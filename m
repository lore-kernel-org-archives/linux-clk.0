Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F84C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 18 May 2022 12:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237098AbiERMsm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 May 2022 08:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237316AbiERMsa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 May 2022 08:48:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFD71611FC
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 05:48:04 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r30so2528982wra.13
        for <linux-clk@vger.kernel.org>; Wed, 18 May 2022 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QDRebOwKR1U7lf+8cC6DEw4q2LYFiJkBiZbjUsroBtA=;
        b=VFaRnp4nJwGe6+K0h8fZQDYP5mjMH+aTJbeT60nygLmmb469VcltrQ6iMwJiEYNttV
         4D4ZTqggYzl1/ZJBDkT4Xhrmx31nbBDFdah32gRN3iGBOSrOUdbh14K50Ycue1VUuG7W
         Y0VDI416R7dTuWuaPW7VgbetqAEKAMlXpfJU/4FI8YPJDzPjgl6Hao4OZvJ8fhasSJOn
         ht4CvN5xsGDQRe9ctRWXh8UTanBF5YXkBRHzot7VF9OpvbKZEexFfK6tTleUlsQQ7zLm
         t9SHTSnO8546tiucnTUBlb/TkjG+0EK8b+x9sD9Keib5aoHcTkrboaKFuz8AIMqaA4av
         Pzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QDRebOwKR1U7lf+8cC6DEw4q2LYFiJkBiZbjUsroBtA=;
        b=4V5Krd7PHw8N3EXbnQbakj7gSBx1dsqFoOj4mIRlfG62xm+1wY4JVZirI6eh+8qSf7
         ONLwf5HtV3L8QAKZPiFQFkBqNB5CdNzQzloOOPq8yEAHSkgQLGLYnBCJagkipbcgixku
         HOg7C3xgiQnmqxH8YqZyH+fBohLrIWvm3KjkIOlGebGV5wnwcJmKZ3AWHkzX3+s2tvPO
         V2rZ/cj+bvyZfaRSGIKDiE3epbjnK0YDth9kqJ60V8mcvUI5H/8hH1L8ac+1ij9Kuyc5
         DMrfQtErrUgjrmfw7SYVbHa6nlVJXmqmNdR3OlbCLEevpinlwkB3e5YYhDMdFd0Ampev
         EXXA==
X-Gm-Message-State: AOAM531+Jgn4APdmxwNlW4P0zmTJpaRKXSJZU030ed1NTu3g+xNm7uAI
        m9TXcMwwG9ALrHJhuMtHTAQHRQ==
X-Google-Smtp-Source: ABdhPJxAJE+m5SmQKDYPjuDuk+UjAwN1tLOx3HmhZwD9VCHZO2OgecLZe+qruUro7ymOOQ+JRFmfNQ==
X-Received: by 2002:adf:e186:0:b0:20d:910:6481 with SMTP id az6-20020adfe186000000b0020d09106481mr12650832wrb.522.1652878082781;
        Wed, 18 May 2022 05:48:02 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j20-20020a05600c2b9400b0039453fe55a7sm4188006wmc.35.2022.05.18.05.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 05:48:02 -0700 (PDT)
Message-ID: <f645fe49-8adf-c1b2-89be-e8ab8f620f16@linaro.org>
Date:   Wed, 18 May 2022 13:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/05/2022 11:35, Vladimir Zapolskiy wrote:
> Access to I/O of SM8250 camera clock controller IP depends on enabled
> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
> one is inited on subsys level, so, to satisfy the dependency, it would
> make sense to deprive the init level of camcc-sm8250 driver.
> 
> If both drivers are compiled as built-in, there is a change that a board
> won't boot up due to a race, which happens on the same init level.
> 
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..ae4e9774f36e 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2440,17 +2440,7 @@ static struct platform_driver cam_cc_sm8250_driver = {
>   	},
>   };
>   
> -static int __init cam_cc_sm8250_init(void)
> -{
> -	return platform_driver_register(&cam_cc_sm8250_driver);
> -}
> -subsys_initcall(cam_cc_sm8250_init);
> -
> -static void __exit cam_cc_sm8250_exit(void)
> -{
> -	platform_driver_unregister(&cam_cc_sm8250_driver);
> -}
> -module_exit(cam_cc_sm8250_exit);
> +module_platform_driver(cam_cc_sm8250_driver);
>   
>   MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
>   MODULE_LICENSE("GPL v2");

So I tried this

-                       clocks = <&gcc GCC_CAMERA_AHB_CLK>,
-                                <&rpmhcc RPMH_CXO_CLK>,
+                       clocks = <&rpmhcc RPMH_CXO_CLK>,
                                  <&rpmhcc RPMH_CXO_CLK_A>,
                                  <&sleep_clk>;
-                       clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", 
"sleep_clk";
+                       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";

and the system wouldn't boot @ * 736ee37e2e8e - (tag: next-20220518, 
linux-next/master) Add linux-next specific files for 20220518 (2 hours ago)

If we do a grep

grep subsys_init drivers/clk/qcom/camcc-*
drivers/clk/qcom/camcc-sc7180.c:subsys_initcall(cam_cc_sc7180_init);
drivers/clk/qcom/camcc-sc7280.c:subsys_initcall(cam_cc_sc7280_init);
drivers/clk/qcom/camcc-sdm845.c:subsys_initcall(cam_cc_sdm845_init);
drivers/clk/qcom/camcc-sm8250.c:subsys_initcall(cam_cc_sm8250_init);

and

arch/arm64/boot/dts/qcom/sc7180.dtsi:			       <&gcc GCC_CAMERA_AHB_CLK>,
arch/arm64/boot/dts/qcom/sm8250.dtsi:			clocks = <&gcc GCC_CAMERA_AHB_CLK>,

I think the sc7180 has this same dependency loop. Probably needs the 
same fix.

Also not sure why sdm845 camcc doesn't declare a depends on 
GCC_CAMERA_AHB_CLK - should it ?

Recommend applying this same fix to sc718x

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
