Return-Path: <ukl@pengutronix.de>
Date: Thu, 11 Jan 2018 22:29:57 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>
Subject: Re: Warnings from drivers/clk/clk.c
Message-ID: <20180111212957.fiyw2eozi5cubt5v@pengutronix.de>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
 <20180111211948.GL28313@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20180111211948.GL28313@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 11, 2018 at 01:19:48PM -0800, Stephen Boyd wrote:
> On 01/10, Fabio Estevam wrote:
> > Hi,
> > 
> > Bootling linux-next 20180110 on a imx53-qsb leads to the following
> > warning that gets repeated several times:
> > 
> > 
> > [    2.776154] ------------[ cut here ]------------
> > [    2.780909] WARNING: CPU: 0 PID: 1 at ../drivers/clk/clk.c:802
> > clk_core_disable+0xc4/0xe0
> 
> We have two WARN_ON in this function. Do you know which one hit
> (makes me think we should put a printk in here now and also
> include the clk name).

It's the one in line 802 as noted above :-)
 
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
