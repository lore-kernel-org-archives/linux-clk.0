Return-Path: <sha@pengutronix.de>
Date: Mon, 11 May 2015 08:01:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Automatic clock disabling on clk_put()
Message-ID: <20150511060129.GG6325@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hi,

Since we now have per-user clks we could automatically disable clks on
clk_put() to make the drivers errors paths easier. AFAIR that was one
of the motivations to switch to per user clks. Is this just not yet
implemented or are there problems implementing this?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
