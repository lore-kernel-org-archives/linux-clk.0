Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C4EC4321E
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 12:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbiLBM1B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 07:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbiLBM0z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 07:26:55 -0500
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C9DCBA70;
        Fri,  2 Dec 2022 04:26:53 -0800 (PST)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
        by mx.sberdevices.ru (Postfix) with ESMTP id 3F1A95FD0B;
        Fri,  2 Dec 2022 15:26:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
        s=mail; t=1669984011;
        bh=8OBXNzSAS41lpYJ9BhmbrARwv9XI5QpXEVQ2Yvfc/tU=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=ihCgOiIlELXCrpiiNICxGJoV1LWQ8yVz8asct5UUredVutLNjzuZzGGP98L78Jk27
         kN62mykio3iggELzYidmLK0/Rwr9hX3A+AiWyee/sjbsRENF1jTvns51bqlB8seRX5
         waaFao0pEXNng9fC/oErDwUTGMlVGPtzuF6a9xMAm5DwIwa4uOB1ZITqR3o8rAfjiz
         R8duAW65C6r2TLY4skcIBg/y30jv52znpi4dqt3SeK72UEUQO8w3IGcN4eL0AUNUqO
         5bOiARbtf2MHlHgySg2RST4PzqdhEcd5iVnigkXp6VjMIXMnbgZ6mnaMJR5MLde52X
         AW3/Iz2wJRcPQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
        by mx.sberdevices.ru (Postfix) with ESMTP;
        Fri,  2 Dec 2022 15:26:50 +0300 (MSK)
Date:   Fri, 2 Dec 2022 15:26:50 +0300
From:   Dmitry Rokosov <ddrokosov@sberdevices.ru>
To:     Jerome Brunet <jbrunet@baylibre.com>
CC:     <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
        <martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
        <kernel@sberdevices.ru>, <rockosov@gmail.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20221202122650.bybwjszlgdnu3zvm@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
 <1jbkom83fg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1jbkom83fg.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 02, 2022 at 12:11:53PM +0100, Jerome Brunet wrote:
> 
> On Fri 02 Dec 2022 at 01:56, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > From: Jian Hu <jian.hu@amlogic.com>
> >
> > Add the documentation to support Amlogic A1 PLL clock driver,
> > and add A1 PLL clock controller bindings.
> >
> > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
> >  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> >  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > new file mode 100644
> > index 000000000000..d67250fbeece
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > @@ -0,0 +1,52 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
> > +
> > +maintainers:
> > +  - Neil Armstrong <narmstrong@baylibre.com>
> > +  - Jerome Brunet <jbrunet@baylibre.com>
> > +  - Jian Hu <jian.hu@jian.hu.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: amlogic,a1-pll-clkc
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +     - description: input xtal_fixpll
> > +     - description: input xtal_hifipll
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xtal_fixpll
> > +      - const: xtal_hifipll
> 
> Do we really need the "xtal_" prefix ?
> 
> Seems like the clock is the PLL, not the xtal
> 

This name was formed from specification registers description. Register
CLKTREE_SYS_OSCIN_CTRL has "gate en" field which calls "xtal ->
HIFIPLL", therefore if was transformed to xtal_hifipll name.

But I agree with you, that "hifipll" is better name choice.
 
-- 
Thank you,
Dmitry
