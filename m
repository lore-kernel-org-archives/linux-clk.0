Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47591C46CA1
	for <linux-clk@archiver.kernel.org>; Thu, 19 Oct 2023 17:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346343AbjJSRpd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Oct 2023 13:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346334AbjJSRp3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Oct 2023 13:45:29 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59CD106;
        Thu, 19 Oct 2023 10:45:24 -0700 (PDT)
Received: from i5e861907.versanet.de ([94.134.25.7] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qtX5C-0006Vb-V4; Thu, 19 Oct 2023 19:45:19 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chris Morgan <macromorgan@hotmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        sebastian.reichel@collabora.com, sboyd@kernel.org,
        mturquette@baylibre.com, daniel@ffwll.ch, airlied@gmail.com,
        sam@ravnborg.org, neil.armstrong@linaro.org, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date:   Thu, 19 Oct 2023 19:45:17 +0200
Message-ID: <3083498.U7HbjWM52l@diego>
In-Reply-To: <SN6PR06MB534289953F0A72345D679A7EA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com>
 <df3c067f-8732-46bf-aa93-852f41e9e4e9@linaro.org>
 <SN6PR06MB534289953F0A72345D679A7EA5D4A@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey Chris,

Am Donnerstag, 19. Oktober 2023, 16:43:56 CEST schrieb Chris Morgan:
> On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> > On 18/10/2023 18:18, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> > > powered by the Rockchip RK3566 SoC.
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > index a349bf4da6bc..a6612185a7ff 100644
> > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > @@ -674,6 +674,11 @@ properties:
> > >            - const: powkiddy,rgb30
> > >            - const: rockchip,rk3566
> > >  
> > > +      - description: Powkiddy RK2023
> > > +        items:
> > > +          - const: powkiddy,rk2023
> > 
> > This cuold be just enum in previous entry :/ but I remember we talked
> > about this once with Heiko.
> 
> For hardware that requires a different device tree, is that possible?
> While most of the devices I've worked on for the RK3566 series are very
> similar for the moment only 1 is identical (the RG353P and the RG353M)
> and can use the same device tree.

In my reply I pointed to the Rock PI 4A/4A+/B/B+/C family, which also has
different devicetrees but is part of the same family of device designs.

So similar Powkiddy RK3568 based gaming handhelds also sound like
a nice family name in the description ;-) .


Heiko


