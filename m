Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42929 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387435AbeGLXCp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jul 2018 19:02:45 -0400
Date: Thu, 12 Jul 2018 18:38:36 -0400
From: David Rivshin <drivshin@awxrd.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        "J, Keerthy" <j-keerthy@ti.com>
Subject: Re: dmtimer fclk regression in 4.16?
Message-ID: <20180712183836.62e88588.drivshin@awxrd.com>
In-Reply-To: <20180620115321.5496761a.drivshin@awxrd.com>
References: <20180619145339.08322293.drivshin@awxrd.com>
        <1b9995a0-0a44-2896-4492-0d16e3fa2b53@ti.com>
        <b37ee1e6-1b06-b82f-9948-ac66a06544ca@baylibre.com>
        <20180620115321.5496761a.drivshin@awxrd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 20 Jun 2018 11:53:21 -0400
David Rivshin <drivshin@awxrd.com> wrote:

> On Wed, 20 Jun 2018 09:11:19 +0200
> Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> > Hi,
> > 
> > On 20/06/2018 08:30, Tero Kristo wrote:  
> > > On 19/06/18 21:53, David Rivshin wrote:    
> > >> I think I've run across a regression in 4.16 that resulted from the TI clock
> > >> infrastructure changes. A bisect pointed to [1] as the first breaking commit.
> > >>
> > >> Our use-case is a pwm-dmtimer-omap using timer7, with timer7_fck parented
> > >> by clkdiv32k_ick (aka timer_32k_ck aka l4_per_cm:clk:0138:0). Starting with
> > >> 4.16 that parenting fails in omap_dm_timer_set_source(), called from
> > >> pwm_omap_dmtimer_probe, at this check:
> > >>     if (clk_hw_get_num_parents(__clk_get_hw(timer->fclk)) < 2)
> > >>         return 0;
> > >> because timer->fclk is "l4_per_cm:clk:0068:0", whose only possible parent
> > >> is "timer7_fck".
> > >>
> > >> It seemed to me that timer->fclk should instead be "timer7_fck" (which has
> > >> the desired set of possible parents). I tried following the lead set in [2]
> > >> and added "clocks" and "clock-names" properties on timer7. However, that
> > >> resulted in omap_dm_timer_of_set_source(), called by omap_dm_timer_prepare(),
> > >> failing when it tries to parent "timer7_fck" to itself.
> > >>
> > >> The following change in omap_dm_timer_prepare() does seem to work:
> > >> -        timer->fclk = clk_get(&timer->pdev->dev, "fck");
> > >> +        timer->fclk = clk_get_parent(clk_get(&timer->pdev->dev, "fck"));    
> > > 
> > > It seems omap_dm_timer_of_set_source() is actually completely broken and isn't doing anything useful. Neil, what was this function supposed to be doing, seeing you invented the initial patch for that (commit 31a7448f4fa8a528040e3df593e9781f55218183)?    
> > 
> > The original change was supposed to set the timer source clock by using the clock defined in the DT, but
> > it was made to work when the code was in arch/arm and the fck was not found from DT.
> > 
> > 
> > The omap_dm_timer_of_set_source() should be changed to get a specified clock name like "src":
> > parent = clk_get(&timer->pdev->dev, "src");
> > if (IS_ERR(parent))
> > 	return -ENODEV;
> > 
> > And the fck clock should be added to all timer nodes.
> > 
> > For example ed839c3664cb308144fe70a3a95813ab59a03dfb or 521f9e5e3f871cdac3ecd2a583d14d0472278053 only adds fck to timer1/2, the 7 timers should have the fck clock.
> > 
> > @David: chan you test the omap_dm_timer_of_set_source() change and in DT update the timer7 node with :
> > clocks = <&timer7_fck>, <&clkdiv32k_ck>;
> > clock-names = "fck", "src";  
> 
> That didn't work as-is because clkdiv32k_ck isn't a direct parent of 
> timer7_fck anymore. However, if I change it to 
> 	<&l4_per_clkctrl AM3_CLKDIV32K_CLKCTRL 0> 
> then all seems well.
> 
> Since pwm-dmtimer-omap sets the source clock explicitly anyways 
> (based on the DT), using any of the parents of timer7_fck as 
> the timer7 "src" clock works in my case.
> 
> Also, if I leave off the "src" clock entirely, then omap_dm_timer_prepare()
> defaults it to using that same clock:
> 	rc = omap_dm_timer_of_set_source(timer);
> 	if (rc == -ENODEV)
> 		return omap_dm_timer_set_source(timer, OMAP_TIMER_SRC_32_KHZ);
> and that also works for me.
> 
> Thanks,
> David Rivshin
> 

Hi Neil,

Are you planning on submitting a patch with this fix? Or would you prefer 
I spun one up? One concern I have is that while I use an am335x and feel 
fairly confident on those DT changes, I'm not so confident about what 
changes would be needed for other SoC's devicetrees. 


> > 
> > Thanks,
> > Neil
> >   
> > > 
> > > -Tero
> > >     
> > >> but I'm very uncertain whether that's the right path.
> > >> Should omap_dm_timer know that the clock returned is actually a child of the
> > >> clock it's interested in? Or should clk_get(<timerN>,"fck") be returning the
> > >> timerN_fck in the first place? Or is the problem something else entirely?
> > >>
> > >> As I'm not sure how these pieces are all intended to fit together, any
> > >> pointers would be appreciated.
> > >>
> > >> Thanks,
> > >> David Rivshin
> > >>
> > >> [1] df54bfc5502a ("clk: ti: am33xx: add clkctrl clock data")
> > >> https://www.spinics.net/lists/linux-omap/msg139798.html
> > >> [2] 521f9e5e3f87 ("ARM: dts: am33xx: add fck under timers1/2")
> > >> https://www.spinics.net/lists/linux-omap/msg140605.html
> > >>    
> > > 
> > > -- 
> > > Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki    
> >   
> 
