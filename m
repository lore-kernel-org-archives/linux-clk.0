Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8319C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 06:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjCAGyy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 01:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjCAGyx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 01:54:53 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FC5298CA;
        Tue, 28 Feb 2023 22:54:52 -0800 (PST)
Received: from pecola.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CFAAA20034;
        Wed,  1 Mar 2023 14:54:50 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677653690;
        bh=7hd2rXTIjthijwypIiEY2EMElVsWDZ7kE82iOJb/pYM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=L9TRX5s3EOuTW1uU3uwpVE9xF3X5jVGN9sq/EVoDDGx7Rq3j1OMrsXev+boozONzJ
         CZIqtLhVWUiiAnRK0m2zLgObXi4h3XV1ubVSaLFBDIzsQi0DiKrM2OFtPfUJebWEHb
         RiuFpaXVaQWxgi0ploAItX8xEa7u0ipWBBZdWFCkUxyiKURqTVPcsvfitgavyOwuvA
         ScOtJ7wq1f43ybiHH2YEeVYrWf174OOHKSJzVGH9Rj9V/4XoGPF4an/ejxc9/xN/4O
         iOmGUsO6ZmEprddiJ0XJALptziBaIXM8XKeR8kf7LylGg4DV+s8yx9kNb6SxHor1M4
         fqv9pZnOgRc3Q==
Message-ID: <51803a244c28c53b5adb384effc09df1909dd1e8.camel@codeconstruct.com.au>
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
Date:   Wed, 01 Mar 2023 14:54:50 +0800
In-Reply-To: <CACPK8XfRg9vHYjC0rco4dr9pNY03vXTrmXaopOGBgdCq09LybQ@mail.gmail.com>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
         <20230228091638.206569-6-jk@codeconstruct.com.au>
         <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
         <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
         <CACPK8XfRg9vHYjC0rco4dr9pNY03vXTrmXaopOGBgdCq09LybQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Joel,

> > So I'm not sure what that comment is supposed to signify as to what
> > qualifies as a "gate" in the context of a reset...
>=20
> This is poor documentation from the author of the clock driver,

Hah, not that guy again!

> which is me.

oh.

> We only expose the reset lines in the device tree for resets that are
> not associated with a clock line.
>=20
> This is done because the aspeed docs specify we do a dance when
> enabling an IP:
>=20
> =C2=A01. Place IP in reset
> =C2=A02. Enable clock
> =C2=A03. Delay
> =C2=A04. Release reset
>=20
> So we do this with the aspeed_g6_gates array. The rule is: any gate
> with a number in the rst column doesn't have that reset line exposed.
> That's what this cryptic comment in the header is warning about.

That makes sense, and means I can drop the explicit reset control from
the DTS, and then we don't need these definitions.

> This was documented to some extent in the original commit message for
> the 2400/2500 driver:
>=20
> =C2=A0https://git.kernel.org/torvalds/c/15ed8ce5f84e2b
>=20
> We could hoist that out and put it in the source file(s).

Awesome, thanks for the explanation - I'll add a patch to do so.

Cheers,


Jeremy
