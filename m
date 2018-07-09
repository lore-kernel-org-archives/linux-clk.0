Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528285308-25477-4-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-4-git-send-email-anischal@codeaurora.org>
Message-ID: <153111468812.143105.11066074667783322403@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: Introduce QCOM Graphics clock bindings
Date: Sun, 08 Jul 2018 22:38:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-06-06 04:41:47)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Doc=
umentation/devicetree/bindings/clock/qcom,gpucc.txt
> new file mode 100644
> index 0000000..e311219
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
> @@ -0,0 +1,18 @@
> +Qualcomm Graphics Clock & Reset Controller Binding
> +--------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain "qcom,sdm845-gpucc".
> +- reg : shall contain base register location and length.
> +- #clock-cells : from common clock binding, shall contain 1.
> +- #reset-cells : from common reset binding, shall contain 1.
> +- #power-domain-cells : from generic power domain binding, shall contain=
 1.
> +
> +Example:
> +       gpucc: clock-controller@@5090000 {

Drop the double '@'

> +               compatible =3D "qcom,sdm845-gpucc";
> +               reg =3D <0x5090000 0x9000>;
> +               #clock-cells =3D <1>;
> +               #reset-cells =3D <1>;
> +               #power-domain-cells =3D <1>;
> +       };
