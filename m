Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <47adf305-f649-dca6-e45e-51c7b418d418@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <1533298874-22863-1-git-send-email-tdas@codeaurora.org>
 <1533298874-22863-2-git-send-email-tdas@codeaurora.org>
 <153540448713.129321.8622050618939041593@swboyd.mtv.corp.google.com>
 <47adf305-f649-dca6-e45e-51c7b418d418@codeaurora.org>
Message-ID: <153619882706.119890.168416195348998783@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: Introduce QCOM LPASS clock bindings
Date: Wed, 05 Sep 2018 18:53:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-09-05 11:26:36)
> =

> On 8/28/2018 2:44 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-08-03 05:21:13)
> =

> >>
> >>   Example:
> >>          clock-controller@900000 {
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt =
b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> >> new file mode 100644
> >> index 0000000..062e413
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> >> @@ -0,0 +1,33 @@
> >> +Qualcomm LPASS Clock Controller Binding
> >> +-----------------------------------------------
> >> +
> >> +Required properties :
> >> +- compatible           : shall contain "qcom,sdm845-lpasscc"
> >> +- #clock-cells         : from common clock binding, shall contain 1.
> >> +- reg                  : shall contain base register address and size,
> >> +                         in the order
> >> +                       Index-0 maps to LPASS_CC register region
> >> +                       Index-1 maps to LPASS_QDSP6SS register region
> >> +- qcom,lpass-protected : Boolean property to indicate to GCC clock co=
ntroller
> >> +                        for the lpass GCC clocks.
> > =

> > Why is this here?
> > =

> =

> Yes, I kept it to make sure it is marked in GCC clock driver too. May be =

> should remove it.
>

It isn't a property of the LPASS clock controller though so I don't see
why it is here.
