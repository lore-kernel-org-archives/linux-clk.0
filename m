Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E3FC433EF
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 11:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbiECLZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 07:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbiECLZh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 07:25:37 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663E71EAE7
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 04:22:05 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bv19so32802086ejb.6
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 04:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DqkjR75SMXnlG7nkHDeeWAoN1b3HYo8caj7b6IwRzKs=;
        b=bbk36sVWI1v62BeCMLkA50GyKd8MHG1h5tX/OrgjHB3/AgnZkUGZZXbtk/EIVCQT1/
         k9mgezCDOcT5rvk3R51RiwB6c4JxgLV/AhF1JcW2qGVjBHWRS3XsdZ5idcMMELu2oiIK
         bZfCKQtpIFbCGCA7XgIFguV6qPWhNTV82E+/l1zq00t9S9PNw9/+V81bdas8qQyrUdKg
         4k1J1iXc6d3mW+wz7LI20poSgqAynWDXAoW68T7XNeH6th1WO3v0082iNAlHM7bNtK+i
         N8SgLqIHlwnCxt7H5tZuZLagIqTtKUz8Dm44pdyjtVNwsKVnci2C3bkdP+0WvKfEaDNu
         JnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DqkjR75SMXnlG7nkHDeeWAoN1b3HYo8caj7b6IwRzKs=;
        b=MmWqMYXOfcMbIvzIMKni761DQG/4Jqnhr6Z0QOVlOnnnQKesGln0JkJuuqtTcB5SrF
         M+8X8WBgD9tXg7G3dw5W/Wle7lrirWyUzz8hGZna9a2EnvXHmdGImbUdNNEshLIFQZPF
         fmIaEfq385d3MblILzKabPNdp94VI2GfpEX9qwOogK3UqJYpLqsYlhRLYmn5M6wN4RPG
         BX4TQVIiondg0n+aFtFtJOpNeVfAqPmhOqe/EPAhAZ1Op9dEEhLT9s7hWEuezjzdOHbO
         6Mog3bW2UWfuS3U9/C95VPZfevL01tf2GPur4bEMkX9kGDF82Z7dFAI9Jgrut6s/utkR
         C17w==
X-Gm-Message-State: AOAM530O67LHmuGM6T7XQemBx7f42G3EcEWjTrAjelbU3x2ZQg2Xe8TW
        Sw03C/GKUnPMtRQtRlalem9rjQ==
X-Google-Smtp-Source: ABdhPJwNE7+1XBnVx5VupXNQBLAJdNHmbtQ+GIBaF8NBVh6binWhbraLbUh1dSuvJe6jtiI1+gIRVA==
X-Received: by 2002:a17:906:dc89:b0:6db:a789:7563 with SMTP id cs9-20020a170906dc8900b006dba7897563mr14746767ejc.471.1651576924003;
        Tue, 03 May 2022 04:22:04 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zd21-20020a17090698d500b006f3ef214e4csm4520501ejb.178.2022.05.03.04.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 04:22:02 -0700 (PDT)
Message-ID: <814dc408-3ede-1223-7fd7-e7e0b1c1530b@linaro.org>
Date:   Tue, 3 May 2022 13:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 10/12] arm64: dts: exynosautov9: add initial cmu clock
 nodes
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20220503105914.117625-1-chanho61.park@samsung.com>
 <CGME20220503105729epcas2p37342dc05e91c9007aa61d950c2bfe447@epcas2p3.samsung.com>
 <20220503105914.117625-11-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503105914.117625-11-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/05/2022 12:59, Chanho Park wrote:
> Add cmu_top, cmu_busmc, cmu_core, cmu_fsys and peric0/c1/s clock nodes.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 84 ++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index 807d500d6022..32c670b8a9b8 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -6,6 +6,7 @@
>   *
>   */
>  
> +#include <dt-bindings/clock/samsung,exynosautov9.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>  
> @@ -190,6 +191,89 @@ chipid@10000000 {
>  			reg = <0x10000000 0x24>;
>  		};
>  
> +		cmu_peris: clock-controller@10020000 {
> +			compatible = "samsung,exynosautov9-cmu-peris";
> +			reg = <0x10020000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIS_BUS>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peris_bus";
> +		};
> +
> +		cmu_peric0: clock-controller@10200000 {
> +			compatible = "samsung,exynosautov9-cmu-peric0";
> +			reg = <0x10200000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_BUS>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peric0_bus",
> +				      "dout_clkcmu_peric0_ip";
> +		};
> +
> +		cmu_peric1: clock-controller@10800000 {
> +			compatible = "samsung,exynosautov9-cmu-peric1";
> +			reg = <0x10800000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC1_BUS>,
> +				 <&cmu_top DOUT_CLKCMU_PERIC1_IP>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_peric1_bus",
> +				      "dout_clkcmu_peric1_ip";
> +		};
> +
> +		cmu_core: clock-controller@1b030000 {
> +			compatible = "samsung,exynosautov9-cmu-core";
> +			reg = <0x1b030000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_CORE_BUS>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_core_bus";
> +		};
> +
> +		cmu_busmc: clock-controller@1b200000 {
> +			compatible = "samsung,exynosautov9-cmu-busmc";
> +			reg = <0x1b200000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>,
> +				 <&cmu_top DOUT_CLKCMU_BUSMC_BUS>;
> +			clock-names = "oscclk",
> +				      "dout_clkcmu_busmc_bus";
> +		};
> +
> +		cmu_top: clock-controller@1b240000 {
> +			compatible = "samsung,exynosautov9-cmu-top";
> +			reg = <0x1b240000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&xtcxo>;
> +			clock-names = "oscclk";
> +		};
> +
> +		cmu_fsys2: clock-controller@17c00000 {

This should go before 1b030000.


Best regards,
Krzysztof
