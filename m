Return-Path: <stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 09 Jun 2016 15:14:30 -0700
From: Stefan Agner <stefan@agner.ch>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dong Aisheng <dongas86@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-kernel@vger.kernel.org, mingo@redhat.com, kernel@pengutronix.de,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: imx: do not sleep if IRQ's are still disabled
In-Reply-To: <alpine.DEB.2.11.1606092204590.28031@nanos>
References: <20160426012341.GB8870@tiger>
 <CAA+hA=QTNEAaMfjJoMMO5gPR8VPYBWYx=HZgjngUFJK4LxMp=g@mail.gmail.com>
 <1461663072.7839.17.camel@pengutronix.de>
 <CAA+hA=SSQJPbzbhCY7O8JaxiUgMDjG2ATQXsCW-X5zc2inC6kw@mail.gmail.com>
 <CAA+hA=Q5Un7Sib5QEvK4H2PH5qrySAkRR+=ofuaKxX_PCuT-Yw@mail.gmail.com>
 <20160427015835.GE30692@tiger>
 <CAA+hA=REqJ8JhmKt5_jCAaRTUy2E14ww_MqWSSLpNBKgnf=U9A@mail.gmail.com>
 <alpine.DEB.2.11.1604271212290.3941@nanos> <20160602145915.GA31124@shlinux2>
 <alpine.DEB.2.11.1606061448010.28031@nanos>
 <20160607070440.GA32573@shlinux2>
 <alpine.DEB.2.11.1606092204590.28031@nanos>
Message-ID: <1162370a4389413d2d4ff0eb79ff13ac@agner.ch>
List-ID: <linux-clk.vger.kernel.org>

On 2016-06-09 13:08, Thomas Gleixner wrote:
> On Tue, 7 Jun 2016, Dong Aisheng wrote:
>> Then it may need introduce a lot changes and increase many new core APIs.
>> Is that a problem?
> 
> No. That's all better than each driver having broken workarounds. It's a
> common problem so it wants to be addressed at the core level. There you have a
> central point to do this and you can still catch abusers which call stuff from
> the wrong context. The hacks in the drivers don't allow that because they look
> at the context, i.e. irq disabled, instead of checking the system state.

IMHO, the hacky part of my patch was how I detected whether to use sleep
or delay. That said I am ok with API extension too, I guess it is fairly
common use case... I found at least 6 clock prepare functions with sleep
in it (and some udelays, all between 1-100).

Your proposed solution uses "early_boot_or_suspend_resume" which I did
not found as a convenient function in the wild :-)

How would you implement that?

--
Stefan
