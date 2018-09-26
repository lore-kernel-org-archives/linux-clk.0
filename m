Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180926064752.GM4097@pengutronix.de>
References: <1537785597-26499-1-git-send-email-abel.vesa@nxp.com>
 <1537785597-26499-5-git-send-email-abel.vesa@nxp.com> <CAOMZO5D7yLUzriOub4RWsq1K8_fTj6c0LFOnSZwHyjqMPYu=0A@mail.gmail.com>
 <20180926064752.GM4097@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Sep 2018 09:02:07 -0300
Message-ID: <CAOMZO5D-40WbanPC=-O_Nj98znOk6Aa3dAqpCuwHTv+GuFR6_g@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] clk: imx: add imx composite clock
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>,
	NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Sascha,

On Wed, Sep 26, 2018 at 3:47 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:

> It's:
>         rate = *prate / prediv_value;
>         rate = rate / div_value;

Yes, this looks correct. Thanks for the feedback.

> To me this looks correct. However, For an unsigned long type we have
> DIV_ROUND_UP() with which we do not need any casting. For 64bit code
> unsigned long is 64bit anyway which makes the cast a no-op and for 32bit
> code there's also no point in exanding the initial 32bit value to 64bit.

That's a good point too.

Thanks
