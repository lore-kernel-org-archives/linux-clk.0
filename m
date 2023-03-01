Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB1CC64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 06:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjCAGsi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 01:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjCAGsh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 01:48:37 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA28314213;
        Tue, 28 Feb 2023 22:48:34 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id da10so49831312edb.3;
        Tue, 28 Feb 2023 22:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rWiH/yfABzHL4ae4C9gVZIzveXFrF1P6maDicDxQmSQ=;
        b=kOJ3Gvv1Fwzz4lmxNclGvUEqUbmXPw2lV8RuCp6rmdyVz52v2fvubX68lsvY9a6se1
         lpheYla/yeWTYz/2IPSSE031pfmPaqRzDvHGSZ9nnXZKpVyMeULKrfmBG4DHP/FARC78
         dCuj3MFioN7+kL1iD/UoYJUJlRoTuTDmJvV50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWiH/yfABzHL4ae4C9gVZIzveXFrF1P6maDicDxQmSQ=;
        b=bvrM9/RUMa050xYZCGeK4xo1YRsQavxdDIu3PQKvfjxrXSs6/6KR+kcBIAkLTEuZlL
         2ak9FTM19gwjeMb4c7xoiW0CZarlLUU4H1LUfEmiX0g9jxvQ/klsjFTlMjXUpGUZp0yo
         xtWpF1OAmL9RhOiRUofG2S2tzbhnqaTLbSf4HYTmD20UWqLc6/5jKoOEWaQ7aGY2WN0L
         CIWsnDXpbMddOsBWIWeb7W8NAd4ExS7y3lJDB5UGHh+XOR6rtkEDc27mhSNCCKVgM+Z3
         exF81HbWJucrspzvlnyJDNTqJJ7UoAw2f2n0KLbh+CaGznkW1xNPItozTeftLKNApqnD
         0dBA==
X-Gm-Message-State: AO0yUKWipMRNyMvZ4Xbaq20WJvIbj5PqJVrYle7T5rx8fqHd9qYDnPMe
        bm0WxfzXK3/is723/R+GMm7nAiMtIeHltKGzk84ENz+UbBk=
X-Google-Smtp-Source: AK7set/sTCJJLaqc0euCySi7vIDxXxrcEU9jaXPxQQR98MSZuPX9L0zhE/D+G0o9T+Y7KVy4e9pW0TJe/EkRga64s74=
X-Received: by 2002:a17:906:1751:b0:8e3:da0f:f9b7 with SMTP id
 d17-20020a170906175100b008e3da0ff9b7mr2749900eje.4.1677653313123; Tue, 28 Feb
 2023 22:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
 <20230228091638.206569-6-jk@codeconstruct.com.au> <CACPK8XcA_SES=Wo7vuWEJ4U5kTizM5brmb=6ELXD-taCFJQwgA@mail.gmail.com>
 <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
In-Reply-To: <cbbb99ce6125048667e4c41412710a61dc4d686f.camel@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 06:48:20 +0000
Message-ID: <CACPK8XfRg9vHYjC0rco4dr9pNY03vXTrmXaopOGBgdCq09LybQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 1 Mar 2023 at 06:29, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> > > diff --git a/include/dt-bindings/clock/ast2600-clock.h
> > > b/include/dt-bindings/clock/ast2600-clock.h
> > > index b4d69103d722..b1c129977910 100644
> > > --- a/include/dt-bindings/clock/ast2600-clock.h
> > > +++ b/include/dt-bindings/clock/ast2600-clock.h
> > > @@ -90,6 +90,12 @@
> > >  /* Only list resets here that are not part of a gate */
> >
> > These definitions are part of a gate, yeah?
>
> Well, no more "part of a gate" than all of the other definitions :)
>
> All the defines in this section are references to individual bits in
> the reset register banks in SCU040 & SCU050; the i3c set are the same
> as the others there.
>
> So I'm not sure what that comment is supposed to signify as to what
> qualifies as a "gate" in the context of a reset...

This is poor documentation from the author of the clock driver, which is me.

We only expose the reset lines in the device tree for resets that are
not associated with a clock line.

This is done because the aspeed docs specify we do a dance when enabling an IP:

 1. Place IP in reset
 2. Enable clock
 3. Delay
 4. Release reset

So we do this with the aspeed_g6_gates array. The rule is: any gate
with a number in the rst column doesn't have that reset line exposed.
That's what this cryptic comment in the header is warning about.

This was documented to some extent in the original commit message for
the 2400/2500 driver:

 https://git.kernel.org/torvalds/c/15ed8ce5f84e2b

We could hoist that out and put it in the source file(s).

Cheers,

Joel
