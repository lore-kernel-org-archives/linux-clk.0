Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530773721-14668-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
 Taniya Das <tdas@codeaurora.org>
References: <1530773721-14668-1-git-send-email-tdas@codeaurora.org>
 <1530773721-14668-2-git-send-email-tdas@codeaurora.org>
Message-ID: <153092054581.143105.16123786121344421693@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Introduce QCOM LPASS clock bindings
Date: Fri, 06 Jul 2018 16:42:25 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-07-04 23:55:20)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/D=
ocumentation/devicetree/bindings/clock/qcom,lpasscc.txt
> new file mode 100644
> index 0000000..fe7378b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> @@ -0,0 +1,22 @@
> +Qualcomm LPASS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible   : shall contain "qcom,sdm845-lpasscc"
> +- #clock-cells : from common clock binding, shall contain 1.
> +- reg          : shall contain base register address and size.
> +- reg-names    : shall contain the register names of LPASS domain
> +                       "lpass_gcc", "lpass_cc", "lpass_qdsp6ss".
> +
> +Example:
> +
> +The below node has to be defined in the cases where the LPASS peripheral=
 loader
> +would bring the subsystem out of reset.
> +
> +       lpasscc: clock-controller {
> +               compatible =3D "qcom,sdm845-lpasscc";
> +               reg =3D <0x00147000 0x20>, <0x17014000 0x1f004>,

This first reg is inside GCC though? Why isn't it added to the gcc
sdm845 driver? And then the next two might make sense as a different
region, but the reg property ending in 20 looks really weird.

> +                       <0x17300020 0x20>;
> +               reg-names =3D "lpass_gcc", "lpass_cc", "lpass_qdsp6ss";
> +               #clock-cells =3D <1>;
> +       };
