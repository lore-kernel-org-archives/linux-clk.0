Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198F4C7EE45
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jun 2023 23:20:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjFHXUE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jun 2023 19:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236744AbjFHXUC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jun 2023 19:20:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA97B30D0;
        Thu,  8 Jun 2023 16:20:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 63A5C60B9C;
        Thu,  8 Jun 2023 23:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9452C433EF;
        Thu,  8 Jun 2023 23:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686266399;
        bh=gNWzo0d9k285yqJ8343FYMMw+n7NS2BmOugvX2V0Ji4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CA4pzCm+6mlNQVfNfEDag0XzljC6cfKu+PqT5l6t8GKJ6NGlZeiHGUJr+CnONQDlA
         Cxj2Zobn+zQbQQO27nvBbTBMNKzC8ytYlap3oYrEOTmLQi7KWIj8Tw97hZW8jSseLB
         u+Y2Ze8goJdUkgMec9T+K3L8O+hZ6/9KzJupowAaBHXhRuHNYxp7+HkQJ0+RsS0SeK
         0AiPMeQK1FAFe1GZXfFMhW+tx9L+nM4htHuYSuEMQcP/b+tBzecABFuAHR2LzR+Mxi
         Q2onTKpdzdjG3vJa2OFjL9C2FKAr4shGeW45NcYgFUg1MOTDCmJHOtsNZrHoRBKldq
         A2dG2IxKIrfpw==
Message-ID: <0447c70d63e13d239bdda839e966bd89.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <96004048-0ba5-4cd6-406f-e1235c819c97@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1d0217a8-661f-4359-b77b-02222c761b01@emailsignatures365.codetwo.com> <20230605133410.15076-1-mike.looijmans@topic.nl> <5d1f08f1-792b-255b-89f0-dd5fa2f0baa4@linaro.org> <96004048-0ba5-4cd6-406f-e1235c819c97@topic.nl>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: fixed-clock: Add nvmem support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date:   Thu, 08 Jun 2023 16:19:57 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mike Looijmans (2023-06-05 07:00:16)
> On 05-06-2023 15:38, Krzysztof Kozlowski wrote:
> > On 05/06/2023 15:34, Mike Looijmans wrote:
> >> diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.yaml =
b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> >> index b0a4fb8256e2..23e4df96d3b0 100644
> >> --- a/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> >> @@ -12,7 +12,9 @@ maintainers:
> >>  =20
> >>   properties:
> >>     compatible:
> >> -    const: fixed-clock
> >> +    enum:
> >> +      - fixed-clock
> >> +      - fixed-clock-nvmem
> > Do you even need new compatible? Isn't this the same clock from the
> > hardware point of view?
>=20
> I need a new compatible because a "fixed-clock" only loads at init time. =

> It registers using CLK_OF_DECLARE, which requires the clock to register=20
> early. NVMEM providers are typical devices like I2C EEPROMs that won't=20
> be available at that point, hence I needed to create a clock that=20
> registers as a regular clock driver and can handle deferral and similar.

What is builtin_platform_driver(of_fixed_clk_driver)?
