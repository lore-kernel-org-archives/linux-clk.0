Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C5021A444
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 00:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766018617; cv=none; b=KMw/4eoryb6fkivjISQgs5jOmFGQnOijk05EBMMbB4cKQCFvfVJyLzR2h4SrtFMqTkbIS20N52TA3T7jkv6iWhWhWTwiXxntJA9tyknNmr4e5EeM9XcjfDDp/Jhi6LjQ9FiAzYt1nLeCbJ3ZXrHg0T7gmZNLh4z3TPyQvbeFhY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766018617; c=relaxed/simple;
	bh=3U+uEvM5FmJ21lBK+piPuzGOpXb+adXu2iPH+sgOaBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoITwZwMwY87Z/j5JTqHYy1Vtp47cdMLnQQfyUL0gE+aHiOgu5Sz7aP0xLAfRANDlN5J2xTdrKkwHG1cF8DXeHAqN97Y3WTv7ZzlDOlW9GjjkGosu5ARqw/1cn95A1O0k/XEwey8TXVQlICEctc3WWTt7FfLTZJ8fXs3Dy0hfV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCIy69yv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCIy69yv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso884545ad.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 16:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766018615; x=1766623415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFBvL96SsBXFY1GOi9n3IufCfDj+mjJoC0nT1JtdTtw=;
        b=HCIy69yvOnSo7Cf6KqZrJHtrmbH+Q5S2DMGTOma/6kqDcZbOlW9VCTFf7hqchVK7ZO
         C1/OEqsN99VvCRVmnf7ZDhdSk9UcvedfvE9H9hVgNBhKTa1RwhLgG+fOamoZe/zIkWA9
         zEZrKWdOW88IvL1YtiVtQ79uHdYOW4+HGUeqwPQh9D3mMAYnMygQQKkQr9mS9Cv3te27
         8YQMOceFlZNMMIYvyoCqMHXf7bip0eR9hW5Q0T7dwBZp2Q8n+kL74G/BKxh6gy4fTAFZ
         smlr6JHr9URmpO6nVD7s9RiHVDoOr2SR/qs4j7Pmj6anJUi00XhxHKRtfyHfN+Ddmosa
         r1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766018615; x=1766623415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFBvL96SsBXFY1GOi9n3IufCfDj+mjJoC0nT1JtdTtw=;
        b=mpLgEt4OWPFfIxXgjNQxC3swsBnQkW/0E4V9Tx4eMnWaJE8/8wG5M4MYfE/sx+9xgZ
         AEnch0TbSIAKbIEC8+POYOWgEJlVbtkv9oNCQF17qnNy5R45Pw3vo/BV4bj8CRLd4rN+
         XXkshOek67PixXIva+wUBIOoBhU7Uu0mcIaAt/c0NrWca4o3STLak5ZjBVfrg1cS2jqm
         8lc0vhbVo06G10yhoEQAdyILzKiYzl9qbh3D/wpNrDYxQW0QVdF3FDSfaKAEc0xY+srk
         bYlHyORkxiz5+FaZaRIfp7UaeEu5ns9DLkL39z6UDaaTOoeRqU0p5H8ePHJHKRYjTTaH
         +cng==
X-Gm-Message-State: AOJu0Yydgy7RGtqGFq1Tci2DEj6Vo8oYOp6ZjAovQuDhz7V2CLSrj+zf
	ysZqWgpmHibm5Xyj5RJeNnwosW3rZHcRzda6TVdic9uwbfTH+NS9tlq1
X-Gm-Gg: AY/fxX5O61dcxMyRqjOEhgEh0bSxfj0YsXliA95RyhO5dN2KRrAopKk0/wW2sLCtrsq
	Lfgy4IUb9IRE85Ld4gDohUglV78DzWtE1EipGq3ww4AxtkLbmGnRQueEPzsUczFFdZSsfgfva9N
	0Rkv0Ed3k+S7so6Rq9QkFkdhCw7cEHMGSaGTvpUgJn0FiDBw0Ulgg8dd/hqbM4JE1grdtuxIOwi
	teyYw7wQyMtiYRspJHzOOOn6qCzl4XgHXbbrNA+G8nh9kHuert/efgjuFWxqny5pgFr4w7N/qIA
	kybqjRrPNIh+ybR6xNHWNmTCd0/dsMHOXEgckY8wDfAx4p08y97dhPQgSCHDkQQnpP4AGE83VAy
	rNHcnUM1Olhh9klr5l2B6k+CLanj7DPAYFKFCwDnJuODRsI5M0ud/xow6+ysF6ZifrnbOHvmVXf
	8D9WuhCG/Tqg==
X-Google-Smtp-Source: AGHT+IHXPYnZ7E69bP2nqUc/pQLxn101I1QmHMYq1oQ+b98tg7iTEqKDi2M4pJ8wuRrwwolMhc/67g==
X-Received: by 2002:a05:701b:2218:b0:11a:72c6:22d6 with SMTP id a92af1059eb24-11f34c02a6fmr15633109c88.25.1766018615312;
        Wed, 17 Dec 2025 16:43:35 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fcfc66sm2825041c88.15.2025.12.17.16.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:43:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Thu, 18 Dec 2025 08:42:27 +0800
Message-ID: <20251218004227.221861-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For build spacemit common clock driver as a module, the build
process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
build will fail.

Add these missing hints, so the driver can be built as a module.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/ccu-k1.c  | 1 +
 drivers/clk/spacemit/ccu_ddn.c | 1 +
 drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c | 5 +++++
 4 files changed, 16 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 4761bc1e3b6e..01d9485b615d 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
 };
 module_platform_driver(k1_ccu_driver);
 
+MODULE_IMPORT_NS("CLK_SPACEMIT");
 MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
 MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index 5b16e273bee5..b5540e0781ff 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -84,3 +84,4 @@ const struct clk_ops spacemit_ccu_ddn_ops = {
 	.determine_rate = ccu_ddn_determine_rate,
 	.set_rate	= ccu_ddn_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_ddn_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..67f8b12b4f5b 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -198,24 +198,28 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_factor_ops = {
 	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_factor_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_div_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_div_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -226,6 +230,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_factor_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -236,6 +241,7 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -246,6 +252,7 @@ const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_div_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -259,6 +266,7 @@ const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_div_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.get_parent	= ccu_mux_get_parent,
@@ -268,3 +276,4 @@ const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_div_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..7389202c4831 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/math.h>
 #include <linux/regmap.h>
+#include <linux/module.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.determine_rate = ccu_pll_determine_rate,
 	.is_enabled	= ccu_pll_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
+
+MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

