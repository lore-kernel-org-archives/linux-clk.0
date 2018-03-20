Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47714 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751738AbeCTSoD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 14:44:03 -0400
From: <ilialin@codeaurora.org>
To: "'Stephen Boyd'" <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>
Cc: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <rnayak@codeaurora.org>, <robh@kernel.org>, <will.deacon@arm.com>,
        <amit.kucheria@linaro.org>, <tfinkel@codeaurora.org>,
        <nicolas.dechesne@linaro.org>, <celster@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org> <1518616792-29028-5-git-send-email-ilialin@codeaurora.org> <152148159682.242365.14310882079879566131@swboyd.mtv.corp.google.com>
In-Reply-To: <152148159682.242365.14310882079879566131@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 04/10] clk: qcom: Add DT bindings for CPU clock driver for msm8996
Date: Tue, 20 Mar 2018 20:43:54 +0200
Message-ID: <016f01d3c07b$69839da0$3c8ad8e0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Monday, March 19, 2018 19:47
> To: Ilia Lin <ilialin@codeaurora.org>; =
linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org; =
ilialin@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: Re: [PATCH v3 04/10] clk: qcom: Add DT bindings for CPU clock =
driver
> for msm8996
>=20
> Quoting Ilia Lin (2018-02-14 05:59:46)
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > ---
> >  Documentation/devicetree/bindings/clock/qcom,kryocc.txt | 17
> +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> > new file mode 100644
> > index 0000000..e7cf15a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> > @@ -0,0 +1,17 @@
> > +Qualcomm CPUSS clock controller for Kryo CPUs
> > +----------------------------------------------------
> > +
> > +Required properties :
> > +- compatible : shall contain only one of the following:
> > +
> > +                       "qcom-msm8996-apcc"
>=20
> Do you mean qcom,msm8996-apcc?

The naming is per Rob's requirement.

>=20
> Rob?

