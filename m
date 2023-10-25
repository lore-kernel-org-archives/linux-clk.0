Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429D6C0032E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 23:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjJYX4P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 19:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjJYX4O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 19:56:14 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3D9A1;
        Wed, 25 Oct 2023 16:56:11 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b2f4a5ccebso172645b6e.3;
        Wed, 25 Oct 2023 16:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698278171; x=1698882971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCPsj7fyW7cdUIN4eSZhDWRggpAaPFIYCKf+PzDUNuE=;
        b=b9NJ+QB3i8SEPSx89TF37EgvIoUQuPqZ39NRv2B9rKC96B93FOp9WtUk0F2CGQYRGz
         XI06ULuSl1ukRNt7l5I+fXEwKXg8dNRjzuzIt3l7tnWm5z4T6liQX/mw+LXXmOZkrfUY
         PVUWrDl7Gq/P8M4qf0Fhzb9y/9h50Af5vtJiAhjDovF+hUCtNC7RRJ2O56A2uCgceb/z
         I9tsiV3xwvJ9lhVXeDU2+KsAI7a14YL9aEe8hEKC6t9DeIyF4JVf2hWoQOckJu1v5R99
         iS26Q+anBI9JEHJp8kCgqXM31aAoyFJd2+ykh0bLzQ+IXpF1NZvH+tXOuUMMuTt8YPa3
         95VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698278171; x=1698882971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCPsj7fyW7cdUIN4eSZhDWRggpAaPFIYCKf+PzDUNuE=;
        b=VdqkAy6ICRq98MEnshGKsGRT1k3tXiMrPE/1Uvc52TX1flgW76hIdwXSbJvlqE7uUc
         c3sdH4doKuA6TZMb39C+ebfjY41C/iNrNu27MkojxPNU7zr3Kph/+TKQ0cBXnbdFz3Z3
         H9u6C5fF/QW+6TXPi74DtqJQkn1rFPEAAfL+oDuFs+lsm2YIa/Tl4fWRTkkt9lPr8d9d
         kl2HN7YiXGxlKSx1jWDCtiFsHzdXGFOLoJK4dRc8LAvjivaobfncmbx7UZ97CDy/esf0
         Fa0UDkZ5zSmPV+hLdOLCagvPqtxbVWWZ6/v/ULXPLZNaD5jM9VeO0IhMsPzlMFaBmzIY
         cvhw==
X-Gm-Message-State: AOJu0Yy6qM2ffL+9BeuJAYiK7yu8ctxxwQIJbngBRbvjYMDZrPGZri9C
        3/TBiZRJYNghwHywmEBo3HM=
X-Google-Smtp-Source: AGHT+IF3K/dDOlkYh5+RBt3Un4gpXBStldhTWHFOIVAffjFVTYRPSTvqpO2GZLzH6h8zqS1S6fl9MA==
X-Received: by 2002:a05:6808:a1b:b0:3a4:225f:a15b with SMTP id n27-20020a0568080a1b00b003a4225fa15bmr17127376oij.31.1698278170843;
        Wed, 25 Oct 2023 16:56:10 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id ch20-20020a0569020b1400b00da086d6921fsm670445ybb.50.2023.10.25.16.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 16:56:10 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailauth.nyi.internal (Postfix) with ESMTP id 828B927C0054;
        Wed, 25 Oct 2023 19:56:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 25 Oct 2023 19:56:08 -0400
X-ME-Sender: <xms:F6s5Ze5WXbuzfvVQy0YEC8I-yd5q8fu1dpceYzWrD-k-LfjMRZG7-g>
    <xme:F6s5ZX7zNXJ4AJ6rA4VgOWCm55U1j4n6TuN_KbcS7qXex_Tx1iJgEonuVqiZ29JJP
    tRWPXBzOyL3epSYuA>
X-ME-Received: <xmr:F6s5Zdc4RM3w4pl9GU_aO3Mn30zhPoA5SS_UFTiYepT1NdDNtmQogNIbugw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledugddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudff
    iedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:F6s5ZbLJNM61Jcn98elyGMnClFZNn19fbYD_aRm0vzWxJQgCqt_Ybw>
    <xmx:F6s5ZSKRC8IXm3vgO7X6bME735BaobO_6dJzrD_FC7u9q8fhUGUT_g>
    <xmx:F6s5Zczzj8uTvyi8ynEFeqbsC8e6xvAifIUB641fteABbP9dXi1KSg>
    <xmx:GKs5ZYyRegY8OI3MGjHTAfTLsUoSKuGUkDcXSLOFsNekF9lZgJOdGQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Oct 2023 19:56:07 -0400 (EDT)
Date:   Wed, 25 Oct 2023 16:55:23 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZTmq67IEI42_tPoY@boqun-archlinux>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
 <d9ba6b65f70ff25df92fda4070bb58f8.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9ba6b65f70ff25df92fda4070bb58f8.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 23, 2023 at 05:57:59PM -0700, Stephen Boyd wrote:
> Quoting Boqun Feng (2023-10-20 11:33:10)
> > On Fri, Oct 20, 2023 at 07:21:08PM +0200, Andrew Lunn wrote:
> > > > +``arm64``     Maintained        Little Endian only.
> > > 
> > > This question is just out of curiosity, not the patchset itself.
> > > 
> > > What is missing to make big endian work?
> > > 
> > 
> > FWIW, I tried the following:
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 8784284988e5..b697c2d7da68 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -227,7 +227,7 @@ config ARM64
> >         select HAVE_FUNCTION_ARG_ACCESS_API
> >         select MMU_GATHER_RCU_TABLE_FREE
> >         select HAVE_RSEQ
> > -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> > +       select HAVE_RUST
> >         select HAVE_STACKPROTECTOR
> >         select HAVE_SYSCALL_TRACEPOINTS
> >         select HAVE_KPROBES
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index 4562a8173e90..4621f1e00e06 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -41,7 +41,11 @@ KBUILD_CFLAGS        += -mgeneral-regs-only  \
> >  KBUILD_CFLAGS  += $(call cc-disable-warning, psabi)
> >  KBUILD_AFLAGS  += $(compat_vdso)
> > 
> > +ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> > +KBUILD_RUSTFLAGS += --target aarch64_be-unknown-linux-gnu -C target-feature="-neon"
> > +else
> >  KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon"
> > +endif
> > 
> >  KBUILD_CFLAGS  += $(call cc-option,-mabi=lp64)
> >  KBUILD_AFLAGS  += $(call cc-option,-mabi=lp64)
> > 
> > and ran the following kunit command (it will run a few tests in a qemu
> > emulated VM):
> > 
> >         ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch arm64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_CPU_BIG_ENDIAN=y
> > 
> > The kernel was built successfully, and all Rust related tests passed.
> > 
> > Of course this doesn't mean a lot, we still need people with deep
> > Rust compiler knowledge to confirm whether the support is completed or
> > not. But I think if people want to do experiments, the tool is there.
> > 
> > P.S. An unrelated topic: I found a few clk related tests (in
> > drivers/clk/clk-gate_test.c IIUC) don't pass (mostly due to that the
> > expected values don't handle big endian), a sample failure output:
> > 
> > [11:13:26]     # clk_gate_test_enable: EXPECTATION FAILED at drivers/clk/clk-gate_test.c:169
> > [11:13:26]     Expected enable_val == ctx->fake_reg, but
> > [11:13:26]         enable_val == 32 (0x20)
> > [11:13:26]         ctx->fake_reg == 536870912 (0x20000000)
> > [11:13:26] clk_unregister: unregistering prepared clock: test_gate
> > [11:13:26] clk_unregister: unregistering prepared clock: test_parent
> > [11:13:26] [FAILED] clk_gate_test_enable
> > 
> > (Cc clk folks)
> > 
> 
> Thanks for the report! We should treat it as an __le32 for now. I'll
> have to add tests for the big endian flag as well. Does this fix it?

Yep! I just tested with kunit, and all the tests pass.

Feel free to add:

Tested-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> 
> ---8<----
> diff --git a/drivers/clk/clk-gate_test.c b/drivers/clk/clk-gate_test.c
> index e136aaad48bf..c96d93b19ddf 100644
> --- a/drivers/clk/clk-gate_test.c
> +++ b/drivers/clk/clk-gate_test.c
> @@ -131,7 +131,7 @@ struct clk_gate_test_context {
>  	void __iomem *fake_mem;
>  	struct clk_hw *hw;
>  	struct clk_hw *parent;
> -	u32 fake_reg; /* Keep at end, KASAN can detect out of bounds */
> +	__le32 fake_reg; /* Keep at end, KASAN can detect out of bounds */
>  };
>  
>  static struct clk_gate_test_context *clk_gate_test_alloc_ctx(struct kunit *test)
> @@ -166,7 +166,7 @@ static void clk_gate_test_enable(struct kunit *test)
>  
>  	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
>  
> -	KUNIT_EXPECT_EQ(test, enable_val, ctx->fake_reg);
> +	KUNIT_EXPECT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(hw));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_prepared(hw));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(parent));
> @@ -183,10 +183,10 @@ static void clk_gate_test_disable(struct kunit *test)
>  	u32 disable_val = 0;
>  
>  	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
> -	KUNIT_ASSERT_EQ(test, enable_val, ctx->fake_reg);
> +	KUNIT_ASSERT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
>  
>  	clk_disable_unprepare(clk);
> -	KUNIT_EXPECT_EQ(test, disable_val, ctx->fake_reg);
> +	KUNIT_EXPECT_EQ(test, disable_val, le32_to_cpu(ctx->fake_reg));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(hw));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_prepared(hw));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(parent));
> @@ -246,7 +246,7 @@ static void clk_gate_test_invert_enable(struct kunit *test)
>  
>  	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
>  
> -	KUNIT_EXPECT_EQ(test, enable_val, ctx->fake_reg);
> +	KUNIT_EXPECT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(hw));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_prepared(hw));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(parent));
> @@ -263,10 +263,10 @@ static void clk_gate_test_invert_disable(struct kunit *test)
>  	u32 disable_val = BIT(15);
>  
>  	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
> -	KUNIT_ASSERT_EQ(test, enable_val, ctx->fake_reg);
> +	KUNIT_ASSERT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
>  
>  	clk_disable_unprepare(clk);
> -	KUNIT_EXPECT_EQ(test, disable_val, ctx->fake_reg);
> +	KUNIT_EXPECT_EQ(test, disable_val, le32_to_cpu(ctx->fake_reg));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(hw));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_prepared(hw));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(parent));
> @@ -290,7 +290,7 @@ static int clk_gate_test_invert_init(struct kunit *test)
>  					    2000000);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
>  
> -	ctx->fake_reg = BIT(15); /* Default to off */
> +	ctx->fake_reg = cpu_to_le32(BIT(15)); /* Default to off */
>  	hw = clk_hw_register_gate_parent_hw(NULL, "test_gate", parent, 0,
>  					    ctx->fake_mem, 15,
>  					    CLK_GATE_SET_TO_DISABLE, NULL);
> @@ -319,7 +319,7 @@ static void clk_gate_test_hiword_enable(struct kunit *test)
>  
>  	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
>  
> -	KUNIT_EXPECT_EQ(test, enable_val, ctx->fake_reg);
> +	KUNIT_EXPECT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(hw));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_prepared(hw));
>  	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(parent));
> @@ -336,10 +336,10 @@ static void clk_gate_test_hiword_disable(struct kunit *test)
>  	u32 disable_val = BIT(9 + 16);
>  
>  	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
> -	KUNIT_ASSERT_EQ(test, enable_val, ctx->fake_reg);
> +	KUNIT_ASSERT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
>  
>  	clk_disable_unprepare(clk);
> -	KUNIT_EXPECT_EQ(test, disable_val, ctx->fake_reg);
> +	KUNIT_EXPECT_EQ(test, disable_val, le32_to_cpu(ctx->fake_reg));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(hw));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_prepared(hw));
>  	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(parent));
> @@ -387,7 +387,7 @@ static void clk_gate_test_is_enabled(struct kunit *test)
>  	struct clk_gate_test_context *ctx;
>  
>  	ctx = clk_gate_test_alloc_ctx(test);
> -	ctx->fake_reg = BIT(7);
> +	ctx->fake_reg = cpu_to_le32(BIT(7));
>  	hw = clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 7,
>  				  0, NULL);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> @@ -402,7 +402,7 @@ static void clk_gate_test_is_disabled(struct kunit *test)
>  	struct clk_gate_test_context *ctx;
>  
>  	ctx = clk_gate_test_alloc_ctx(test);
> -	ctx->fake_reg = BIT(4);
> +	ctx->fake_reg = cpu_to_le32(BIT(4));
>  	hw = clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 7,
>  				  0, NULL);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> @@ -417,7 +417,7 @@ static void clk_gate_test_is_enabled_inverted(struct kunit *test)
>  	struct clk_gate_test_context *ctx;
>  
>  	ctx = clk_gate_test_alloc_ctx(test);
> -	ctx->fake_reg = BIT(31);
> +	ctx->fake_reg = cpu_to_le32(BIT(31));
>  	hw = clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 2,
>  				  CLK_GATE_SET_TO_DISABLE, NULL);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> @@ -432,7 +432,7 @@ static void clk_gate_test_is_disabled_inverted(struct kunit *test)
>  	struct clk_gate_test_context *ctx;
>  
>  	ctx = clk_gate_test_alloc_ctx(test);
> -	ctx->fake_reg = BIT(29);
> +	ctx->fake_reg = cpu_to_le32(BIT(29));
>  	hw = clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 29,
>  				  CLK_GATE_SET_TO_DISABLE, NULL);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> 
