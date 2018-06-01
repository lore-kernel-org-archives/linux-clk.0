Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajendra Nayak <rnayak@codeaurora.org>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180323082616.10142-2-rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
 srinivas.kandagatla@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-2-rnayak@codeaurora.org>
Message-ID: <152787634364.144038.3592690846877465058@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: gdsc: Add support for ALWAYS_ON gdscs
Date: Fri, 01 Jun 2018 11:05:43 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajendra Nayak (2018-03-23 01:26:14)
> Some GDSCs might have software control to turn them off, but we might
> want to keep them enabled always, in some cases because of lack of
> support in kernel to handle a graceful turning off/on of such GDSCs.
> Most common instances would be the GDCSs which power up the noc/bus
> fabrics, which need bus drivers to handle them and atleast support for
> which is missing on all qcom SoCs.
> =

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next
