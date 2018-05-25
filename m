Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/3] clk: qcom: Register the gdscs before the clocks
To: Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-3-rnayak@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b0f5df15-d312-166d-f7fe-43bf0c49df23@linaro.org>
Date: Fri, 25 May 2018 19:20:55 +0100
MIME-Version: 1.0
In-Reply-To: <20180323082616.10142-3-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 23/03/18 08:26, Rajendra Nayak wrote:
> We have atleast some instances of ALWAYS_ON gdscs, which need to
> be turned ON*before*  some clocks within the gdsc domain marked
> with a CLK_IS_CRITICAL can be turned ON.
> To facilitate this sequence, register the GDCSs (and hence handle
> the ALWAYS_ON gdscs) before we register clocks (and handle the
> clocks marked as CLK_IS_CRITICAL)
> 
> Signed-off-by: Rajendra Nayak<rnayak@codeaurora.org>
> ---
Tested-by: Srinivas Kandagatla<srinivas.kandagatla@linaro.org>
