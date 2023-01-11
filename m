Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B529C5479D
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 09:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238497AbjAKJrr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 04:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235627AbjAKJr3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 04:47:29 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A88DE3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:45:34 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so12160649wms.4
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wWIW61CZB/vxYsqF5McKIEUW8wQWfFLBGnoRl2r3g4=;
        b=QguNZ3AYn9in0xBi5rvw6eS1DCNUvH+vHez+dOi+3DDRE45hk/4PDbuSn45J90c/he
         j9k7ueMNy/fKnOW3aTx0YQ7yCOLxZrYxw2P6CfoRNM9EbcIobYhVXvmoQuxtmug6pXqo
         VxKJCD0aS1ADMeueGAEC0rXJA9e+QVd/68mGb43OS6xg2hph7591FLUISbJsWuh7bBPw
         f6sGF5hw76qmQjoswCmFm4MeKOfRKGwndK9neQJiIg1GATDMpou+XvO4GZJ9iU6zNBUS
         +zSGI6qnV7CEz7JMMoqP8qDW79VPIRhm63ChyeueuIbzSqxwZJvnkoOB2FtE3D6pXVsY
         Pcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wWIW61CZB/vxYsqF5McKIEUW8wQWfFLBGnoRl2r3g4=;
        b=sJhA6ta0EF//JUxZ028RvIjiogULu5xmu4Fa8iwBBULoqk+Ey4jFtVZX897ASlMB34
         aqJ7tk1roqr9rmNPeOZpcS/AzLhbBRJUBMmK+Uat4bUu1Fa43wLP/mZwUFe89MhUTB9B
         2FU6k3yim9JdsU8d1v/Eh55kvLJpzVg6avd6yvir7Vw6BwbWXTiE7jF0DqykIIAYeLWn
         lpWKrBKuhHzwIP6i/tbhEPmaUnoGApo6iYP9NjZpEMcXHFTTA6o86kf8jzJTkM6LVM90
         BXkfhgXZAgn/dhvvZPDbYILbUstFvdC8jei/aq4j9WMpAwYECkqmDFTh+MOASrylgS8J
         3kKA==
X-Gm-Message-State: AFqh2kp0GsX3928S4R6GzgsJeshAvop94z4ZmloPeO2uWOtJ0n0ivTX9
        D5G6tIH8d3iWrDVqFcWpl2AJPA==
X-Google-Smtp-Source: AMrXdXs3iRR5hbQRbV2mNc++Pv4HJQCPNW9Qxhph9zZkqzpQCh6C2nt5n8RG3k3wja/pppBlAUQdrQ==
X-Received: by 2002:a05:600c:3ca8:b0:3d9:e8b3:57fa with SMTP id bg40-20020a05600c3ca800b003d9e8b357famr10283292wmb.30.1673430333549;
        Wed, 11 Jan 2023 01:45:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003b492753826sm16653155wme.43.2023.01.11.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 01:45:33 -0800 (PST)
Message-ID: <e5383b73-7026-ede1-387c-5847535438eb@linaro.org>
Date:   Wed, 11 Jan 2023 10:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/7] arm64: dts: Add ipq9574 SoC and AL02 board support
Content-Language: en-US
To:     devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-7-quic_devipriy@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110121316.24892-7-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/01/2023 13:13, devi priya wrote:
> From: POOVENDHAN SELVARAJ <quic_poovendh@quicinc.com>
> 
> Add initial device tree support for Qualcomm IPQ9574 SoC
> and AL02 board
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: POOVENDHAN SELVARAJ <quic_poovendh@quicinc.com>

Don't use CAPITAL CASE FOR NAMES BUT Camel Case. Although different
languages might have different rules, but most cases when transliterated
to English (or Latin alphabet), the name Start with capital letter. The
same in your case.

> ---
>  arch/arm64/boot/dts/qcom/Makefile            |   1 +
>  arch/arm64/boot/dts/qcom/ipq9574-al02-c7.dts |  69 ++++

One more:

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Best regards,
Krzysztof

