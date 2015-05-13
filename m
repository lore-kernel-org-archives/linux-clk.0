Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Message-ID: <55537F93.2000101@linaro.org>
Date: Wed, 13 May 2015 19:45:07 +0300
From: Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@linaro.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: Add MSM8916 iommu clocks
References: <1431428438-8171-1-git-send-email-georgi.djakov@linaro.org> <20150513073601.GB15988@codeaurora.org>
In-Reply-To: <20150513073601.GB15988@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 05/13/2015 10:36 AM, Stephen Boyd wrote:
> On 05/12, Georgi Djakov wrote:
>> Add support for the msm8916 TCU clocks that are needed for IOMMU.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
> 
> Applied to clk-next
> 

Hi Stephen,
Just got a report that this patch has some issues - gcc_bimc_clk
may get disabled by the CCF, which turns out to be not good.
So I am going to remove it from the chain leaving only the
bimc_ddr_clk_src as the parent of apss_tcu and gfx_tcu clocks.
Will re-send this series soon. Apologies for the extra work.

Thanks,
Georgi
