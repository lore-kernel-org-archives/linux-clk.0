Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F3CC433F5
	for <linux-clk@archiver.kernel.org>; Sat,  2 Apr 2022 16:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358523AbiDBQ5v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Apr 2022 12:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358525AbiDBQ5u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Apr 2022 12:57:50 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AEF160C1B
        for <linux-clk@vger.kernel.org>; Sat,  2 Apr 2022 09:55:58 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id qh7so1851200ejb.11
        for <linux-clk@vger.kernel.org>; Sat, 02 Apr 2022 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nfi4NEK6MIGGOAKpFGw3ah+OgZ8k4sVFe3sjs7AcqKI=;
        b=R9o0JLcLKKFkgcjNXlnkGZo74RAn4fx6d8+oEhfEiQdz9ohinjsUMYIbHGFs8pTg72
         AeObhxIY/YhiJkekxiP4FoBpJvqI7b2cCmo03xP+S7bmFVyAWgwLI4VSyEv+3A7IaKFa
         4VxZ4zHWYR5Awejm+qzr0EC9IaiRToORoxnORkAazKg1DxPsXQmiX7/g29YO2WqRwLVq
         xwCeA43TIEdS1YhYgLLupmFZ/11cKfP+DZZpC5JTo5GPbb+3RO2dR9Ruvmxfn3pVyZNP
         X8VbolWxl2yR32EpDZUe7RMdBh9P3PVizLnoiJ7WBx/AZjlGjiEQmZLvZr9T3/8ZHz2S
         xS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nfi4NEK6MIGGOAKpFGw3ah+OgZ8k4sVFe3sjs7AcqKI=;
        b=IJbBai9d9Ok1mn/RaBAAVok7rA22RK2leAQMQ2924ErLufhgPAu0ximg6+MCUKysij
         BBLedAdd6Rxd86jEWDs2dWcNo18Y9hZ79PFhvTknseIHmt3I0fC7Ok1cPbmnswm+hlhS
         7E58FM1ECDYzLesj7Vg3/JCRyWdHIBJ+E6oRRpi+k2k/fPT1HEZQYENUozqg+VwvSbOD
         uCtIKpLFp8UdKav2D6tL/PoT6L3FFQNdMl35VKxySjLRWrQYRAxVwfuqPa5f8TOUm8MM
         aK1rzpUxvCvauG3ujNt4T1r22kTMBg/CtW/VXZgdqSYLJjP8fIHDdLDN0NUSdNGahLBo
         MBXA==
X-Gm-Message-State: AOAM53321yNAD8TNjktN3KByIKcTXXUsgjctYmg3JwznbivAUp0MIjZu
        +AW9/FXG5WtVTLMpSty/GL8vLQ==
X-Google-Smtp-Source: ABdhPJzV97548dTgRrJlT61n1xfow5lqLQajsyqG2L4623QqUac2p7SFXZ10wARzCdQ9KlnmqK5lRg==
X-Received: by 2002:a17:907:60cc:b0:6da:9616:ecec with SMTP id hv12-20020a17090760cc00b006da9616ececmr4716491ejc.298.1648918556604;
        Sat, 02 Apr 2022 09:55:56 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ec10-20020a0564020d4a00b0041a68df1a71sm2629455edb.77.2022.04.02.09.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 09:55:56 -0700 (PDT)
Message-ID: <ebfdfed2-58c3-0b3d-b381-9160a00640bd@linaro.org>
Date:   Sat, 2 Apr 2022 18:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 15/16] dt-bindings: clock: use generic node name for
 pmucru example in rockchip,rk3399-cru.yaml
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220402143636.15222-1-jbx6244@gmail.com>
 <20220402143636.15222-16-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220402143636.15222-16-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/04/2022 16:36, Johan Jonker wrote:
> The node names should be generic, so fix this for the pmucru node example
> in the rockchip,rk3399-cru.yaml file and rename it to "clock-controller".
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/clock/rockchip,rk3399-cru.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

You received here the tag, there were no changes in the patch, yet you
ignored it.

This raises my concern that for all other patches you also ignored my tags.

Please resend with collecting appropriate tags from all reviewers. For
places you discard the tag, please mention it in each patch changelog
(under ---).

Best regards,
Krzysztof
