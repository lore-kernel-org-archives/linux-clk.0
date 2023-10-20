Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D07BC0032E
	for <linux-clk@archiver.kernel.org>; Fri, 20 Oct 2023 18:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjJTSdo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Oct 2023 14:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjJTSdn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Oct 2023 14:33:43 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7FE112;
        Fri, 20 Oct 2023 11:33:41 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-773ac11de71so68800685a.2;
        Fri, 20 Oct 2023 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697826820; x=1698431620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cj7GMM7RLClKlHfnFK4kXZdb0+sWcPsNsBicOEASd0=;
        b=R4oRhXURwnS6CU+VLy/BcaiF6g3LxARtkKj62HmXlLF6xitosKSbgE5OYe2Ac68Vpk
         gEJyE4agUdMEOXK0AIAhz41wBjpYk+tcj4eSvDrvmIzNwhrpAzC21RBRUH2xXG2K/+8i
         cmcquuPD4OU8jvMKRRMTMOdw/FBCwYGp82DATWw8oU5JsxhHDusWNmYruKAK6ks/4Die
         K/YZRQZt7x03RFXsn0rpOw1AUltlfXykgJOQtzws5M0q0ni/NiHGlycsNu4vQtL+nJHF
         rOprgOci4FloEr6O0Yr6hITUDwq77bH5cWW3IdkxqDb32AGpUPFmSLaaUvYVheR7OOej
         CeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697826820; x=1698431620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cj7GMM7RLClKlHfnFK4kXZdb0+sWcPsNsBicOEASd0=;
        b=MSxRwtI4aD3ZpRNc1wC3CIgbc7Q7bR8zjKVsVw4nwelUTZjwBSucrIvkUxQ9ctbf3i
         n7XGLlc8xqSF/GGaObYLQDPgGpPnQneEfUeYoNOn8Oy7T8acUOC/OPCC6d99kRMHqkij
         Hcygjx1MntRjBU8kp1IsxX2d3cSezGVWioacSvF+t7kANPdI+MmqQpKwerK5kYnVz2yI
         8b4Ls9mkdJFar6q1K0MvmjnYMHVE1bNywV9x7PANJk+KnzPmo6wYQD4/o7nh++BtNwPO
         Kp1OJm7H8kNGcAQKY3Jdel6mY/7jP7ck1QPl7Bx9qH7S/NjJFc7HCH/6yOB15gR23mgE
         6GLA==
X-Gm-Message-State: AOJu0YwovQiQMTu0wJN9KH29hkDRrf9FCfd8oXEa7dORyv6qCJ0OJhEG
        9mNFvZPoXbaSVB2FlX6LIek=
X-Google-Smtp-Source: AGHT+IHmKRqg3V73KQWHnpwBwu3Z6Fm3ew8wL9QAJvTqJVm2nI/O6b3sx8HX+C8Hm6WnPkMj+GgV5Q==
X-Received: by 2002:a05:6214:2aa6:b0:64f:92af:9080 with SMTP id js6-20020a0562142aa600b0064f92af9080mr2653671qvb.21.1697826820229;
        Fri, 20 Oct 2023 11:33:40 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id w5-20020a0cf705000000b0066d1d2242desm873943qvn.120.2023.10.20.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 11:33:39 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailauth.nyi.internal (Postfix) with ESMTP id 4DC6427C0054;
        Fri, 20 Oct 2023 14:33:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 20 Oct 2023 14:33:39 -0400
X-ME-Sender: <xms:AsgyZRSpz_AH4GXHxtUSO2JBN3y0SkdeoHGoUW4iDhC4FMfxqxQGrQ>
    <xme:AsgyZawRuZglCBTfaYRZurhos9I1x0UpZHNQeEE2Ew1qBfRnqj3KvF-j1UXDkZlaQ
    QD8iaX94k04zBRJwQ>
X-ME-Received: <xmr:AsgyZW1mnbaNP4BmBZCH9zpP6TxbpO3sHVQSfYiMTLPXLcFOwYS3DETgm9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjeekgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:AsgyZZD2aWLPHM0PjXNMq7FTIc3f8kNJ8F0FY1z5UxLONGNSOtTnzA>
    <xmx:AsgyZagfp4Pr9vSVdSIjIjSALlIZTNxd-_19K58j0Tliw-xd36V1TA>
    <xmx:AsgyZdoGYJTsTvuMVyTStA4cwQJbe1A25H71KnP5cNXW7FadUIWxRQ>
    <xmx:A8gyZRqEzYXmGV_T7_cxArXELzictf37Ty3H1E_Br0a0AJCN_jBzXA>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Oct 2023 14:33:38 -0400 (EDT)
Date:   Fri, 20 Oct 2023 11:33:10 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZTLH5o0GlFBYsAHq@boqun-archlinux>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 20, 2023 at 07:21:08PM +0200, Andrew Lunn wrote:
> > +``arm64``     Maintained        Little Endian only.
> 
> This question is just out of curiosity, not the patchset itself.
> 
> What is missing to make big endian work?
> 

FWIW, I tried the following:

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 8784284988e5..b697c2d7da68 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -227,7 +227,7 @@ config ARM64
        select HAVE_FUNCTION_ARG_ACCESS_API
        select MMU_GATHER_RCU_TABLE_FREE
        select HAVE_RSEQ
-       select HAVE_RUST if CPU_LITTLE_ENDIAN
+       select HAVE_RUST
        select HAVE_STACKPROTECTOR
        select HAVE_SYSCALL_TRACEPOINTS
        select HAVE_KPROBES
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 4562a8173e90..4621f1e00e06 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -41,7 +41,11 @@ KBUILD_CFLAGS        += -mgeneral-regs-only  \
 KBUILD_CFLAGS  += $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS  += $(compat_vdso)

+ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
+KBUILD_RUSTFLAGS += --target aarch64_be-unknown-linux-gnu -C target-feature="-neon"
+else
 KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon"
+endif

 KBUILD_CFLAGS  += $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS  += $(call cc-option,-mabi=lp64)

and ran the following kunit command (it will run a few tests in a qemu
emulated VM):

	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch arm64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_CPU_BIG_ENDIAN=y

The kernel was built successfully, and all Rust related tests passed.

Of course this doesn't mean a lot, we still need people with deep
Rust compiler knowledge to confirm whether the support is completed or
not. But I think if people want to do experiments, the tool is there.

P.S. An unrelated topic: I found a few clk related tests (in
drivers/clk/clk-gate_test.c IIUC) don't pass (mostly due to that the
expected values don't handle big endian), a sample failure output:

[11:13:26]     # clk_gate_test_enable: EXPECTATION FAILED at drivers/clk/clk-gate_test.c:169
[11:13:26]     Expected enable_val == ctx->fake_reg, but
[11:13:26]         enable_val == 32 (0x20)
[11:13:26]         ctx->fake_reg == 536870912 (0x20000000)
[11:13:26] clk_unregister: unregistering prepared clock: test_gate
[11:13:26] clk_unregister: unregistering prepared clock: test_parent
[11:13:26] [FAILED] clk_gate_test_enable

(Cc clk folks)

Regards,
Boqun

> Network developers have expressed an interesting in testing Rust code
> on big endian systems, since the code should work on both endians. It
> might be easier to get an ARM board running big endian than get access
> to an S390x machine.
> 
>       Andrew
