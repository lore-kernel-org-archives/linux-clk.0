Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BDAECAAD3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 06:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiISG62 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 02:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiISG61 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 02:58:27 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546AA1D0DF
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 23:58:24 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q17so18853699lji.11
        for <linux-clk@vger.kernel.org>; Sun, 18 Sep 2022 23:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=g9C/MfJJjbB+wgNXrWuFEljn9V5vmIb3VWjPOKyg+Qk=;
        b=Z42z23jl9F2ZGgqCmaNN3Vn6ZgHPRQ1r8XP/PXPB+4BoAxNuO7bObcFNA+36cUuc2d
         uMvE08GYPkrl/ZC38D+BgPQTNfodEb9BfjUr2ksZ2e4B61uxzhaa8WwtPZlkexCDIB4P
         oid56rg0BIUzktbzASPCex9B0pfwIfTIpc6cV5cjJJ0EG9rym9VO4hJI0OZKLh+jmd74
         lFOt/S2BmQln0Tjj7obSB33poreZ4BcTo2C5qSPbFPXFalGgRkQ0dihGgUYaCDHQj9it
         EBOp7PMci3ccDNrvnOAzXhi3wNcf2ZTj89yCVtbil8VJui0+XHJQwFHUQQTFA432F0Aw
         WcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=g9C/MfJJjbB+wgNXrWuFEljn9V5vmIb3VWjPOKyg+Qk=;
        b=rgtbxgEjiD/Oo248KbXHEfrgmXpy7byKylxwGQFZYfhUq/TTKasLkUKJQONjmrIRdA
         Fl/VgGwCo6wWFuyO3eY/Y1kVTqu4ZRHBHhWwqYrfE4ri7hV/sViWdmxFZemOTfLwOFDg
         EasxclokubCy3+QiE40tgWwdVfYV5JZhmvVal1IbeGX7cKRQlpRtdLbj0kC9kz3gEfeP
         jD9TG4zpW9hnAf3SF4hZMQTgqrHs5dMysoGDEnpXkYKNjwRREU2dYpkFUTi4wFf1NPCK
         aPy7Z1NEfvIh+HioWmWU33njV3Tck+y2Gl0EKBPaFFgF1cfsepRpXpLNGvcSIOxCRbij
         IIqw==
X-Gm-Message-State: ACrzQf0MndCWczdcsqnQ6cJ9Di5zJhYwXvhBxYQoTRMH2NDPY8O7/u4D
        8+erOBwvLcw4JjYsBOI/+a25ag==
X-Google-Smtp-Source: AMsMyM5uT+h9wE808Mt6XOAxUiRCj800HStbb7MsveGE9HAmuED6l+yUP18GZgu19hnYM7bPSiTznA==
X-Received: by 2002:a2e:bf23:0:b0:26c:83e:b4d3 with SMTP id c35-20020a2ebf23000000b0026c083eb4d3mr4789082ljr.282.1663570702649;
        Sun, 18 Sep 2022 23:58:22 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8-20020ac25f48000000b004945c1c5cccsm5067936lfz.268.2022.09.18.23.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 23:58:21 -0700 (PDT)
Date:   Mon, 19 Sep 2022 08:58:20 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        devicetree@vger.kernel.org, abelvesa@kernel.org,
        linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
        linux-clk@vger.kernel.org, abel.vesa@linaro.org, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
        s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH V3] dt-bindings: clock: add i.MX8M Anatop
Message-ID: <20220919065820.fk3ppcdoioubqfbg@krzk-bin>
References: <20220919055904.1659124-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919055904.1659124-1-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 19 Sep 2022 13:59:04 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8M Family features an anatop module the produces PLL to clock
> control module(CCM) root clock. Add the missing yaml file.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> V3:
>  Add #clock-cells property
> 
> V2:
>  Drop syscon, use clock-controller
>  Add fsl vendor prefix
>  Add interrupt property
> 
>  dts update not included, so there will be dtbs_check fail.
> 
>  .../bindings/clock/fsl,imx8m-anatop.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8m-anatop.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


anatop@30360000: '#clock-cells' is a required property
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
	arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dtb
	arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb
	arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb
	arch/arm64/boot/dts/freescale/imx8mp-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb
	arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb
	arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb
	arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb

anatop@30360000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
	arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
	arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-kontron-n801x-s.dtb
	arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
	arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
	arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb
	arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
	arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
	arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
	arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb
	arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb
	arch/arm64/boot/dts/freescale/imx8mp-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb
	arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb
	arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb
	arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb
	arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb

syscon@30360000: '#clock-cells' is a required property
	arch/arm64/boot/dts/freescale/imx8mq-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb
	arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb
	arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb
	arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb
	arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb
	arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb
	arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb
	arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb
	arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb

syscon@30360000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8mq-evk.dtb
	arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb
	arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb
	arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb
	arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb
	arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb
	arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb
	arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb
	arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb
	arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb
	arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb
	arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb
