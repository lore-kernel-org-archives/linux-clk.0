Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF9C54EE9
	for <linux-clk@archiver.kernel.org>; Sun, 18 Sep 2022 09:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbiIRJLD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Sep 2022 05:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiIRJLC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Sep 2022 05:11:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C0F24F3E
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 02:10:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so8990779lfu.0
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=srNlg2LiyeE4H+1yt0j96mFfFz31FD86zqxk5YdbAkw=;
        b=rT6QoF4WsmWTDVatIXzmMrts+Rov3EOaEP1JUZNJOZhnKq38aKwlS+iFQ9mo+fUH89
         Py7Mmkr/r4JPXbPp4y5Iy+VpxWm/Qg6blWoY1lyRauibjQv4mTD5Bh7PlzifirowofDY
         0+RPLB47Yu5uS5N5XXX42WZbcymNUjB5ZSZvwlepXeM0pNUVXnvqUBCJZCd2gZPkm/hS
         MYXM8MGR5egMaqExzTcbq/BOSPMbLbgD6+KVUwzhhg+ksXeDupYAadS95+F/oPppBaNE
         JcjgYcOg2sp/Hs5PqRdrQP/v9FJqZCiCUuoig9cPJaLekmMWufwtRYxeDeMhTu1Exs+i
         fGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=srNlg2LiyeE4H+1yt0j96mFfFz31FD86zqxk5YdbAkw=;
        b=8NpTLre1ywzjjIwD8jFpy8UK9wf66mC91ZLvGTalsI8d7S3VV1HZ/oa0oyVLrCZ+pQ
         fOvnT44me4N01N7jsUxxHbPYNq33/GCNoruvN2YgWqUwU2w87lRxHFHjI388kaudnVPC
         JSFM0JiMfr4QTp58NAF4RtNZagEBHtQ/g/VTdBwfnBx0mcIOyZa6/AetgwOU4j6vsOyf
         6yBU10lupP+8Gosvvl2J3hqwW4GvcL5GwF3fqk9L5ATArLRk6GzS0or2WoBoqtjJFyGB
         3SypzMKOMtWD0a8mGR15XUypcoSfhM8RoSdWOvbQJ69pVM2gV8y+7eI44PtEdzxFbjUn
         fsvw==
X-Gm-Message-State: ACrzQf1/1EGG8QfEf7g8JrpLLN/JmLvP2CJGv7qumH6319GVm76qZTL0
        186GxFnNlT6qYM4rKzXiyLDCYQ==
X-Google-Smtp-Source: AMsMyM4NWRLio7xqS2Dut3Cj32Y1HGLfzcmoYn1BRmMJ/fvmHMUhydjcmX1+TRnmG8gKcVi/krytwQ==
X-Received: by 2002:ac2:568a:0:b0:49a:1fe:64e2 with SMTP id 10-20020ac2568a000000b0049a01fe64e2mr4657723lfr.156.1663492258078;
        Sun, 18 Sep 2022 02:10:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a2eb94b000000b00268cfcf841asm414348ljs.56.2022.09.18.02.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:10:57 -0700 (PDT)
Message-ID: <11a7c912-5eb9-d2f9-c85c-a98772b39d80@linaro.org>
Date:   Sun, 18 Sep 2022 10:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] dt-bindings: clock: convert rockchip,rk3128-cru.txt to
 YAML
Content-Language: en-US
To:     Johan Jonker <jbx6244@gmail.com>, heiko@sntech.de,
        zhangqing@rock-chips.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <614ccc3b-eb65-450e-d015-9c615a09a701@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <614ccc3b-eb65-450e-d015-9c615a09a701@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/09/2022 20:42, Johan Jonker wrote:
> Convert rockchip,rk3128-cru.txt to YAML.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V2:
>   Use SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>   Add more clocks
> 
> ---
> 
> Rockchip recently replied on other clock-patches to dual-license the
> binding.
> 
> https://lore.kernel.org/all/510d1180-bc8e-7820-c772-ed7f35447087@rock-chips.com/
> From Finley with an  @rock-chips.com address, so this should be ok.
> 
> Document history:
> 
> git log Documentation/devicetree/bindings/clock/*rk312*.txt
> 
> Author: Elaine Zhang <zhangqing@rock-chips.com>
>     dt-bindings: add documentation for rk3126 clock
> Author: Elaine Zhang <zhangqing@rock-chips.com>
>     dt-bindings: add bindings for rk3128 clock controller
> ---
>  .../bindings/clock/rockchip,rk3128-cru.txt    | 58 ---------------
>  .../bindings/clock/rockchip,rk3128-cru.yaml   | 74 +++++++++++++++++++
>  2 files changed, 74 insertions(+), 58 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
> deleted file mode 100644
> index 6f8744fd301b..000000000000
> --- a/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -* Rockchip RK3126/RK3128 Clock and Reset Unit
> -
> -The RK3126/RK3128 clock controller generates and supplies clock to various
> -controllers within the SoC and also implements a reset controller for SoC
> -peripherals.
> -
> -Required Properties:
> -
> -- compatible: should be "rockchip,rk3126-cru" or "rockchip,rk3128-cru"
> -  "rockchip,rk3126-cru" - controller compatible with RK3126 SoC.
> -  "rockchip,rk3128-cru" - controller compatible with RK3128 SoC.
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- #clock-cells: should be 1.
> -- #reset-cells: should be 1.
> -
> -Optional Properties:
> -
> -- rockchip,grf: phandle to the syscon managing the "general register files"
> -  If missing pll rates are not changeable, due to the missing pll lock status.
> -
> -Each clock is assigned an identifier and client nodes can use this identifier
> -to specify the clock which they consume. All available clocks are defined as
> -preprocessor macros in the dt-bindings/clock/rk3128-cru.h headers and can be
> -used in device tree sources. Similar macros exist for the reset sources in
> -these files.
> -
> -External clocks:
> -
> -There are several clocks that are generated outside the SoC. It is expected
> -that they are defined using standard clock bindings with following
> -clock-output-names:
> - - "xin24m" - crystal input - required,
> - - "ext_i2s" - external I2S clock - optional,
> - - "gmac_clkin" - external GMAC clock - optional
> -
> -Example: Clock controller node:
> -
> -	cru: cru@20000000 {
> -		compatible = "rockchip,rk3128-cru";
> -		reg = <0x20000000 0x1000>;
> -		rockchip,grf = <&grf>;
> -
> -		#clock-cells = <1>;
> -		#reset-cells = <1>;
> -	};
> -
> -Example: UART controller node that consumes the clock generated by the clock
> -  controller:
> -
> -	uart2: serial@20068000 {
> -		compatible = "rockchip,serial";
> -		reg = <0x20068000 0x100>;
> -		interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> -		clock-frequency = <24000000>;
> -		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> -		clock-names = "sclk_uart", "pclk_uart";
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.yaml
> new file mode 100644
> index 000000000000..b77aec3a6f8d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3128-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3126/RK3128 Clock and Reset Unit (CRU)
> +
> +maintainers:
> +  - Elaine Zhang <zhangqing@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |
> +  The RK3126/RK3128 clock controller generates and supplies clock to various
> +  controllers within the SoC and also implements a reset controller for SoC
> +  peripherals.
> +  Each clock is assigned an identifier and client nodes can use this identifier
> +  to specify the clock which they consume. All available clocks are defined as
> +  preprocessor macros in the dt-bindings/clock/rk3128-cru.h headers and can be
> +  used in device tree sources. Similar macros exist for the reset sources in
> +  these files.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rk3126-cru
> +      - rockchip,rk3128-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum:
> +        - xin24m

xin24m is required thus it should be first and in fixed position. enum
is applicable only for next two items.



Best regards,
Krzysztof
