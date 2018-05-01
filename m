Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525164093-16645-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Taniya Das <tdas@codeaurora.org>
References: <1525164093-16645-1-git-send-email-tdas@codeaurora.org>
 <1525164093-16645-2-git-send-email-tdas@codeaurora.org>
Message-ID: <152520902751.138124.3904360654314728163@swboyd.mtv.corp.google.com>
Subject: Re: [v5 1/2] dt-bindings: clock: Introduce QCOM RPMh clock bindings
Date: Tue, 01 May 2018 14:10:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-05-01 01:41:32)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/=
Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> new file mode 100644
> index 0000000..ecc1dbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -0,0 +1,32 @@
> +Qualcomm Technologies, Inc. RPMh Clocks
> +-------------------------------------------------------
> +
> +Resource Power Manager Hardened (RPMh) manages shared resources on
> +some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
> +other hardware subsystems via RSC to control clocks.
> +
> +Required properties :
> +- compatible : shall contain "qcom,sdm845-rpmh-clk"
> +
> +- #clock-cells : must contain 1
> +
> +Optional properties :
> +- assigned-clk-divs : property should contain a list of divs for each cl=
ock in
> +                       the clk-output-names property. In case divs are n=
ot
> +                       provided the clock rate would be same as parent r=
ate.
> +- clk-output-names :  a list of strings of clock output signal for the d=
ivs to
> +                        be applied.
> +
> +Example :
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +
> +       &apps_rsc {
> +               rpmhcc: clock-controller {
> +                       compatible =3D "qcom,sdm845-rpmh-clk";
> +                       #clock-cells =3D <1>;
> +                       assigned-clk-divs =3D <2 2 2>;

This property shouldn't need to exist. Instead, add a fixed div-2 clock
to the DTS file (I guess in the SoC file) to divide the crystal
frequency into the rate you want (19.2 MHz in this case).

> +                       clk-output-names =3D "bi_tcxo", "lnbb_clk2",
> +                                               "lnbb_clk3";

We don't need this either.
