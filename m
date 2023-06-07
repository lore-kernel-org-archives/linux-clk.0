Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D851CC7EE2E
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 11:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240384AbjFGLUP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 07:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240344AbjFGLUN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 07:20:13 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1607F1993
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 04:20:08 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f624daccd1so4599596e87.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686136806; x=1688728806;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTBg9MyG6jhsl+u10WSeM0LsmdB54Dp+FeeVDwf+P1E=;
        b=GqGvhfCD5CfG/i9PdEtiYtDORlS2hSYj/XdMUA6gwOK8QYt2DOpbQVjlH403owaCe1
         lt2U1vB/X6Q7w6wsrTq+cvIdnX26i/HZvKpE5YJoX+GTLQcdhI8JXBPwryb7qPQMyEMU
         XipEAQqFjEkejFo7Nr4oTddfOWdKj0frkMfRavbwap9iA+85xQEXxQjlNigBkP5nr/dP
         0ywDsqvbzc0MGbhC37pE6yc3JUO0S6eAkpMYkhavE0Vbsz54D8dNOaWTbMlKHV2dLEv/
         CrZNM3bNoMVLKZSfpx85+uyuxt4osLX51Td9LTfFkLvgjisW/b36SNH7JkiB89JbhNDM
         IdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686136806; x=1688728806;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTBg9MyG6jhsl+u10WSeM0LsmdB54Dp+FeeVDwf+P1E=;
        b=j6MNIHo/FQ6M6PPfDFvcxKUPLUsk0BX49X0PlNpw24A90A8xMUKn3CoJRoZf/EUFaZ
         WMm6WMV0J3EFQxB+Y4BsYli//v86uJxDQSTrI+fThNxTCURT8ngz1Skxn6p6gEslDnGo
         TXZkP4eLfxpviBTQmsYhQvJhAuQqs4yZHF+520zR6KOIyc/re++sVq9dG8HDx5mshz91
         pw4j/k2rWeKpX6BXkCPvqLCjEjHyTvP8HmaJkrOSrbHw9ZtxzPM10uwehpIWtai6Zq9w
         CXzTHJB5CBRdagvVtn8Z53C4PzNayBiEGvllgiRX07HjRY+Yyqm3M+f0OiNO/m4v8GLM
         vyTA==
X-Gm-Message-State: AC+VfDxSCRu31qqYqkF3KmbU+wIr7Wh5f9zNAlSxi1rKs4MDyg6OIvix
        tvyqStT07ntQIsus8+vIVLTVlg==
X-Google-Smtp-Source: ACHHUZ4dGJnb/Q4jQtanIF6np0lUFYJ9Kec/sjx85wUK5bWSOr8484OmnpVW6Ub4tegvaeUknGYZyQ==
X-Received: by 2002:a2e:320c:0:b0:2b1:e966:b349 with SMTP id y12-20020a2e320c000000b002b1e966b349mr1944701ljy.31.1686136806130;
        Wed, 07 Jun 2023 04:20:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y19-20020a2e3213000000b002b1e6a78d3esm1096403ljy.82.2023.06.07.04.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:20:05 -0700 (PDT)
Message-ID: <f007fbf0-b1a7-cb44-d662-c30bf114365e@linaro.org>
Date:   Wed, 7 Jun 2023 14:20:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/9] phy: qcom-m31: Introduce qcom,m31 USB phy
Content-Language: en-GB
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <636308462efb579734de829fb6e9cbda81b982f7.1686126439.git.quic_varada@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <636308462efb579734de829fb6e9cbda81b982f7.1686126439.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 13:56, Varadarajan Narayanan wrote:
> Introduce CONFIG_PHY_QCOM_M31_USB for including the M31 phy driver
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>

Is there any reason to keep Kconfig, Makefile and driver in different 
commits?

> ---
>   drivers/phy/qualcomm/Kconfig | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index 67a45d9..8a363dd 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -188,3 +188,14 @@ config PHY_QCOM_IPQ806X_USB
>   	  This option enables support for the Synopsis PHYs present inside the
>   	  Qualcomm USB3.0 DWC3 controller on ipq806x SoC. This driver supports
>   	  both HS and SS PHY controllers.
> +
> +config PHY_QCOM_M31_USB
> +	tristate "Qualcomm M31 HS PHY driver support"
> +	depends on (USB || USB_GADGET) && ARCH_QCOM
> +	select USB_PHY
> +	help
> +	  Enable this to support M31 HS PHY transceivers on Qualcomm chips
> +	  with DWC3 USB core. It handles PHY initialization, clock
> +	  management required after resetting the hardware and power
> +	  management. This driver is required even for peripheral only or
> +	  host only mode configurations.

-- 
With best wishes
Dmitry

