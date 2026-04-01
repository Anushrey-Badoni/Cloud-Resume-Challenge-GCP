import functions_framework
from flask import jsonify
from google.cloud import firestore

@functions_framework.http
def count_visit(request):
    db = firestore.Client()
    doc_ref = db.collection("visits").document("counter")
    
    doc = doc_ref.get()
    if doc.exists:
        current = doc.to_dict()["count"]
        doc_ref.update({"count": current + 1})
    else:
        doc_ref.set({"count": 1})
        current = 1

    response = jsonify({"count": current})
    response.headers.set("Access-Control-Allow-Origin", "*")
    response.headers.set("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
    response.headers.set("Access-Control-Allow-Headers", "Content-Type")

    if request.method == "OPTIONS":
        return ('', 204, response.headers)

    return response
