Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2D6C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 18 Apr 2022 12:11:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbiDRMOU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Apr 2022 08:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237456AbiDRMOR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2022 08:14:17 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694F31A824
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 05:11:38 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l7so26542923ejn.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+Nbh/Prc/5H/cORCat6vWbX6y9/y12F3+R8EiMn4z8U=;
        b=Dm4XMjPYCtdWA3+pMzuuvBgBW44TWQH3InrfQd1a0hq7Ob49UlvwiCHAN4ZWvJ2y2q
         +yzvclbmmfLi8ARs9lokw+4HyAR4OfObvE+VJm1/QHMoG8/6c73qAkgTz3aC8v29MHz7
         qVaiWh5oclYzdnwqFl/v0Kdtyjc33wAKTtZBwPgH+dP75Zei0myGjOASKfxImNlyCHXi
         x6yFw94J3CaPW2OBnqLltUmOjDHvVj9PyIdhil2JglCu/pso0MDmodEaDLL0QCVnq2AB
         NZMS5jHhb5h4lNtVobaLz4MrJm3uiX64/3mkg2BeGQG7KiQC50PvFPOt3j1FcgFhI71w
         ur7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Nbh/Prc/5H/cORCat6vWbX6y9/y12F3+R8EiMn4z8U=;
        b=m3aU7NoBltYrVJs/vk4WOfOmjG2IPcU0W2Jmg+xJ4XQTqvktDiwkN//wZcc1DLf+y0
         LByyuF71EBNma0vtEqm7wGx8IXpMhXqRZZzLF0x2QEZqkoObSH3HjfojPCXdDPChWtHR
         2Gl7zGQ3m307dCQ8QWt38+WNR3F9SP3TZAZL3f7Aounwv75k+llehLOWB+hSPMt7lPy9
         qbSY5Cx+2cebb2ASRgipbAR0W0DqEE+aNicQxTDRsgMoPD6bSOb25rM0HgzNgzUaFVKs
         /ln4kvving8ogReQRevdGgxpuO33vGoqZv2jcITveo294KQI2pGQAOhWRN+P3HuEmyCp
         1nLQ==
X-Gm-Message-State: AOAM532yHG8P4PRGM4Pq3S/Th7PyHfNe54BxYcgfKnk62kvLpiYb1ICo
        Y+y2mtGygTo7gn10f5UA102Hdw==
X-Google-Smtp-Source: ABdhPJxwyW9e6YDW1vaDtAloi25ghlPcrr65ZHDnvPjhycYnJSWeOGX1Kex17Bi6It3cYwT7mCnGZA==
X-Received: by 2002:a17:907:60c9:b0:6e8:ae9e:d052 with SMTP id hv9-20020a17090760c900b006e8ae9ed052mr8666429ejc.628.1650283896988;
        Mon, 18 Apr 2022 05:11:36 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm6861903edt.34.2022.04.18.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:11:36 -0700 (PDT)
Message-ID: <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
Date:   Mon, 18 Apr 2022 14:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton
 Platform
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, will@kernel.org, soc@kernel.org,
        cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418082738.11301-6-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/04/2022 10:27, Jacky Huang wrote:
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,ma35d1
> +          - nuvoton,ma35d1-evb
> +          - nuvoton,ma35d1-iot
> +          - nuvoton,ma35d1-som512
> +          - nuvoton,ma35d1-som1g

This does not match your DTS and does not look reasonable (SoC
compatible should not be part of this enum). Check some other board
bindings for examples.


Best regards,
Krzysztof
