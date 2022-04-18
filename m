Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC98C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 18 Apr 2022 12:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238862AbiDRM0x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Apr 2022 08:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238744AbiDRM0W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Apr 2022 08:26:22 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF6412610
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 05:20:26 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l7so26580276ejn.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Apr 2022 05:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IrspqwoC0i8xWBSDGv/e81WYq/G3Gaial55KaXcpMB4=;
        b=EROJPtVhkTWMC362VRxsn28ErAWXjxRwSGzBrXd/ILtzWuytV08hvlbx49encLOOqc
         yeMw9yc7SKrF1+IquHFumnC5nzv8sCjiS/9h3Ie6onCCBYKAmaLf0suDnplCv4q3oEDF
         knghEFqpRQpYEfE3tDtNwMu2obylGzqhbXAdLhvCLWIQKLnEXd8Sw7hYct4HM0iizOxM
         KJxVev9k4sh5XJ89IrjxtG8nz5L8AoKnxF88C74xHknJiavH0KHq7Pxu0mOPH9XvZWze
         PiVvIKdjNyMdM4oEgTDgrWs57aI2jc86pzv2U3KyxgYxeQX5iqZEIrJxIMY3Y4NeUc0Y
         leDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IrspqwoC0i8xWBSDGv/e81WYq/G3Gaial55KaXcpMB4=;
        b=4nnyu1uH1JX9I5LwXhJY0o5w65rSNczNhS9ake5DIGqrtxkn5CuoM764weW+8JmOos
         lRw07fAHcEeDX0DYX6GcDWJy6awBhe8CPUf+H9ip/5yuHrfQDhlHww8EEJtczm1s6zXx
         MXNzU+vtLlK5y5mHqxRRIYwCKO/nWOU/OXDG2Vo8SxK4hNMN/xLeYUqG2V45Igb7uVXq
         waKqY93tBIZUEinnYg5XThMUuibXwWR38zaMLlom4mcfoaTJWbLwftb38MhoNyHI0xH/
         iye/ks2Wp/oC68gOt/jd8NuhnmqUyqoMsmLfW+cUlWUsK9Qbb8pRy/Ijl0XeVQy6Knhq
         tpJw==
X-Gm-Message-State: AOAM532CmanEeR+NLeY9ukIQZqD7AcVn6E2md/I3eLoKFb/HmByHBXb+
        /e6d6XlnjZLA4GN/io63cxVS0A==
X-Google-Smtp-Source: ABdhPJzoDxvcNzmEcyeGaDq97ow/WOeOSzYmXAahpLo2Kg1wrT2tHDDGSBII00dY0Cob+6Pqx4rvHQ==
X-Received: by 2002:a17:907:7e9f:b0:6e8:92eb:4171 with SMTP id qb31-20020a1709077e9f00b006e892eb4171mr8636712ejc.53.1650284425490;
        Mon, 18 Apr 2022 05:20:25 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006d5b915f27dsm4538016ejn.169.2022.04.18.05.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:20:25 -0700 (PDT)
Message-ID: <60e50c11-118d-431f-7120-95fcbb53eeb5@linaro.org>
Date:   Mon, 18 Apr 2022 14:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] arm64: dts: nuvoton: Add initial support for
 MA35D1
Content-Language: en-US
To:     Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
Cc:     robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        arnd@arndb.de, olof@lixom.net, will@kernel.org, soc@kernel.org,
        cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-4-ychuang3@nuvoton.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418082738.11301-4-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/04/2022 10:27, Jacky Huang wrote:
> Add the initial device tree files for Nuvoton MA35D1 Soc.
> 

(...)

> +	gic: interrupt-controller@50800000 {

The unit address does not match first reg property. Don't you have
warnings with this?

> +		compatible = "arm,gic-400";
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;
> +		interrupt-controller;
> +		reg = <0x0 0x50801000 0x0 0x1000>,
> +		      <0x0 0x50802000 0x0 0x2000>,
> +		      <0x0 0x50804000 0x0 0x2000>,
> +		      <0x0 0x50806000 0x0 0x2000>;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
> +			      IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +};

Best regards,
Krzysztof
