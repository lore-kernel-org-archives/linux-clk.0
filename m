Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33459 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751722AbeEUKhj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 May 2018 06:37:39 -0400
Received: by mail-pg0-f67.google.com with SMTP id e21-v6so1287261pgv.0
        for <linux-clk@vger.kernel.org>; Mon, 21 May 2018 03:37:39 -0700 (PDT)
Date: Mon, 21 May 2018 16:07:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ilia Lin <ilialin@codeaurora.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: Add Kryo CPU scaling driver
Message-ID: <20180521103736.5bz7oulz5gpl24ea@vireshk-i7>
References: <1526555955-29960-11-git-send-email-ilialin@codeaurora.org>
 <1526898690-4018-1-git-send-email-ilialin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1526898690-4018-1-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Would have been better if you would have updated the subject as:

[PATCH v10 10/15] cpufreq: Add Kryo CPU scaling driver

On 21-05-18, 13:31, Ilia Lin wrote:
> In Certain QCOM SoCs like apq8096 and msm8996 that have KRYO processors,
> the CPU frequency subset and voltage value of each OPP varies
> based on the silicon variant in use. Qualcomm Process Voltage Scaling Tables
> defines the voltage and frequency value based on the msm-id in SMEM
> and speedbin blown in the efuse combination.
> The qcom-cpufreq-kryo driver reads the msm-id and efuse value from the SoC
> to provide the OPP framework with required information.
> This is used to determine the voltage and frequency value for each OPP of
> operating-points-v2 table when it is parsed by the OPP framework.
> 
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Yes, I acked it earlier, but then comments came back. You should drop
the tags in such cases normally.

Anyway, the patch looks fine now.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
