Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180606092928.11724-1-pp@emlix.com>
References: <20180606092928.11724-1-pp@emlix.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 6 Jun 2018 10:07:18 -0300
Message-ID: <CAOMZO5B-T2UWdv-tf5vsCuRQ6f_o1gw1pAn-b6h9zfmi5ng4Ug@mail.gmail.com>
Subject: Re: [PATCH] clk: imx6: fix video_27m parent for IMX6SX_CLK_CKO1_SEL
To: Philipp Puschmann <pp@emlix.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 6, 2018 at 6:29 AM, Philipp Puschmann <pp@emlix.com> wrote:
> q/dl datasheets list the 5th selection value for ck01_sel as
> video_27M_clk_root.
>
> By replacing the dummy value we then can set IMX6QDL_CLK_VIDEO_27M
> as parent for IMX6QDL_CLK_CKO1_SEL.
>
> Signed-off-by: Philipp Puschmann <pp@emlix.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
