Return-Path: <pp@emlix.com>
Subject: Re: [PATCH] clk: imx6: fix video_27m parent for IMX6SX_CLK_CKO1_SEL
To: Fabio Estevam <festevam@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20180606092928.11724-1-pp@emlix.com>
 <CAOMZO5B-T2UWdv-tf5vsCuRQ6f_o1gw1pAn-b6h9zfmi5ng4Ug@mail.gmail.com>
From: Philipp Puschmann <pp@emlix.com>
Message-ID: <5cd0f6eb-9c90-f89c-7fc4-7b2bfae99809@emlix.com>
Date: Fri, 8 Jun 2018 12:21:56 +0200
MIME-Version: 1.0
In-Reply-To: <CAOMZO5B-T2UWdv-tf5vsCuRQ6f_o1gw1pAn-b6h9zfmi5ng4Ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

I screwed up the title: IMX6SX_CLK_CKO1_SEL instead of IMX6QDL_CLK_CKO1_SEL

I have resent the patch with correct title. Sorry for the inconvenience.

Am 06.06.2018 um 15:07 schrieb Fabio Estevam:
> On Wed, Jun 6, 2018 at 6:29 AM, Philipp Puschmann <pp@emlix.com> wrote:
>> q/dl datasheets list the 5th selection value for ck01_sel as
>> video_27M_clk_root.
>>
>> By replacing the dummy value we then can set IMX6QDL_CLK_VIDEO_27M
>> as parent for IMX6QDL_CLK_CKO1_SEL.
>>
>> Signed-off-by: Philipp Puschmann <pp@emlix.com>
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
