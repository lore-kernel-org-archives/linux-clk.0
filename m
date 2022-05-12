Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C251C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 14:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354967AbiELOET (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 10:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354959AbiELOES (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 10:04:18 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B41557B10
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 07:04:17 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t5so6331713edw.11
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 07:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ObfwnmtrxkKT50YzmCvliwo/dT5DMiUQiO0PH0LTMx0=;
        b=PQYeTpEbK+tYHe872qmLftAqI/d4BlbDIDFQkTYjTxrBTRNjTmDJ1qyGjiB2HlDqGQ
         9xauAiYkkluMogshl7JwT76akt+9lCQyiq7k9ZN39Mu+eVSBGvX7Sn6hkPEyMdu76izm
         wyOvXOhrZ9lEzFlAztS4dKVJ8bDywjg0D9FGFCC3kiHDpyx2kLAcD60elGv8jateClaN
         jw5WlU4lTHCq2K2YK4364eAdCpSVVA4YjiBJCJYHFiqTp9DzeQMa2j+rHTGzwBm/23oi
         syJHx5eyczEpaX31duAOMQdfUm8XNHp163ZsIhJ0SkBe82I4N+8ZLekjfg3+6kgd5lA7
         FbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ObfwnmtrxkKT50YzmCvliwo/dT5DMiUQiO0PH0LTMx0=;
        b=Vj3LoLARbywFQ5W+oEMO9GfMhZLBVpWoi4hYyxpXud8AY4UD2rk9+mDxoPyQKY+P3g
         ucZZ3C6HW0Z26NWoLE6ygDHACTpur0O9kXgyBsHzmnSrnN9reKPSthAD+u1P9ieADQx2
         s+LfW23sy5VBJ5UIk0i+SVQI83i1VNO4sbuAOUizd+IZpj3J66oLxxJRzBiYX+IYg96t
         q+jRvzobmOvR3iY+NN+YxZ9PtgFVlynrXWwt3gLOz6CVCugC+pxcIyBNguUsEhdYjGUl
         t4O7oOMcUU1qnLeQzxb9s0z7u4cYSnsCt0qLjLag4KhEFQ7vcBv3cHT99XXjRJqFaMz7
         7HVQ==
X-Gm-Message-State: AOAM532uyLTGRC9fJnI+sRyP/vP4dxrjIlrSKHVK+8XtR4sd6RTaRbr+
        J6nM9QrxOgL3dxmxzQUhPd5hjw==
X-Google-Smtp-Source: ABdhPJyTJw8+7v3GXv2bh38/HEmQHaY6esp5J8bzfqvccK20LUmGMVe7oaS7gE+migdw2SOqftSY1A==
X-Received: by 2002:a50:ea8b:0:b0:428:7d05:eb7e with SMTP id d11-20020a50ea8b000000b004287d05eb7emr29484883edo.185.1652364255711;
        Thu, 12 May 2022 07:04:15 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id rv21-20020a17090710d500b006f3ef214e06sm2133546ejb.108.2022.05.12.07.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 07:04:15 -0700 (PDT)
Message-ID: <f0969769-9f24-7e48-6a60-adeea94404e1@linaro.org>
Date:   Thu, 12 May 2022 16:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V4 2/5] dt-bindings: clock: Document MA35D1 clock
 controller bindings
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com,
        will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220510032558.10304-1-ychuang3@nuvoton.com>
 <20220510032558.10304-3-ychuang3@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220510032558.10304-3-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2022 05:25, Jacky Huang wrote:
> Add documentation to describe Nuvoton MA35D1 clock driver bindings.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    clk: clock-controller@40460200 {
> +        compatible = "nuvoton,ma35d1-clk";
> +        reg = <0x0 0x40460200 0x0 0x100>;

I don't think you tested your bindings. This fails.

clock-names below as well. Please do not send untested code.

Testing is explained here:
https://elixir.bootlin.com/linux/v5.18-rc6/source/Documentation/devicetree/bindings/writing-schema.rst#L111

Best regards,
Krzysztof
