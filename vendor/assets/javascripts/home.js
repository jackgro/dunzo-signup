/*! ResponsiveSlides.js v1.32
 * http://responsiveslides.com
 * http://viljamis.com
 *
 * Copyright (c) 2011-2012 @viljamis
 * Available under the MIT license
 */
/*jslint browser: true, sloppy: true, vars: true, plusplus: true, indent: 2 */
(function(e, t, n) {
e.fn.responsiveSlides = function(r) {
var s = e.extend({
auto: !0,
speed: 1e3,
timeout: 4e3,
pager: !1,
nav: !1,
random: !1,
pause: !1,
pauseControls: !1,
prevText: "Previous",
nextText: "Next",
maxwidth: "",
controls: "",
namespace: "rslides",
before: function() {},
after: function() {}
}, r);
return this.each(function() {
n++;
var o = e(this), u, a, f, l, c, h = 0, p = o.children(), d = p.size(), v = parseFloat(s.speed), m = parseFloat(s.timeout), g = parseFloat(s.maxwidth), y = s.namespace, b = y + n, w = y + "_nav " + b + "_nav", E = y + "_here", S = b + "_on", x = b + "_s", T = e("<ul class='" + y + "_tabs " + b + "_tabs' />"), N = {
"float": "left",
position: "relative"
}, C = {
"float": "none",
position: "absolute"
}, k = function(t) {
s.before(), p.stop().fadeOut(v, function() {
e(this).removeClass(S).css(C);
}).eq(t).fadeIn(v, function() {
e(this).addClass(S).css(N), s.after(), h = t;
});
};
s.random && (p.sort(function() {
return Math.round(Math.random()) - .5;
}), o.empty().append(p)), p.each(function(e) {
this.id = x + e;
}), o.addClass(y + " " + b), r && r.maxwidth && o.css("max-width", g), p.hide().eq(0).addClass(S).css(N).show();
if (p.size() > 1) {
if (m < v + 100) return;
if (s.pager) {
var L = [];
p.each(function(e) {
var t = e + 1;
L += "<li><a href='#' class='" + x + t + "'>" + t + "</a>" + "</li>";
}), T.append(L), c = T.find("a"), r.controls ? e(s.controls).append(T) : o.after(T), u = function(e) {
c.closest("li").removeClass(E).eq(e).addClass(E);
};
}
s.auto && (a = function() {
l = setInterval(function() {
p.stop(!0, !0);
var e = h + 1 < d ? h + 1 : 0;
s.pager && u(e), k(e);
}, m);
}, a()), f = function() {
s.auto && (clearInterval(l), a());
}, s.pause && o.hover(function() {
clearInterval(l);
}, function() {
f();
}), s.pager && (c.bind("click", function(t) {
t.preventDefault(), s.pauseControls || f();
var n = c.index(this);
if (h === n || e("." + S + ":animated").length) return;
u(n), k(n);
}).eq(0).closest("li").addClass(E), s.pauseControls && c.hover(function() {
clearInterval(l);
}, function() {
f();
}));
if (s.nav) {
var A = "<a href='#' class='" + w + " prev'>" + s.prevText + "</a>" + "<a href='#' class='" + w + " next'>" + s.nextText + "</a>";
r.controls ? e(s.controls).append(A) : o.after(A);
var O = e("." + b + "_nav"), M = e("." + b + "_nav.prev");
O.bind("click", function(t) {
t.preventDefault();
if (e("." + S + ":animated").length) return;
var n = p.index(e("." + S)), r = n - 1, i = n + 1 < d ? h + 1 : 0;
k(e(this)[0] === M[0] ? r : i), s.pager && u(e(this)[0] === M[0] ? r : i), s.pauseControls || f();
}), s.pauseControls && O.hover(function() {
clearInterval(l);
}, function() {
f();
});
}
}
if (typeof document.body.style.maxWidth == "undefined" && r.maxwidth) {
var _ = function() {
o.css("width", "100%"), o.width() > g && o.css("width", g);
};
_(), e(t).bind("resize", function() {
_();
});
}
});
};
})(jQuery, this, 0), function() {
$(function() {
var e, t, n;
return $(".rslides").responsiveSlides({
auto: !0,
pager: !0,
nav: !0,
speed: 800,
timeout: 5e3,
pauseControls: !0
}), n = function() {
return $(window).height();
}, t = function() {
var t;
return t = e(), $("#home-head").css({
height: t.height
}), $("#home-head .intro").css({
top: t.top
});
}, e = function() {
var e, t;
return t = n(), e = t / 2 - 92, {
top: e,
height: t
};
}, $(".scroll").click(function(e) {
return e.preventDefault(), $("html,body").animate({
scrollTop: $(this.hash).offset().top
}, 700);
}), $(window).resize(t), t(), $("#how-does-it-work").bind("inview", function(e, t) {
if (t === !0) return $("#how-does-it-work figure").addClass("in-view");
}), $("#product-software").bind("inview", function(e, t) {
if (t === !0) return $("#product-software figure").addClass("in-view");
}), $("#faq .block-head").bind("inview", function(e, t) {
if (t === !0) return $("#hotspot-info .hotspot-side, #hotspot-info .hotspot-side-shadow").addClass("in-view");
});
});
}.call(this);;