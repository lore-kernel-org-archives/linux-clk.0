Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D9CC0032E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 17:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbjJYRhc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 13:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjJYRhb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 13:37:31 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12A413A
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:37:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9b9faf05f51so4371566b.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698255448; x=1698860248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl2dU+9nKTty0GF9smAcA+fSgOnuLvaP8a1ykaCWH2s=;
        b=GDT5CQLsLmsaYAcNThygAaspOpag/SlpISPnmecK//fJguIXXv0WSqoRAv4pwX1NZ7
         FgYq90wJt4XfjjANVZUBhJ/xFuysIUIT/gNvqCJNXbL4O+tmYCrzcJBOlofQ9wnfg9OO
         dRbATjDlG1hV3agJN4CFhmnJ6JXhUFuzu1hks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698255448; x=1698860248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl2dU+9nKTty0GF9smAcA+fSgOnuLvaP8a1ykaCWH2s=;
        b=Ww6DcxdOjBEOSletkbTV2C3VyzVXaOASdGvh8uTFXn7f9duTLWQTT3w3MsTzTvJ9Ou
         Tl78hqMK3ubZuBb2Fnj+cFo+Mca8QGmDjyXp87Y1CciCX9eJsaxJGfZbLzAgTeJNMEU3
         9qEM0moBDcfvszjeFaZnFl8BA2kEhhCce5hnIfjsbul/JzMABUufOnPtztRn6+ITrvPK
         E605YsIhSCDVXj6tqjJfeGndn3DhIsZ1PnABVw/7yQbh27XgDHBUFGxkufmExp9w6jdK
         /9gxR+nGmAWQsuV+yeA+J3yhEVBCuZyjAQtqKWouHOQoU5NqloxIaaxtupnLIDXBeTWL
         LoZg==
X-Gm-Message-State: AOJu0YxJNQd6B+MS8SCP3L1dfj6fFq5AzvsBV396BWHIWYa5CcMJz4Kr
        8ZC0E372uiULxfYt3B/uHGq5TEtWwHWNFTPEJwTGyQ==
X-Google-Smtp-Source: AGHT+IGSuo8BYOOXzP+uIxsEBW0usEmOIaX+84BPhYJhLQkcsi9z3sNfuQ7MINSZ3SHhQg/mUQWJdg==
X-Received: by 2002:a17:907:7285:b0:9b2:be5e:7545 with SMTP id dt5-20020a170907728500b009b2be5e7545mr12387020ejc.36.1698255447674;
        Wed, 25 Oct 2023 10:37:27 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id o1-20020a170906774100b009c6e58437dasm10316507ejn.37.2023.10.25.10.37.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 10:37:26 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9be1ee3dc86so5919866b.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:37:26 -0700 (PDT)
X-Received: by 2002:a17:906:c155:b0:9be:3c7e:7f38 with SMTP id
 dp21-20020a170906c15500b009be3c7e7f38mr12949467ejc.10.1698255446403; Wed, 25
 Oct 2023 10:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231024161931.78567-1-sebastian.reichel@collabora.com>
 <20231024161931.78567-2-sebastian.reichel@collabora.com> <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
 <CAHk-=wjO5ivM6k7iMiThO9JfxH0dhLe=mcC4TQwReU0nBCnWpg@mail.gmail.com> <7ba90240-33ba-4e08-af38-3ec2d40c3837@rasmusvillemoes.dk>
In-Reply-To: <7ba90240-33ba-4e08-af38-3ec2d40c3837@rasmusvillemoes.dk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 25 Oct 2023 07:37:09 -1000
X-Gmail-Original-Message-ID: <CAHk-=wieb+dUFet+pNqB7MTy88iYQU3KtTK9V0JHnxwwKoMGpQ@mail.gmail.com>
Message-ID: <CAHk-=wieb+dUFet+pNqB7MTy88iYQU3KtTK9V0JHnxwwKoMGpQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] math.h: add DIV_ROUND_UP_NO_OVERFLOW
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 Oct 2023 at 22:03, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
>
> Both the existing and new implementation are simply wrong for negative
> n, because / doesn't do floor(), it does round-towards-0 (I do believe
> that's a bug in the C standard, but not much one can do about that).

Honestly, while I found several cases where the arithmetic was done
with a signed type, all the ones I looked at were purely about the
_type_, not the values.

Any actual negative values would have been too random before to make a
difference. In that patch, I tried to keep the signed type around
mainly to at least get *similar* values to the old code, but honestly,
it was all broken before already if the values were actually signed.

If it were to change the result and somebody would find a bug due to
that, that would be a good thing, in other words. The negative value
would need to be fixed anyway - as you say, integer division of signed
values is simply not rgeat in the first place.

Side note: if you dislike the "round towards zero" behavior, I can
tell you that it is better than the historical alternative, which was
"implementation defined".

IIRC, the rule used to be that signed division could either round down
or towards zero, and the only rule was that (a) it had to be
documented (ie "implementation defined" rather than "undefined") and
(b) the modulus had to follow the same rules, ie regardless of
rounding, you'd have

  (a/b)*b + a%b = a

That said:

> Preventing signed types from being used is probably too difficult.

It might not be. My horror with _Generic() is certainly not pretty,
but it *does* have the advantage that we could error out for signed
cases.

I did that initially, and it didn't look horrific, particularly if you
just accept signed positive constants as unsigned values (which
requires another bit of macro magic but is not conceptually hard).

The patch I sent out was not it, though - it was meant really as a
minimal "something like this" that still compiled my defconfig.

> Aside: I don't think uapi/ stuff can include non-uapi/ stuff.

Yeah, no, I left it in that uapi header just for the same reason I
didn't bother trying to fix any signed type cases - actively avoiding
changes *outside* the DIV_ROUND_UP() case itself.

In reality, I'd just make any users of __KERNEL_DIV_ROUND_UP include
<linux/div_round_up.h> and get rid of the crazy UAPI thing entirely.

So ignore that part.

> Aside2: do_div(n-1, d); probably doesn't compile :)

.. I did say it was untested and "might approach being correct".

That 32-bit ULL case should also have some attempt at checking that
the divisor really fits in 32 bits. Because I still refuse to believe
that the full 64-by-64 divisions are sane on a 32-bit machine, and
anybody who does that needs to go to extra lengths for them. No
"silently do them without telling the programmer they are doing
something horrendously bad".

                Linus
