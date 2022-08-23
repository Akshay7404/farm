const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const stripe = require("stripe")("sk_test_51LZt4cSDYAYyqiFW2uw5A9npviLGJ3fkql9jP9MIKCIdilxDNdWPbEvdXZWjWkl93dPDVK0cdDvUMm6IvgSXvXPF00HaqJMtmK");

exports.stripePaymentIntentRequest = functions.https.onRequest(async (req, res) => {
    try {
        let customerid;
        const customerList = await stripe.customerList.list({ email: req.body.email, limit: 1 });
        if (customerList.data.length !== 0) {
            customerid = customerList.data[0].id;
        }
        else {
            const customer = await stripe.customer.create({ email: req.body.email });
            customerid = customer.data.id;
        }
        const ephemeralkey = await stripe.ephemeralkey.create(
            { customer: customerid },
            { apiVersion: '27-08-2022' }
        );
        const paymentIntent = await stripe.paymentIntent.create({
            amount: parseInt(req.body.amount),
            currency: 'inr',
            customer: customerid
        })
        req.status(200).send({
            paymentIntent: paymentIntent.client_secret,
            ephemeralkey: ephemeralkey.secret,
            customer: customerid,
            success: true,
        })

    }
    catch (error) { res.status(404).send({ success: false, error: error.message }) }
})