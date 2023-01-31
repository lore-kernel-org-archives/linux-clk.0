Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8EFC38142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 09:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbjAaJLw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 04:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjAaJLb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 04:11:31 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6B94AA59
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:08:32 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id me3so39582780ejb.7
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvZFGEb6ilNzMNhh9fv9IuXbqpfg3oT1c2jIZcF2xWM=;
        b=e4YvRLThIDW9v3B7U+tlfqyrqRGiLm7MG2HXLEFNLDpiTAcUFDAViKXBIBGw7jcwkb
         JfBWu2LxdK2tycGekl15QM0AHzRiO40LNHYzmhoudgsBXOoWK2UKVqfKeFWbZSJ4Lu9e
         2LKyedqhz9gesKVtlUFmBm1sH7qeJ7USTZuHqwn5XY7+Zp5SrfX9GwfIQbSLB0b+LVjC
         B7Ls/px9FoOf5F7NqS4cBgWBC9iqbzKCdusY8dg5oQdO7l4QgZmCFvSkhfscug8Pogmx
         UkDdXgJyqZgZLBGGPPv4riPbS8UkzDW6FKNDqxdxDv3Kd8FKnItHqQCaPH2kwWseiy2Z
         l8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvZFGEb6ilNzMNhh9fv9IuXbqpfg3oT1c2jIZcF2xWM=;
        b=Yy3TsBtMtkwx6CXo+d3dR0Ev1VFDVY4qO0WNNfnEeE3tXLD2Ro89C/SzlfRF0LMrbZ
         GdQRN9jLjQt2qFz+O+sOJvvojc5zqh2YmlTZBBwY5PV7L0kMK0fKLEjgWXdrUKIKpfxW
         bolbHxJbjtZOwka1bayFVs4V1yI7NdBapXX+7mdBXw4NQv8Y1UQg8Q5nxmmB4HD9K56U
         HSmmWWGQfYTb+SKS+xc7m9fHp6f6yppupQS1JQcBg2aSf2eivxUK44F3L0pdmROONgrT
         12kAqkpqBFxH7F+mXphjgm73Wrx+BUSteNZcGBoT1g+vR2WkEqGE7PxbFLa7Q3jJFlTd
         0QWw==
X-Gm-Message-State: AO0yUKWjSy1z7oHGHAAui728v4ctzo6Pkjf8RcGsyRQKHIc3y8085I85
        AeRiz75ys3q/XA1+Y53AwuAMgA==
X-Google-Smtp-Source: AK7set/fkCjMwPdeq3dbT7XzpDbaTpWYqO6zlWASza9z86yswhAQLidjpbkA5qSyCnhSfhfuixdc5g==
X-Received: by 2002:a17:906:9d18:b0:860:5723:a5e5 with SMTP id fn24-20020a1709069d1800b008605723a5e5mr13444218ejc.69.1675156026038;
        Tue, 31 Jan 2023 01:07:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c7-20020a170906d18700b00871f66bf354sm8000458ejz.204.2023.01.31.01.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 01:07:05 -0800 (PST)
Message-ID: <ad54c0b7-f228-ed4a-4a6b-33edb2af2c07@linaro.org>
Date:   Tue, 31 Jan 2023 11:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/8] clk: qcom: branch: Add SLEEP/WAKE fields
 definitions
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
 <20230130235926.2419776-3-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230130235926.2419776-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/01/2023 01:59, Konrad Dybcio wrote:
> HLOS-controlled branch clocks on non-ancient Qualcomm platforms
> feature SLEEP and WAKE fields which can be written to to configure
> how long the clock hardware should wait internally before being
> (un)gated. Some very sensitive clocks need to have these values
> programmed to prevent putting the hardware in a not-exactly-good
> state.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

(I think these fields should go to the same file as other CBCR_ defs go, 
so if you adapt the suggestion in patch#1, please move them too.)

> ---
>   drivers/clk/qcom/clk-branch.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
> index d8fc7b93ef6d..773f760a4590 100644
> --- a/drivers/clk/qcom/clk-branch.h
> +++ b/drivers/clk/qcom/clk-branch.h
> @@ -41,6 +41,8 @@ struct clk_branch {
>   #define CBCR_FORCE_MEM_CORE_ON		BIT(14)
>   #define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
>   #define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
> +#define CBCR_WAKEUP			GENMASK(11, 8)
> +#define CBCR_SLEEP			GENMASK(7, 4)
>   
>   static inline void qcom_branch_set_force_mem_core(struct regmap *regmap, u32 reg, bool on)
>   {

-- 
With best wishes
Dmitry

