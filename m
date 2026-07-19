Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE530DEB2
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784497436; cv=none; b=E7wpBzd6raBvke48Oe1LBx6kInjgrUXcUFSQnTXGGKJeyBNTu3K6OxUTfITH0+49FhstH5zvr10v2pyc7tDhV2fZQsqPQp/nci9GP2ACKOoGRI8X9g9FHpHUIauxmIpbd8UwMv4jQfZTjz5gl4YoupHJPTIJaKmvnUs53cKL7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784497436; c=relaxed/simple;
	bh=8Cao4YSvyyxi8IkEpgt42VHy5qSQ+ev50GEinysOTY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8tftopewwX8c5RHrBeJZZ1Yp5QvOJbok6KX1x+u+lioFIiFPhbvpQyJLW7EgNNGTJw5uVIfXPzAhnbYhZkulgvhUXaJOU+t7TUzGUfZvLtOmGzqJeltoaoFq9uLFBK3AJT1wE0id4FKpPesSnBf9CAeGWrfKHcxSMRiMhz+23Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbg9hrkP; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbg9hrkP"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e65e18969so334230185a.1
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497434; x=1785102234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=;
        b=bbg9hrkP/RD5EVOUw04voik+GKcKfj9RB8QsANtD/Szjezmluuo2hk02hQs5YG65sA
         S7lhekQgioEVWSa7URI9w6brtsgObBvuEZiCrVfPD7l3n9t367DYZBrh5FecyuPfYTmK
         UJmzq8VY3k1cHWLNk6LJjjPjFNoL+KnkE7ZzFFOeiUvP1ln2QLwSyA2lb21JO0TyUqTr
         VnZhkuzZAskcUyCmf9wowvTwZqL8aQRWqsettDH+AQWnRWAcnbx39EwnUd92Rqz61fW/
         cZ66C8VNPzGke87AJcSTwGwjx2qbzNUiIBGLR9psJ5WG+oDA81WOpRWuJs/a0caJSR3x
         cafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497434; x=1785102234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lo+kG++Zl0Kl2zxIYPSuQhtBBH9noHj84CgVxWP736w=;
        b=KKJJogaDVoo5AdUDYnRI1e6GZcM0CQLZMQNk2wo5Pj42nLUsVQXbwuhImDPuhTwerc
         K6dupNMBV4B1YJStTSzV5jycevoNxLQnxZexEkqLn+ynUW2mFy9WEbBgH4QPbYsEnBYD
         fU4nWX0HsvDC3gZoa3Cdm/YGt3/SRB9ot1w60sR5apD+W9+o4V1BjL6iJXGJyZwyz1k6
         zQbBPwIPDUrJGN/DpXenMVe/tkzYErqd5JN392Z1hchob1lWA9X3UU+raaHCqxgY8Bbq
         uRZikvEx6ZP0Tqebf9+OSwGmLkG3qrPV2jRKNH+bwVIDoNmoncpvLqk1dUEqfYRAbJaj
         J2vQ==
X-Gm-Message-State: AOJu0Ywdm31NbF/qGHkVC9JifqS9JcTAVLQhG5S5JndGIg/Ng8GYBUZE
	lcGu9MmL24+0sFbcQg53QmFDbYJSnj0e4fhtdd10t75+N+QlvkfjBQRwJueeeA==
X-Gm-Gg: AfdE7clQhtqtJbgRD1hrMXUNcDjjKMsSiU/2YD/s/zdRCZA8ZrDyhXAlz7U52zzmrV3
	9Toqbga2iZUVne8fQusxopZxDfhTxBRttSkiVHfRqWEX/HMQD0Dmz2wHKqgbTvUhBbIGv1fZJH7
	Naij9iJ/DiPQ5deDZ6PDaA6iS8uhgwRHkoBl12Mi0/u9xAW0xFE8m2OuErTD/DFlds5SAHdF/uD
	jzhURJO6VbBeaE0SnIVfYeXol5BCo6WpCqipwsNYK4IBDXr3nnsqJaVUNp9OLPF/2RoBlHNx9tr
	K/To1pMGz+eRvT4s0OM6cN5xwlxOEb4DdFD99Leqzw4OPK781RVu5EIN5QqmA8DUZcySf+woc0R
	G9S5PWkDB96auPOB5BO0GDDtgURviShGtofBc+G0gfkPgnJXw9q++AlhpMRBmZApvx+YgzW0GLE
	4Ssa4fQqAs9F4vojskZgLjt0hTK6xiSp4kk6AyJlFwpa5+1LTYgzkrEEbp08gqMX4dE2oWXvk0Q
	3hoYm/7NDCOziSKTqdFvLaL3u4RgYIDZrsrhKnVjsv4s38Ip6Xbor4=
X-Received: by 2002:a05:620a:440b:b0:915:5216:e5bf with SMTP id af79cd13be357-930b492fe84mr1146363085a.22.1784497434363;
        Sun, 19 Jul 2026 14:43:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b542e60asm744171885a.31.2026.07.19.14.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:43:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell PXA1908 SOC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: mmp: allow COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:43:49 -0700
Message-ID: <20260719214349.734351-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMP clock directory is only entered for ARCH_MMP, even though the
PXA1908 and MMP2 audio clock symbols can already be selected for
COMPILE_TEST.

Add a hidden MMP clock family gate, select it from the compile-testable MMP
clock symbols, and use that symbol for the parent Makefile descent.  Keep
ARCH_MMP as the default provider for existing platform builds.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/mmp/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Kconfig     | 2 ++
 drivers/clk/Makefile    | 2 +-
 drivers/clk/mmp/Kconfig | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 16191b297150..cb69872401fd 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -457,12 +457,14 @@ config COMMON_CLK_STM32H7
 
 config COMMON_CLK_MMP2
 	def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)
+	select COMMON_CLK_MMP
 	help
 	  Support for Marvell MMP2 and MMP3 SoC clocks
 
 config COMMON_CLK_MMP2_AUDIO
         tristate "Clock driver for MMP2 Audio subsystem"
         depends on COMMON_CLK_MMP2 || COMPILE_TEST
+        select COMMON_CLK_MMP
         help
           This driver supports clocks for Audio subsystem on MMP2 SoC.
 
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 4b2c089f46a1..8383f9f1da51 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -130,7 +130,7 @@ obj-y					+= mediatek/
 obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-y					+= microchip/
 ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_MMP)			+= mmp/
+obj-$(CONFIG_COMMON_CLK_MMP)		+= mmp/
 endif
 obj-y					+= mstar/
 obj-y					+= mvebu/
diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
index b0d2fea3cda5..35a069034b28 100644
--- a/drivers/clk/mmp/Kconfig
+++ b/drivers/clk/mmp/Kconfig
@@ -1,10 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config COMMON_CLK_MMP
+	bool
+	default ARCH_MMP
+
 config COMMON_CLK_PXA1908
 	bool "Clock driver for Marvell PXA1908"
 	depends on ARCH_MMP || COMPILE_TEST
 	depends on OF
 	default y if ARCH_MMP && ARM64
+	select COMMON_CLK_MMP
 	select AUXILIARY_BUS
 	help
 	  This driver supports the Marvell PXA1908 SoC clocks.
-- 
2.55.0

