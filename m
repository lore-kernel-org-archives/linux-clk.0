Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1523254493-5313-2-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1523254493-5313-1-git-send-email-anischal@codeaurora.org>
 <1523254493-5313-2-git-send-email-anischal@codeaurora.org>
Message-ID: <152393976444.51482.14239555065542681076@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 1/3] clk: qcom: Clear hardware clock control bit of RCG
Date: Mon, 16 Apr 2018 21:36:04 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-04-08 23:14:51)
> For upcoming targets like sdm845, POR value of the hardware clock control
> bit is set for most of root clocks which needs to be cleared for software
> to be able to control. For older targets like MSM8996, this bit is reserv=
ed
> bit and having POR value as 0 so this patch will work for the older targe=
ts
> too. So update the configuration mask to take care of the same to clear
> hardware clock control bit.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>

This one's already been applied. Please stop sending it.
