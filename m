Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB174C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Apr 2022 14:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377710AbiD2Op0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Apr 2022 10:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377680AbiD2OpI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 10:45:08 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93D160AA6
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 07:41:43 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s27so10805299ljd.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=v2gZtm1Y9EnOM5Lz97MhvmGZH6fMaQCNcq4ssrGXHvA=;
        b=ClMCvVPqnQvsDrQSnAHoGq7Vw5jDkH20m6A/jFylwgb5q97jAdRdcW5Tq/ZaNiH+Cp
         yIg47tN6GtmlTBH5mtys7w9mDlDFu5S/h+p9aL/puwS8bYuXt/nFHomvmU3LgQAF6YSY
         r037KVH5Hozn7/KWxmUuGVfe2fRViCWWRM0skggmZKD3leNVKeniAzLHjebi28EOK5Nr
         n6giekI/b+HkE2c8faKP8PebkDDPCvZNdKFVksYUzucQrGdb9y63esEM2xL1deU8a37x
         p1AI8Br8SMlk0CuUVXdCLcjGT+EQfv9Pw3SDNLA28y2JJrwSVpHcX1QA+HZAnMN07QBG
         NwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v2gZtm1Y9EnOM5Lz97MhvmGZH6fMaQCNcq4ssrGXHvA=;
        b=gRCQXleC+2FlFGonxiK+Ou+7Ua91cCSVrxYBYTiz1gx6bEGRqvtqs8/a8RYQHk78GK
         yLcunImgmxhR7nm7eCCFZuvXOu4QbUlRgqYbrpnhUQTqmw9/r0L8wt0FztlhmvwR3X8D
         ZB8OPg0JUHXsSszfXPCupW+1eyAeXlhmMjFqIkRArGEU1YD+DJcDbndTUWATJixV6XNJ
         WMuaqcrE8JWohP7Od5DbHjcSzuViWf0eDwePsHFLPjIj59ZAEu+Qs6rF3QvEIb2PgP15
         BXxlKgLmCQyCmGMtltaJ9eN4LXA3SEV29pbYr+S0CSNcPzB28oeTNznRclj1QrL2NOoE
         Q2ng==
X-Gm-Message-State: AOAM5324Itk1lI84TLgFjBTx7Wk4ni9vn6j2ZVukDRp7wg3TLVs9xGOQ
        jWb6NGDK6b5sjVgYDtrIg3A4eg==
X-Google-Smtp-Source: ABdhPJx293qUvuCappYWJV4aCE2Kp2oJ/m2hcMh6SW9WP1q60AEQCRl17k3YoPhVKTLl4IVO2KI5Mg==
X-Received: by 2002:a2e:8e98:0:b0:24f:15e9:ed39 with SMTP id z24-20020a2e8e98000000b0024f15e9ed39mr14240296ljk.460.1651243302165;
        Fri, 29 Apr 2022 07:41:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h7-20020ac24d27000000b004720819b691sm255343lfk.130.2022.04.29.07.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 07:41:41 -0700 (PDT)
Message-ID: <beb3bd74-a550-b0c1-b6bd-99536dc9b2e1@linaro.org>
Date:   Fri, 29 Apr 2022 17:41:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/4] clk: qcom: clk-krait: unlock spin after mux
 completion
Content-Language: en-GB
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan R <sricharan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220429120108.9396-1-ansuelsmth@gmail.com>
 <20220429120108.9396-3-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220429120108.9396-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2022 15:01, Ansuel Smith wrote:
> Unlock spinlock after the mux switch is completed to prevent any corner
> case of mux request while the switch still needs to be done.
> 
> Fixes: 4d7dc77babfe ("clk: qcom: Add support for Krait clocks")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/clk/qcom/clk-krait.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> index 59f1af415b58..90046428693c 100644
> --- a/drivers/clk/qcom/clk-krait.c
> +++ b/drivers/clk/qcom/clk-krait.c
> @@ -32,11 +32,16 @@ static void __krait_mux_set_sel(struct krait_mux_clk *mux, int sel)
>   		regval |= (sel & mux->mask) << (mux->shift + LPL_SHIFT);
>   	}
>   	krait_set_l2_indirect_reg(mux->offset, regval);
> -	spin_unlock_irqrestore(&krait_clock_reg_lock, flags);
>   
>   	/* Wait for switch to complete. */
>   	mb();
>   	udelay(1);
> +
> +	/*
> +	 * Unlock now to make sure the mux register is not
> +	 * modified while switching to the new parent.
> +	 */
> +	spin_unlock_irqrestore(&krait_clock_reg_lock, flags);
>   }
>   
>   static int krait_mux_set_parent(struct clk_hw *hw, u8 index)


-- 
With best wishes
Dmitry
