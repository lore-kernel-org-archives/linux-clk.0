Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033D5C76196
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 17:25:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238578AbjDFRZC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 13:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240090AbjDFRY4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 13:24:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA9B65A9
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 10:24:30 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9341434fe3cso150717566b.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZWm8VVPjeFnm2JphubEFlx8VRO3aDXS4Y0MKirBKZc=;
        b=KaQblYxlv8Wg8dwXdhzP4qzFeNMXk41ba0tlgNgrCN9LirZed/7BpMBMqMCiPA/MKH
         lZTS2GazYf5qg5bYzuIG7uVN20BmC1nvSPU1RX8yN5XqxbHSBPcOyzH+CCIzAI+zVw7a
         qXFW8+AqSJPtIr4fcarlM76G9TR2EzHzPqD00UnHxwo64ctd4WP3bXE9euQyMSCMKMcy
         jI+TIgx/R91BOfaYL9fD2OBpxvGzIcjIePtS27tQtCAAqj3jVcdmaAcKeteQFCJIjzYH
         3p1lYq9OLxx8r4N1OFwfYXcFf8M/kbEY7QMWP792bqMq6GyUEk5cgNcskuKZHPKDEP+5
         ZZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YZWm8VVPjeFnm2JphubEFlx8VRO3aDXS4Y0MKirBKZc=;
        b=o1JKX0sQpEbnSWVp62JMj8Q8Qch37aM2XNtJpQioyGWAFpeV6G8qI59F114304S+AA
         qspYbyEZZuFABwBnL1wdgLs4EXHPMzo+aeTOv57nT01s09DapB7WYtUgQWxiiJwyVKi6
         +p4yxTjwFWLMVU5iDdsf94kQNc6JppkoL4cg5CDceFaNDBs+L02sKk76ePsVyjZ45L/K
         iWbU0ufPh3RDMoMslcfGeLB561ESRsoEBe5s0zwykFHCCt2FEENrTUmX9+QcCT0uN6z0
         5iCGzlvadrIZWaCAqkWbB1JmojJFKxoQ31awLwKUJGVMAJRwuN29ghedt78niEYT9D8e
         pkUw==
X-Gm-Message-State: AAQBX9fE3b8nwHdWJ/Ml9ysnQyNuydBDOJVtStYs63XjlncnAnze2b3c
        nJybLzp28VzuYbo3yKj5YJpdnw==
X-Google-Smtp-Source: AKy350ai06lz6ssfMPZUtJwK4e2IEAi6KKdYKCbUWEY+9XXjVsN6ewHSpx6CGQ1uSzp7iWlJhL82sw==
X-Received: by 2002:aa7:c0c7:0:b0:4fa:d83b:f5da with SMTP id j7-20020aa7c0c7000000b004fad83bf5damr239948edp.30.1680801822458;
        Thu, 06 Apr 2023 10:23:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id b16-20020a50b410000000b004c5d1a15bd5sm967580edh.69.2023.04.06.10.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:23:42 -0700 (PDT)
Message-ID: <4af1ebd0-243f-39e4-c290-1eb627bd7b71@linaro.org>
Date:   Thu, 6 Apr 2023 19:23:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] dt-bindings: reset: Add binding constants for
 BLZP1600
Content-Language: en-US
To:     Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     "soc@kernel.org" <soc@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "olof@lixom.net" <olof@lixom.net>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        James Cowgill <james.cowgill@blaize.com>,
        Matt Redfearn <matthew.redfearn@blaize.com>,
        Neil Jones <neil.jones@blaize.com>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
 <20230406102149.729726-4-nikolaos.pasaloukos@blaize.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-4-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Add SCMI reset IDs which are used on Blaize BLZP1600 SoC.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
> ---
>  .../dt-bindings/reset/blaize,blzp1600-reset.h | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 include/dt-bindings/reset/blaize,blzp1600-reset.h
> 
> diff --git a/include/dt-bindings/reset/blaize,blzp1600-reset.h b/include/dt-bindings/reset/blaize,blzp1600-reset.h
> new file mode 100644
> index 000000000000..ff1de6b1bd5c
> --- /dev/null
> +++ b/include/dt-bindings/reset/blaize,blzp1600-reset.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */

Why 2.0+? Unusual choice. Do you really need it?


> +/*
> + * Copyright (C) 2022, Blaize, Inc.
> + */
> +
> +#ifndef DT_BINDING_RESET_BLZP1600_H
> +#define DT_BINDING_RESET_BLZP1600_H
> +
> +#define BLZP1600_A53_C0_HARD_RST	0
> +#define BLZP1600_A53_C0_SOFT_RST	1
> +#define BLZP1600_A53_C1_HARD_RST	2
> +#define BLZP1600_A53_C1_SOFT_RST	3
> +#define BLZP1600_A53_L2_CACHE_RST	4
> +#define BLZP1600_A53_DBG_RST		5
> +#define BLZP1600_GIC_RST		6
> +#define BLZP1600_CRYPTO_RST		7
> +#define BLZP1600_GSP_RST		9
> +#define BLZP1600_DRAM_A_SYS_RST		10
> +#define BLZP1600_DRAM_A_DDRC_RST	11
> +#define BLZP1600_DRAM_A_PRST		12
> +#define BLZP1600_DRAM_A_ARST		13
> +#define BLZP1600_DRAM_A_PHY_RST		14
> +#define BLZP1600_DRAM_A_PWRON_RST	15
> +#define BLZP1600_DRAM_A_PHY_PRST	16
> +#define BLZP1600_DRAM_B_SYS_RST		17
> +#define BLZP1600_DRAM_B_DDRC_RST	18
> +#define BLZP1600_DRAM_B_PRST		19
> +#define BLZP1600_DRAM_B_ARST		20
> +#define BLZP1600_DRAM_B_PHY_RST		21
> +#define BLZP1600_DRAM_B_PWRON_RST	22
> +#define BLZP1600_DRAM_B_PHY_PRST	23
> +#define BLZP1600_USB_RST		24
> +#define BLZP1600_USB_PHY_RST		25
> +#define BLZP1600_CAN0_RST		26
> +#define BLZP1600_CAN1_RST		27
> +#define BLZP1600_CAN2_RST		28
> +#define BLZP1600_ETH_MAC_RST		29
> +#define BLZP1600_SDIO0_RST		30
> +#define BLZP1600_SDIO1_RST		31
> +#define BLZP1600_SDIO2_RST		32
> +#define BLZP1600_SD_CARD_RST		34
> +#define BLZP1600_CSI0_CTRL_RST		35
> +#define BLZP1600_CSI0_VDMA_RST		36
> +#define BLZP1600_CSI1_CTRL_RST		37
> +#define BLZP1600_CSI1_VDMA_RST		38
> +#define BLZP1600_CSI2_CTRL_RST		39
> +#define BLZP1600_CSI2_VDMA_RST		40
> +#define BLZP1600_CSI3_CTRL_RST		41
> +#define BLZP1600_CSI3_VDMA_RST		42
> +#define BLZP1600_CSID_CTRL_RST		43
> +#define BLZP1600_CSID_VDMA_RST		44
> +#define BLZP1600_DSI_CTRL_RST		45
> +#define BLZP1600_DSI_VDMA_RST		46
> +#define BLZP1600_DMA_RST		49

You have some gaps here. These are IDs, so they do not have gaps.



Best regards,
Krzysztof

