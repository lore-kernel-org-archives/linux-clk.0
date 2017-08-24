Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:35894 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752071AbdHXRf2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2017 13:35:28 -0400
Received: by mail-wr0-f175.google.com with SMTP id p14so406567wrg.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2017 10:35:28 -0700 (PDT)
Subject: Re: [PATCH] clk: qcom: msm8916: Fix bimc gpu clock ops
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20170818142250.27867-1-georgi.djakov@linaro.org>
 <20170823225543.GJ21656@codeaurora.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <a307ae95-ee53-4676-e5ed-8763b8b507ce@linaro.org>
Date: Thu, 24 Aug 2017 20:35:25 +0300
MIME-Version: 1.0
In-Reply-To: <20170823225543.GJ21656@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/24/2017 01:55 AM, Stephen Boyd wrote:
> On 08/18, Georgi Djakov wrote:
>> The clock bimc_gpu_clk_src is incorrectly set to use the shared rcg2
>> ops, which are for RCGs with child branches controlled by different
>> CPUs.
>>
>> The result of the incorrect ops is that the GPU's PM runtime may leave
>> this clock set at a very low rate. Fix this issue by using the correct
>> rcg2 ops.
>>
>> Fixes: a2e8272f3f89 ("clk: qcom: Add MSM8916 gpu clocks")
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>> ---
> 
> This is the only user of clk_rcg2_shared_ops. I'm totally lost
> why we added this in the first place.
> 

Yes, this is the only user. It seems that the ops could be useful for
a few other SoC that are not upstream yet, but for now i am sending a
patch to remove the unused code.

Thanks,
Georgi
