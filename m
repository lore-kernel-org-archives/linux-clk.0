Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB62C04A68
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jul 2022 11:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbiG1LlL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jul 2022 07:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237291AbiG1Lk5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Jul 2022 07:40:57 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA435F6E
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 04:40:15 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id q18so1822079wrx.8
        for <linux-clk@vger.kernel.org>; Thu, 28 Jul 2022 04:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZTE4cnVobwmiqOUoS9ukGmjCOG+lX5jwP+r9zIdwDR4=;
        b=POCt2LdXxGBz03FDFBw0TqGivbwIbMfy3yVn0vuquDPrOK51EiKmVXwPUuGsbI5Y3o
         //9o2GyvPB+UJ9t5A7r1v4n3gMDLNDcECNpqAyNY9XuZ7I1adAmgT+eGie172lemzll2
         VZTyqRdpKrDFrvuUYj7+NHwPUffQXOkyAAwOFklWw0mESAHY5n51/znIUcDHIAsWjjyB
         CqYYW1aCrzDukJqTyi1PsZqhrW1Q22v8gceNYThdJhzKBpO3NmQf4w4mSHIlfx4A99i6
         afRf9W0e12L+dHchYBiHfskWdktZwcuSivkE1yoCLKjKhPvhz1LhqcMuBpbTLqii+uP2
         0Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZTE4cnVobwmiqOUoS9ukGmjCOG+lX5jwP+r9zIdwDR4=;
        b=cEpg09jnT13M0FsNTSBm3J4lQJ6ikWVTmjynSS9R6dg+FVoKQJ/BQ23oHxBJ8zLw+0
         kJlnHAgD7xiP8TsOcO1ezjpmlwWpAsbypeYVzOD7PMVcHMsFUchG7FeX6rWy57aoVVnT
         5daAPzorsk0qEz8iYMyMpTg6EgVt9GcxQYG94HCB8LLkyBDf9VAYMngKMahaAv9+qMFb
         YsaNa2dDgE8lfMHi+qk0EbdML/ETc7gh9T/FQkQhjGceclHHwAvFrLB6BuOUr5xZL4p5
         hSvyEPmAiFg50PV5SfULT16XDgB639Kx/AT7Y2plrXI4kmCG1IWCRLiYDGwTvbdI2C5l
         p69Q==
X-Gm-Message-State: AJIora+6B+xC58kAenITidJ5Z5LcnruU2iZJwy+b2be6TYfH2Bk41uNn
        jK77co9j/p7m/qoZ+WAbpTurKQ==
X-Google-Smtp-Source: AGRyM1vYKooOSjgWwIWNujjfVy6VuQq0Lw3mcwRtcB1YbS1NSaJR2CGc58Mg2l7pDrGhc3/H3W2OmQ==
X-Received: by 2002:a05:6000:156e:b0:21d:c50a:7cdb with SMTP id 14-20020a056000156e00b0021dc50a7cdbmr17180485wrz.16.1659008413733;
        Thu, 28 Jul 2022 04:40:13 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r41-20020a05600c322900b003a2e89d1fb5sm4444116wmp.42.2022.07.28.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 04:40:13 -0700 (PDT)
Date:   Thu, 28 Jul 2022 14:40:11 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     XU pengfei <xupengfei@nfschina.com>
Cc:     Kernel@nfschina.com, agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Subject: Re: [PATCH v2] clk/qcom/gcc-sm6350: Remove unnecessary semicolon
Message-ID: <20220728114011.2fztt7htj6ekwiz2@linaro.org>
References: <Yt5FAJiEv0WWuDNV@linaro.org>
 <20220728090719.3056-1-xupengfei@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728090719.3056-1-xupengfei@nfschina.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-07-28 17:07:20, XU pengfei wrote:
> Remove unnecessary semicolon after qcom_cc_really_probe call.
>
> Signed-off-by: XU pengfei <xupengfei@nfschina.com>
> ---

Thanks for this new version, but there are still some issues with it.

First of, don't use slashes in subject. Use semicolons instead.
Have a look at how other commits look like by running:

git log --oneline drivers/clk/qcom/

Also, do not send subsquent versions of a patch as a reply to old ones.


>  drivers/clk/qcom/gcc-sm6350.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index a4f7fba70393..69412400efa4 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2558,7 +2558,7 @@ static int gcc_sm6350_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);;
> +	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);
>  }
>
>  static struct platform_driver gcc_sm6350_driver = {
> --
> 2.18.2
>
