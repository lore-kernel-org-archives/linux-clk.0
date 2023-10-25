Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89926C07545
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 02:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjJYCCC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 22:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJYCCB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 22:02:01 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20BA10D5;
        Tue, 24 Oct 2023 19:01:55 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so751471a12.1;
        Tue, 24 Oct 2023 19:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698199314; x=1698804114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GM5rExFFAkHF7RtOeKmV3ULAewVErHQqCo+hgEVi4RA=;
        b=ELrs+b1Q0EA3DqOPVXTS28zAClNcEOzMuAUYl6yTuBKg9SQP7OnY6MLof9tQ0DgUQv
         mIs5YOLVbI14gBxQXUoZqWsU7Cxr11SP5e9DyJy6RFDoJP/KUTs76C7q/R2l3xzB25kU
         qnUHDzEdcqXMz7bK9oFqh0YafDjDMansZWcgVGZCGl4hj5mSF5CXuIZLXpD7tuhPRNyX
         vHxavCKPsxEyQohbjwPPzNiykE3XlzZG8lrAdZv6U/OyKE7e2BamhiifY0gOAQ+lVJiS
         qZx7VRGEtA4xy0t0/xsNnke9tuk9+R/r5TVs8QESlCjkEEESakYDWyvUR6Bq1KFkNBws
         i2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698199314; x=1698804114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GM5rExFFAkHF7RtOeKmV3ULAewVErHQqCo+hgEVi4RA=;
        b=gJ8LpjAOVGGJXAJ5cmkmumm4U9iDFy1s34x2JCF6X7vkjTxdklgDWBYcROS79RuqE1
         /Ut/6jtnTxeqCQoHj1YGjSuGWzI+2tpXRMnHQQff6jBLlPipSI+K4b8R3+hmtiNLkFm8
         OfZJTFAY6APHNmG4eul5VEibKpEhOAZtDbw8umkiqVNPtbi1eKDF8YH2ZvLGWnezMMkY
         jKv3J7OUQA3k/CW3moeKc017hpMdhvhBPg4qyoiM6gB0T4rA1YMZIF8jNqroO1I1o47F
         1RM7XMgBfpaTJ7gM4fuf75+7v2ArdLM+Ja/seQ8aUlROMcccH/uqaQOE2HGYhVrZY6Z6
         ivOQ==
X-Gm-Message-State: AOJu0Ywi3b48Q5bfhCoZJO6RQQC20O5H0V6cIlxGkFwr1H5QcrzMZEYq
        C7ThoK1UuX4LDvnXXVGFprMYDnUTNaej0awvvg==
X-Google-Smtp-Source: AGHT+IF5wNjXCrU3e3AhnULwTZzACMqTHWJmcxngSuiAJ4OzxgmbLU15VCielhFiQyycbsVTC2YVJ3uRiPEmjWkMwUI=
X-Received: by 2002:a17:906:6a13:b0:9ad:8a96:ad55 with SMTP id
 qw19-20020a1709066a1300b009ad8a96ad55mr16665902ejc.14.1698199314119; Tue, 24
 Oct 2023 19:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+6MoE1DyOay-fMWQP0hsenz174hSuGJnKM7symh0C-y1mqZw@mail.gmail.com>
 <CANiq72=LGW-7qMSFKs7ZLOfOGfJKJthR8nd06j-zfqSpZQY3zQ@mail.gmail.com>
In-Reply-To: <CANiq72=LGW-7qMSFKs7ZLOfOGfJKJthR8nd06j-zfqSpZQY3zQ@mail.gmail.com>
From:   Pratham Patel <thefirst1322@gmail.com>
Date:   Wed, 25 Oct 2023 07:31:17 +0530
Message-ID: <CAM+6MoFOF3CgP2pgRNcpSFdFtPA1V++JK3WURkFTfZdsR7aadA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     boqun.feng@gmail.com, Jamie.Cunliffe@arm.com, andrew@lunn.ch,
        catalin.marinas@arm.com, lina@asahilina.net,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, sboyd@kernel.org,
        steve.capper@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 Oct 2023 at 20:49, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> > but from a developer's and packager's
> > perspective, this will lead to a few wasted hours until the
> > metaphorical person figures out why said Rust code failed to build for
> > AArch64 BE.
>
> Why would the code fail to build? i.e. as far as I understand, Boqun
> successfully compiled and QEMU-booted a BE image.
>
> If you mean that it could stop compiling at any point because it is
> not officially supported, then note that we pin the compiler, and that
> it also applies to the rest of the code due to other unstable features
> too, which is why we need to get the Rust project to support the
> kernel properly for the use cases we need (not just targets, but also
> features).

Yes, apologies for not clarifying it. I meant exactly that: the code
would stop compiling if either the target was dropped for any reason,
or supporting AArch64 BE would hold back upgrading the compiler for
other architectures. Though, this is from a very high level overview.
If you feel like this won't be an issue, I don't have any problems
with this :)

> Also please note that, even if everything else was formally supported,
> it would still be a good idea to add this support early (possibly with
> a warning or gate or similar if not intended to be used by end users
> yet) so that we have the first big-endian target around.


> > P.S. This is my first time sending an email to a mailing list, sorry
> > if I mucked something up.
>
> The content looks fine :)
>
> However, I think the proper `In-Reply-To` header is not there so Lore
> gets confused -- did you use the suggested parameters at the bottom of
> e.g. [1]?
>
> [1] https://lore.kernel.org/rust-for-linux/CAM+6MoE1DyOay-fMWQP0hsenz174hSuGJnKM7symh0C-y1mqZw@mail.gmail.com/

Yes, I appear to have missed copying the `In-Reply-To` header in this
reply thread. Sorry about that.
