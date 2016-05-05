Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, zhengxing@rock-chips.com, zhangqing@rock-chips.com, Doug Anderson <dianders@google.com>
Subject: Re: [RFC PATCH 0/3] clk: attempt to keep requested rate on parent changes
Date: Thu, 05 May 2016 17:07:41 +0200
Message-ID: <4828628.D4nfByUg7D@diego>
In-Reply-To: <572B4AF8.6070509@collabora.com>
References: <1462206982-10444-1-git-send-email-heiko@sntech.de> <572B4AF8.6070509@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Tomeu,

Am Donnerstag, 5. Mai 2016, 15:30:32 schrieb Tomeu Vizoso:
> On 05/02/2016 06:36 PM, Heiko Stuebner wrote:
> > I remember reading about people discussing that problem in the past, but
> > haven't been able to find another approach to it yet [or I'm just blind
> > as happens to often].
> > 
> > Our problem is the following clock structure:
> > 
> > [anotherPLL]
> > 
> >     ------ [div] ----- dclk_vop
> > 
> > [   vpll   ] --------- hdmi_phy
> > 
> > 
> > We need to set the vpll dynamically but still want to retain
> 
> Guess something is missing here?

looks like I forgot to finish my thought "... the vpll as regular dclk_vop 
source".


> > The other option that comes to mind, would be to have a clock-notifier,
> > in the drm driver, but calling clk_set_rate from their looks like it
> > shouldn't work due to the prepare mutex already being held.
> > 
> > 
> > The whole thing is labeled RFC because while it works for us and solves
> > the problem, I'm not sure if I'm overlooking some important aspect or
> > am interferring with some other planned approach for that issue.
> 
> I like this approach very much and wonder in what cases it wouldn't be
> desirable to re-try to achieve the requested rate after a change in an
> ancestor clock.

I guess that is mainly me being overly careful and not overlooking if the 
clock-framework can get into any troubled state if all clocks do this, but I 
guess it should just work ;-) .


> Besides that, do you know already if it would solve the conflicts
> described by Doug in the thread below?
> 
> http://thread.gmane.org/gmane.linux.kernel/1820653/focus=3298

I think the big issue on the rk3288 is, who is actually in charge of 
controlling the npll frequency.

On the rk3399 the vpll is supplied unmodified to the hdmiphy, while as a 
dclk_vop source it goes through a divider first. So it's pretty clear that the 
hdmiphy will control the core frequency while other users need to adapt to 
what they get.

On the rk3288 the npll is a possible source to both the hdmi- as well as the 
edp-clock (and some others as well), so when it gets adapted dynamically, wo 
is going to be in charge and who needs to adapt ... and how do we set this 
hierarchy.


Heiko
