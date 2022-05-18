Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96144C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 17:24:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240999AbiERRY2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 13:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240996AbiERRY2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 13:24:28 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD9920D4D9
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:24:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t25so4814906lfg.7
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mf9G3ysnZiC52rqRmJAWRUhPTOoibF8SrhOcqiUaOSU=;
        b=iKl+3s9SH+6K3kV2Q9tc7wqnPfzfDuUCGl15w3X157YKQLhFByhfGvYlL6wjbAC8xI
         bs0XWJR2h0Zp5u8dM9f38fQpkgt9LCP6A12vMRqw471BNALR6AdoFZb/BgYsDWdjVX5Z
         PDIUOXkn+HibD/8i3hUoj/VV8yOqqLI9g+kyHMJxtajhTadL31olwBj69+nGPQmwYOim
         RiCjJ+Fwad5oeyhc8hgaKS6d+tfCU4fUkUkk93KGSNwVo5WVHQZxW2Gq17lthG/mLkup
         xLBcLEeF2CptJ55MaoxmSXHMnZ8W3l0B1k0BPgcfD31tloSfe7T4eVclKxmUiwN5eTKr
         Xorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mf9G3ysnZiC52rqRmJAWRUhPTOoibF8SrhOcqiUaOSU=;
        b=sXEQMzF1OdzVTM453nKtMLHpLeq3JvkK4cMHW/MoIuSXEJFUFSdxrYG4Kv+/hK+Rnw
         6jhavkDEVkHx9XKW0kjS5FdJMPpZQoC6/rpX9pxzZqcSPGz8/AoSIW1emZtrLx043e42
         14fre0SmNizcDRPBT0bWa8pyGBzM8KRULEj709fbjIa0LbA4eXE92N7S7gRDBxbkDHOg
         8Hcv3ZaXqGWYjSQ2fiD3EjJohC8XTranLuWEGDGGT2jrxl9re96/yhsrLrpnAY8HBQ3k
         XOdsnXeR5O7/4UDzFJDXmzaZBHkEZF6I3WpcOnEIMQeJ8KShGaOVWa9u93E2etdDT5EU
         abcw==
X-Gm-Message-State: AOAM533rLv+5jZlk1HWSknstuVmnq/92gMZrQSYY61Zp1B3Px4cPRn0j
        dvQFH2ZEnbA2Ibk/FB/krcg9cv8D+3E7Ww==
X-Google-Smtp-Source: ABdhPJxfehjjbocbgZ+T2p5x/dvs+5c+/yv4uHTEnxdkTlpRn4YoEcTKmAi3T/pfbr1/j+u0+V2sQw==
X-Received: by 2002:a05:6512:1291:b0:473:b522:ef58 with SMTP id u17-20020a056512129100b00473b522ef58mr390939lfs.190.1652894662150;
        Wed, 18 May 2022 10:24:22 -0700 (PDT)
Received: from [192.168.1.102] (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id r3-20020a2e80c3000000b0024f3d1daecesm276741ljg.86.2022.05.18.10.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 10:24:21 -0700 (PDT)
Message-ID: <c1f4cfa7-f7f3-a72a-b48b-97071906398c@linaro.org>
Date:   Wed, 18 May 2022 20:24:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
 <6cb75a3e-49fd-bbe0-4e81-d6aec33b70a5@somainline.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6cb75a3e-49fd-bbe0-4e81-d6aec33b70a5@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Konrad,

On 5/18/22 19:47, Konrad Dybcio wrote:
> 
> On 18/05/2022 12:35, Vladimir Zapolskiy wrote:
>> Access to I/O of SM8250 camera clock controller IP depends on enabled
>> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
>> one is inited on subsys level, so, to satisfy the dependency, it would
>> make sense to deprive the init level of camcc-sm8250 driver.
> 
> Hi,
> 
> I believe this is due to the fact that this clock is falsely advertised
> by the header and Linux does not know anything about it, because it is
> handled by a magic write [1] (as I once said in a similar case, this was
> going bite eventually..) instead and the index corresponding to the
> define symbol is not initialized, hence it points to NULL. Adding the

your observation is correct in my opinion, however it does not change the
identified root cause of the problem, and my rationale remains the same,
the camera clock controller should be initialized after the GCC, thus
this change, and currently the critical fix, remains valid.

> clock properly in GCC would let the OF clock stuff handle it gracefully.

If/when the clock is properly added in the GCC, then it will open an
option to clk_prepare_enable() it in the CAMCC driver, so at least it's
a point to keep it described in a dts as it's done right from the beginning,
especially because the platform dtsi describes the hardware properly.
To add a real CCF clock would be my preference, but, as I've said above,
even if it happens, it does not belittle the presented change.

> If that is the case, your patch disabling the clock controller block
> (which I'm against unless there's abosolute need, as having the hw block
> initialized properly should be possible regardless of the board, as it's
> a generic SoC components) should not be necessary.

Here I do oppose, I believe board dts files should explicitly describe
enabled IPs in accordance to actual board peripherals. For instance it's
unclear why CAMCC or e.g. CAMSS should be enabled by default on a board
without camera sensors at all. I understand that there is an option to
explicitly disable some particular device tree nodes in board files, but
it is against common practicalities.

Also above I do neglect the fact that the GCC clock is always enabled,
irrelatively of its actual usage by probably disabled CAMCC.

--
Best wishes,
Vladimir

> That said, I can not test my theory right now.
> 
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/qcom/gcc-sm8250.c?h=next-20220518#n3647
> 
> Konrad
> 
>>
>> If both drivers are compiled as built-in, there is a change that a board
>> won't boot up due to a race, which happens on the same init level.
>>
>> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>    drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
>>    1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
>> index 439eaafdcc86..ae4e9774f36e 100644
>> --- a/drivers/clk/qcom/camcc-sm8250.c
>> +++ b/drivers/clk/qcom/camcc-sm8250.c
>> @@ -2440,17 +2440,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
>>    	},
>>    };
>>    
>> -static int __init cam_cc_sm8250_init(void)
>> -{
>> -	return platform_driver_register(&cam_cc_sm8250_driver);
>> -}
>> -subsys_initcall(cam_cc_sm8250_init);
>> -
>> -static void __exit cam_cc_sm8250_exit(void)
>> -{
>> -	platform_driver_unregister(&cam_cc_sm8250_driver);
>> -}
>> -module_exit(cam_cc_sm8250_exit);
>> +module_platform_driver(cam_cc_sm8250_driver);
>>    
>>    MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
>>    MODULE_LICENSE("GPL v2");
>>
