Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 33CD118E;
	Wed, 22 Nov 2023 06:23:23 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,219,1695654000"; 
   d="scan'208";a="187742825"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2023 23:23:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.150])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7AB824280549;
	Wed, 22 Nov 2023 23:23:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] clk: versaclock3: Avoid unnecessary padding
Date: Wed, 22 Nov 2023 14:23:07 +0000
Message-Id: <20231122142310.203169-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231122142310.203169-1-biju.das.jz@bp.renesas.com>
References: <20231122142310.203169-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move long/pointer variables at the beginning of struct to avoid
unnecessary padding.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/clk-versaclock3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 3aad69a08512..058efffd4e01 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -148,16 +148,16 @@ struct vc3_pfd_data {
 };
 
 struct vc3_pll_data {
+	unsigned long vco_min;
+	unsigned long vco_max;
 	u8 num;
 	u8 int_div_msb_offs;
 	u8 int_div_lsb_offs;
-	unsigned long vco_min;
-	unsigned long vco_max;
 };
 
 struct vc3_div_data {
-	u8 offs;
 	const struct clk_div_table *table;
+	u8 offs;
 	u8 shift;
 	u8 width;
 	u8 flags;
-- 
2.25.1

