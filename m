Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55BBECAAA1
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 13:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiJ1NtG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 09:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbiJ1Nsx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 09:48:53 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F421E0442
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 06:46:58 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so5505611wms.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlka1GHz30o8aFh5tsOBDtq0uUt2y6UQRhwfqrBr1vE=;
        b=QYmk5BWs/oI32LYoqi6tLS8sQs5PGD1Qrw15MH8NBomuEMZV10PHqTFlI+RoBIu63A
         O3/7wsg3FeQJ8vpmH241KKQ65NuURSh+kytsn4Er3zqNF+2kZrikQips6ZOXKrKbtlZ2
         t+ChjWuvDTdR8O1yED8kWYgLfTG3bEGRzxsxItS4+3Z+603sVU7GuAYftmbDHAx9PbhO
         x9igrP530WCjTkHlUR07gSVAPV0wbqlU/N7YUS/Zs66d9uG/4YOFXarqhBQqMQZGnXTA
         Y6rKBrErcmc0BcARnZN8SJZ7gHOj9FiEyUNKny59c92ODDwddB7ExNP8QQ3t20w8FXkr
         0AGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlka1GHz30o8aFh5tsOBDtq0uUt2y6UQRhwfqrBr1vE=;
        b=ePNup8OrEBxfIvM9mhPlg3fYxwgnaf8ipRelQpi0+m15edrMiyjvYxzdlxBWNd1wbI
         JFjj2yRGPO2XNMp7hNH/vU1IEndMMd7to9Z0MvAy8DCi2ajB9wyVxKnVkCspiOOcNtHq
         3CBNdJ2r2QecXHd/Zq7zWgNOjr2oPuzyGiH8OoEW8jrT4lBOtU4kzQRblO11MKic5Rz5
         aAfTe3Y6sPKy0h6QDosaKR1quioAboCxMqlkmUSD09p2DMFTpBX2Z4+ZVWYFj2a5c9j6
         Ere9VkGp24kSL1u0IQfA9gGdHA1NXZRnCa6dYlg6qp1axetY5uKSgWiUkX3QMw742IFp
         RdLA==
X-Gm-Message-State: ACrzQf3kpgcCSL3ygX6fDKmq1/qTEwjl3HPKrQk6UOa7mDdu/HulRHUi
        wu5XCNIeLLTuU74BnBcPghcyWTrCbgqsBw==
X-Google-Smtp-Source: AMsMyM6jRcL5aI0pR7qvy593FXtb1XFIcJ1VPvGc+0GGu3R4pUQo7szAhVrmZO9sLmRfQplU7LHFgQ==
X-Received: by 2002:a05:600c:3789:b0:3c6:beed:fecf with SMTP id o9-20020a05600c378900b003c6beedfecfmr9281906wmr.174.1666964817077;
        Fri, 28 Oct 2022 06:46:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:9e9c:c6c2:95a3:c182? ([2a01:e0a:898:f380:9e9c:c6c2:95a3:c182])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003c6c5a5a651sm4267793wmb.28.2022.10.28.06.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 06:46:56 -0700 (PDT)
Message-ID: <ec753353-a844-2262-bbbf-7b77fc55af19@linaro.org>
Date:   Fri, 28 Oct 2022 15:46:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] clk: meson: fix repeated words in comments
Content-Language: en-US
To:     Jilin Yuan <yuanjilin@cdjrlc.com>, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221028134156.64042-1-yuanjilin@cdjrlc.com>
Organization: Linaro Developer Services
In-Reply-To: <20221028134156.64042-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/10/2022 15:41, Jilin Yuan wrote:
> Delete the redundant word 'of'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
> ---
>   drivers/clk/meson/clk-regmap.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index e365312da54e..e08a9fa0cc36 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h
> @@ -18,7 +18,7 @@
>    * @data:	data specific to the clock type
>    *
>    * Clock which is controlled by regmap backed registers. The actual type of
> - * of the clock is controlled by the clock_ops and data.
> + * the clock is controlled by the clock_ops and data.
>    */
>   struct clk_regmap {
>   	struct clk_hw	hw;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
