Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C5FC77B73
	for <linux-clk@archiver.kernel.org>; Mon,  1 May 2023 21:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbjEAVfK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 May 2023 17:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjEAVfJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 May 2023 17:35:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A24CE5A
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 14:35:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C182C61944
        for <linux-clk@vger.kernel.org>; Mon,  1 May 2023 21:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3932C433EF;
        Mon,  1 May 2023 21:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682976907;
        bh=XnqhpFr6fnfhNPWyqQmtX3kBqxpEOgAFxsVlBRWbBPI=;
        h=From:Date:Subject:To:Cc:From;
        b=ZnOCr8fDXckc608qZzHYTAP81OsjQwPHx+kpYeRnbO8GwTsX4Mmp7thkxDQT7ktCz
         sXF4pS3skljGbgDEev83h1qbNEWAS7aALi2k1nfXkODnAoYd0qjj523FtoCOBq718w
         ovnGQ/wVI9ORmB17jnlCrKCT02P6nHKdBPkBUL7X6naonavE4pAE75FXGB1qObvEeO
         ZEAy4/RriaOmbCXzlzExr9M9LpuwtK5X3YmNZ4dEsq8mUSYDaJc0ggeeS+7Bk7Q6Un
         CsAz+bosOgwr2MkhL53MVah59NCUvMrPNHeqsThrYPlHmE7IAnZS1C73R1M0ZmF6zC
         eSJaY6LgYb7Aw==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Mon, 01 May 2023 14:34:47 -0700
Subject: [PATCH] clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230501-sp7021-field_prep-warning-v1-1-5b36d71feefe@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHYwUGQC/x2NUQrCQAwFr1LybWB3i1S8ioik7ds2oGtJRIXSu
 7v1c3jMvJUcpnA6NysZ3ur6LBXioaFhljKBdaxMKaQ2HENkX7qQImfFfbwthoU/YkXLxCm1OXY
 CyAlU/V4c3JuUYd4LD/EXbB+qlfX7P71ct+0H5eGNcoQAAAA=
To:     qinjian@cqplus1.com, mturquette@baylibre.com, sboyd@kernel.org
Cc:     ndesaulniers@google.com, trix@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        llvm@lists.linux.dev, patches@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2913; i=nathan@kernel.org;
 h=from:subject:message-id; bh=XnqhpFr6fnfhNPWyqQmtX3kBqxpEOgAFxsVlBRWbBPI=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCkBBl0x325mvvvMZK8y1diE+9rvAO2KpJkn+Xfe+3mPh
 e9v6587HaUsDGIcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiczsZ/jtkKxpPiBOQYLl7
 gEmbzfxfSkTYD+nfdzYtZ7t3OVrtwRyG/2XqGcHPXafO1rZdx6N4oCj9yj2tLNMH+9d0rDusPCd
 LgRkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When building with clang + W=1, there is a warning around an internal
comparison check within the FIELD_PREP() macro, due to a 32-bit variable
comparison against ~0ull:

  drivers/clk/clk-sp7021.c:316:8: error: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((_m), ...' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
          r0 |= HWM_FIELD_PREP(MASK_SEL_FRA, clk->p[SEL_FRA]);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/clk/clk-sp7021.c:45:15: note: expanded from macro 'HWM_FIELD_PREP'
          (_m << 16) | FIELD_PREP(_m, value);     \
                       ^~~~~~~~~~~~~~~~~~~~~
  include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
                  __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  include/linux/bitfield.h:71:53: note: expanded from macro '__BF_FIELD_CHECK'
                  BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
  note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
  include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
          _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
          ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
          __compiletime_assert(condition, msg, prefix, suffix)
          ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
                  if (!(condition))                                       \
                        ^~~~~~~~~

This is expected given the tyoes of the input. Increase the size of the
temporary variable in HWM_FIELD_PREP() to eliminate the warning, which
follows the logic of commit cfd6fb45cfaf ("crypto: ccree - avoid
out-of-range warnings from clang") for the same reasons.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/clk-sp7021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 8fec14120105..11d22043ddd7 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -41,7 +41,7 @@ enum {
 /* HIWORD_MASK FIELD_PREP */
 #define HWM_FIELD_PREP(mask, value)		\
 ({						\
-	u32 _m = mask;				\
+	u64 _m = mask;				\
 	(_m << 16) | FIELD_PREP(_m, value);	\
 })
 

---
base-commit: d54c1fd4a51e8fbc7f9da86b0cd338a4f7cd2bb2
change-id: 20230501-sp7021-field_prep-warning-223f17aeea8e

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

