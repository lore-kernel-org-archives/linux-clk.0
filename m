Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <614e462b0294a1ece78b654ad3e4553f@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk-owner@vger.kernel.org
References: <1532345193-18108-1-git-send-email-anischal@codeaurora.org>
 <1532345193-18108-3-git-send-email-anischal@codeaurora.org>
 <153262575082.48062.16264904338225269915@swboyd.mtv.corp.google.com>
 <614e462b0294a1ece78b654ad3e4553f@codeaurora.org>
Message-ID: <153322907852.10763.2149017059137432779@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] clk: qcom: Add camera clock controller driver for SDM845
Date: Thu, 02 Aug 2018 09:57:58 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-07-30 00:20:52)
> On 2018-07-26 22:52, Stephen Boyd wrote:
> > Quoting Amit Nischal (2018-07-23 04:26:33)
> >> diff --git a/drivers/clk/qcom/camcc-sdm845.c =

> >> b/drivers/clk/qcom/camcc-sdm845.c
> >> new file mode 100644
> >> index 0000000..61e5ec2
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/camcc-sdm845.c
> >> +static struct clk_rcg2 cam_cc_bps_clk_src =3D {
> >> +       .cmd_rcgr =3D 0x600c,
> >> +       .mnd_width =3D 0,
> >> +       .hid_width =3D 5,
> >> +       .parent_map =3D cam_cc_parent_map_0,
> >> +       .freq_tbl =3D ftbl_cam_cc_bps_clk_src,
> >> +       .clkr.hw.init =3D &(struct clk_init_data){
> >> +               .name =3D "cam_cc_bps_clk_src",
> >> +               .parent_names =3D cam_cc_parent_names_0,
> >> +               .num_parents =3D 6,
> >> +               .flags =3D CLK_SET_RATE_PARENT,
> >> +               .ops =3D &clk_rcg2_shared_ops,
> > =

> > Why are shared ops used in this driver?
> > =

> =

> As per HW design, most of the CAMCC RCGs needs to move to
> XO during clock disable so because of this we have used the
> shared ops.

Please add a comment to this effect in this driver and also mention this
in the commit text. I guess the camera firmware is also doing clk
control and so it wants the clk to be on at some basic rate in case
that's happening?
 =

> >> +
> >> +static struct clk_rcg2 cam_cc_slow_ahb_clk_src =3D {
> >> +       .cmd_rcgr =3D 0x6054,
> >> +       .mnd_width =3D 0,
> >> +       .hid_width =3D 5,
> >> +       .parent_map =3D cam_cc_parent_map_0,
> >> +       .freq_tbl =3D ftbl_cam_cc_slow_ahb_clk_src,
> >> +       .clkr.hw.init =3D &(struct clk_init_data){
> >> +               .name =3D "cam_cc_slow_ahb_clk_src",
> >> +               .parent_names =3D cam_cc_parent_names_0,
> >> +               .num_parents =3D 6,
> >> +               .flags =3D CLK_SET_RATE_PARENT,
> > =

> > Is CLK_SET_RATE_PARENT intentionally set on these RCGs so that they can
> > reconfigure the PLL frequency? Wouldn't that be a fixed rate PLL
> > frequency?
> > =

> =

> PLL2_OUT_EVEN requires to be reconfigure to 480MHz so clock sources =

> which
> are using PLL2 in their frequency table requires 'CLK_SET_RATE_PARENT'
> flag to be set.

Ok.
