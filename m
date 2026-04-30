Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04D36308F;
	Thu, 30 Apr 2026 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777573849; cv=none; b=T20y+9WZXyDelwfUxzh1v/bM0Kw79dtls4UpmBjPS8cASVgRXfEs5cq40QQF88moJnB2MVG56r+PJl6yHkmOF7HKzd464UorTMC3Gj1F98EtLZ3Qm0Y9Hwq9OD6HcB86xWtksiWX8qZQLwMjNkLAddf3v6QdY1ZUBKrUmXIXAUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777573849; c=relaxed/simple;
	bh=rfQclrOG2+K/zyZP/OJeAgFOXwexy9LiNJGhmfYVcGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sw+iSzevLWaHZTaF4dOQi16evAaD70z6YIDmtdfg/lQ4R3gRH4X+co9heVDBzJ+iukivOFIjMSItaYHdTd1E5nJOiOBoqRHgVJblnPdQLPIG8rBWn/NpZQxCGlkHcS7TQvQq/IubqpWj8Hc/CkZ/I5by6wXPHIFIcNxHtq90nv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCdAiCp4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCdAiCp4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B61C2BCB3;
	Thu, 30 Apr 2026 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777573848;
	bh=rfQclrOG2+K/zyZP/OJeAgFOXwexy9LiNJGhmfYVcGE=;
	h=From:To:Cc:Subject:Date:From;
	b=oCdAiCp4joWuTw+qckuChCZC4np1SnNax/gzBvuDqMstsLiL1iexbesO98p/mUx8U
	 iGD8zFrzoFF4naNp5xS/OEAnddx96wZdwyrjxRSN1WGdNWc4LmUuVDctsSQ6S30UG+
	 i5rtYvW+LoOdaj546lS+JgJNiCOcNlR8x4X3yncZomlCrqc148VgKcw/wRsglUhPQf
	 v4cig64lhcx/w2Ow+Gd5AyIYIl8AnbTVIraanPq/1gsJzWQYPUP3ZPtytKiVD9OLiW
	 0cYQw2nwZBjT+EAkBmHc5SocYEpPkMCUybyNTrlL+/FH+vbhK6Wb9OQBYOJXLQ2Asj
	 VO1PBOdV6g1Jw==
From: Conor Dooley <conor@kernel.org>
To: linux-clk@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: microchip: mpfs-ccc: fix peripheral driver registration failures after oob fix
Date: Thu, 30 Apr 2026 19:30:28 +0100
Message-ID: <20260430-unmade-overpay-28d175fd09a3@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VaF+6olKctVzAKmjWOmn2I1XWd1Ql4MMeD+3Nxkkz6I=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmf5x+WuHo6g19+2TSeWpn1wq/FJk8/f32X+CGPR5Ps9 MuP5m9q6yhlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEEvQYGZbOPzD3NGeHyVeh cwd6kwskv39SXF0vvedIR1ehhfcmue8M/2s9n3+e/NY9Xf8J84baP5sffd+SVy939KDkKS3b9vf OlewA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Commit 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds
access during output registration") fixed the out of bounds access, but
it did so by packing sparse indices into a linear space. When
peripheral drivers request clocks, they obviously don't care for this
compression and use the sparse indices, and therefore try to request the
wrong clocks or clocks that don't exist.

The most straightforward fix here seems to stop being clever with the
packing and just overallocate the array.

Fixes: 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds access during output registration")
Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Brian Masney <bmasney@redhat.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-mpfs-ccc.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
index 0a76a1aaa50f7..40c17593e5941 100644
--- a/drivers/clk/microchip/clk-mpfs-ccc.c
+++ b/drivers/clk/microchip/clk-mpfs-ccc.c
@@ -32,6 +32,7 @@
 #define MPFS_CCC_FIXED_DIV		4
 #define MPFS_CCC_OUTPUTS_PER_PLL	4
 #define MPFS_CCC_REFS_PER_PLL		2
+#define MPFS_CCC_NUM_CLKS		16
 
 struct mpfs_ccc_data {
 	void __iomem **pll_base;
@@ -178,7 +179,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
 			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
 					     out_hw->id);
 
-		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;
+		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
 	}
 
 	return 0;
@@ -231,17 +232,9 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
 {
 	struct mpfs_ccc_data *clk_data;
 	void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
-	unsigned int num_clks;
 	int ret;
 
-	/*
-	 * If DLLs get added here, mpfs_ccc_register_outputs() currently packs
-	 * sparse clock IDs in the hws array
-	 */
-	num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks) +
-		   ARRAY_SIZE(mpfs_ccc_pll1out_clks);
-
-	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
+	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, MPFS_CCC_NUM_CLKS),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
@@ -255,7 +248,7 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
 		return PTR_ERR(pll_base[1]);
 
 	clk_data->pll_base = pll_base;
-	clk_data->hw_data.num = num_clks;
+	clk_data->hw_data.num = MPFS_CCC_NUM_CLKS;
 	clk_data->dev = &pdev->dev;
 
 	ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,
-- 
2.53.0

