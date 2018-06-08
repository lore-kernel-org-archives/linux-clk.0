Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180608101924.31195-1-pp@emlix.com>
References: <20180608101924.31195-1-pp@emlix.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 8 Jun 2018 10:00:52 -0300
Message-ID: <CAOMZO5C8CA02V+oiag5tGpKBWN+UP28KwQ98jQ9PpQ2_aCq_bA@mail.gmail.com>
Subject: Re: [PATCH] clk: imx6: fix video_27m parent for IMX6QDL_CLK_CKO1_SEL
To: Philipp Puschmann <pp@emlix.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Philipp,

On Fri, Jun 8, 2018 at 7:19 AM, Philipp Puschmann <pp@emlix.com> wrote:
> q/dl datasheets list the 5th selection value for ck01_sel as
> video_27M_clk_root.
>
> By replacing the dummy value we then can set IMX6QDL_CLK_VIDEO_27M
> as parent for IMX6QDL_CLK_CKO1_SEL.
>
> Signed-off-by: Philipp Puschmann <pp@emlix.com>

You could still have added my Reviewed-by tag that I sent previously :-)

Here it goes:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Also in the future, when posting a new version of a patch, please mark
it as such:

[PATCH v2] clk: imx6: fix video_27m parent for IMX6QDL_CLK_CKO1_SEL

and write below the --- line what are the changes in this new version.

Thanks
