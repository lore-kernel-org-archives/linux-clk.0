Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1164EC27C46
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 15:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343765AbjJXPXN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 11:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343769AbjJXPWo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 11:22:44 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3511B19B4;
        Tue, 24 Oct 2023 08:19:34 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a7a80a96dbso46292157b3.0;
        Tue, 24 Oct 2023 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698160774; x=1698765574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se2flEy1odRQEOyO7azgGeUowuD+rL3cXR3aXywEh3c=;
        b=RNbrf33WCAwZ+8mo6FliZEVBuV/miIoLs/LeZOSt1u05QHNXSoa5/W2xSUTrDCFZYB
         hfmraXQIQOfSa2esBWgrfyAI1ACcG+GD6XyYEIgL5Qjle8fka7XtBVoRFqmrwg2EShRp
         UasAzqukluQm42zwrJlBrTiFiW+zmArr8DiIuIwnzfKxv1qUdZcttL2Sm6jthNbioQ4O
         fJOUkb4GY7nNgMyJdzcWfUesotbUDqkaqCgc2jmVuS3rCXbYniQSL0L/caKWpouRyRH0
         AbOtAOOIbATB+ojh7X23q21qNIo4BHQM5Ve1cnxtyzwjMQAdB7HV7oMoINz5689Oxjir
         hOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698160774; x=1698765574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Se2flEy1odRQEOyO7azgGeUowuD+rL3cXR3aXywEh3c=;
        b=i2CKXjOvkcvOJwQU07UhOKjk7LV8LeWeGQ0gTP3ga7t6/JRdOocJja2itYz5xLm9sN
         dzoH3VEKpuGBAiJ+mQRCX6vXdZMdx7nGfxLHC69nAEQJwiEIU/upCr0IsL9T2bJIYGp1
         /sur/U/gehOpYY3ZWg3fofKRb9iJsaKB4Ma6/F7NDF+sqUXDy5HvFP8LHXIoLv2p3h/5
         zktyBkUAqkITsMVUR0quwVMENS0Psxa5xdX4aJBJlVkRrRwEYLJENIob9lG1IL1hRVnc
         28VfmfTwPkg5HTZle8PTwn2T9EuYmAJKqULkSoXXrDkwg8kG6mml1YxgAW1Cia9ZmRed
         vHIw==
X-Gm-Message-State: AOJu0YxQhYDdIhnmXbwJzGwKdKBBDo/0zd11/3yaHjPR7kYVchvv3xMv
        060rhESLmZN2bHlEIfF7vLoa3YzlFuMSRBuegfwwEwjVK0c/bA==
X-Google-Smtp-Source: AGHT+IEAxsj19P2vVAjwasqGHSMNvXTaA8KgEPHIp4DN6X2moMi49ivpFTHHTNOnZAaBFvgbO/aNpTrjrHR07I8/Fwk=
X-Received: by 2002:a05:690c:d83:b0:5a7:b545:dcaa with SMTP id
 da3-20020a05690c0d8300b005a7b545dcaamr15942777ywb.23.1698160773826; Tue, 24
 Oct 2023 08:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAM+6MoE1DyOay-fMWQP0hsenz174hSuGJnKM7symh0C-y1mqZw@mail.gmail.com>
In-Reply-To: <CAM+6MoE1DyOay-fMWQP0hsenz174hSuGJnKM7symh0C-y1mqZw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 24 Oct 2023 17:19:22 +0200
Message-ID: <CANiq72=LGW-7qMSFKs7ZLOfOGfJKJthR8nd06j-zfqSpZQY3zQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To:     Pratham Patel <thefirst1322@gmail.com>
Cc:     boqun.feng@gmail.com, Jamie.Cunliffe@arm.com, andrew@lunn.ch,
        catalin.marinas@arm.com, lina@asahilina.net,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, sboyd@kernel.org,
        steve.capper@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 24, 2023 at 4:18=E2=80=AFPM Pratham Patel <thefirst1322@gmail.c=
om> wrote:
>
> This comes from a nobody (quite literally my first email on the kernel
> mailing list), but I would rather that the support for AArch64 BE be
> not added at all. My reasoning for this is because the rustc target
> `aarch64_be-unknown-linux-gnu` is in the tier 3 of support.

We are aware of the tier list support, but please note that e.g. for
x86, we are not even using one of the built-in targets (for the moment
at least), and that we use a range of other unstable features. It is
under discussion between the two projects how these details will be
properly supported.

> but from a developer's and packager's
> perspective, this will lead to a few wasted hours until the
> metaphorical person figures out why said Rust code failed to build for
> AArch64 BE.

Why would the code fail to build? i.e. as far as I understand, Boqun
successfully compiled and QEMU-booted a BE image.

If you mean that it could stop compiling at any point because it is
not officially supported, then note that we pin the compiler, and that
it also applies to the rest of the code due to other unstable features
too, which is why we need to get the Rust project to support the
kernel properly for the use cases we need (not just targets, but also
features).

Also please note that, even if everything else was formally supported,
it would still be a good idea to add this support early (possibly with
a warning or gate or similar if not intended to be used by end users
yet) so that we have the first big-endian target around.

> P.S. This is my first time sending an email to a mailing list, sorry
> if I mucked something up.

The content looks fine :)

However, I think the proper `In-Reply-To` header is not there so Lore
gets confused -- did you use the suggested parameters at the bottom of
e.g. [1]?

[1] https://lore.kernel.org/rust-for-linux/CAM+6MoE1DyOay-fMWQP0hsenz174hSu=
GJnKM7symh0C-y1mqZw@mail.gmail.com/

Cheers,
Miguel
