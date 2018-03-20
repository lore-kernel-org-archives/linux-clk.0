Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60682 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753459AbeCTNxQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 09:53:16 -0400
From: <ilialin@codeaurora.org>
To: "'Stephen Boyd'" <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>
Cc: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <rnayak@codeaurora.org>, <robh@kernel.org>, <will.deacon@arm.com>,
        <amit.kucheria@linaro.org>, <tfinkel@codeaurora.org>,
        <nicolas.dechesne@linaro.org>, <celster@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org> <1518616792-29028-8-git-send-email-ilialin@codeaurora.org> <152147821849.242365.7709382599118820578@swboyd.mtv.corp.google.com>
In-Reply-To: <152147821849.242365.7709382599118820578@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 07/10] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
Date: Tue, 20 Mar 2018 15:53:08 +0200
Message-ID: <013c01d3c052$ca49ecd0$5eddc670$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Monday, March 19, 2018 18:50
> To: Ilia Lin <ilialin@codeaurora.org>; =
linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org; =
ilialin@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: Re: [PATCH v3 07/10] clk: qcom: clk-cpu-8996: Prepare PLLs on =
probe
>=20
> Quoting Ilia Lin (2018-02-14 05:59:49)
> > The PLLs must be prepared enabled during the probe to be accessible =
by
> > the OPPs. Otherwise an OPP may switch to non-enabled clock.
>=20
> Sounds like an OPP problem.

And again, it could be solved by a platform specific cpufreq driver. =
Worth it?

>=20
> >
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > ---
> >  drivers/clk/qcom/clk-cpu-8996.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/clk-cpu-8996.c
> > b/drivers/clk/qcom/clk-cpu-8996.c index 854f327..b0a3b73 100644
> > --- a/drivers/clk/qcom/clk-cpu-8996.c
> > +++ b/drivers/clk/qcom/clk-cpu-8996.c
> > @@ -15,7 +15,7 @@
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > -
> > +#include <linux/clk-provider.h>
>=20
> Please leave a newline between linux/* and local includes.

Will be changed in the next spin.

>=20
> >  #include "clk-alpha-pll.h"
> >
> >  #define VCO(a, b, c) { \
> > @@ -376,6 +376,18 @@ struct clk_hw_clks {
> >         clk_alpha_pll_configure(&perfcl_alt_pll, regmap, =
&altpll_config);
> >         clk_alpha_pll_configure(&pwrcl_alt_pll, regmap,
> > &altpll_config);
> >
> > +       /* Enable all PLLs and alt PLLs */
> > +       clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
> > +       clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
> > +       clk_prepare_enable(pwrcl_pll.clkr.hw.clk);
> > +       clk_prepare_enable(perfcl_pll.clkr.hw.clk);
>=20
> And this can't be done by the cpufreq-dt driver?

Are you suggesting changing the cpufreq-dt as well?

>=20
> > +
> > +       /* Set initial boot frequencies for power/perf PLLs */
> > +       clk_set_rate(pwrcl_alt_pll.clkr.hw.clk, 652800000);
> > +       clk_set_rate(perfcl_alt_pll.clkr.hw.clk, 652800000);
> > +       clk_set_rate(pwrcl_pll.clkr.hw.clk, 652800000);
> > +       clk_set_rate(perfcl_pll.clkr.hw.clk, 652800000);
>=20
> We have assigned rates in DT for this.

I assumed that the clock driver can live without the OPP table and any =
cpufreq driver. Or do you mean adding this as parameters for the kryocc =
DT node?

>=20
> > +
> >         ret =3D clk_notifier_register(pwrcl_pmux.clkr.hw.clk, =
&pwrcl_pmux.nb);
> >         if (ret)
> >                 return ret;

