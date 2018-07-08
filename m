Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1529763567-13131-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1529763567-13131-1-git-send-email-tdas@codeaurora.org>
 <1529763567-13131-2-git-send-email-tdas@codeaurora.org>
Message-ID: <153109377967.143105.13957823345139041590@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/3] clk: qcom: Move frequency table macro to common file
Date: Sun, 08 Jul 2018 16:49:39 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-06-23 07:19:25)
> Frequency table macro is used by multiple clock drivers, move frequency
> table macro to common header file.
> =

> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
