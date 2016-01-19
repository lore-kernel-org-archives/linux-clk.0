Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160113201704.1168.94040@quark.deferred.io>
References: <1452531716-12149-1-git-send-email-festevam@gmail.com>
	<20160113201704.1168.94040@quark.deferred.io>
Date: Tue, 19 Jan 2016 11:12:44 -0200
Message-ID: <CAOMZO5D7qspC=j0nuYqJR2S+vOuR13JZm2z0SL-QraUMzpHdSQ@mail.gmail.com>
Subject: Re: [PATCH] clk: clk-imx25: Force LCDC IPG clock to be disabled
From: Fabio Estevam <festevam@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>, Carlos Soto <csotoalonso@gmail.com>, linux-clk@vger.kernel.org,
	Fabio Estevam <fabio.estevam@nxp.com>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

On Wed, Jan 13, 2016 at 6:17 PM, Michael Turquette
<mturquette@baylibre.com> wrote:

> A couple of thoughts on this:
>
> 1) should you have a reset controller thingy for the LCDC? That might be
> a better way to model what's going on.

Ok, just sent a patch forcing a reset to the controller by
enabling/disabling the IPG clock.

Thanks
