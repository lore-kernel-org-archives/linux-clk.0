Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B17C7EE2C
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jun 2023 13:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbjFBNSC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jun 2023 09:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236107AbjFBNR7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jun 2023 09:17:59 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024BB132
        for <linux-clk@vger.kernel.org>; Fri,  2 Jun 2023 06:17:46 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-97392066d04so290053366b.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Jun 2023 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711864; x=1688303864;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JwF8cKHicld7kwqHMzUbVeRLWFJ7BH702LKOXAuZJco=;
        b=zoY+NU5Y6PiNfdLA/h3+RX2B6aQxqApaIJuCIQBXUKQQNOyCMbc4wvlkTW3Jdz8KzV
         CW1bMcKbal5t6u9JEX1aw98ZqjEkgFDvWYq4m+rSlKG4atUXtQx+1jI65AqgUa0cG8hx
         lpmJ525GUXJJuHzOQ6gzwvn+JeUqVL6AuIQIK8axZWdH+pOvOU9vU0kjWOzihh2S1kQc
         6Zo0spJEJCU4FAuvHJRR2YTCQNvmZUUdBjgFO5TkB8QD1/jIyh7uOjbe6jlgxyhx81mo
         gfBZ9AT2ZB/rf8tLMZhBujuxWLfDghppXexU+xqSB9crZsqxTWANzlerLLKruOHjjK1A
         Gq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711864; x=1688303864;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwF8cKHicld7kwqHMzUbVeRLWFJ7BH702LKOXAuZJco=;
        b=TV+W22LMn/d13LRhxypMmel1cTZL9pvtUiF5FrCiXrkuh+vHpfqMPn0QBoP4QS9qg2
         fhbFBnHUusJk1kIQ+al1pfCsoS2pPSClnwfI2zfO5dYz6/OURUA5Ny2Dfwq8khiwAL1H
         lnOwJQ0rSRyhLhGuKIW3zHiShFqFsAH4FPQTteXJZpIg1NzSYqaSJGwKhvWnNtHf7CJY
         6TSr6UqdAPIlame/riXaOws4vohA9juumWKMRZthAl/XXDGkjE0NivOyaHePH6egWjFd
         qY9WWSkC79WNMXOhpmgt7s/29DW8FrKPN0fQPylIXD+016pdWiEn1rMvkhUWAkKn4vFU
         t6xg==
X-Gm-Message-State: AC+VfDw84PGPM1YDNUcYn7mJXk3ZILB57R/nELUuIknNKvs3QPOSNbM8
        5ZiVVAygwExKMnx45C8KqsRpjQ==
X-Google-Smtp-Source: ACHHUZ4g96v6Peh4kQ0OBC9/PyT6SdBvBNAAHB9J6XRtu9uVD3Y96twKtow4Pg4xSokDPdAldMJeIQ==
X-Received: by 2002:a17:906:9755:b0:974:1ced:6a56 with SMTP id o21-20020a170906975500b009741ced6a56mr12569506ejy.32.1685711864497;
        Fri, 02 Jun 2023 06:17:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id dk7-20020a170906f0c700b00974e7559fbfsm483707ejb.144.2023.06.02.06.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:17:43 -0700 (PDT)
Message-ID: <894a5ed1-71aa-d9ef-1301-54f4e3583cf3@linaro.org>
Date:   Fri, 2 Jun 2023 15:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/6] clk: qcom: Add lpass clock controller driver for
 SC8280XP
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-4-srinivas.kandagatla@linaro.org>
Content-Language: en-US
In-Reply-To: <20230525122930.17141-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Resending as my previous email probably got lost. If you got it twice,
apologies.

On 25/05/2023 14:29, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on SC8280XP based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig            |  8 ++++
>  drivers/clk/qcom/Makefile           |  1 +
>  drivers/clk/qcom/lpasscc-sc8280xp.c | 63 +++++++++++++++++++++++++++++
>  3 files changed, 72 insertions(+)
>  create mode 100644 drivers/clk/qcom/lpasscc-sc8280xp.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 85869e7a9f16..e25993abb519 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -523,6 +523,14 @@ config SC_LPASSCC_7280
>  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
>  	  controller to reset the LPASS subsystem.
>  
> +config SC_LPASSCC_8280XP
> +	tristate "SC8280 Low Power Audio Subsystem (LPASS) Clock Controller"

depends on ARM64 || COMPILE_TEST

Best regards,
Krzysztof

