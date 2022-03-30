Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB17FC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 30 Mar 2022 17:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349320AbiC3Rfe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Mar 2022 13:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349311AbiC3Rfd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 13:35:33 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64B415A1D
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 10:33:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bq8so29014172ejb.10
        for <linux-clk@vger.kernel.org>; Wed, 30 Mar 2022 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v0ypuDOZ9iczYgFgx1CgxJv5DcfIjupX67FG6Uawm28=;
        b=Dm4NkdgRizF5UQHrmqClnq9Isje3UUn/6mfSP4EzRO9H4lnnvVVEQ6DnQATUMmZ1Fa
         8tLkTSxaqIdLUv20E/Gu7Q/D+Bf2phajGvNvFRcAngMSJKL6GvlLqrF3BVOqwVYo7dv2
         O5eUq/V1HRa3gacQHhwgilqItG9HfX7McmwvquTGOF29bJRWfX+E49xK+IuBEfn30fo2
         HEKTJ3Ktt2hOU9Q5TFLhrMKTBW6WGIdyda3iv6ewbq/rX9fCGI27hnE2eDFYjQT7L1pz
         dzYq71C8W/guTKY5YxX+v4lUmxUR0ypPvaLjgttweJWRW5YIBMAkQ3JecwKv8cPbpASG
         UI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v0ypuDOZ9iczYgFgx1CgxJv5DcfIjupX67FG6Uawm28=;
        b=aoDEtYDm9iovouM68ix7XH1ph2VZ9pNdR40/8Q2Z+V4+UcJQC/qCZ3TpMvLG1yoTgS
         QBgnMhN+KBd9Fzzhpyj0RX1NwJDLjkZ/0xfco3pdQhzX2dWwHareJlhuklAvJ9Gi12j/
         LHC2ZWk/5clXlpsoS02RJ1xvZrRc/Yds8iwVDE0ww2IB5H6SYlqd6adIYu4VYphpHk6F
         X8R7JQRuFEprBPY9CJ24Jn3RfpMQr5Qq38YI3KkoRVVKum1jEiOraBeavsF1+c4ZwMWx
         Ar7NTGCWo9IZWkSGi0O92K/7fnZ2r59WDsl8PSO0TVth2xU5LCwa4CaFzkO6WOSFe4Ic
         WRkw==
X-Gm-Message-State: AOAM5307vDmdg+J6dKzTIhLgAvYz0b6kmMO8EiGm0MyS1I21ssbGK59I
        S7jkMCPRptRTz4Msk8Cle4755g==
X-Google-Smtp-Source: ABdhPJx8VM85FNTNB3nTJF1PZIQmaZo0yaLCn/umk7bKrByJw9kErPb8vzRj3m4+OkxUDwCBIhXXlQ==
X-Received: by 2002:a17:906:7944:b0:6da:b834:2f3e with SMTP id l4-20020a170906794400b006dab8342f3emr681549ejo.353.1648661625373;
        Wed, 30 Mar 2022 10:33:45 -0700 (PDT)
Received: from [192.168.0.164] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id b8-20020a170906728800b006e0351df2dcsm8533922ejl.70.2022.03.30.10.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 10:33:44 -0700 (PDT)
Message-ID: <5ecf5ad4-a0f7-69f6-7d00-2ae4a83e5f29@linaro.org>
Date:   Wed, 30 Mar 2022 19:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/3] ARM: dts: rockchip: rk322x: use generic node name
 for dma
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220330121923.24240-1-jbx6244@gmail.com>
 <20220330121923.24240-3-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330121923.24240-3-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/03/2022 14:19, Johan Jonker wrote:
> The node names should be generic, so fix this for the rk3228 dma node
> and rename it to "dma-controller".
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm/boot/dts/rk322x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Squash it with your other change that type and submit one commit per
sub-arch (so for all arm Rockchips).

Best regards,
Krzysztof
