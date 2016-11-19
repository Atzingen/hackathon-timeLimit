import os, shutil, time
from flask import Flask, request, redirect, url_for, render_template
from werkzeug.utils import secure_filename

UPLOAD_FOLDER = '/uploads'
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])

app = Flask(__name__)

@app.route('/')
def principal():
    return render_template('principal.html')

@app.route('/resposta')
def resposta():
    return render_template('resposta.html')

@app.route('/resposta-erro')
def resposta-erro():
    return render_template('resposta-erro.html')

@app.route('/envia-foto',methods=['GET','POST'])
def fotos():
    print 'request envia-foto'
    if request.method == 'POST':
        try:
            new_dict = request.files.copy()
            nome, arquivo = new_dict.popitem()
            print nome, arquivo
            file = request.files[nome]
            if not file:
                print 'arquivo vazio'
                flash('No selected file')
            else:
                file.save('upload/' + nome)

                return render_template('resposta.html')
        except Exception as e:
            print 'Exception', e
    return render_template('teste2.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=5000,debug=True)
