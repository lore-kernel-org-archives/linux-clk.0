Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 26 Jan 2017 15:54:25 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] clk: imx7d: Add the IPG root clock
Message-ID: <20170126235425.GH8801@codeaurora.org>
References: <1484762037-10737-1-git-send-email-fabio.estevam@nxp.com>
 <1484762037-10737-2-git-send-email-fabio.estevam@nxp.com>
 <CAOi56cUrAyqV3e1zW+UGNRfGaueJr9yH1md3DPJT6vVM_zfpTA@mail.gmail.com>
 <CAOMZO5CTrO2kEgxg=-KamZb5HXEoy18T0yDDxGQ4b9oscjU2_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5CTrO2kEgxg=-KamZb5HXEoy18T0yDDxGQ4b9oscjU2_A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, Sascha Hauer <kernel@pengutronix.de>,
 Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-clk@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

On 01/26, Fabio Estevam wrote:
> Hi Kevin,
> 
> On Thu, Jan 26, 2017 at 3:24 AM, Kevin Hilman <khilman@baylibre.com> wrote:
> > Hi Fabio,
> >
> > On Wed, Jan 18, 2017 at 9:53 AM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> >> Add an entry for the IMX7D_IPG_ROOT clock.
> >>
> >> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> >
> > kernelci.org started detecting boot failures on imx7s-warp in
> > next-20160124[1], and I bisected it down to this patch, which is in
> > linux-next as commit dde08302c083.
> >
> > I verified that reverting that commit on top of next-20160124 gets
> > imx7s-warp booting again.
> 
> Thanks for the report.
> 
> Stephen, could you please drop this patch from your tree? I will
> investigate the issue.

Sure. I've dropped this patch.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
