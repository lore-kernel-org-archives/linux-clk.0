Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5078C00A8F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 00:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjJXA6E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 20:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbjJXA6D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 20:58:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EA89B
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 17:58:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B41C433C7;
        Tue, 24 Oct 2023 00:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698109081;
        bh=6xcYy7y/NhN0GuWPyErw35vL5UrTbBr46c5mIqocPA8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Svdatss/wwjjq1Q6LUfIEIaC5eoT9sKpCHtOPta8GwLbSU2r/27AxRFD+inq9HZgH
         YlvuxkpThLkDm/ItAdS0bbyRFGnAMosVGDrjYDNjWqIlhY+W9rB1mfDh1rfj6UZPoR
         xKZvT5vRA/V/t/jwd//fPqDLRPxW2MZ+IznVMH80nrXTUqHpHMvd3IRDnbfwpHc/VR
         yP3V9F0X1+/yrRX3Hb8qVxFyhkumh+XRyQa3xCIm4vPGoA5bJKkv2Trn3IVQVAb671
         F5rZHZVNTgO++aAD/ry4djgsD7btyiaF62OtALfYcAh1DDVnJcp00fMZyV1RFiaJgn
         w1snfnm1YO3vA==
Message-ID: <d9ba6b65f70ff25df92fda4070bb58f8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZTLH5o0GlFBYsAHq@boqun-archlinux>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <20231020155056.3495121-3-Jamie.Cunliffe@arm.com> <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch> <ZTLH5o0GlFBYsAHq@boqun-archlinux>
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Andrew Lunn <andrew@lunn.ch>, Boqun Feng <boqun.feng@gmail.com>
Date:   Mon, 23 Oct 2023 17:57:59 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Boqun Feng (2023-10-20 11:33:10)
> On Fri, Oct 20, 2023 at 07:21:08PM +0200, Andrew Lunn wrote:
> > > +``arm64``     Maintained        Little Endian only.
> >=20
> > This question is just out of curiosity, not the patchset itself.
> >=20
> > What is missing to make big endian work?
> >=20
>=20
> FWIW, I tried the following:
>=20
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
>=20
> +ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> +KBUILD_RUSTFLAGS +=3D --target aarch64_be-unknown-linux-gnu -C target-fe=
ature=3D"-neon"
> +else
>  KBUILD_RUSTFLAGS +=3D --target aarch64-unknown-none -C target-feature=3D=
"-neon"
> +endif
>=20
>  KBUILD_CFLAGS  +=3D $(call cc-option,-mabi=3Dlp64)
>  KBUILD_AFLAGS  +=3D $(call cc-option,-mabi=3Dlp64)
>=20
> and ran the following kunit command (it will run a few tests in a qemu
> emulated VM):
>=20
>         ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch=
 arm64 --kconfig_add CONFIG_RUST=3Dy --kconfig_add CONFIG_CPU_BIG_ENDIAN=3Dy
>=20
> The kernel was built successfully, and all Rust related tests passed.
>=20
> Of course this doesn't mean a lot, we still need people with deep
> Rust compiler knowledge to confirm whether the support is completed or
> not. But I think if people want to do experiments, the tool is there.
>=20
> P.S. An unrelated topic: I found a few clk related tests (in
> drivers/clk/clk-gate_test.c IIUC) don't pass (mostly due to that the
> expected values don't handle big endian), a sample failure output:
>=20
> [11:13:26]     # clk_gate_test_enable: EXPECTATION FAILED at drivers/clk/=
clk-gate_test.c:169
> [11:13:26]     Expected enable_val =3D=3D ctx->fake_reg, but
> [11:13:26]         enable_val =3D=3D 32 (0x20)
> [11:13:26]         ctx->fake_reg =3D=3D 536870912 (0x20000000)
> [11:13:26] clk_unregister: unregistering prepared clock: test_gate
> [11:13:26] clk_unregister: unregistering prepared clock: test_parent
> [11:13:26] [FAILED] clk_gate_test_enable
>=20
> (Cc clk folks)
>=20

Thanks for the report! We should treat it as an __le32 for now. I'll
have to add tests for the big endian flag as well. Does this fix it?

---8<----
diff --git a/drivers/clk/clk-gate_test.c b/drivers/clk/clk-gate_test.c
index e136aaad48bf..c96d93b19ddf 100644
--- a/drivers/clk/clk-gate_test.c
+++ b/drivers/clk/clk-gate_test.c
@@ -131,7 +131,7 @@ struct clk_gate_test_context {
 	void __iomem *fake_mem;
 	struct clk_hw *hw;
 	struct clk_hw *parent;
-	u32 fake_reg; /* Keep at end, KASAN can detect out of bounds */
+	__le32 fake_reg; /* Keep at end, KASAN can detect out of bounds */
 };
=20
 static struct clk_gate_test_context *clk_gate_test_alloc_ctx(struct kunit =
*test)
@@ -166,7 +166,7 @@ static void clk_gate_test_enable(struct kunit *test)
=20
 	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
=20
-	KUNIT_EXPECT_EQ(test, enable_val, ctx->fake_reg);
+	KUNIT_EXPECT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(hw));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_prepared(hw));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(parent));
@@ -183,10 +183,10 @@ static void clk_gate_test_disable(struct kunit *test)
 	u32 disable_val =3D 0;
=20
 	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
-	KUNIT_ASSERT_EQ(test, enable_val, ctx->fake_reg);
+	KUNIT_ASSERT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
=20
 	clk_disable_unprepare(clk);
-	KUNIT_EXPECT_EQ(test, disable_val, ctx->fake_reg);
+	KUNIT_EXPECT_EQ(test, disable_val, le32_to_cpu(ctx->fake_reg));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(hw));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_prepared(hw));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(parent));
@@ -246,7 +246,7 @@ static void clk_gate_test_invert_enable(struct kunit *t=
est)
=20
 	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
=20
-	KUNIT_EXPECT_EQ(test, enable_val, ctx->fake_reg);
+	KUNIT_EXPECT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(hw));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_prepared(hw));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(parent));
@@ -263,10 +263,10 @@ static void clk_gate_test_invert_disable(struct kunit=
 *test)
 	u32 disable_val =3D BIT(15);
=20
 	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
-	KUNIT_ASSERT_EQ(test, enable_val, ctx->fake_reg);
+	KUNIT_ASSERT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
=20
 	clk_disable_unprepare(clk);
-	KUNIT_EXPECT_EQ(test, disable_val, ctx->fake_reg);
+	KUNIT_EXPECT_EQ(test, disable_val, le32_to_cpu(ctx->fake_reg));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(hw));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_prepared(hw));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(parent));
@@ -290,7 +290,7 @@ static int clk_gate_test_invert_init(struct kunit *test)
 					    2000000);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
=20
-	ctx->fake_reg =3D BIT(15); /* Default to off */
+	ctx->fake_reg =3D cpu_to_le32(BIT(15)); /* Default to off */
 	hw =3D clk_hw_register_gate_parent_hw(NULL, "test_gate", parent, 0,
 					    ctx->fake_mem, 15,
 					    CLK_GATE_SET_TO_DISABLE, NULL);
@@ -319,7 +319,7 @@ static void clk_gate_test_hiword_enable(struct kunit *t=
est)
=20
 	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
=20
-	KUNIT_EXPECT_EQ(test, enable_val, ctx->fake_reg);
+	KUNIT_EXPECT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(hw));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_prepared(hw));
 	KUNIT_EXPECT_TRUE(test, clk_hw_is_enabled(parent));
@@ -336,10 +336,10 @@ static void clk_gate_test_hiword_disable(struct kunit=
 *test)
 	u32 disable_val =3D BIT(9 + 16);
=20
 	KUNIT_ASSERT_EQ(test, clk_prepare_enable(clk), 0);
-	KUNIT_ASSERT_EQ(test, enable_val, ctx->fake_reg);
+	KUNIT_ASSERT_EQ(test, enable_val, le32_to_cpu(ctx->fake_reg));
=20
 	clk_disable_unprepare(clk);
-	KUNIT_EXPECT_EQ(test, disable_val, ctx->fake_reg);
+	KUNIT_EXPECT_EQ(test, disable_val, le32_to_cpu(ctx->fake_reg));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(hw));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_prepared(hw));
 	KUNIT_EXPECT_FALSE(test, clk_hw_is_enabled(parent));
@@ -387,7 +387,7 @@ static void clk_gate_test_is_enabled(struct kunit *test)
 	struct clk_gate_test_context *ctx;
=20
 	ctx =3D clk_gate_test_alloc_ctx(test);
-	ctx->fake_reg =3D BIT(7);
+	ctx->fake_reg =3D cpu_to_le32(BIT(7));
 	hw =3D clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 7,
 				  0, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
@@ -402,7 +402,7 @@ static void clk_gate_test_is_disabled(struct kunit *tes=
t)
 	struct clk_gate_test_context *ctx;
=20
 	ctx =3D clk_gate_test_alloc_ctx(test);
-	ctx->fake_reg =3D BIT(4);
+	ctx->fake_reg =3D cpu_to_le32(BIT(4));
 	hw =3D clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 7,
 				  0, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
@@ -417,7 +417,7 @@ static void clk_gate_test_is_enabled_inverted(struct ku=
nit *test)
 	struct clk_gate_test_context *ctx;
=20
 	ctx =3D clk_gate_test_alloc_ctx(test);
-	ctx->fake_reg =3D BIT(31);
+	ctx->fake_reg =3D cpu_to_le32(BIT(31));
 	hw =3D clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 2,
 				  CLK_GATE_SET_TO_DISABLE, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
@@ -432,7 +432,7 @@ static void clk_gate_test_is_disabled_inverted(struct k=
unit *test)
 	struct clk_gate_test_context *ctx;
=20
 	ctx =3D clk_gate_test_alloc_ctx(test);
-	ctx->fake_reg =3D BIT(29);
+	ctx->fake_reg =3D cpu_to_le32(BIT(29));
 	hw =3D clk_hw_register_gate(NULL, "test_gate", NULL, 0, ctx->fake_mem, 29,
 				  CLK_GATE_SET_TO_DISABLE, NULL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
