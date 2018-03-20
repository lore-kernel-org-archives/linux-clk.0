Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49356 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbeCTSpP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 14:45:15 -0400
From: <ilialin@codeaurora.org>
To: "'Stephen Boyd'" <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>
Cc: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <rnayak@codeaurora.org>, <robh@kernel.org>, <will.deacon@arm.com>,
        <amit.kucheria@linaro.org>, <tfinkel@codeaurora.org>,
        <nicolas.dechesne@linaro.org>, <celster@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org> <1518616792-29028-6-git-send-email-ilialin@codeaurora.org> <152148167517.242365.13429407450120461901@swboyd.mtv.corp.google.com>
In-Reply-To: <152148167517.242365.13429407450120461901@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 05/10] clk: qcom: cpu-8996: Add support to switch to alternate PLL
Date: Tue, 20 Mar 2018 20:45:04 +0200
Message-ID: <017101d3c07b$9367cc40$ba3764c0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Will be fixed and respinned.

> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Monday, March 19, 2018 19:48
> To: Ilia Lin <ilialin@codeaurora.org>; =
linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org; =
ilialin@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: Re: [PATCH v3 05/10] clk: qcom: cpu-8996: Add support to =
switch to
> alternate PLL
>=20
> Quoting Ilia Lin (2018-02-14 05:59:47)
> > From: Rajendra Nayak <rnayak@codeaurora.org>
> >
> > Each of the CPU clusters on msm8996 and powered via a primary
>=20
> s/and/are/
>=20
> > PLL and a secondary PLL. The primary PLL is what drivers the
>=20
> s/drivers/drives/
>=20
> I make the same typo all the time!
>=20
> > CPU clk, except for times when we are reprogramming the PLL itself,
> > when we temporarily switch to an alternate PLL.
> > Use clock rate change notifiers to support this.
> >
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > ---
> >  drivers/clk/qcom/clk-cpu-8996.c | 35
> > +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-cpu-8996.c
> > b/drivers/clk/qcom/clk-cpu-8996.c index 42489f1..75bd014 100644
> > --- a/drivers/clk/qcom/clk-cpu-8996.c
> > +++ b/drivers/clk/qcom/clk-cpu-8996.c
> > @@ -140,10 +140,14 @@ struct clk_cpu_8996_mux {
> >         u32     reg;
> >         u32     shift;
> >         u32     width;
> > +       struct notifier_block nb;
> >         struct clk_hw   *pll;
> >         struct clk_regmap clkr;
> >  };
> >
> > +#define to_clk_cpu_8996_mux_nb(_nb) \
> > +       container_of(_nb, struct clk_cpu_8996_mux, nb)
> > +
> >  static inline
> >  struct clk_cpu_8996_mux *to_clk_cpu_8996_mux_hw(struct clk_hw *hw)
> {
> > @@ -194,6 +198,27 @@ static int clk_cpu_8996_mux_set_parent(struct
> clk_hw *hw, u8 index)
> >         return 0;
> >  }
> >
> > +int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long =
event,
> > +                       void *data)
> > +{
> > +       int ret;
> > +       struct clk_cpu_8996_mux *cpuclk =3D =
to_clk_cpu_8996_mux_nb(nb);
> > +
> > +       switch (event) {
> > +       case PRE_RATE_CHANGE:
> > +               ret =3D =
clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw,
> ALT_INDEX);
> > +               break;
> > +       case POST_RATE_CHANGE:
> > +               ret =3D =
clk_cpu_8996_mux_set_parent(&cpuclk->clkr.hw,
> PLL_INDEX);
> > +               break;
> > +       default:
> > +               ret =3D 0;
> > +               break;
> > +       }
> > +
> > +       return notifier_from_errno(ret); };
> > +
> >  const struct clk_ops clk_cpu_8996_mux_ops =3D {
> >         .set_parent =3D clk_cpu_8996_mux_set_parent,
> >         .get_parent =3D clk_cpu_8996_mux_get_parent, @@ -237,6 =
+262,7 @@
> > static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
> >         .shift =3D 0,
> >         .width =3D 2,
> >         .pll =3D &pwrcl_pll.clkr.hw,
> > +       .nb.notifier_call =3D cpu_clk_notifier_cb,
> >         .clkr.hw.init =3D &(struct clk_init_data) {
> >                 .name =3D "pwrcl_pmux",
> >                 .parent_names =3D (const char *[]){ @@ -256,6 +282,7 =
@@
> > static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
> >         .shift =3D 0,
> >         .width =3D 2,
> >         .pll =3D &perfcl_pll.clkr.hw,
> > +       .nb.notifier_call =3D cpu_clk_notifier_cb,
> >         .clkr.hw.init =3D &(struct clk_init_data) {
> >                 .name =3D "perfcl_pmux",
> >                 .parent_names =3D (const char *[]){ @@ -331,6 =
+358,14 @@
> > struct clk_hw_clks {
> >         clk_alpha_pll_configure(&perfcl_alt_pll, regmap, =
&altpll_config);
> >         clk_alpha_pll_configure(&pwrcl_alt_pll, regmap,
> > &altpll_config);
> >
> > +       ret =3D clk_notifier_register(pwrcl_pmux.clkr.hw.clk, =
&pwrcl_pmux.nb);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D clk_notifier_register(perfcl_pmux.clkr.hw.clk,
> &perfcl_pmux.nb);
> > +       if (ret)
> > +               return ret;
> > +
>=20
> Please resend this with the other patches that need rework.

