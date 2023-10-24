Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534A6C00A8F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 14:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234675AbjJXOSV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 10:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234567AbjJXOSV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 10:18:21 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C7F7C4;
        Tue, 24 Oct 2023 07:18:18 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9be02fcf268so661954666b.3;
        Tue, 24 Oct 2023 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698157097; x=1698761897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2PK1fU8QWuwhD6iIY5Em92nwMiyyUjXYffcjg6qNGA=;
        b=LhSTlCJLitHnBYmOH79Q1bEk63DIg8DPmf4NeJD+mTr2MV79+L/9ENzUDh/N0QUDWA
         v2O8N0c1lCH1XduMXtsJHAaw5QOkMLNTE5zLCdMKOo73xyxznBozRBKMJO3h9lQKzTeJ
         DZevPU1jKwlkykGoDbCKPK+NNK+vSIhHqI78Xecsw51B1edhBSUKzaxp+Csj4jT1pXB8
         XHRsm7ISisDKoxn1a9EjsU8mRZVYoSkuaNAMFKgWRgXZ2fPkxz5/y7aN3crE0KQVI6Y+
         QKCTP7RJo3gGtXfuNECLvjGytALzOx93PUOUlXF2sUuSWTQLZY096H5ZFd5d2ryPhjRb
         +yaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157097; x=1698761897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2PK1fU8QWuwhD6iIY5Em92nwMiyyUjXYffcjg6qNGA=;
        b=uJ0VOgQhJtD3CsKx5NYzFfAEeCWIsvFL/KVM4goOm1wNoFEBSD6xLbzXBVT2M8Pctc
         qCwGZbELWQS+TyK3BfVLHMQLDwiwbmuOoge3MqSr/x3c2kX6ub8ahvQWEFQLpSLthIvR
         rLxBlGU5TVe4xccpK6M4U2RPyI4OlfDjEesBR67dWjp5hjfE+X/3NrdvG4OULhZUgLJq
         qASKDWrKasqdE8Z90chRgvTvlQ5a/Euy96QvtkIl/qgjRqSPXQ6vBzOfu5IKCVQbt8wS
         9JHqhCYunmtgt5f5OsS0mDAVJeV8gUZfBCH3RM+DLCEpgyYK3sUaF17GetzpKvfYYYof
         wtUw==
X-Gm-Message-State: AOJu0YyZbHegvGwNmtYwyHDyRSvnPN29HU9wh2WcxgeopFfiMFzLH3Eq
        SKNUvMF+8cJlHvvVXPMUPyQeTtAFBNWGFi9ghANz0/4ltk1T
X-Google-Smtp-Source: AGHT+IGBMOD8/0GagH9LdaLzB0aYbQMv1yqCrUSOzjESFzYdKqb3PjjAOJSYq92IFXqOfZ821NgeGfxdi6UgMT69VIg=
X-Received: by 2002:a17:906:6a13:b0:9ae:74d1:4b45 with SMTP id
 qw19-20020a1709066a1300b009ae74d14b45mr10412646ejc.65.1698157096776; Tue, 24
 Oct 2023 07:18:16 -0700 (PDT)
MIME-Version: 1.0
From:   Pratham Patel <thefirst1322@gmail.com>
Date:   Tue, 24 Oct 2023 19:47:40 +0530
Message-ID: <CAM+6MoE1DyOay-fMWQP0hsenz174hSuGJnKM7symh0C-y1mqZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
To:     boqun.feng@gmail.com
Cc:     Jamie.Cunliffe@arm.com, andrew@lunn.ch, catalin.marinas@arm.com,
        lina@asahilina.net, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        ojeda@kernel.org, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
        steve.capper@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 20 Oct 2023 11:33:10 -0700, Boqun Feng wrote:
> FWIW, I tried the following:
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 8784284988e5..b697c2d7da68 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -227,7 +227,7 @@ config ARM64
>         select HAVE_FUNCTION_ARG_ACCESS_API
>         select MMU_GATHER_RCU_TABLE_FREE
>         select HAVE_RSEQ
> -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> +       select HAVE_RUST
>         select HAVE_STACKPROTECTOR
>         select HAVE_SYSCALL_TRACEPOINTS
>         select HAVE_KPROBES
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 4562a8173e90..4621f1e00e06 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,7 +41,11 @@ KBUILD_CFLAGS        +=3D -mgeneral-regs-only  \
>  KBUILD_CFLAGS  +=3D $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS  +=3D $(compat_vdso)
>
> +ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> +KBUILD_RUSTFLAGS +=3D --target aarch64_be-unknown-linux-gnu -C target-fe=
ature=3D"-neon"
> +else
>  KBUILD_RUSTFLAGS +=3D --target aarch64-unknown-none -C target-feature=3D=
"-neon"
> +endif
>
>  KBUILD_CFLAGS  +=3D $(call cc-option,-mabi=3Dlp64)
>  KBUILD_AFLAGS  +=3D $(call cc-option,-mabi=3Dlp64)
>

This comes from a nobody (quite literally my first email on the kernel
mailing list), but I would rather that the support for AArch64 BE be
not added at all. My reasoning for this is because the rustc target
`aarch64_be-unknown-linux-gnu` is in the tier 3 of support. More
details can be found in the official documentation [0], but a few,
**select** key points from that section:

> At this tier, the Rust project provides no official support for a target,=
 so we place minimal requirements on the introduction of targets.

> Tier 3 targets should attempt to implement as much of the standard librar=
ies as possible and appropriate (core for most targets, alloc for targets t=
hat can support dynamic memory allocation, std for targets with an operatin=
g system or equivalent layer of system-provided functionality), but may lea=
ve some code unimplemented (either unavailable or stubbed out as appropriat=
e), whether because the target makes it impossible to implement or challeng=
ing to implement. The authors of pull requests are not obligated to avoid c=
alling any portions of the standard library on the basis of a tier 3 target=
 not implementing those portions.

I am not an owner of any AArch64 BE machines, but if I were, this
would be concerning to _me_. I would prefer waiting for the Rust side
to be a bit more stable, at least in tier 2 support, for adding
AArch64 BE support. Though from the user of the Linux kernel, it may
not be that much of an issue, but from a developer's and packager's
perspective, this will lead to a few wasted hours until the
metaphorical person figures out why said Rust code failed to build for
AArch64 BE.

[0]: https://doc.rust-lang.org/rustc/target-tier-policy.html#tier-3-target-=
policy

P.S. This is my first time sending an email to a mailing list, sorry
if I mucked something up.
