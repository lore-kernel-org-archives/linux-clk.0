Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E399C7EE31
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 08:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCAIRt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 03:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCAIRp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 03:17:45 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD05B3A845;
        Wed,  1 Mar 2023 00:17:42 -0800 (PST)
Received: from pecola.lan (unknown [159.196.93.152])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 12FF420034;
        Wed,  1 Mar 2023 16:17:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677658660;
        bh=woNoLas9qnFhgi2HTH7IsMcjNwAfQKmp4m9Er7VtDVM=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=PEowzYc9B2LIuyaK3BtrFQXwzP0mhCqomVvK6auctWuEl7bC4n4gQEolYh0fOSayt
         pMjNbs6eU8bI7EBNuDvWmft769L1QQlRqHkktK83ncMVVfvkXPn3jNc50GKprhaVj/
         kE9xlkgZzilRAaZ826hqzFuBr6RaIYtIFcMwqsM5oaGn2TMiV3EyyuxFzNrLvD6/Gv
         mMt1Pu2i2d75yIQDWqnAWhvuB1JqgslY93DqOaJKZXp+QLwfbGbeY4eEEuQCPR0XTE
         wrPbKoHCarqmMbXBnaFLU1y279IFDTKYAe4UBkF4U5JOJzD3lbvyHeW4JfbdHHAHGz
         +dUFuYpvKWb1g==
Message-ID: <f5c9ecb7b1a850b196dfd3a5207f03226f514721.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
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
Date:   Wed, 01 Mar 2023 16:17:39 +0800
In-Reply-To: <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
         <20230228091638.206569-4-jk@codeconstruct.com.au>
         <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
         <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Joel,

> > > @@ -15,7 +16,7 @@
> > >=20
> > > =C2=A0#include "clk-aspeed.h"
> > >=20
> > > -#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 71
> > > +#define ASPEED_G6_NUM_CLKS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 72
> >=20
> > NUM_CLKS seems dangerous. Should we instead use
> > ARRAY_SIZE(aspeed_g6_gates)?
>=20
> Yep, that would have saved me some time debugging. That would suit as
> a separate change though, would you like it in the same series?

No wait, it's not just ARRAY_SIZE(aspeed_g6_gates), there's a bunch of
manually-configured clocks in the aspeed_g6_clk_data->hws[] array too.

This might require a bit more of a restructure if we want to get rid of
the NUM_CLKS definitions...

Cheers,


Jeremy
