Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0171C83F12
	for <linux-clk@archiver.kernel.org>; Tue, 29 Aug 2023 17:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjH2RWR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Aug 2023 13:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237786AbjH2RV6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Aug 2023 13:21:58 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C58CF0
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:21:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-500c7796d8eso731924e87.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Aug 2023 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329638; x=1693934438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gJh7hh3Cv4MKGAYWWiEyZbDkr75Vxh68gw9dOhliEo=;
        b=svFv/Z9pr7z+fE96FtSY4wNw5Qa2yWz9MMDZgo8e5txPC7jOPprZ+/VfkDOhO9+5ff
         JZbANOmLFqeO8HbS9PoJbKb8b3ziDDnQyTUOlfVWdJ5IBXengbnaH+UBjH1U6aFAEsWo
         H0F44cpGBCVK18gmBV0dWJi1qVfi3txaFE2I4YM9onDQB2OfMS4VTVoCQQQJgZhD8dhi
         aq57PQjk/nBpwCbPwjSHfVxNMRTfNVqOiqu600sz3+nNxjjDIs7GU6nLF0fFWuOKdgm4
         k2Nj6XlyP0xiztq8gbA+3vi2kXSKxd4ze0yumQ8Hz9IDWAknT7KaS9nXgckiNRTMnjdh
         HJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329638; x=1693934438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gJh7hh3Cv4MKGAYWWiEyZbDkr75Vxh68gw9dOhliEo=;
        b=l9ouW09m9PxqXem5Unlr3zUJ3nN583c2i04zWsa+zRbnnIg08zYnlHQetwCOWmO0rZ
         0Qbwj9G1pEkvorwFmJL+HibrugeUDy7wT4tNPgk7YKxwm7Z4rm1fiaPsRoeZBFpPXMj0
         oWX7jq2cDw4EY2gbCa8vAqauCbvGSgNhZ62/+N3fg7Vlr6+9NL1sGGSO2ZMNjn/g/7fr
         GK2rBMLqtxExbuVC5L+T1AJeRfnS7iyUhPZZSZ4N/+pVivr1uDYy8QWT9Zxt37MBYIOK
         n1wpqDiOXqrUh6x4deKIh3F7f61NdpLjWLCDrAfOaGC2Jm6Aca0gjPg1osvyGr7oFZva
         L2dA==
X-Gm-Message-State: AOJu0YwZ5fC/8UBjr/48PVjOIURzZ5OnpuSgHQRmm//KyJJFVXfKq099
        JkgQBbZ1SNd94l61MvA3v3t9ug==
X-Google-Smtp-Source: AGHT+IGlVnUWA48hZ1fV2ZgoaAUWDkmNEboaK1aSOxLC5DhzgZm2KyvX6J5uG+IbCKz7WrZM5DcSfA==
X-Received: by 2002:ac2:4985:0:b0:4f9:51ac:41eb with SMTP id f5-20020ac24985000000b004f951ac41ebmr17504153lfl.16.1693329638491;
        Tue, 29 Aug 2023 10:20:38 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id u18-20020a1709064ad200b0099bc08862b6sm6299274ejt.171.2023.08.29.10.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:20:38 -0700 (PDT)
Message-ID: <20308990-0701-6dae-a5f3-b0c5d6cccbe4@linaro.org>
Date:   Tue, 29 Aug 2023 19:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/31] dt-bindings: mfd: syscon: Add rockchip,rk3128-qos
 compatible
Content-Language: en-US
To:     Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Elaine Zhang <zhangqing@rock-chips.com>,
        Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
        linux-clk@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-2-knaerzche@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-2-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/08/2023 19:16, Alex Bee wrote:
> Document Rockchip RK3128 SoC compatible for qos registers.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +

You should probably split patches per subsystem, if you want it to get
applied.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

