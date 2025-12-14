Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6921A3B8D78
	for <linux-clk@vger.kernel.org>; Sun, 14 Dec 2025 23:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765755042; cv=none; b=fdWjNz/AR+5qT4kIaNmDRO8amT4HjTrSgU+LInO8Ai/HsBfGgxAM+yeiJeZNuWgB/oLPHRwLFCXmrT+9jPxFvGO8CN5dhxNpZtDSH48E+jvUYKf0pFEnnHxw2jzlX5XdYpSp5tJxX2tIqpH31NaRFO6Wb8YX85pVy+w+/uDjOv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765755042; c=relaxed/simple;
	bh=T7SjwE3X4VHRa7EQmLRK+I4LKSkVDZeZ306BR6wQm0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKB3R4Ue8yNTxdbsStWT7pV2ZC0Sq4uDTxIbWO6FObIk6JULGMeU2yumc4TZ7NclLAiM0eqABQUNlvVdq4V2i++QhTaqF17fY44ZAi3bABvZPvQkHsfuDc9WrfArRIL990iQPTnoLGsF2k4QlHsfx8MvCybyB99QnT8MW5Eby58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD6gg5mr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD6gg5mr"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2817096a12.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Dec 2025 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765755041; x=1766359841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYzoYAiPmzzivK8Ki6QV16iwe5G/a6yZeTp3lLRhlMY=;
        b=ZD6gg5mrAmcRabsstBS289USVSQNF5f03DvigG8LrxyABrtd22LfEesOqWB8hLILBl
         fRsHDFYLoc6TnerCWkHo6Km1Bd1WZhqXOVuHQGAr5GhHR35kM5kgRYYExUlqcg11tWo6
         Z3h+pUviPEmH7B1zzvLGOZfpUR6SRUudvqPlAG+4JXWVnDJY/4nDwSXyGBaiWDCw0CvF
         RT4fkVpihZDM8tLRU0MJIo9a2/kokqu1I4z4Ye2cz6yZjwzRsgK/5VS1jXfZSExADOfF
         lw6WVXxq2GuJMt+FbFXd/1t8jKauPAnsoWf+IzPHbOq0lWHAQTS1VJ/uIefBkj1iAu2K
         uZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765755041; x=1766359841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYzoYAiPmzzivK8Ki6QV16iwe5G/a6yZeTp3lLRhlMY=;
        b=NTRCyc9oSgPC9Fhx4WUjz32a+f8GVTjjX48WcDuvgodO4QEYQVV40hNS7amff3bgw+
         ui8qtthSq5KyYijB6C9w/f6lTeWi29glwdLi5Ymwq9pR5Ivqua/3WkN/pvaEFKi+5erd
         5r2Q9KDQf4su67f50kZz0NPyPqcuxEbjIgj0xLg/wiY/yijxLo19Kh4c1jsA8Fui6kRb
         2gC0OsSwP4w5KKZdsycf/qztup0+sjuHiBHH85k3q/1Wj9k1VSYB2kMhIluUpvI2mlXT
         nuuVdMEpL4QkMO4+J0YDOtlhWwl10/ia7XHEN5mCsQMDkuucaZMHp2llRiYiDFuUEso0
         WXHQ==
X-Gm-Message-State: AOJu0Yy5OPaqLsx/LmRxbXnA4jYXkZww+jGGD9A2C8RVD5VxEP7vwl1R
	4cKULplEWPE4ZvqlORuGfcdh27bGeGgCw5+c4E7dqAqTXXQXNznsBpO3
X-Gm-Gg: AY/fxX799YiTlrfVrN/WD3/E++OmdjWjcZKoFUvU730slhMKl9/+4Au+uuAOXchews1
	+GN108p7oYX8MB3wAqtYHIcf6UjXHG8zcKTWC4xJRltDG3N6ifmK+lh/R8tlGAwBB3ZsNuB+7iO
	JzyOMlkzSBn4SIKfLaAFFz9SyGc7FtTufb7Hoagcd9KOcd4JJ1fJiuSrM90EXwahDzHrF5Yt9R5
	j0owo+hd1LiNFQR7o4gO1niGiMq1CAlT44gTluvEN9tJzv0s9621NTYY4xLEcQ9QTT8JQzaTL3n
	l84iLSSGfCx8zjdrcXzLji/IFqfU9vqnWQkENR/MNlTeKFG6NsNiCvkkbGqtA8isdmHipIS6CPb
	sm2SIdsX6fJhIhYNUINroR9Dqb9Rdtt/n5I8YjfAiTipkzJERaphoU22+4zx7osYDlcY8SyFSmr
	qKFneF7JleEg==
X-Google-Smtp-Source: AGHT+IGQk884QPSGZiuAKUTjJrQTSdk3vzJE7zDrugsr9qRUB8OVSda5q4I3tfPa/ntnYHcQi10gGw==
X-Received: by 2002:a05:7301:e0cc:b0:2ac:21bf:e937 with SMTP id 5a478bee46e88-2ac2f29b7f6mr4392207eec.0.1765755040555;
        Sun, 14 Dec 2025 15:30:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm13553377eec.0.2025.12.14.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 15:30:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Mon, 15 Dec 2025 07:29:37 +0800
Message-ID: <20251214232938.668293-1-inochiama@gmail.com>
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
 drivers/clk/spacemit/ccu_ddn.c | 1 +
 drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index 5b16e273bee5..9b6dc6910284 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -84,3 +84,4 @@ const struct clk_ops spacemit_ccu_ddn_ops = {
 	.determine_rate = ccu_ddn_determine_rate,
 	.set_rate	= ccu_ddn_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_ddn_ops);
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..09f377a6a4f5 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -198,24 +198,28 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 };
+EXPORT_SYMBOL(spacemit_ccu_gate_ops);
 
 const struct clk_ops spacemit_ccu_factor_ops = {
 	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_factor_ops);
 
 const struct clk_ops spacemit_ccu_mux_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_ops);
 
 const struct clk_ops spacemit_ccu_div_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_div_ops);
 
 const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -226,6 +230,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_factor_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -236,6 +241,7 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_gate_ops);
 
 const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -246,6 +252,7 @@ const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_div_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -259,6 +266,7 @@ const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_div_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.get_parent	= ccu_mux_get_parent,
@@ -268,3 +276,4 @@ const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_div_ops);
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..f8fc53887189 100644
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
+EXPORT_SYMBOL(spacemit_ccu_pll_ops);
+
+MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0

