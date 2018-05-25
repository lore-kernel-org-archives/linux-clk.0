Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/3] clk: qcom: gdsc: Add support for ALWAYS_ON gdscs
To: Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org,
 mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 stanimir.varbanov@linaro.org, vivek.gautam@codeaurora.org
References: <20180323082616.10142-1-rnayak@codeaurora.org>
 <20180323082616.10142-2-rnayak@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d0f36b0e-852d-c0b7-53f8-ac5ad9d34d9e@linaro.org>
Date: Fri, 25 May 2018 19:20:41 +0100
MIME-Version: 1.0
In-Reply-To: <20180323082616.10142-2-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 23/03/18 08:26, Rajendra Nayak wrote:
> Some GDSCs might have software control to turn them off, but we might
> want to keep them enabled always, in some cases because of lack of
> support in kernel to handle a graceful turning off/on of such GDSCs.
> Most common instances would be the GDCSs which power up the noc/bus
> fabrics, which need bus drivers to handle them and atleast support for
> which is missing on all qcom SoCs.
> 
> Signed-off-by: Rajendra Nayak<rnayak@codeaurora.org>
Tested-by: Srinivas Kandagatla<srinivas.kandagatla@linaro.org>
