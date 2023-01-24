Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E599C38142
	for <linux-clk@archiver.kernel.org>; Tue, 24 Jan 2023 15:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbjAXPPA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Jan 2023 10:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235051AbjAXPO4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2023 10:14:56 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29F249437
        for <linux-clk@vger.kernel.org>; Tue, 24 Jan 2023 07:14:53 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id b7so14219578wrt.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Jan 2023 07:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fa3NonT7uFixEjw+mFXts/QRHz1QGTzg+aYFZ1DSamI=;
        b=ZDwoRWXjszEA2Uri4ulJorf3U8qeYpMCzR9w95It/1gUBf49Qp2To8luIc8kDHdrxW
         FO9g8eIkGybfAuaMkAa7qWlRjQKZia6gZzzuEMba/PBpQbZj1vsW7IiTtxk2BaCH6u2g
         WuY8nWWaaQZesAhD1Hp/CkPGxt+c73uqhP8N9iH4sqYsfkhAcz+YH4CYpjPbr6j9NPtv
         JxdnlmhmAEJupOZdHv/cSBJi772XxQ1gunch/yWVVhkzzd27ePiVcvcS1ch7I6bM+mbN
         3Vp0oCwj6XDip/JpghvWcM6pCB5D5rCwK2bxnp08+BJutG4B+3YIVslD9+EB+fibY2+p
         qZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fa3NonT7uFixEjw+mFXts/QRHz1QGTzg+aYFZ1DSamI=;
        b=brHTl9kSvl3kkpAyzr54Lt65smh4JC81ob7JyuS8ZcYVPqdcjKNZ4c+Ny4e6iprVor
         OQMgDr9DWxbKEJ8ghcm4V+/KO/dv06Das0ijeg8cyP1Hm3XuRHUVctEaE1fjvQMSotl/
         yDEaUWDwuwJ/NXPAZ4iRY6TRVdz8ZNCvYSDMTDAjeRB52bPj59fPZ8zwvULkxf1d2+7K
         jnLWiyZoxYlGbCboQw11b+ry+m3H4a8+XYbmDmloHiByhIZu3KRzH2RRk3fS6ixknaHS
         aUGj+t8dAoNMSDvA5JfK+5FzamygLg+wYnjXfM8OYquiCBGpaJyC+ZwOlxpQxnSjoD+G
         7WfQ==
X-Gm-Message-State: AFqh2kqhZheMj/CKAc/TXhx9CF/fz0kEPI+kyME8Mxmo69uhUZT9mGJF
        YAwNLmX1PgYvygjLX/0rGoigJg==
X-Google-Smtp-Source: AMrXdXvK51H0IbshntMwpUlZI+AFdA28RuhJbW5H0nwtSX5T9NKgvLN4T82oPMNUoBjZnUPRsi2oJA==
X-Received: by 2002:adf:e883:0:b0:2be:4624:dd81 with SMTP id d3-20020adfe883000000b002be4624dd81mr16218138wrm.58.1674573292454;
        Tue, 24 Jan 2023 07:14:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s9-20020adfdb09000000b002238ea5750csm2644979wri.72.2023.01.24.07.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 07:14:52 -0800 (PST)
Message-ID: <adb66162-6ff3-184e-fe92-109bdef8ed1c@linaro.org>
Date:   Tue, 24 Jan 2023 16:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V1 7/8] arm64: dts: qcom: Add ipq9574 SoC and AL02 board
 support
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, ulf.hansson@linaro.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230124141541.8290-1-quic_devipriy@quicinc.com>
 <20230124141541.8290-8-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124141541.8290-8-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/01/2023 15:15, devi priya wrote:
> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> 
> Add initial device tree support for Qualcomm IPQ9574 SoC
> and AL02 board
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts |  78 +++++
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi        | 285 +++++++++++++++++++
>  3 files changed, 364 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 3e79496292e7..872c62028a0b 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-al02-c7.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb

This does not match current tree, so I could not apply it for tests. I
think you based it on a bit older version.

Best regards,
Krzysztof

