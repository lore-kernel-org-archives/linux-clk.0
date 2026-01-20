Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0314657EA;
	Tue, 20 Jan 2026 15:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921590; cv=none; b=jXqs63zGZR/9EfuqIMgAY61F4i04+6UE4ZCusWvKXg2f6xnVLiVVGLgHE29ATXESG22GSWUCQ2jnN6ql8cKPE5kzKMuhlrbBqxpPWAVxmd43yHFQdw4hrAxS/juD0IEvNWD9vdINEbEBZyMfdLf5N6Rk40km2BBtAwwY1OvBoRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921590; c=relaxed/simple;
	bh=X+Hf/miYtwn8mLMNSub6ZRCadjeTxEICFVNeXeYg1Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUO/lfWv1upUhOzj3IlllHZ+xBlmILGC4ZEHA2b/ve2HcaoB+aZtmKmfjwqVHKGLJdVFNg76/hyVg/SBkDBz3q4vKbDA+TLtz7y5jFe9o/7ARWqDbOEQXfC9N5/eSORDkQjxXWYxHEJR2tZQa/AKBF4JFbiRFf9I4s2H8oojRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 6rtea5VQRTmKzgffk2w0sA==
X-CSE-MsgGUID: V8VhoD5nQja+AnoRf8zdjw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jan 2026 00:06:21 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 81016402261F;
	Wed, 21 Jan 2026 00:06:17 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/5] clk: versaclock3: Use clk_parent_data arrays for clk_mux
Date: Tue, 20 Jan 2026 15:06:03 +0000
Message-ID: <20260120150606.7356-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the inline parent_hws initializers with static clk_parent_data
arrays for the clk muxes. This provides more flexibility in how
parents are described and will simplify extending the parent lists in
the next commit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: None.

 drivers/clk/clk-versaclock3.c | 48 ++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index f387cdb12f48..ebd9d75d7f55 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -900,6 +900,29 @@ static struct vc3_hw_data clk_div[] = {
 	}
 };
 
+static const struct clk_parent_data clk_mux_parent_data[][2] = {
+	[VC3_SE1_MUX] = {
+		{ .hw = &clk_div[VC3_DIV5].hw },
+		{ .hw = &clk_div[VC3_DIV4].hw }
+	},
+	[VC3_SE2_MUX] = {
+		{ .hw = &clk_div[VC3_DIV5].hw },
+		{ .hw = &clk_div[VC3_DIV4].hw }
+	},
+	[VC3_SE3_MUX] = {
+		{ .hw = &clk_div[VC3_DIV2].hw },
+		{ .hw = &clk_div[VC3_DIV4].hw }
+	},
+	[VC3_DIFF1_MUX] = {
+		{ .hw = &clk_div[VC3_DIV1].hw },
+		{ .hw = &clk_div[VC3_DIV3].hw }
+	},
+	[VC3_DIFF2_MUX] = {
+		{ .hw = &clk_div[VC3_DIV1].hw },
+		{ .hw = &clk_div[VC3_DIV3].hw }
+	},
+};
+
 static struct vc3_hw_data clk_mux[] = {
 	[VC3_SE1_MUX] = {
 		.data = &(struct vc3_clk_data) {
@@ -909,10 +932,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se1_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_SE1_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -924,10 +944,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se2_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV5].hw,
-				&clk_div[VC3_DIV4].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_SE2_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -940,10 +957,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "se3_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV2].hw,
-				&clk_div[VC3_DIV4].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_SE3_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -956,10 +970,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "diff1_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_DIFF1_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
@@ -972,10 +983,7 @@ static struct vc3_hw_data clk_mux[] = {
 		.hw.init = &(struct clk_init_data) {
 			.name = "diff2_mux",
 			.ops = &vc3_clk_mux_ops,
-			.parent_hws = (const struct clk_hw *[]) {
-				&clk_div[VC3_DIV1].hw,
-				&clk_div[VC3_DIV3].hw
-			},
+			.parent_data = clk_mux_parent_data[VC3_DIFF2_MUX],
 			.num_parents = 2,
 			.flags = CLK_SET_RATE_PARENT
 		}
-- 
2.51.0

