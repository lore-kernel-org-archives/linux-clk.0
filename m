Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B5FC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 11:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbiGKL20 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 07:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiGKL1q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 07:27:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFCFA46A
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:05:27 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z25so8090438lfr.2
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 04:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=dPrZfAXq7F8ce8t3fuNDg51KlRMukh3iZYk9RgLqoNE=;
        b=Ss7HyQSh+ofbEmUv0VvjsNobh4eJuEu0heIwrqhODc6RsT3ooq+uTYDKAmfXJiLl1g
         lcpPVr6IKvLmIYxxIJxpBgYmaD9ce+ueRFIeW3xkkBS+Mw8BvqtSW6HB5yt7N/GCqR7N
         Dhu0CgbfeUwhJSwtVmNiQHibrjkqYGlOPKjWoKIvEnnoIb5n7KsSeYDAhcW7bRwHrQlV
         HwfLcVKbF5DRSrVXPLdx1xsIEC2c4zUVhBqH6pGqaCRMdpj/h0CDTFMhfpBeAtEjh45r
         2HKdKVbE08UkUyGZtuU8L3chtY+xQrdNQHmNmaPl4QrCTzroaZ+z3Isr/rm5lozyh+HR
         ks6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dPrZfAXq7F8ce8t3fuNDg51KlRMukh3iZYk9RgLqoNE=;
        b=EUPUqs3rAT3+1c8lZhb290c0i1RCNB8EY5NDSmbYrvTm9TnYsBhQLHuyWUEd9tu5iz
         CaTJuI6AwbRPkX1BhO72iP4JfnO5UQKvpARA+j8uei7eqlN0NnXlM4EBy3B518/LW0RY
         JPoTB/gum0NsZOf40upGmZbWzltUHuKc3qQkgDEuirS58pXEArlz3DRoXz36ce63I/72
         +c00hMs+zs87jBdk/+UP4tyz0y+FD5AgQwTN16jVttUR04K2ND1TU+x1slgi7iaF9cfj
         x/eeEkjjD6Si6v5FF9o3CXiEUdvES+qoskdRB8FlMsTERaRXfxZ2yDk8h4t6sxsVaKMX
         Ymzw==
X-Gm-Message-State: AJIora8QjDp2irxaciQq2m8PTDGSGf3e3Dg6SRyzbRDzQV01eqqZNpKD
        PukDr3Aal6k9Q96QGhD3SioFXQ==
X-Google-Smtp-Source: AGRyM1u/jw24PhqwPc6UTV/hyxk2KaW3EecjOe9Ez/DY3S2cBKdbASV5EDr17T6xbqPGPzK8st+IRw==
X-Received: by 2002:a05:6512:1310:b0:481:6154:c292 with SMTP id x16-20020a056512131000b004816154c292mr11134909lfu.95.1657537525579;
        Mon, 11 Jul 2022 04:05:25 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id w21-20020a05651c119500b00255500154fasm1681683ljo.52.2022.07.11.04.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:05:25 -0700 (PDT)
Message-ID: <4de38d90-0020-c2db-b283-319b4a0e2ce5@linaro.org>
Date:   Mon, 11 Jul 2022 13:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] clk: qcom: apss-ipq6018: add MODULE_ALIAS
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220711104719.40939-1-robimarko@gmail.com>
 <20220711104719.40939-4-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711104719.40939-4-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/07/2022 12:47, Robert Marko wrote:
> Add MODULE_ALIAS so that driver will be autoloaded if built as a module.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq6018.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
> index f2f502e2d5a4..963c69f2c0c2 100644
> --- a/drivers/clk/qcom/apss-ipq6018.c
> +++ b/drivers/clk/qcom/apss-ipq6018.c
> @@ -101,5 +101,6 @@ static struct platform_driver apss_ipq6018_driver = {
>  
>  module_platform_driver(apss_ipq6018_driver);
>  
> +MODULE_ALIAS("platform:qcom,apss-ipq6018-clk");

That's not correct alias (no commas) and usually alias is not needed at
all. If you need one, please explain why it is needed. Module
autoloading works fine without aliases...

Best regards,
Krzysztof
