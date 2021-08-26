Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C71EC432BE
	for <linux-clk@archiver.kernel.org>; Thu, 26 Aug 2021 18:34:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5676F60F45
	for <linux-clk@archiver.kernel.org>; Thu, 26 Aug 2021 18:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243283AbhHZSet (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Aug 2021 14:34:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:54304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243264AbhHZSes (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 26 Aug 2021 14:34:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1817E60FE6;
        Thu, 26 Aug 2021 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630002841;
        bh=Ojo3AIE2zQ0ofeJ5NGW+uPmOVDRe2wm4x9HFW+VBgO4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=t2ajXCxILAsV8E5ErOWsZbxH3Rp4CD//p9wUp4lsIFiXCYMqBxD/oH6XCBLIZmtfS
         MZ8Ip58RM7ZAud8XVEYxjFWPBITSNc6PbMM1/MfycJA19gTE5Co1MmflWvKZdytTJN
         uurRVQYl3Z43qZce4H7BzYQ92TY51MiPyNdqCxDkImVvE8oB1LbmnTh+BSYYDTCmKB
         1ujBqtngu45vZ7cvSP+ujPpV2usWwL/y6muQeVBeJ/IXeRG7I/v8I3yiFSU/3XQDWI
         EESb/sG3ExakYTjuWPM51sX+I3AJvqQ3MBpSlJSlS39LAv+CWqJpcgt4vDaSpp7CPH
         wdyFnK68isg9w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210818141102.36655-2-daire.mcnamara@microchip.com>
References: <20210818141102.36655-1-daire.mcnamara@microchip.com> <20210818141102.36655-2-daire.mcnamara@microchip.com>
Subject: Re: [PATCH v5 1/2 resend] dt-bindings: clk: microchip: Add Microchip PolarFire host binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     cyril.jean@microchip.com, conor.dooley@microchip.com,
        david.abdurachmanov@gmail.com, palmer@dabbelt.com,
        Daire McNamara <daire.mcnamara@microchip.com>
To:     daire.mcnamara@microchip.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Thu, 26 Aug 2021 11:33:59 -0700
Message-ID: <163000283984.1317818.6815846417836501879@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting daire.mcnamara@microchip.com (2021-08-18 07:11:01)
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Add device tree bindings for the Microchip PolarFire system
> clock controller
>=20
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs.yaml        | 67 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 +++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpf=
s.yaml
>  create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml =
b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
> new file mode 100644
> index 000000000000..1a38c9c66281
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/microchip,mpfs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire Clock Control Module Binding
> +
> +maintainers:
> +  - Daire McNamara <daire.mcnamara@microchip.com>
> +
> +description: |
> +  Microchip PolarFire clock control (CLKCFG) is an integrated clock cont=
roller,
> +  which gates and enables all peripheral clocks.
> +
> +  This device tree binding describes 33 gate clocks.  Clocks are referen=
ced by
> +  user nodes by the CLKCFG node phandle and the clock index in the group=
, from
> +  0 to 32.
> +
> +properties:
> +  compatible:
> +    const: microchip,mpfs-clkcfg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +    description: |
> +      The clock consumer should specify the desired clock by having the =
clock
> +      ID in its "clocks" phandle cell. See include/dt-bindings/clock/mic=
rochip,mpfs-clock.h
> +      for the full list of PolarFire clock IDs.
> +
> +  clock-output-names:
> +    maxItems: 33

Do you need clock-output-names? I'd prefer to see less of this property
used, not more.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +  - clock-output-names
> +
> +additionalProperties: false
