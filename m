Return-Path: <sha@pengutronix.de>
Date: Mon, 18 May 2015 16:11:20 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Ricky Liang <jcliang@chromium.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Henry Chen <henryc.chen@mediatek.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3] clk: mediatek: Initialize clk_init_data
Message-ID: <20150518141120.GU6325@pengutronix.de>
References: <1431957632-2182-1-git-send-email-jcliang@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431957632-2182-1-git-send-email-jcliang@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

On Mon, May 18, 2015 at 10:00:26PM +0800, Ricky Liang wrote:
> The variable init (struct clk_init_data) is allocated on the stack.
> We weren't initializing the .flags field, so it contains random junk,
> which can cause all kinds of interesting issues when the flags are
> parsed by clk_register.
> 
> Signed-off-by: Ricky Liang <jcliang@chromium.org>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
