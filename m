Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA33C07545
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 15:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbjJXPrw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 11:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234724AbjJXPrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 11:47:52 -0400
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9DB1B3;
        Tue, 24 Oct 2023 08:47:46 -0700 (PDT)
Received: from i53875a19.versanet.de ([83.135.90.25] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1qvJd5-0005MZ-2h; Tue, 24 Oct 2023 17:47:39 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        sebastian.reichel@collabora.com, sboyd@kernel.org,
        mturquette@baylibre.com, daniel@ffwll.ch, airlied@gmail.com,
        sam@ravnborg.org, neil.armstrong@linaro.org, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: rockchip: Add Powkiddy RK2023
Date:   Tue, 24 Oct 2023 17:47:37 +0200
Message-ID: <11399368.MucGe3eQFb@diego>
In-Reply-To: <SN6PR06MB534206AB35C00B3D003765AAA5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231018161848.346947-1-macroalpha82@gmail.com> <3083498.U7HbjWM52l@diego>
 <SN6PR06MB534206AB35C00B3D003765AAA5DBA@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris,

Am Freitag, 20. Oktober 2023, 17:03:08 CEST schrieb Chris Morgan:
> On Thu, Oct 19, 2023 at 07:45:17PM +0200, Heiko Stübner wrote:
> > Hey Chris,
> > 
> > Am Donnerstag, 19. Oktober 2023, 16:43:56 CEST schrieb Chris Morgan:
> > > On Thu, Oct 19, 2023 at 11:21:47AM +0200, Krzysztof Kozlowski wrote:
> > > > On 18/10/2023 18:18, Chris Morgan wrote:
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > 
> > > > > The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
> > > > > powered by the Rockchip RK3566 SoC.
> > > > > 
> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > index a349bf4da6bc..a6612185a7ff 100644
> > > > > --- a/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > +++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
> > > > > @@ -674,6 +674,11 @@ properties:
> > > > >            - const: powkiddy,rgb30
> > > > >            - const: rockchip,rk3566
> > > > >  
> > > > > +      - description: Powkiddy RK2023
> > > > > +        items:
> > > > > +          - const: powkiddy,rk2023
> > > > 
> > > > This cuold be just enum in previous entry :/ but I remember we talked
> > > > about this once with Heiko.
> > > 
> > > For hardware that requires a different device tree, is that possible?
> > > While most of the devices I've worked on for the RK3566 series are very
> > > similar for the moment only 1 is identical (the RG353P and the RG353M)
> > > and can use the same device tree.
> > 
> > In my reply I pointed to the Rock PI 4A/4A+/B/B+/C family, which also has
> > different devicetrees but is part of the same family of device designs.
> > 
> > So similar Powkiddy RK3568 based gaming handhelds also sound like
> > a nice family name in the description ;-) .
> 
> Gotcha, I can do that. Would you like for me to go back and do the same
> for the Anbernic devices as well? I can do it as part of a seperate
> patch series.

that doing that for the Anberic devices would be really nice too, so
yes please :-) .

Thanks
Heiko


