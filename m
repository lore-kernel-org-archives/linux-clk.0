Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F138C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 29 Mar 2022 17:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240142AbiC2RYw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Mar 2022 13:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238156AbiC2RYw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Mar 2022 13:24:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC47E210280
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 10:23:08 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id w25so21471205edi.11
        for <linux-clk@vger.kernel.org>; Tue, 29 Mar 2022 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nJ8logHvUhwzuUyaPd0gnGv7WJWT9U6mqYqu6DTlmCY=;
        b=CqHheIaK1zijProvoDF6vHljodsrx2WgrnFolz2FUM9rkuSIwAHkyUiAy1eZT2/Cc8
         wvjdJ/NjcUEStl8AP+KILlCE/kjZsnaq0EL3NvWEdGtrUjK/NgEPxNKahSlcYYHah78H
         a8M1kagnsY+Gy3nghLe3aRHRrVfEZlPfKZpWp+QaXij9rtRJr8k8cUzNnMluw0N+8+vi
         71pe91y5Lbpbkb/s85pOD9UhdpSy1fiEoBOXEkM/L56r6GGOQjNwjzCIFTEvcITyRv18
         GMpBfnk95ss0Ljg78/J0n/lBx/uYQcURpbumlD3qk80t8eueqyo19Zz8RslGuRDu806M
         0nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nJ8logHvUhwzuUyaPd0gnGv7WJWT9U6mqYqu6DTlmCY=;
        b=LM4CxRSS2lMQfLSYitotxg4KRHX4jpXDAhdjwjrxH5yUdIb2WNRr174QAGlMWIokya
         DWW52QD62TdjwWYscJRDEkOHXSIRthhYpaGcntNn3F0G3a2euqopV5HXOcysYy6qo1L/
         dk+OUJICTluEYTAkqbwujayYJyCGZtrzAKESOGLCdZ8BMKhQ92+85dQMOAoMk6mTC7Rm
         lBXlFHNgZDe2qZwv9Bxa+tFGEzl6JVJpPDIzs+OVunxiiopRL5Kr/RaFx+8Ljy20tPQB
         qctqPvDDOarctn4kTsBp9gizM8uGx94HBCvNCMOCs+vtFhPMXWFslTr+QaESPk4DMZhb
         arbQ==
X-Gm-Message-State: AOAM53283xD/De2N4CYLd1FXvzblN6v6XVm5w+JTxWxDkfgI1F3pOjY/
        W3xadt+pXNGd53gk9Z+xqnyfOA==
X-Google-Smtp-Source: ABdhPJyKfZ5o8TNiFzHDrzD0PJMaC6MOkuu5P1BcM/Clp65rrRNfGctrKdbGNAm5D2f2U1fFGsclFg==
X-Received: by 2002:aa7:d311:0:b0:419:443b:6222 with SMTP id p17-20020aa7d311000000b00419443b6222mr5852391edq.161.1648574587472;
        Tue, 29 Mar 2022 10:23:07 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id r11-20020aa7cfcb000000b0041902ac4c6asm8565475edy.1.2022.03.29.10.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 10:23:06 -0700 (PDT)
Message-ID: <09fa521e-dcf9-b744-da30-86542fd8855e@linaro.org>
Date:   Tue, 29 Mar 2022 19:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/3] arm64: dts: rockchip: fix compatible string rk3328
 cru node
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220329163016.27458-1-jbx6244@gmail.com>
 <20220329163016.27458-2-jbx6244@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220329163016.27458-2-jbx6244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/03/2022 18:30, Johan Jonker wrote:
> The rockchip,rk3328-cru.txt file was converted to YAML.
> A DT test of the rk3328 cru node gives notifications regarding
> the compatible string. Bring it in line with the binding by
> removing some unused fall back strings.

Are you sure these are unused? rockchip,cru maybe, but what about DTS
used out of tree? It's useful to mention that the compatible is not
documented (so if there are any out of tree users, it's their fault).

Removal of syscon is different case - why do you think it is unused? Did
you check it? It's not a fallback compatible.

> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index b822533dc..73418fd2f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -756,7 +756,7 @@
>  	};
>  
>  	cru: clock-controller@ff440000 {
> -		compatible = "rockchip,rk3328-cru", "rockchip,cru", "syscon";
> +		compatible = "rockchip,rk3328-cru";
>  		reg = <0x0 0xff440000 0x0 0x1000>;
>  		rockchip,grf = <&grf>;
>  		#clock-cells = <1>;


Best regards,
Krzysztof
