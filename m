Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180805002222.GA24789@embeddedor.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
References: <20180805002222.GA24789@embeddedor.com>
Message-ID: <153566754942.93865.16064112317062824567@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: qcom: clk-branch: Use true and false for boolean values
Date: Thu, 30 Aug 2018 15:19:09 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Gustavo A. R. Silva (2018-08-04 17:22:22)
> Return statements in functions returning bool should use true or false
> instead of an integer value.
> =

> This code was detected with the help of Coccinelle.
> =

> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Applied to clk-next
