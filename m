Return-Path: <SRS0=zpb1=XA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDF9C3A5AB
	for <linux-clk@archiver.kernel.org>; Thu,  5 Sep 2019 07:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C33BA2339D
	for <linux-clk@archiver.kernel.org>; Thu,  5 Sep 2019 07:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kv5HIPYV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732030AbfIEHaq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Sep 2019 03:30:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37292 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731641AbfIEHaq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Sep 2019 03:30:46 -0400
Received: by mail-wr1-f68.google.com with SMTP id i1so828073wro.4
        for <linux-clk@vger.kernel.org>; Thu, 05 Sep 2019 00:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UrUg55b04dM+yl9nRPJPjzzhoddXyzVLDYekdXcQSgc=;
        b=Kv5HIPYVfI9PgdgwlCV07ZyFJgXqw7sq2+0Vh5bvfl+bSA4H2DjB6yuku9I/09UJw0
         c7wiE0Ah5S4Fwoi9aBtWJH9SA4mfKNahb4AgmRQ8aZPo9BWBWuINo1P0Tn7z4hJ+4o1s
         m9aEA88V6xZZlC5r+OqaJE0phxLyFQx9G2JkUi6cTgFXGyHk7dyWzV6kVkwQsDV1KUBY
         TvfJiDilT5QL7nboF06DNKSjOH+13DXqo4K76QFFXnFY+3lzNTkOCb27liOVWBjTBcwN
         2cuANjLSloAdEcbrbP/5EwasNynZDopVKktayAkqiU9ZOqJSJblQ4qdOTzyJwGtq4u6k
         IPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UrUg55b04dM+yl9nRPJPjzzhoddXyzVLDYekdXcQSgc=;
        b=lA/aIzwaYmkRAQmpKLUeus6w3lfJ7KJobNk9S8djegZURFT0KBAj4q1mByz83nhbE3
         7DRtpy1LMO8IBwKK5BboM7a1kn4z1E2zv5xV0B2NXceoSoQWj+DSXXAnTbpYUvxGvi8j
         2ftJ3+zyEh6qNMj+jp6yIz9rFY1lWvL5ru9lQyR5HjXPrLSEdLakaXNZs3ROnca3s9m1
         vnyJOwTAknj9KnxxXWx6AfpbcVSK7IPkkCSo6SKm00KAZn7sm666LJYRFVtllMJreJsK
         UCkin3TshK93fstJPQrRKWJ8mtoW0mTvwoqDR6LUC4Ix25kaWjA6zR3ZLYuTa+BND609
         uC2g==
X-Gm-Message-State: APjAAAXqbHVI3qGbpzjF1nV5kf7Tq7oBVGmJD82d2OrV2R7ltli5SnoQ
        /bbR/yNkmNrYRUCaadRPTTKEpw==
X-Google-Smtp-Source: APXvYqxH10enx77PdMtYP8D35eEzL9IT8FWMAW4RDBDvOLJ+k8dnLJcHq1w5oeNLhxbZDZ5naLBEdQ==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr1376482wro.17.1567668644139;
        Thu, 05 Sep 2019 00:30:44 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id j26sm3633386wrd.2.2019.09.05.00.30.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 00:30:43 -0700 (PDT)
Subject: Re: [PATCH 1/5] clk: qcom: gcc: limit GPLL0_AO_OUT operating
 frequency
To:     sboyd@kernel.org, agross@kernel.org, mturquette@baylibre.com
Cc:     bjorn.andersson@linaro.org, niklas.cassel@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <f2e43da9-2d31-e8d5-83d2-77020e85e2a7@linaro.org>
Date:   Thu, 5 Sep 2019 09:30:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826164510.6425-1-jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/26/19 18:45, Jorge Ramirez-Ortiz wrote:
> Limit the GPLL0_AO_OUT_MAIN operating frequency as per its hardware
> specifications.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 ++++++++
>  drivers/clk/qcom/clk-alpha-pll.h | 1 +
>  drivers/clk/qcom/gcc-qcs404.c    | 2 +-
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 055318f97991..9228b7b1f56e 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -878,6 +878,14 @@ static long clk_trion_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return clamp(rate, min_freq, max_freq);
>  }
>  
> +const struct clk_ops clk_alpha_pll_fixed_ops = {
> +	.enable = clk_alpha_pll_enable,
> +	.disable = clk_alpha_pll_disable,
> +	.is_enabled = clk_alpha_pll_is_enabled,
> +	.recalc_rate = clk_alpha_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_ops);
> +
>  const struct clk_ops clk_alpha_pll_ops = {
>  	.enable = clk_alpha_pll_enable,
>  	.disable = clk_alpha_pll_disable,
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 15f27f4b06df..c28eb1a08c0c 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -109,6 +109,7 @@ struct alpha_pll_config {
>  };
>  
>  extern const struct clk_ops clk_alpha_pll_ops;
> +extern const struct clk_ops clk_alpha_pll_fixed_ops;
>  extern const struct clk_ops clk_alpha_pll_hwfsm_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_ops;
>  extern const struct clk_ops clk_alpha_pll_huayra_ops;
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index e12c04c09a6a..567140709c7d 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -330,7 +330,7 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
>  			.parent_names = (const char *[]){ "cxo" },
>  			.num_parents = 1,
>  			.flags = CLK_IS_CRITICAL,
> -			.ops = &clk_alpha_pll_ops,
> +			.ops = &clk_alpha_pll_fixed_ops,
>  		},
>  	},
>  };
> 

just a quick follow up, is this series being picked-up?
