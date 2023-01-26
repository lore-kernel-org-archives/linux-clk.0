Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535FDC54EED
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 16:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjAZQBM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 11:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjAZQBM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 11:01:12 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C82049950
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 08:01:10 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id l8so1442886wms.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 08:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FcQ8vq6lUSoBcskeTdnLtSTsDVmAwYg1jg2lyisgCl8=;
        b=l2geVIF7Cfn/0E5HIjMq40Ir/HPwxXgiS7dR57dcGci+Y95s25TMwfB0YUJqd6DzVv
         qEfN6GkXi+VyC7xiGffcp0Hhn2GgRG+IbuZ+IRN6QUgS+CswhZq7jNb5RdlgRvv5gUqQ
         AN2XAOLGWn8yGWqpjyEBxuV5KCru+byPUtX0opGO87zUIBYJlxuHdpl/xeaV9fo1gc6a
         En8sW7dzkyZ3cYuE6Xv8z04LVTHnqYw6OVG6pJ2xhn6g1EVB/31ydh66u7BUWg/XO7Dh
         X3yXsMpRrDojOZi2gNQ2PruEHPbamKlCnTCIAdMzdMf2IsvNA+QyYp3qs0X4m9FgVuDg
         xLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcQ8vq6lUSoBcskeTdnLtSTsDVmAwYg1jg2lyisgCl8=;
        b=jN3uuYjmLos3uKwQ6cMjFJz8M0NmXBux7MiyDcGjXkiZwJqtFIzMCSotCVG2m9NBX4
         Av1/o4HfSEIp/WL4nXtauKXIGsLTsAjI7cNKqq1owWPGFhJZcjoflBdoxzgaJ9aXo9oO
         gc2ACf81koWCPTNQBZ855K8ZV4/YYoT9gdXuNozHddgWW0wWvdFSW7gQICufACEh0YJN
         /BrBuvAWwZ2ZpbVFtnGV0eS03aW0JA33YBcZUlkjc9Bbe9fQ8D9cDycsJxZwUK2sfaf0
         7KHtc42IK3G30xDdQXvgeOFn4AWad8GBSMBpUJNrZ3q3V5nAPjb1ZPNcgCFiwZxFK5SH
         El8w==
X-Gm-Message-State: AFqh2koWZPzVv6Ju9sY6Bk0hHqaVrSROnkhVcgFndcNvoU3nMrTbL9YY
        9k3JqfDa1Rj+62ZilobVYgeTjw==
X-Google-Smtp-Source: AMrXdXs6JAtLvjTpQlUAkzsZq1XnTeNHQWtt5ki8p1OQb+ECja5bbx3QJ6wq8n9QR639AVO1rNPmdQ==
X-Received: by 2002:a05:600c:1906:b0:3da:1d51:ef9d with SMTP id j6-20020a05600c190600b003da1d51ef9dmr36757088wmq.15.1674748869113;
        Thu, 26 Jan 2023 08:01:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c180a00b003daf672a616sm1753836wmp.22.2023.01.26.08.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 08:01:08 -0800 (PST)
Message-ID: <9cbc160e-5aef-1de4-f1c8-a2d51b37aa0e@linaro.org>
Date:   Thu, 26 Jan 2023 17:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/6] clk: qcom: Add GPU clock controller driver for SM6125
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230126144033.216206-1-konrad.dybcio@linaro.org>
 <20230126144033.216206-3-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126144033.216206-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/01/2023 15:40, Konrad Dybcio wrote:
> Add support for the GPU clock controller found on SM6125.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig        |   8 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm6125.c | 444 ++++++++++++++++++++++++++++++++
>  3 files changed, 453 insertions(+)
>  create mode 100644 drivers/clk/qcom/gpucc-sm6125.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index ca6c7d2ada6c..ca2c83ecc6a6 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -798,6 +798,14 @@ config SM_GCC_8550
>  	  Say Y if you want to use peripheral devices such as UART,
>  	  SPI, I2C, USB, SD/UFS, PCIe etc.
>  
> +config SM_GPUCC_6125
> +	tristate "SM6125 Graphics Clock Controller"
> +	select SM_GCC_6125

depends on ARM64 || COMPILE_TEST

Same for second patch

Best regards,
Krzysztof

