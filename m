Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Rajendra Nayak <rnayak@codeaurora.org>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180323082616.10142-4-rnayak@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org,
 srinivas.kandagatla@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-4-rnayak@codeaurora.org>
Message-ID: <152787639993.144038.1013097942784774744@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: mmcc-msm8996: leave all mmagic gdscs and
 clocks always enabled
Date: Fri, 01 Jun 2018 11:06:39 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Rajendra Nayak (2018-03-23 01:26:16)
> There's no bus infrastructure today to handle all the mmagic bus
> clocks and GDSCs needed by all the multimedia blocks in msm8996, like
> mdss, video, camera and gpu. Mark all these clocks with a CLK_IS_CRITICAL
> and GDSCs with a ALWAYS_ON flag for now so they are left always enabled.
> This patch should be reverted at some point when we do have a bus driver
> to manage these clocks and GDSCs.
> =

> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Applied to clk-next
