Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:36052 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932770AbbLON1n (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 15 Dec 2015 08:27:43 -0500
Received: by mail-wm0-f44.google.com with SMTP id n186so164928407wmn.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Dec 2015 05:27:42 -0800 (PST)
Message-ID: <5670154B.4020607@linaro.org>
Date: Tue, 15 Dec 2015 13:27:39 +0000
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
To: Georgi Djakov <georgi.djakov@linaro.org>, sboyd@codeaurora.org
CC: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk:gcc-msm8916: add missing mss_q6_bimc_axi clock
References: <1449934749-26223-1-git-send-email-srinivas.kandagatla@linaro.org> <56701278.90306@linaro.org>
In-Reply-To: <56701278.90306@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 15/12/15 13:15, Georgi Djakov wrote:
> Hi Srini,
> Thanks for the patch.
>
> On 12/12/2015 05:39 PM, Srinivas Kandagatla wrote:
>> This clock is required for loading the qdsp firmware.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/clk/qcom/gcc-msm8916.c               | 18 ++++++++++++++++++
>>   include/dt-bindings/clock/qcom,gcc-msm8916.h |  1 +
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
>> index e3bf09d..1ec5a27 100644
>> --- a/drivers/clk/qcom/gcc-msm8916.c
>> +++ b/drivers/clk/qcom/gcc-msm8916.c
>> @@ -2590,6 +2590,23 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
>>   	},
>>   };
>>
>> +static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
>> +	.halt_reg = 0x49004,
>> +	.clkr = {
>> +		.enable_reg = 0x49004,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(struct clk_init_data){
>> +			.name = "gcc_mss_q6_bimc_axi_clk",
>> +			.parent_names = (const char *[]){
>> +				"pcnoc_bfdcd_clk_src",
>
> Looks like the parent should be bimc_ddr_clk_src.
> Otherwise looks fine to me.

Thanks for review, I will fix it and send v2.

--srini
>
> BR,
> Georgi
>
