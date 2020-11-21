Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D79C63777
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 14:50:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FC7F2224A
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 14:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C98eNIJQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgKUOug (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Nov 2020 09:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgKUOug (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Nov 2020 09:50:36 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC618C0613CF;
        Sat, 21 Nov 2020 06:50:34 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id q206so14155877oif.13;
        Sat, 21 Nov 2020 06:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ette9kx7pLe3BTxF6SA7N6NBJN1cBdU9jOFxOgT8Dgs=;
        b=C98eNIJQ96ROHkZRL2BXaceiD1FesqjudfRDq0SpYUawYUbCsJMGSJnsiTUwp+ChlT
         m4kiJfomdNY6iWhv9UK81qwOFUCOseOB+YLSTDuzWlcTHD45LIH6deMhEFjpv8zwnRsZ
         F5PDDrjO3Jly6kUL5VABH4/9KRP5UwkMRT1mxrEAaZ9nCCNw9bbLebPJgNbvD/KcwcKG
         KRAt1AyVrrgnbZ8qjoNtbFrDp28z/eI4ki6K6oxtKYMZKmQwvNEHwnQVWDZFDBDTuzWq
         /7/0SuxWzzN2qPxvilP23Ega639E64hREY3F/w3y2+39Rlc8brtm/8PnKKhypzapyapf
         RFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ette9kx7pLe3BTxF6SA7N6NBJN1cBdU9jOFxOgT8Dgs=;
        b=d79kQ7Qimgywbnq+EPRQvH71IRirBLysUn4v5sCOrA4p4K9bLz6KORgo5sjR+tCT3U
         5ncgnm69ltIre23bWbOao+xKAWfr25/ne4h6/gMD2QdW8zodfASR5SZp/0agb419UMAk
         sewCd+VJQOMz1emkms3CRv7ADWi+UX09XyMlhcwvgn0JjQfXeYpgIRpZ4zGQjmrFGBqo
         SFQO2ew4uPrAN68PfKIiPBuI4zs53v4ILau0MVjuk/9riBelPHBApMgMgnrE4ChvpoQp
         PSoyRtzrJFPCuzGBPZoxRq9ppgbebKB8eBM/3s7pBvOZ5Zj4Ef7JLhcUccYRQgJuU+Wb
         DR9Q==
X-Gm-Message-State: AOAM531Sk752XyQmKNV8zpUVRlcnhkXbZCtK3i0bLMt9Vb9j4LK2eJYW
        V35pMpeXJPQwmexwIsgRV0utI8RK2xrDr6HtESE=
X-Google-Smtp-Source: ABdhPJySOdSRaChFfDTdyVQzHEvIojGBbrolLIz896Qw2h4xpte1Ro7K6uWBdEMow99a6PELRxBLWCEe9btAVMFc9CI=
X-Received: by 2002:aca:59c3:: with SMTP id n186mr9282300oib.149.1605970234325;
 Sat, 21 Nov 2020 06:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
 <20201113154632.24973-3-sergio.paracuellos@gmail.com> <20201121133432.GA2130098@robh.at.kernel.org>
In-Reply-To: <20201121133432.GA2130098@robh.at.kernel.org>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Sat, 21 Nov 2020 15:50:23 +0100
Message-ID: <CAMhs-H9JORHgPmq0-n=hx=yRo0SCT33mP_quxZoRtKYkiVDy_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt: bindings: add mt7621-clk device tree binding documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        NeilBrown <neil@brown.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rob,

Thanks for the review.

On Sat, Nov 21, 2020 at 2:34 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Nov 13, 2020 at 04:46:29PM +0100, Sergio Paracuellos wrote:
> > Adds device tree binding documentation for clocks in the
> > MT7621 SOC.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  .../bindings/clock/mediatek,mt7621-clk.yaml   | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > new file mode 100644
> > index 000000000000..363bd9880e29
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MT7621 Clock Device Tree Bindings
> > +
> > +maintainers:
> > +  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > +
> > +description: |
> > +  The MT7621 has a PLL controller from where the cpu clock is provided
> > +  as well as derived clocks for the bus and the peripherals. It also
> > +  can gate SoC device clocks.
> > +
> > +  Each clock is assigned an identifier and client nodes use this identifier
> > +  to specify the clock which they consume.
> > +
> > +  All these identifiers could be found in:
> > +  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt7621-clk
> > +
> > +  ralink,sysctl:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to the syscon which is in the same address area with syscon
> > +      device.
> > +
> > +  "#clock-cells":
> > +    description:
> > +      The first cell indicates the clock gate number, see [1] for available
> > +      clocks.
> > +    const: 1
> > +
> > +  clock-output-names:
> > +    maxItems: 8
> > +
> > +required:
> > +  - compatible
> > +  - ralink,sysctl
> > +  - '#clock-cells'
> > +  - clock-output-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt7621-clk.h>
> > +
> > +    pll {
> > +      compatible = "mediatek,mt7621-clk";
> > +      ralink,sysctl = <&sysc>;
>
> If this is the only control interface, then make this a child of 'sysc'.
> And use 'reg' if there's a dedicated range of registers.

This is the only one now in the device tree which is still in staging
but there are several places where this sys control registers are
accessed from. In the case of the clocks we need:

#define SYSC_REG_SYSTEM_CONFIG0         0x10
#define SYSC_REG_SYSTEM_CONFIG1         0x14
#define SYSC_REG_CLKCFG0                0x2c
#define SYSC_REG_CLKCFG1                0x30
#define SYSC_REG_CUR_CLK_STS            0x44

where there is not a range as it is but several different registers
from where we need to read or write things. I wrote the driver using
syscon and regmap because I thought in that way it might be more
maintainable but this architecture also has operations to read and
write registers from sysc and not using regmap at all. This operations
are defined in arch/mips/include/asm/mach-ralink/ralink_regs.h. But
because this sysc is currently mapped I cannot request its registers
using reg in the device tree. If you prefer me to avoid the use of
this syscon and regmap and use operations defined in ralink_regs.h,
this will become in a node without "regs" or  "ralink,sysctl"
property:

pll {
    compatible = "mediatek,mt7621-clk";
    #clock-cells = <1>;
    clock-output-names = "xtal", "cpu", "bus",
                      "50m", "125m", "150m",
                       "250m", "270m";
};

What should I do then?

Best regards,
    Sergio Paracuellos

>
> > +      #clock-cells = <1>;
> > +      clock-output-names = "xtal", "cpu", "bus",
> > +                           "50m", "125m", "150m",
> > +                           "250m", "270m";
> > +    };
> > --
> > 2.25.1
> >
