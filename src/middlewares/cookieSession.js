const cookieSession = (req, res, next) => {
    if(req.cookies.anubisCook){
        req.session.user = req.cookies.anubisCook;
        res.locals.user = req.session.user;
    }
    next()
}

module.exports = cookieSession;