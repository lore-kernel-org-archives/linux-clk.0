Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5D8C77B60
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 08:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjC2IWz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Mar 2023 04:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjC2IW2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 04:22:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEB22688
        for <linux-clk@vger.kernel.org>; Wed, 29 Mar 2023 01:21:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y20so19131975lfj.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Mar 2023 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRbDqq9vIw03wZ46k1c5GQIbp3MsDcHgKH6HMicJQ34=;
        b=IJ/6/WiY0gZWjaAE7nBEVUFeVIs5w9JhkhPFNsQilBeSB+Mdgv0G9oEmQvoCvFDnyE
         T2Etyc52i6erCwh3xFy9fEYifbP7uygmcK7SO2O8IHFFlH7Vh5SNZFMpiFj7o/0B9AXw
         hP5QmQ+DpdlGWmW+X//hH3I9T9hK/J8oitpJ2BBf0BlilUKMkY22LyezsuKa1qRHk0wK
         ltXwViei9Pga3C4cEfQeS+gw0WlCFSTxlWXEm+UgxjZHMYdOYmwnsB+X4nPAorc/Ii5G
         oDOa+aJXNLZO1lNZFZk3t269NLUYYMvAi5DCt7n1FBjnD0uwk2GiMl+KhBuJyM/iuUFe
         rsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRbDqq9vIw03wZ46k1c5GQIbp3MsDcHgKH6HMicJQ34=;
        b=rqk4N939RWMfupPKqrdeP0Z66vzfUQUUu9BOp0MJT61luV7JCJekQwhBAjDm+XVBEB
         3sdSws53Hf+9vpZBeYj1oJdgNvMPjDXbPDPpmvfM1RdFYSsJyHQR5uRjoUe3+AnQDv1I
         siVJk/fxIg9orpTQhss4h9NtufL+JVD4St9D9ngji/ruR0fw4YSMTQKBb8nTOqLZBRxy
         a2srmYQG43IQ4sHs+53bu4Gk/GPVP/PWxDxQEMFnR63P+QvCfjBYBnrmKYanEK8OuhZA
         d4+H+2Jc3TDVRbxso4ZzH2F+coUGHtH2xF21NtVIG2GDRe+mdZrjCqPawK8/D0kMc6yL
         hGQQ==
X-Gm-Message-State: AAQBX9ejpgyay86Hujjy7GdCzIP1/lnAIxyjorQvOShzCZ01z2h/rqfB
        YBLUxPhocKRphvWob8WY8GLtWw==
X-Google-Smtp-Source: AKy350a5r26p47bAo38Gr8TFyeJ+va7pWduXVogqgpv/VWEmcGXfuoOBI3kLgpj57CmmcDvG8Cc8IA==
X-Received: by 2002:ac2:4884:0:b0:4e1:7dd:1142 with SMTP id x4-20020ac24884000000b004e107dd1142mr5766576lfc.51.1680078103481;
        Wed, 29 Mar 2023 01:21:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d15-20020ac241cf000000b004dc721ea6a1sm5335923lfi.273.2023.03.29.01.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:21:43 -0700 (PDT)
Message-ID: <36f75c71-cf5b-7cbd-8eac-8a8f628d1201@linaro.org>
Date:   Wed, 29 Mar 2023 10:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 08/12] arm64: dts: nuvoton: Add initial ma35d1 device
 tree
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        arnd@arndb.de, schung@nuvoton.com, mjchen@nuvoton.com,
        Jacky Huang <ychuang3@nuvoton.com>
References: <20230328021912.177301-1-ychuang570808@gmail.com>
 <20230328021912.177301-9-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328021912.177301-9-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/03/2023 04:19, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add initial device tree support for Nuvoton ma35d1 SoC, including
> cpu, clock, reset, and serial controllers.
> Add reference boards som-256m and iot-512m.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>



> +	gic: interrupt-controller@50801000 {
> +		compatible = "arm,gic-400";
> +		reg =   <0x0 0x50801000 0 0x1000>, /* GICD */
> +			<0x0 0x50802000 0 0x2000>, /* GICC */
> +			<0x0 0x50804000 0 0x2000>, /* GICH */
> +			<0x0 0x50806000 0 0x2000>; /* GICV */
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;
> +		interrupt-controller;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
> +			      IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	uart0:serial@40700000 {

There is always space after label:.


Best regards,
Krzysztof

