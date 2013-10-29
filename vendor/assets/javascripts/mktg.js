// JavaScript Document
$(window).load(function() {

    if (document.getElementById('galler') != null)
        $(".gallery a[rel^='prettyPhoto']").prettyPhoto();
    var currSiteUrl = $('#currentSiteUrl').val();


    /* close nav button funcation - START */
    $('.close-nav').click(function() {
        $('body').attr('class', previousBodyClass);
        $('.bg-slide-wrapper').show();
        $('.sidebar-wrap').show();
        $('.industryDrop').fadeOut(600, function() { $('.panel').fadeIn(600); $('.footer-widget-wrap').fadeIn(600); });
        $('.nav-primary li a').removeClass("dropOpen");
        $('#language-country').removeClass("locDropOpen");
        $('.spotlight').fadeIn(600);
        $('.nav-primary li').removeClass("current");

        //code to resume the jquery cycle on homepage
        $('#bgSlider').cycle('resume');
        $('.spotlight ul').cycle('resume');
        $('#bgSlider').show();
    });
    /* close nav button funcation - END */

    /* Global-nav function and event-handler - START */
    function LangCountryHandler(data, $this) {

        //fill data in to
        var $smSubmenusData = $('.sm-sub-menus-data');
        $smSubmenusData.empty();
        var html = '';

        $.each(data, function(index, element) {
            html = html + "<h2 class='head' id='" + element.Region + "'>" + element.Region + "</h2>";
            html = html + "<div class='data'>";
            //inner loop
            $.each(element.Countries, function(i, e) {

                html = html + "<div class='global-country'><div class='floatLeft'>" + e.Title + "</div>" + e.HtmlForUrl + "</div>";

            });

            html = html + "</div><div class='hr'></div>";

        });

        $smSubmenusData.html(html);

        var smHeight = $(".sm-sub-menus-data").height();
        var smMinHeight = parseInt($(".sm-sub-menus-data-holder").css('max-height'));
        if (smHeight > smMinHeight) {
            $(".sm-sub-menus-gotop").show();
            $(".sm-sub-menus-gobot").show();
        }
        else {
            $(".sm-sub-menus-gotop").hide();
            $(".sm-sub-menus-gobot").hide();
        }


    }


    /* Global Nav event-handler: Start */
    $('a#language-country').on('click', function(event) {

        event.preventDefault();

        var $this = $(this);
        var $smSubmenusData = $('.sm-sub-menus-data');

        var inputData = $this.attr("name");


        if (($('.locDropOpen').length == 0)) {
            $('.sidebar-wrap').css('display', 'none');
            $('.industryDrop').css('min-height', '500px');
            $('.bg-slide-wrapper').fadeOut(600);
            if ($('.nav-primary-wrap .current').length == 0) {
                previousBodyClass = $('body').attr('class');
            }
            else {
                $('.current').removeClass("current");
            }
            $('body').attr('class', 'locBg');
            $this.addClass("locDropOpen");
            $('.spotlight').css('display', 'none');
            $('.footer-widget-wrap').css('display', 'none');
            $('.panel').fadeOut(200, function() {
                $('.industryDrop').fadeIn(200);

            });
            $smSubmenusData.empty();


            //load data in to $smSubmenusData
            //calling side bar data using ajax
            $.ajax({
                type: "POST",
                url: "/_layouts/infosyscms/responsive/AsyncMethods.aspx/GetGlobalNavMenu",
                data: "{subsidiaryFilter:'" + inputData + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(responseData) {
                    //on successful call to ajax methods, try to render the data.
                    LangCountryHandler(responseData, $this);

                },
                error: function(xhr, ajaxOptions, thrownError) {
                    LoggingInConsole(xhr.status);
                    LoggingInConsole(thrownError);
                }
            });
        }
        else {
            $('.dropOpen').removeClass('dropOpen');
            $('.bg-slide-wrapper').show();
            $('.bg-slide-wrapper').fadeIn(600);
            $('.current').removeClass("current");
            $('body').attr('class', previousBodyClass);
            $('.industryDrop').fadeOut(600, function() { $('.sidebar-wrap').fadeIn(100); $('.panel').fadeIn(600); $('.spotlight').fadeIn(600); $('.footer-widget-wrap').fadeIn(600); });
            $(this).removeClass("locDropOpen");
        }


    });
    /* Global Nav event-handler: End */
    /* Global-nav function and event-handler - END */

    /* Sub-menu nav: Start*/
    $('div.sm-sub-menus h2').live('click', function() {
        var $this = $(this);

        if ($this.hasClass("active")) {
            //if ($(".locDropOpen").length != 0) {
            if (true) {
                $this.removeClass("active");
                $('div.sm-sub-menus .data').slideUp(200, function() {

                    var smHeight = $(".sm-sub-menus-data").height();
                    var smMinHeight = parseInt($(".sm-sub-menus-data-holder").css('max-height'));
                    if (smHeight > smMinHeight) {
                        $(".sm-sub-menus-gotop").show();
                        $(".sm-sub-menus-gobot").show();
                    }
                    else {
                        $(".sm-sub-menus-gotop").hide();
                        $(".sm-sub-menus-gobot").hide();
                    }

                });
                return;
            }
        }

        $this.siblings().removeClass('active');
        $this.addClass('active').next().addClass('active');
        $('div.sm-sub-menus .data').slideUp(200);
        var currentMainMenuItem = $this.attr('name');
        //        var clsN = $(this).attr('id');
        //        $('body').attr('class', clsN);

        if ($(".locDropOpen").length == 0) {


            //calling side bar data using ajax
            $.ajax({
                type: "POST",
                url: "/_layouts/infosyscms/responsive/AsyncMethods.aspx/GetSideBarData",
                data: "{currentSubMenuItem:'" + currentMainMenuItem + "', webUrl:'" + currSiteUrl + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(responseData) {
                    //on successful call to ajax methods, try to render the data.

                    $(".sidebar-wrap").empty();
                    $('body').attr('class', responseData.BgImage);

                    $(".sidebar-wrap").html(responseData.Html + "<script type='text/javascript' src='/Style Library/JSFiles/responsive/script.js'></script>");
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    LoggingInConsole(xhr.status);
                    LoggingInConsole(thrownError);
                }
            });
        }

        $this.next().slideDown(200, function() {

            var smHeight = $(".sm-sub-menus-data").height();
            var smMinHeight = parseInt($(".sm-sub-menus-data-holder").css('max-height'));
            if (smHeight > smMinHeight) {
                $(".sm-sub-menus-gotop").show();
                $(".sm-sub-menus-gobot").show();
            }
            else {
                $(".sm-sub-menus-gotop").hide();
                $(".sm-sub-menus-gobot").hide();
            }

        });
    });
    /* Sub-menu nav: End*/

    /* Mobile menu navigation on page content - START */
    $('.mobile-navigation .mobile-navigation-ul li a').on('click', function(event) {
        if ($(this).attr('ID') != 'home-mobile-nav') {
            event.preventDefault();
        }
    });

    $('.mobile-navigation .mobile-navigation-ul > li').on('click', function(event) {

        var $this = $(this);

        //check that the li tag should not be for homepage link
        if (!$this.children('a').is('#home-mobile-nav')) {

            if (!$this.hasClass('current')) {
                //local variables
                var currentMainMenuItem = $this.children('a').attr('ID');
                //ajax call
                $.ajax({
                    type: "POST",
                    url: "/_layouts/infosyscms/responsive/AsyncMethods.aspx/GetMainMenuItems",
                    data: "{divId:'" + currentMainMenuItem + "', webUrl:'" + currSiteUrl + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(responseData) {
                        //on successful call to ajax methods, try to render the data.
                        UlRenderingForMobileContent(responseData, $this);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        LoggingInConsole(xhr.status);
                        LoggingInConsole(thrownError);
                    }
                });
            }
            else {
                $this.children('ul').remove();
                $this.toggleClass('current');
                $this.toggleClass('on');
            }
        }
    });

    /* Mobile menu navigation on page content - END */

    /* UI for mobile rendering - START */
    function UlRenderingForMobileContent(responseData, currentLi) {

        //        var UlHtml = "<ul>";

        //        $.each(responseData.SubNavItems, function(index, element) {
        //            UlHtml = UlHtml + "<li><a href='" + element.Readmore + "'>" + element.Name + "</a></li>";
        //        });

        //        UlHtml = UlHtml + "</ul>";

        //        currentLi.children('ul').remove();


        //        currentLi.toggleClass('current');
        //        currentLi.toggleClass('on');

        //        currentLi.append(UlHtml);

        currentLi.children('ul').remove();
        var UlHtml = "<ul>";
        $.each(responseData.SubNavItems, function(index, element) {
            //UlHtml = UlHtml + "<li><a href='" + element.Readmore + "'>" + element.Name + "</a></li>";
            if (element.BgImgClass != 'NOREADMORE') {
                //normal rendering
                UlHtml = UlHtml + "<li><a href='" + element.Readmore + "'>" + element.Name + "</a></li>";
            }
            else {
                //rendering for no readmore scenario
                UlHtml = UlHtml + "<li class='nav-sub-menu-mobile'><a href='#'>" + element.Name + "</a>" + element.Description + "</li>";
            }
        });
        UlHtml = UlHtml + "</ul>";
        currentLi.toggleClass('current');
        currentLi.toggleClass('on');
        currentLi.append(UlHtml);
        //hide inner ul for mobile menu 
        $('..mobile-navigation-ul li ul li ul').hide();

        $('li.current.on ul li a').click(function(e) {

            if ($(this).siblings('ul').length == 1) {
                e.preventDefault();
                $(this).siblings('ul').toggle('slow');
                e.stopImmediatePropagation();
                $(this).parent().toggleClass('on');
            }

        });


    }
    /* UI for mobile rendering - END */

    //Inner Page Content Slider-pager
    if (document.getElementById('inner-page-slider') != null) {
        $('#inner-page-slider').after('<div id="inner-page-slider-pager">').cycle({
            fx: 'scrollHorz',
            //fx:     'fade', 
            speed: 400,
            pause: 1,
            timeout: 4500,
            next: '#inner-page-slider-next',
            prev: '#inner-page-slider-prev',
            pager: '#inner-page-slider-pager',
            pagerAnchorBuilder: function(idx, slide) { return '<a href="#">&nbsp;</a>'; }
        });
    }

    if (document.getElementById('bgSlider') != null) {
        $('#bgSlider').cycle({
            // pager: '.slider-pagination',
            cleartype: true,
            cleartypeNoBg: true,
            speed: 1000,  // speed of the transition (any valid fx speed value) 
            speedIn: 1600,  // speed of the 'in' transition 
            speedOut: 900,  // speed of the 'out' transition 
            fx: 'fade'
        });

        $('.spotlight ul').cycle({
            pager: '.spotlight-pagination',
            cleartype: true,
            cleartypeNoBg: true,
            speed: 1000,  // speed of the transition (any valid fx speed value) 
            speedIn: 1600,  // speed of the 'in' transition 
            speedOut: 900,  // speed of the 'out' transition 
            fx: 'fade'
        });
        /*
        $('#goto1').click(function() {
        $('#bgSlider, .spotlight ul').cycle(0);
        return false;
        });

        $('#goto2').click(function() {
        $('#bgSlider, .spotlight ul').cycle(1);
        return false;
        });

        $('#goto3').click(function() {
        $('#bgSlider, .spotlight ul').cycle(2);
        return false;
        });
        */

        $('.spotlight-pagination a').click(function() {
            var leadno = $(this).text();
            $('#bgSlider, .spotlight ul').cycle(leadno - 1);
            return false;

        });
    }

});
//V Player

function vplayercall(istreamfile, preimage, wid, hei, contid, startmode) {
    jwplayer(contid).setup({
        'autostart': startmode,
        'flashplayer': '/richmedia/players/vplayer.swf',
        'playlistfile': '/Videos/vplayer/' + istreamfile + '.xml',
        'backcolor': '000000',
        'frontcolor': 'EEEEEE',
        'lightcolor': '66FFFF',
        'width': '100%',
        'height': hei - 10,
        'logo.file': '/SiteCollectionImages/infosys-logo.png',
        'logo.position': 'top-left',
        'author': 'Infosys Limited',
        'abouttext': 'Infosys Limited',
        'aboutlink': 'http://www.infosys.com',
        'skin': '/richmedia/players/vskin/infosys.zip',
        'controlbar.position': 'over',
        'plugins': { '/richmedia/players/viral-2h.swf': { onpause: 'false', oncomplete: 'false', allowmenu: 'false', functions: 'embed'} }
    });
}

function vplayercallFill(istreamfile, preimage, wid, hei, contid, startmode) {
    jwplayer(contid).setup({
        'autostart': startmode,
        'flashplayer': '/richmedia/players/vplayer.swf',
        'playlistfile': '/Videos/vplayer/' + istreamfile + '.xml',
        'backcolor': '000000',
        'frontcolor': 'EEEEEE',
        'lightcolor': '66FFFF',
        'width': '100%',
        'height': hei - 10,
        'logo.file': '/SiteCollectionImages/infosys-logo.png',
        'logo.position': 'top-left',
        'author': 'Infosys Limited',
        'abouttext': 'Infosys Limited',
        'aboutlink': 'http://www.infosys.com',
        'skin': '/richmedia/players/vskin/infosys.zip',
        'stretching': 'fill',
        //'aspectratio' : '4:3',
        'controlbar.position': 'over',
        'plugins': { '/richmedia/players/viral-2h.swf': { onpause: 'false', oncomplete: 'false', allowmenu: 'false', functions: 'embed'} }
    });
}








function vplayercAudio(istreamfile, preimage, wid, hei, contid, startmode) {
    jwplayer(contid).setup({
        'autostart': startmode,
        'flashplayer': '/richmedia/players/vplayer.swf',
        // 'file': 'http://stream.infosys.com/video_app/'+istreamfile,
        'playlistfile': '/Audio/vplayer/' + istreamfile + '.xml',
        //'image': preimage,
        'backcolor': '000000',
        'frontcolor': 'EEEEEE',
        'lightcolor': '66FFFF',
        'controlbar': 'bottom',
        'width': wid,
        'height': '22',
        'logo.file': '/SiteCollectionImages/infosys-logo.png',
        'logo.position': 'top-left',
        'author': 'Infosys Limited',
        'abouttext': 'Infosys Limited',
        'aboutlink': 'http://www.infosys.com',
        //'skin': '/richmedia/players/vskin/infosys.zip', 
        //'controlbar.position': 'over',
        'plugins': {
            '/richmedia/players/viral-2h.swf': { onpause: 'false', oncomplete: 'false', allowmenu: 'false', functions: 'embed' }
        }
    });
}
//V Player END


/*
$(document).ready(function() {
if(navigator.platform == "iPad") {
$("a").each(function() { 
									 
									
// have to use an `each` here - either a jQuery `each` or a `for(...)` loop
var onClick; // this will be a function
var firstClick = function() {
onClick = secondClick;
alert("f");
return false;
};
var secondClick = function() {
onClick = firstClick;
alert("t");
return true;
};
onClick = firstClick;
$(this).click(function() {
alert("y");
//window.location = this.attr('href');
return onClick();
});
});
}
});
 
*/
// $('a').on({ 'touchstart' : function(){ window.location = this.attr('href') } });