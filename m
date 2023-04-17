Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C5FC77B7A
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 17:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjDQRyW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 13:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjDQRyU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 13:54:20 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 436467A91
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 10:54:18 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o8so6336492ljp.6
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681754056; x=1684346056;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4+8olREfasjZv5QZc5V/pBOVr5naRMQNwCkcS8I+dA=;
        b=xWU5V7sLim6ioC/6Y+oJGgycGYAycQ5y8UhuBIc4sh3cg9EMDk8QRYHlF/jnbdPdsd
         32bDTpiDjIw0Egbeqk4eXTxNtEv3FtPbSHAkLGmSLadSJ2Elm0V1OOdfXXiGvQZIws5k
         KLSdVDp1B8h/UzI/xc+fQmAQvn0u3P4jRkJ9g0EP9cyK2JDwz7iHt9LNC845kDcVAv0r
         6xzLFeLqCNUoK8xhkDp+KCXFvvvuWnBiJ8097BQmVKCH8lDShMJRy+Ir0A4IzlafTh2d
         YrLSdE1XCyXcGIcGF5OZwh7kbYjlI7O9JYii9SIU3q8HAnKS7UiyecSVVTdalT4aX2sn
         k50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681754056; x=1684346056;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4+8olREfasjZv5QZc5V/pBOVr5naRMQNwCkcS8I+dA=;
        b=k1pzq/QBL2W3USb7IIMvFAJQi8/PK4D0GLO+hhXsXlafyosPrrg4bOxV9+XcWOuPfQ
         64DTPsKSx5cE1GcLauCFaoi1WIAJ4XwCj5ziGRDv8Ikx+ANA+BZ5BgtyNGlyQbD8Zo9p
         StXnQeh0PXfCSEt+nUie9mi+HsDks2EQXksQ5AzK7Ujdv+s2XRQ62snEFX6Gx7RSc+GX
         GE62kRqPxtq0CKoHKHbW784ll58jaUB+IXDSQYmbwso70snN35fsbARyevrttcrv52Xw
         NrhZeltuS8asJoPdpT5snpuPl9mioroLtUQTfFyoCHz8AozsrHABSACb6nfzueFYPI/C
         vUew==
X-Gm-Message-State: AAQBX9cPkIWjFIR7K+3aWQcUR6+MrifZ7OZ7Zwxq6pFkQpxjYmxFnsFK
        zW6sf/71FNH/EJYAT7uPF3k0jw==
X-Google-Smtp-Source: AKy350ZdGGOn1B6q+n7vcHcpU61x1OwUpebtzROn9z+Ltft2doHXj3wDzpWVq4DXIjV60SfmaBUrRg==
X-Received: by 2002:a2e:7c06:0:b0:2a7:a5f7:e9bc with SMTP id x6-20020a2e7c06000000b002a7a5f7e9bcmr3887227ljc.15.1681754056399;
        Mon, 17 Apr 2023 10:54:16 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id w19-20020a2e9bd3000000b002a8d915f30asm8799ljj.77.2023.04.17.10.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 10:54:16 -0700 (PDT)
Message-ID: <8b73a320-8c52-16bb-12c5-85e78dd48c04@linaro.org>
Date:   Mon, 17 Apr 2023 19:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sdm660: drop redundant F define
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230417174408.23722-1-ansuelsmth@gmail.com>
 <20230417174408.23722-2-ansuelsmth@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417174408.23722-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.04.2023 19:44, Christian Marangi wrote:
> The same exact F frequency table entry is defined in clk-rcg.h
> Drop the redundant define to cleanup code.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sdm660.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
> index db918c92a522..6afce8e42ede 100644
> --- a/drivers/clk/qcom/gcc-sdm660.c
> +++ b/drivers/clk/qcom/gcc-sdm660.c
> @@ -25,8 +25,6 @@
>  #include "reset.h"
>  #include "gdsc.h"
>  
> -#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> -
>  enum {
>  	P_XO,
>  	P_SLEEP_CLK,
