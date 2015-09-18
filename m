Return-Path: <scottwood@freescale.com>
Message-ID: <1442535513.19102.83.camel@freescale.com>
Subject: Re: [PATCH 02/26] clk: Replace __clk_get_num_parents with
 clk_hw_get_num_parents()
From: Scott Wood <scottwood@freescale.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@baylibre.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Boris Brezillon
	<boris.brezillon@free-electrons.com>, Chao Xie <chao.xie@marvell.com>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas
	<javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>, Emilio
 =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Tero Kristo
	<t-kristo@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 17 Sep 2015 19:18:33 -0500
In-Reply-To: <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	 <1438362246-6664-3-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: scottwood@freescale.com
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2015-07-31 at 10:03 -0700, Stephen Boyd wrote:
> Mostly converted with the following semantic patch:
> 
> @@
> struct clk_hw *E;
> @@
> 
> -__clk_get_num_parents(E->clk)
> +clk_hw_get_num_parents(E)

I don't understand why this is considered a clock provider API.  How is a 
clock consumer, such as cpufreq, supposed to find out the number of parents 
or similar information, so that it knows what its options are for calling 
clk_set_parent()?

This is the caller I had in mind:
http://patchwork.ozlabs.org/patch/507619/

Surely asking the clock to describe itself is better than what that cpufreq 
driver currently does, which is to look in the device tree and make 
assumptions about how that maps to what the clock provider driver does...

-Scott
