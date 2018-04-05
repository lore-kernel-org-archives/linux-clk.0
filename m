Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522304274-18989-3-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1522304274-18989-1-git-send-email-tdas@codeaurora.org>
 <1522304274-18989-3-git-send-email-tdas@codeaurora.org>
Message-ID: <152297042791.143116.12493897848354753009@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: Introduce QCOM RPMh clock bindings
Date: Thu, 05 Apr 2018 16:20:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-03-28 23:17:53)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh.txt b/Docu=
mentation/devicetree/bindings/clock/qcom,rpmh.txt
> new file mode 100644
> index 0000000..8222c88
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh.txt

Can the file name be qcom,rpmh-clk?

> @@ -0,0 +1,22 @@
> +Qualcomm Technologies, Inc. RPMh Clocks
> +-------------------------------------------------------
> +
> +Resource Power Manager Hardened (RPMh) manages shared resources on
> +some Qualcomm Technologies Inc. SoCs. It accepts clock requests from
> +other hardware subsystems via RSC to control clocks.
> +
> +Required properties :
> +- compatible : shall contain "qcom,rpmh-clk-sdm845"
> +
> +- #clock-cells : must contain 1
> +
> +Example :
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +
> +       &apps_rsc {

> +               clock_rpmh: qcom,rpmhclk {

Should say clock-controller for node name.

> +               compatible =3D "qcom,rpmh-clk-sdm845";
> +               #clock-cells =3D <1>;

Is this tabbed out correctly?

> +               };
> +       };
