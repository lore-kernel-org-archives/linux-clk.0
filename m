Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D334FC64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 06:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjCAG3H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 01:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCAG3G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 01:29:06 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A2CC14E84;
        Tue, 28 Feb 2023 22:29:05 -0800 (PST)
Received: from pecola.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 099EF20034;
        Wed,  1 Mar 2023 14:28:59 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677652141;
        bh=JjvivDnqcykLuKc8oV/hCmlttRnjTv4tkpSa4zDE59E=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=ZkNio0k94N5gqhyrtKFIFOCSZsWnsTd//j1vm3Ay1y6URtoHvgJnpZbmewDviagEO
         4u7htvGLsgOGm6qvxMRPVWfB5TwRhZmiK7BuT/LhWFjQ79TvT/zsyVz8fyXXXaU8c8
         I8jhEi6YlzO19KASGx1DjGmiU3ow0F3Z6K5s/wn4aoSAPUjkzMFOGPH42EwXw2eLog
         ky6rihrecxiwpYyUzJ1BvGal35LwkK+z3ziK6Ls2VdKJ2WTpxeXU/4jKKgNjYfJiuS
         TpntvkNtYAb0MTl0Ymsi32Feo8cCCNPbGZ4wO3yZgq26bp7+Ce2wXCS7YTDJ0ZYs3I
         oF/zbbsOZLdtw==
Message-ID: <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config
 for I3C
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Date:   Wed, 01 Mar 2023 14:28:59 +0800
In-Reply-To: <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
         <20230228091638.206569-6-jk@codeconstruct.com.au>
         <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Joel,

> > diff --git a/include/dt-bindings/clock/ast2600-clock.h
> > b/include/dt-bindings/clock/ast2600-clock.h
> > index b4d69103d722..b1c129977910 100644
> > --- a/include/dt-bindings/clock/ast2600-clock.h
> > +++ b/include/dt-bindings/clock/ast2600-clock.h
> > @@ -90,6 +90,12 @@
> > =C2=A0/* Only list resets here that are not part of a gate */
>=20
> These definitions are part of a gate, yeah?

Well, no more "part of a gate" than all of the other definitions :)

All the defines in this section are references to individual bits in
the reset register banks in SCU040 & SCU050; the i3c set are the same
as the others there.

So I'm not sure what that comment is supposed to signify as to what
qualifies as a "gate" in the context of a reset...

Cheers,


Jeremy
