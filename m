Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB6254B1F;
	Thu, 30 Apr 2026 15:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562426; cv=none; b=HIBBW6ud9bUCR3X38PTRNbdTzaAuQHP10NhQYpeWWlmCRBhNf4pTp/HZeIkUK2+gNHwWsfmrL9aQHYQsiW+xy6RAnyvfjpJ+HQcq+WxN7QHkLZ4UOx9gBPayNuW6GA+2dvrnA7U6zayL5omSbL8WnSIzI+aoSSmEOrlWd/Z2ZXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562426; c=relaxed/simple;
	bh=L1FyeCRkQqZrYBDJJGviXcHOJDSBTmHgkzVezlgqjUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6Lx6KprSYJq2EeVBWqcdgh/oGHONcNOGy7DyOkxLU0Lb18ZPacopqclIhEKotD3WVHKJdyxaxeHazsRJsSZ33Pg3AvHuO+n16j00akvedIUEJbAsb7Zqx87O2q4fTc9n+X+uJF1VV3Bz4tII7sp2DSDUW4pBa3PAKBoOB9L7os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D1BC2BCB8;
	Thu, 30 Apr 2026 15:20:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: rzg2l: Consolidate DEF_MUX() and DEF_MUX_FLAGS()
Date: Thu, 30 Apr 2026 17:20:17 +0200
Message-ID: <46e2713f39cc5efc4b05a65723e0781a9dd8291c.1777562043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777562043.git.geert+renesas@glider.be>
References: <cover.1777562043.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define DEF_MUX() using DEF_MUX_FLAGS(), to reduce duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No change in generated code.
---
 drivers/clk/renesas/rzg2l-cpg.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 0e63b62e84350358..33f54ba0e64ee628 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -178,22 +178,19 @@ enum clk_types {
 		 .invalid_rate = _invalid_rate, \
 		 .max_rate = _max_rate, .flag = (_clk_flags), \
 		 .notifier = _notif)
-#define DEF_MUX(_name, _id, _conf, _parent_names) \
+#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
-		 .mux_flags = CLK_MUX_HIWORD_MASK)
+		 .mux_flags = CLK_MUX_HIWORD_MASK, \
+		 .flag = _flag)
+#define DEF_MUX(_name, _id, _conf, _parent_names) \
+	DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, 0)
 #define DEF_MUX_RO(_name, _id, _conf, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, \
 		 .num_parents = ARRAY_SIZE(_parent_names), \
 		 .mux_flags = CLK_MUX_READ_ONLY)
-#define DEF_MUX_FLAGS(_name, _id, _conf, _parent_names, _flag) \
-	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
-		 .parent_names = _parent_names, \
-		 .num_parents = ARRAY_SIZE(_parent_names), \
-		 .mux_flags = CLK_MUX_HIWORD_MASK, \
-		 .flag = _flag)
 #define DEF_SD_MUX(_name, _id, _conf, _sconf, _parent_names, _mtable, _clk_flags, _notifier) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SD_MUX, .conf = _conf, .sconf = _sconf, \
 		 .parent_names = _parent_names, \
-- 
2.43.0

