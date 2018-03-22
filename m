Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1521712529-632-2-git-send-email-abel.vesa@nxp.com>
References: <1521712529-632-1-git-send-email-abel.vesa@nxp.com> <1521712529-632-2-git-send-email-abel.vesa@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Mar 2018 11:20:32 -0300
Message-ID: <CAOMZO5DdBv0oisdRt01O-VnF_5b1oL6d2a0JGyieOiNvrut=Qg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm: imx: Update clk driver API
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Yongcai Huang <anson.huang@nxp.com>,
	linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 22, 2018 at 6:55 AM, Abel Vesa <abel.vesa@nxp.com> wrote:
> This adds the following new wrappers:
>  - imx_clk_gate2_flag
>  - imx_clk_set_parent
>
> It also updates the flags for the old wrappers.

This flag update should also be a separate patch and you should
explain the reason for it.
