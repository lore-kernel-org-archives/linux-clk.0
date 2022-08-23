Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C653C32772
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 19:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiHWTVG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 15:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234384AbiHWTUn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 15:20:43 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945A312C7DC;
        Tue, 23 Aug 2022 10:59:53 -0700 (PDT)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1oQYBm-0006NS-G1; Tue, 23 Aug 2022 19:59:46 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Stephen Boyd <sboyd@kernel.org>, Jagan Teki <jagan@edgeble.ai>
Cc:     Kever Yang <kever.yang@rock-chips.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 10/19] dt-bindings: clock: rockchip: Document RV1126 CRU
Date:   Tue, 23 Aug 2022 19:59:45 +0200
Message-ID: <6086608.Sb9uPGUboI@diego>
In-Reply-To: <CA+VMnFyJOCc-RzENYs9L+U4VeJgEpMmZeSLZahcNdnL7_Cvw9Q@mail.gmail.com>
References: <20220818124132.125304-1-jagan@edgeble.ai> <20220818212913.7FC43C433D6@smtp.kernel.org> <CA+VMnFyJOCc-RzENYs9L+U4VeJgEpMmZeSLZahcNdnL7_Cvw9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Freitag, 19. August 2022, 23:20:03 CEST schrieb Jagan Teki:
> On Fri, 19 Aug 2022 at 02:59, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Jagan Teki (2022-08-18 05:41:23)
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  clock-names:
> > > +    const: xin24m
> > > +
> > > +  rockchip,grf:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Phandle to the syscon managing the "general register files" (GRF),
> > > +      if missing pll rates are not changeable, due to the missing pll
> > > +      lock status.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#clock-cells"
> > > +  - "#reset-cells"
> >
> > Why aren't clocks required?
> 
> I don't see any clocks being used by cru in rv1126 [1] so that is the
> reason I didn't add any. Let me know if it is something that is
> mandatory to add even if it's unused.
> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/arch/arm/boot/dts/rv1126.dtsi#L1074

Our clock drivers normally just expect that xin24m to be present
but that xin24m _is_ a clock dependency for the cru and for a lot
of Rockchip SoCs Johan did update both the binding and the dtsi-s
to make that explicit when converting the binding over to yaml

See for example the rk3399.

Heiko


