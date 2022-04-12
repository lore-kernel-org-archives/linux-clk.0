Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5219FC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 12:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbiDLMbI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356232AbiDLMaD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 08:30:03 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578B2CEB
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 04:46:18 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id d10so22076786edj.0
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 04:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CAzofaR9FtDRM+wFckGofjwaCdLcN5fw9Tp9Ja6KClQ=;
        b=FkbM4k1L25VdLH3C5Axv+jI5HXZbnjrOgB1F9cfIlW0SFn/s0XwgchhjQhuYd75ZJp
         l0ggFoX54olXCeWc9IzSamo3CubXGiIDP55x5LX57Oel5PZ6NkUUm+4iB6bxPS06h1HV
         jqkEqowlNp00SUqof2j7njrdAHS9lNKcWcw0+hK0oH76kh/zz7TXHOhjEzqHRkoEK63j
         wO1YON+EMja2U1zcYlojaB+aSh99hrGAmHupapX5VwM1ApVn7t0eydmPo4tc7UI95+FQ
         +gfIaKkp2SSYX2kGa83T2AdSPTyLQfdvQg43BJ6dDbQbRLGtNCrf+SgoVy+4l2QQV06/
         p+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CAzofaR9FtDRM+wFckGofjwaCdLcN5fw9Tp9Ja6KClQ=;
        b=H7oIbe8TOKFbPTnD8Im+NwPY9L9PZbGj4UGtLoqGnJQBAbwgNc12l+Yk1FonKs+3M+
         ZbeM4/QFQin451uJu8yPpVvR25bU0f6yUDk06pdB2ZAFiV9Z3D8wW9cek8CHIW6o6QZ/
         l4f+JYAY6O0AlswAVgJ6jDgS1tknaQEB3Ku6SWakknlGvgKp5VXhExXYmX8dq18Lpirc
         R/oqQIbVUZXHhsh3A+/6NblIkaKzhoOhhb2Czu7jsP+EHgw31vWdOv5m0h2YVISzZtfy
         VCVK03KFoP6NHV7iC1KW9FCvyANYHr+jGjv/zBmoWPZnc+MSs6rjGVvNONjpx8213J4X
         vmSw==
X-Gm-Message-State: AOAM532KSznwGtoPgyx4Ul4DQFCRJgvgcWARpfiUd3tfzK2EvteHsGdg
        YeEdMe/+XGDZ+YJNgLHIPjrvCcZOrZgOo9kQ
X-Google-Smtp-Source: ABdhPJzgTthKDvyK5jkgahd3jA3ghr8ocxlOO81cPS3FfOff0qgYSswuAkilr5C24AhAfauBQLOBDw==
X-Received: by 2002:a05:6402:4302:b0:419:4be8:6493 with SMTP id m2-20020a056402430200b004194be86493mr38525636edc.294.1649763976885;
        Tue, 12 Apr 2022 04:46:16 -0700 (PDT)
Received: from [192.168.0.195] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm13012850ejc.81.2022.04.12.04.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 04:46:16 -0700 (PDT)
Message-ID: <6bd0ef3e-5e50-9207-375d-088167131a9e@linaro.org>
Date:   Tue, 12 Apr 2022 13:46:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/9] dt-bindings: clk: mpfs document msspll dri
 registers
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-5-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220411085916.941433-5-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/04/2022 10:59, Conor Dooley wrote:
> As there are two sections of registers that are responsible for clock
> configuration on the PolarFire SoC: add the dynamic reconfiguration
> interface section to the binding & describe what each of the sections
> are used for.
> 
> Fixes: 2145bb687e3f ("dt-bindings: clk: microchip: Add Microchip PolarFire host binding")
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs.yaml     | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
