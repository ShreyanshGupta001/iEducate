from flask import Flask,render_template,request,redirect,session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
from math import ceil


with open('config.json','r') as c:
     params=json.load(c)['params']
     c.close()


app=Flask(__name__)
app.secret_key=params['secretkey']

if (params['local_server']):
    app.config['SQLALCHEMY_DATABASE_URI']=params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI']=params['prod_uri']
    
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db=SQLAlchemy(app)

class Contacts(db.Model):
    sno=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(50),nullable=False)
    email=db.Column(db.String(50),nullable=False)
    phone=db.Column(db.Integer)
    message=db.Column(db.String(200),nullable=False)
    date=db.Column(db.DateTime,default=datetime.utcnow())

class Posts(db.Model):
    sno=db.Column(db.Integer,primary_key=True)
    slug=db.Column(db.String(50),nullable=False)
    author=db.Column(db.String(20),default="Admin")
    title=db.Column(db.String(50),nullable=False)
    subtitle=db.Column(db.String(100),nullable=False)
    content=db.Column(db.String(10000),nullable=False)
    date=db.Column(db.DateTime,default=datetime.now())
    img_file=db.Column(db.String(50),nullable=False)
    def __repr__(self) -> str:
        return f"{self.sno} - {self.title}"

@app.context_processor
def inject_param():
    return dict(params=params)

@app.route('/')
def index():
    allposts=Posts.query.order_by(Posts.date.desc(),Posts.date.desc()).all()
    no_of_posts=len(allposts)
    last_page=ceil(no_of_posts/params['no_of_homeposts'])
    page=request.args.get('page',1,type=int)
    posts=allposts[params['no_of_homeposts']*(page-1):params['no_of_homeposts']*page]

    if page==1:
        previous='#'
        next='/?page='+str(page+1)
    elif page==last_page:
        previous='/?page='+str(page-1)
        next='/?page='+str(last_page)+'#'
    else:
        next='/?page='+str(page+1)
        previous='/?page='+str(page-1)

    return render_template('index.html',posts=posts,next=next,previous=previous)


@app.route('/about')
def about():
    return render_template('about.html')



@app.route('/contact',methods=['GET','POST'])
def contact():
    if request.method=='POST':
        name=request.form['name']
        email=request.form['email']
        phone=request.form['phone']
        message=request.form['message']
        person_detail=Contacts(name=name,email=email,phone=phone,message=message)
        db.session.add(person_detail)
        db.session.commit()
    return render_template('contact.html')

@app.route('/post/<string:slug>')
def posting(slug):
    post=Posts.query.filter_by(slug=slug).first()
    return render_template('post.html',post=post)

@app.route('/dashboard', methods=['GET','POST'])
def dashboard():
    posts=Posts.query.order_by(Posts.date.desc(),Posts.sno.desc()).all()
    if 'admin' in session and session['admin']==params['adminid']:
        return render_template('dashboard.html',posts=posts)
    else:
        if request.method=='POST':
            adminid=request.form['adminid']
            password=request.form['password']
            if adminid==params['adminid'] and password==params['adminpass']:
                session['admin']=adminid
                return render_template('dashboard.html',posts=posts)

    return render_template('admin.html')



@app.route('/dashboard/logout')
def logout():
    if 'admin' in session and session['admin']==params['adminid']:
        session.pop('admin')
        return redirect('/dashboard')
    else:
        return "Error Logging Out......Make sure you Logged in"

@app.route('/dashboard/update/<string:slug>', methods=['GET','POST'])
def update(slug):
    if 'admin' in session and session['admin']==params['adminid']:
        post=Posts.query.filter_by(slug=slug).first()
        if request.method=='POST':
            post.title=request.form.get('title')
            post.subtitle=request.form.get('subtitle')
            post.content=request.form.get('content')
            db.session.add(post)
            db.session.commit()
            return redirect('/dashboard')
        return render_template('update.html',post=post)

@app.route('/dashboard/delete/<string:slug>')
def delete(slug):
    if 'admin' in session and session['admin']==params['adminid']:
        post=Posts.query.filter_by(slug=slug).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')

@app.route('/dashboard/addnewpost', methods=['GET','POST'])
def addnewpost():
    if 'admin' in session and session['admin']==params['adminid']:
        if request.method=='POST':
            post=Posts(title=request.form['title'],subtitle=request.form['subtitle'],slug=request.form['slug'],img_file=request.form['imageFileName'],content=request.form['content'])
            db.session.add(post)
            db.session.commit()
            return redirect('/dashboard')
        return render_template('addnewpost.html',post={})


if __name__=='__main__':
    app.run(debug=True,port=8000)
