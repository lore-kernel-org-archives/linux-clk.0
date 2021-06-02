Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC1BC47083
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 17:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5C4961CBF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 17:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhFBRT2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Jun 2021 13:19:28 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37496 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhFBRTZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Jun 2021 13:19:25 -0400
Received: by mail-ot1-f50.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so3106656otp.4;
        Wed, 02 Jun 2021 10:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YcaaWssKoIqKkfvvS+KCJUJhitjMpANZfFfLpXrQw08=;
        b=XQZtCPu1kO1ze+jQz0kQm4TwPO0Vmy/sM92DVhWJyk4MCnqOSycRPY0vsBGWkIUQyj
         g98LV6HhDGXt3HBs1Xg1oCb/PUUbjhXvKvNYPvKGXZoVHkCDkZzpeInx3hKe8fCtlTMI
         ZUoxBc9ve2HQzMi3Q5vw8XYGm22oQRtDjd7C57/usdWS9/+g5UIrrwsCezCloOHLRGx7
         3eL0/qV9dVyu1YnMEGhzjpcjWBzwOjOlC+ObbxNXrjqcdApdLVAGA6t70EQPc6/zBjvQ
         lmPhmnMUfHIBKW4N1JItvftwji0JvmnTUDBNpBnxp4SsGSZYuFfTDeY3T7kCXdicvXIK
         8kyA==
X-Gm-Message-State: AOAM530vEWh5egKyd0TTpIyDtwPr+/vdEClKWQCTUZpNHE5BDMLbSOMq
        xeYn0sIZV0yYlGSqnyJe5w==
X-Google-Smtp-Source: ABdhPJzPaZYjKf2UJsc0c5sCkVtrtsGyVKRWv/FpQZ6SO3sfQn22/lfVD9l6FGpu9FE2kok03pun4w==
X-Received: by 2002:a05:6830:1e70:: with SMTP id m16mr26745744otr.340.1622654250335;
        Wed, 02 Jun 2021 10:17:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k16sm107568otp.19.2021.06.02.10.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 10:17:28 -0700 (PDT)
Received: (nullmailer pid 3599590 invoked by uid 1000);
        Wed, 02 Jun 2021 17:17:27 -0000
Date:   Wed, 2 Jun 2021 12:17:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v9 03/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of msdc controller
Message-ID: <20210602171727.GA3596715@robh.at.kernel.org>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-4-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524122053.17155-4-chun-jie.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 24, 2021 at 08:20:34PM +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation of msdc controller
> for Mediatek MT8192.

This is only additional compatibles. You can combine this with the 
schema in patch 2. (Unless some blocks are syscon and some aren't)

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,msdc.yaml  | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> new file mode 100644
> index 000000000000..10eb43de2d2b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,msdc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MSDC Controller
> +
> +maintainers:
> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +description:
> +  The Mediatek msdc controller provides functional configurations and clocks to the system.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt8192-msdc
> +          - mediatek,mt8192-msdc_top
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    msdc: syscon@11f60000 {
> +        compatible = "mediatek,mt8192-msdc", "syscon";
> +        reg = <0x11f60000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> +
> +  - |
> +    msdc_top: syscon@11f10000 {
> +        compatible = "mediatek,mt8192-msdc_top", "syscon";
> +        reg = <0x11f10000 0x1000>;
> +        #clock-cells = <1>;
> +    };
> -- 
> 2.18.0
