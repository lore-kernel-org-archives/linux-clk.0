Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9CDC001DF
	for <linux-clk@archiver.kernel.org>; Sun, 22 Oct 2023 12:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbjJVM5j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 22 Oct 2023 08:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230440AbjJVM5i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 22 Oct 2023 08:57:38 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED32997;
        Sun, 22 Oct 2023 05:57:35 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a7dd65052aso26498297b3.0;
        Sun, 22 Oct 2023 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697979455; x=1698584255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1ZIDfg4fDYHneg0YkS2Dov7fQ2ZHu14rSk3MyZYEMI=;
        b=B3aPGj5ftV8QMLYR/ONMrC1yWO6Iq2NyWD6fqyDBakZk943W372YXUddbDq+qy+l6L
         kzBXYudksSiHg+Imxg5VJlIWr6TOWs7HrxVqegjBq0ZIQNovyPKIsrsmhCeQItYZqXfy
         qVe6aErnKbM6+KzQM7c1BU80utenGt+fSElmpVmkGjobcaf8ZeQhVU+hkrhcDucN0wrE
         ibb7TZ3CmbK6odJSJvy7mNkybHVXx3S2LDcVyqOObMmHh9zjQzFQ73coJqU3HghDOuyG
         7tcfkJNxvUhnkHYqBev6ypBbHMi0YvxzBGCn0BrL1Kx4x7kZSIrMoNUmqVzLHJ1xABgx
         aLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697979455; x=1698584255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1ZIDfg4fDYHneg0YkS2Dov7fQ2ZHu14rSk3MyZYEMI=;
        b=lWoK4dHoG1wepA+VFXTK1YWL9aYgZpICR55n97w5n9y6Ao7CpFYZaPFZ7zz0uaS3TI
         0jIOAPOQdta35wknqRNpRkDViQbJLu7mIWkHhtfg3nGDVoffjDoKXP24Z9P1KYLetm/m
         6DPUXmzv8wg0Z3wKJp2b/ac5zZ0BOO7yO33gjIOKnEFj4YkBdm9ZwfvTijBY2RLZLz+4
         iE/SvISC3WO1gTN1Liy5br0LegsLhj3aq69ci+JxfBU0QJPg8n3o204Pc0x4irW7ijT9
         GtZmybwKWD/ychYxXW7j1SFDTvJDVnJkjf6ifvGku9lD0F429IBxXFFPar7f28aLQ9Ep
         dloA==
X-Gm-Message-State: AOJu0YysB1HHJDvwDJmYmgjqFs4CJgUO8cMKNdscbkf6dHNeTS0hhjge
        2AQ7F0b1CjH4eYK69OfMBUHWY1DqAtXAR0a4Rms=
X-Google-Smtp-Source: AGHT+IHlxzvjMDtDv57xKv7QO/2RzbpOhi5sH43CfixyH80BjWJRX3PcjBegazo85eKdASftX6xKlVCdgRuxbS2Em0Q=
X-Received: by 2002:a25:764a:0:b0:d81:85c9:cea9 with SMTP id
 r71-20020a25764a000000b00d8185c9cea9mr6524086ybc.65.1697979455123; Sun, 22
 Oct 2023 05:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux> <CANiq72kjJu=P=19kqq1+5uPpfdS=N4Ucv2okbcWFJVnvR+Hkug@mail.gmail.com>
 <94ab3de4-8687-4bc9-a1eb-18a37d7944cd@lunn.ch>
In-Reply-To: <94ab3de4-8687-4bc9-a1eb-18a37d7944cd@lunn.ch>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 22 Oct 2023 14:57:23 +0200
Message-ID: <CANiq72nEVB2XPfiSa0OsLxyuYaz9ub8U78_Big4pcJDO4SRnDA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Oct 21, 2023 at 6:03=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Maybe at the netdev conference next month, how to handle endiannes can
> be part of the presentation? I'm guessing, but is it part of the type
> system? So long as a type is marked as 'cpu endian', little endian, or
> big endian, the compiler will take care of adding the needed swaps?

Yeah, the type system can take care of ensuring that one does not
forget which type of quantity one is handling.

For instance, in this out-of-tree commit [1] from Wedson a `LE`
generic is added, which allows you to use e.g. `LE<u32>` in your
structs:

    struct Example {
        a: LE<u32>,
        b: LE<u32>,
    }

    fn sum(e: &Example) -> u32 {
        // `value` extracts the value in cpu representation.
        e.a.value() + e.b.value()
    }

Relatedly, the primitive integer types also provide "raw"
functionality for endianness, e.g. the `to_{le,be}` and
`to_{le,be,ne}_bytes` methods [2][3], and there are third-party crates
on this, e.g. [4].

[1] https://github.com/wedsonaf/linux/commit/ca4a93caff8b96a54a68fb05295980=
1468bce01a
[2] https://doc.rust-lang.org/std/primitive.u32.html#method.to_le
[3] https://doc.rust-lang.org/std/primitive.u32.html#method.to_be_bytes
[4] https://docs.rs/byteorder/latest/byteorder/

Cheers,
Miguel
