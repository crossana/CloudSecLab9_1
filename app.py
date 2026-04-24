# import the elements from the Flask framework 

from flask import Flask, render_template 
 

# Our web application object 

app = Flask(__name__) 

 

# Provide the code to handle the root route into our application 

@app.route('/') 

def index(): 

    return render_template('index.html') 

 

# Run the webserver on port 8080 

if __name__ == '__main__': 

    app.run(debug=True, host='0.0.0.0', port=8080) 
