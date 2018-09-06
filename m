Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <15984aab-d815-56bb-af9c-7be9cfd9a103@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <1533298874-22863-1-git-send-email-tdas@codeaurora.org>
 <1533298874-22863-3-git-send-email-tdas@codeaurora.org>
 <153540431524.129321.12826367247850332291@swboyd.mtv.corp.google.com>
 <15984aab-d815-56bb-af9c-7be9cfd9a103@codeaurora.org>
Message-ID: <153619871329.119890.8761547440925666785@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/2] clk: qcom: Add lpass clock controller driver for SDM845
Date: Wed, 05 Sep 2018 18:51:53 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-09-05 11:26:10)
> On 8/28/2018 2:41 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-08-03 05:21:14)
> >> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpas=
scc-sdm845.c
> >> new file mode 100644
> >> index 0000000..6f387f9
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
> > [...]
> >> +
> >> +/* CLK_OFF would not toggle until LPASS is not out of reset */
> > =

> > Can we change the branch ops to check for out of reset or not? Do the
> > clks even work when LPASS isn't out of reset? Why would the clk APIs
> > even be called on here if it hadn't taken LPASS out of reset?
> > =

> =

> The branches need to be turned ON before the LPASS is out of reset.
> But we would not be able to check the CLK_ENABLE bit.

Ok. Are the branches actually outputting any clk frequency when LPASS is
in reset? It sounds like the hardware is broken and we can't ever check
the halt bits?
