Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813E6C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 09:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjCAJgf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:36:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCAJge (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 04:36:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C7636FE3
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 01:36:33 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIsj-0006oO-T9; Wed, 01 Mar 2023 10:36:17 +0100
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1pXIsi-000589-KP; Wed, 01 Mar 2023 10:36:16 +0100
Date:   Wed, 1 Mar 2023 10:36:16 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh@kernel.org>, Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 3/5] dt-bindings: clock: imx8mp: Add audiomix block
 control
Message-ID: <20230301093616.nj5pvtdkf7qjd5hw@pengutronix.de>
References: <20230228215739.171071-1-marex@denx.de>
 <20230228215739.171071-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228215739.171071-3-marex@denx.de>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On 23-02-28, Marek Vasut wrote:
> Unlike the other block control IPs in i.MX8M, the audiomix is mostly a
> series of clock gates and muxes. Add DT bindings for this IP.
> 
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V2: No change
> V3: - Add missed RB from Rob from V1
>     - Rename audio_ahb to plain ahb
> V4: - Rebase on next 20230223
> V5: Add TB from Adam and Alexander
> V6: - Add RB from Fabio
>     - Drop power-domain-names
>     - Move reg below compatible property
> ---
>  .../bindings/clock/imx8mp-audiomix.yaml       | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> new file mode 100644
> index 0000000000000..ca0bdd0c551b8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mp-audiomix.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8MP AudioMIX Block Control Binding
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  NXP i.MX8M Plus AudioMIX is dedicated clock muxing and gating IP
> +  used to control Audio related clock on the SoC.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-audio-blk-ctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 7
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: sai1
> +      - const: sai2
> +      - const: sai3
> +      - const: sai5
> +      - const: sai6
> +      - const: sai7
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      The clock consumer should specify the desired clock by having the clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mp-clock.h
> +      for the full list of i.MX8MP IMX8MP_CLK_AUDIOMIX_ clock IDs.
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    #include <dt-bindings/clock/imx8mp-clock.h>
> +
> +    clock-controller@30e20000 {
> +        #clock-cells = <1>;

We should move the #clock-cells at least below the reg property.
IMHO the cells property could be the last one. With that fixed feel free
to add my

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Regards,
  Marco

> +        compatible = "fsl,imx8mp-audio-blk-ctrl";
> +        reg = <0x30e20000 0x10000>;
> +        clocks = <&clk IMX8MP_CLK_AUDIO_ROOT>,
> +                 <&clk IMX8MP_CLK_SAI1>,
> +                 <&clk IMX8MP_CLK_SAI2>,
> +                 <&clk IMX8MP_CLK_SAI3>,
> +                 <&clk IMX8MP_CLK_SAI5>,
> +                 <&clk IMX8MP_CLK_SAI6>,
> +                 <&clk IMX8MP_CLK_SAI7>;
> +        clock-names = "ahb",
> +                      "sai1", "sai2", "sai3",
> +                      "sai5", "sai6", "sai7";
> +        power-domains = <&pgc_audio>;
> +    };
> +
> +...
> -- 
> 2.39.2
> 
> 
