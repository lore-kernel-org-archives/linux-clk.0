Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:37782 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751320AbeCTUeV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 16:34:21 -0400
From: <ilialin@codeaurora.org>
To: "'Stephen Boyd'" <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>
Cc: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <rnayak@codeaurora.org>, <robh@kernel.org>, <will.deacon@arm.com>,
        <amit.kucheria@linaro.org>, <tfinkel@codeaurora.org>,
        <nicolas.dechesne@linaro.org>, <celster@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org> <1518616792-29028-10-git-send-email-ilialin@codeaurora.org> <152147812199.242365.11821734771337881765@swboyd.mtv.corp.google.com> <013a01d3c051$d65a9160$830fb420$@codeaurora.org> <152157637794.125118.12382168941652366593@swboyd.mtv.corp.google.com>
In-Reply-To: <152157637794.125118.12382168941652366593@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 09/10] DT: QCOM: Add cpufreq-dt to msm8996
Date: Tue, 20 Mar 2018 22:34:04 +0200
Message-ID: <017c01d3c08a$cf903270$6eb09750$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Understood, what you mean. I assumed that the cpufreq-dt is generic =
driver, and adding architecture specific code to it is no not correct =
from architectural point of view. Anyway, I'm considering adding a =
platform specific cpufreq driver, which will handle the efuse data as =
well.

Meanwhile this is the way to use the generic driver.

> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Tuesday, March 20, 2018 22:06
> To: ilialin@codeaurora.org; linux-arm-kernel@lists.infradead.org; =
linux-arm-
> msm@vger.kernel.org; linux-clk@vger.kernel.org; sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: RE: [PATCH v3 09/10] DT: QCOM: Add cpufreq-dt to msm8996
>=20
> Quoting ilialin@codeaurora.org (2018-03-20 06:46:19)
> > > From: Stephen Boyd <sboyd@kernel.org> Quoting Ilia Lin (2018-02-14
> > > 05:59:51)
> > > > diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > index 3b585e4..b6cd0ae 100644
> > > > --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> > > > @@ -95,6 +95,9 @@
> > > >         { .compatible =3D "xlnx,zynq-7000", },
> > > >         { .compatible =3D "xlnx,zynqmp", },
> > > >
> > > > +       { .compatible =3D "qcom,msm8996", },
> > > > +       { .compatible =3D "qcom,apq8096", },
> > > > +
> > >
> > > Why can't we base it on the kryocc node being present?
> > This could be good idea, if I would writing a platform specific =
cpufreq driver,
> which may be a future option.
>=20
> Well maybe cpufreq-dt can also look at the cpus nodes for a cpu with a
> certain type (in this case kryo). Then we can add cpufreq dt based on =
that
> CPU node being there.
>=20
> > > Or even populate
> > > the cpufreq-dt from the kryocc driver?
> > There is a problem that during the clock probe the OPP table still =
doesn't
> exist.
>=20
> The OPP table is in DT? Why doesn't it exist?

