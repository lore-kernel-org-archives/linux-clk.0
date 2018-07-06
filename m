Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Vivek Gautam <vivek.gautam@codeaurora.org>, linux-clk@vger.kernel.org,
 mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180629113640.11888-1-vivek.gautam@codeaurora.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20180629113640.11888-1-vivek.gautam@codeaurora.org>
Message-ID: <153090148164.143105.10101604037427005480@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH RESEND 1/1] clk/mmcc-msm8996: Make mmagic_bimc_gdsc ALWAYS_ON
Date: Fri, 06 Jul 2018 11:24:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Vivek Gautam (2018-06-29 04:36:40)
> Patch (7705bb7176b9 clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> and clocks always enabled") makes all mmgaic gdscs ALWAYS_ON.
> The mmagic_bimc_gdsc is also needed to be turned on to get display
> working on 8x96.
> =

> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Applied to clk-fixes
