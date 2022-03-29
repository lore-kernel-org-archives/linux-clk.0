Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F23C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 17:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240167AbiC2R1q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 13:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239139AbiC2R1p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 13:27:45 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B74718EEB9
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 10:26:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id pv16so36591036ejb.0
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=16O1OMAfhlCbCfBLXhj0uiBE7+Ph4Xzv5BL186nDdEE=;
        b=Iz0gFt6SkMM/Tc1oKY+iWeHB+ZZzVCBhie9aFJTmGMcAo9i/HuFW8csLVXQUFouF7i
         sODn1lkzn7fEu9q/GWTsROihZlk1uPShwi0QMfkhbopw6GToZht6UVCbVifHRhRZJ7NB
         pslFxBjNnSP7HSaOmFfJGSTrQfUU+bs3n4vS+S7HDqxOlIwthiEQnI3UKTF319vYLHmo
         weXVxF9pkizeGsEBh71hKzQz20MJ/aHwGGypCtIjcE018sPWX4agTh5FLy0ed2PZmEPn
         U6ngoOrUZBCJPLjvHna3xjRPh0QQZfMUzSS6HSLs4yBE+Ej6pMMiZiDebkc0cr/N41+7
         COsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=16O1OMAfhlCbCfBLXhj0uiBE7+Ph4Xzv5BL186nDdEE=;
        b=W9Ju3Q7fxscnyWoBgYBf9VYOkmUinrHCcNJyL43JuF+jA0oBkCciC4tRRPYFK3gPnt
         Ye0XYe3AqzlUYZBtJRb6ZX2RcbrRH0Y9Tw22X1MGTozrX4qddxTNyBE8WFeYQ7rywtTp
         UI+42YEDdN3tzRPU1vldR903UMCFkMRTWLNxfhX+6E+tBY7sFcFFtvQg2ntjd1LdGh8u
         zN/lFvSwQoitulVEoBjQfJF//QDKZXbS5KOWf78ExmU5LKYcsSraAtOjlaaC5uKvVAdX
         MM1P9RsGETwLnBXuiMsKM9yVPUGw48SJwfmHJhO4HQblkA9UKs4XBDc3tBQ/QHPoOpwz
         l9nQ==
X-Gm-Message-State: AOAM532wB2U9mT/kZps46gUoiH6A+k4LPbO+fvLUJOCKSLlz+KM37F+i
        e1085Dc5mKmq3LLCtexTn+CSZw==
X-Google-Smtp-Source: ABdhPJwO9YuESjI9rToeZW+DG0b2tF5pOXo1HOsOCjNQL+mrVjMKAMiXxYXUoYj7xy0+X+N5MP2kCQ==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id mp32-20020a1709071b2000b006da649bd99emr35881835ejc.712.1648574759076;
        Tue, 29 Mar 2022 10:25:59 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id k3-20020a05640212c300b0041605b2d9c1sm8772042edx.58.2022.03.29.10.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 10:25:58 -0700 (PDT)
Message-ID: <403f831c-6a19-8ede-9dfe-6b033d1292b4@linaro.org>
Date:   Tue, 29 Mar 2022 19:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: convert rockchip,
 rk3368-cru.txt to YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329172120.30328-1-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329172120.30328-1-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/03/2022 19:21, Johan Jonker wrote:
> Current dts files with RK3368 'cru' nodes are manually verified.
> In order to automate this process rockchip,rk3368-cru.txt has to be
> converted to YAML.
> 
> Changed:
>   Add properties to fix notifications by clocks.yaml for example:

I see you are on a conversion spree. :) Thanks for the work. Please
shorten the subject as I proposed for 3328. Also this "Changed" and
"notifications" are confusing. There are no notifications here.

This could be something like:
Changes against original bindings:
 - Add clocks and clock-names because the device has at least one input
clocks.

Best regards,
Krzysztof
