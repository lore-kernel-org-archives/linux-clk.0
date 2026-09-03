Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E2411FB4;
	Thu,  3 Sep 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430184; cv=none; b=JqoROK0jEwQJxA+y2viTYToYRLwjNuTrDG8C4lpSXcl0rLWnZ77OUNs1wUZYlhx7eyqVql1t/Llys3Ti0YnduhEpm9JvxJjcLlkdr8jnfYeBjjiGcOOjE5bRjba240YmLF5E7YHdKvV0y7ZeLSEREvOF+UzTaVyspHeCY5PDboo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430184; c=relaxed/simple;
	bh=xL+NI6pdGVlZX3Zxg/N+aKJ3Rcb2SKIUHBfkzU5NohU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMasTs+G/2aCuovgpSBJtyI8T5kI4Qe8gQ8tR7OfXB4fdVdftqVcDZU3gOH3otWJQA8db7AA9g2qPh2gWuL+rPHOYN4zxJQz1XogBtM2b5xO7oXNuBxGlmnH4F1hoJ28HFBABxqOPNvkqw7jAe1cWdsWPihJ4jqC7EPyCh+uS2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACEB1F00A3D;
	Thu,  3 Sep 2026 10:09:34 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: [PATCH v5 2/2] clk: rs9: Convert to clk_hw_onecell_data and of_clk_hw_onecell_get()
Date: Thu,  3 Sep 2026 12:09:26 +0200
Message-ID: <3db76818bc24b7ff9706cce86b1e082811a17902.1788429994.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788429994.git.geert+renesas@glider.be>
References: <cover.1788429994.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the rs9 clock driver to use the of_clk_hw_onecell_get() helper,
which requires using the clk_hw_onecell_data structure.  Embedding that
structure in the rs9_driver_data structure has the benefit that the
clock array always has the correct size, and thus can no longer become
out of sync when adding support for new rs9 variants.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
v5:
  - No changes,

v4:
  - Add Reviewed-by,
  - Rebase on top of "clk: rs9: Add clock index range check to
    rs9_of_clk_get()", so this becomes a pure refactoring instead of a
    fix,
  - Put in a series,

(v3 and v2 do not exist)

v1:
  - https://lore.kernel.org/a6dce17b15d29a257d09fe0edc199a14c297f1a8.1768836042.git.geert+renesas@glider.be
---
 drivers/clk/clk-renesas-pcie.c | 44 ++++++++++++++--------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index f3376c29007aa92d..e2b441f99ccab4c2 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -63,10 +63,11 @@ struct rs9_driver_data {
 	struct i2c_client	*client;
 	struct regmap		*regmap;
 	const struct rs9_chip_info *chip_info;
-	struct clk_hw		*clk_dif[8];
 	u8			pll_amplitude;
 	u8			pll_ssc;
 	u8			clk_dif_sr;
+	/* must be last */
+	struct clk_hw_onecell_data onecell;
 };
 
 /*
@@ -270,37 +271,28 @@ static void rs9_update_config(struct rs9_driver_data *rs9)
 	}
 }
 
-static struct clk_hw *
-rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
-{
-	struct rs9_driver_data *rs9 = data;
-	unsigned int idx = clkspec->args[0];
-
-	if (idx >= rs9->chip_info->num_clks) {
-		pr_err("%s: Invalid clock index %u\n", __func__, idx);
-		return ERR_PTR(-EINVAL);
-	}
-
-	return rs9->clk_dif[idx];
-}
-
 static int rs9_probe(struct i2c_client *client)
 {
+	const struct rs9_chip_info *chip_info;
 	unsigned char name[5] = "DIF0";
 	struct rs9_driver_data *rs9;
 	unsigned int vid, did;
 	struct clk_hw *hw;
 	int i, ret;
 
-	rs9 = devm_kzalloc(&client->dev, sizeof(*rs9), GFP_KERNEL);
+	chip_info = i2c_get_match_data(client);
+	if (!chip_info)
+		return -EINVAL;
+
+	rs9 = devm_kzalloc(&client->dev, struct_size(rs9, onecell.hws,
+			   chip_info->num_clks), GFP_KERNEL);
 	if (!rs9)
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, rs9);
 	rs9->client = client;
-	rs9->chip_info = i2c_get_match_data(client);
-	if (!rs9->chip_info)
-		return -EINVAL;
+	rs9->chip_info = chip_info;
+	rs9->onecell.num = chip_info->num_clks;
 
 	/* Fetch common configuration from DT (if specified) */
 	ret = rs9_get_common_config(rs9);
@@ -308,7 +300,7 @@ static int rs9_probe(struct i2c_client *client)
 		return ret;
 
 	/* Fetch DIFx output configuration from DT (if specified) */
-	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+	for (i = 0; i < rs9->onecell.num; i++) {
 		ret = rs9_get_output_config(rs9, i);
 		if (ret)
 			return ret;
@@ -334,24 +326,24 @@ static int rs9_probe(struct i2c_client *client)
 		return ret;
 
 	vid &= RS9_REG_VID_MASK;
-	if (vid != RS9_REG_VID_IDT || did != rs9->chip_info->did)
+	if (vid != RS9_REG_VID_IDT || did != chip_info->did)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Incorrect VID/DID: %#02x, %#02x. Expected %#02x, %#02x\n",
-				     vid, did, RS9_REG_VID_IDT,
-				     rs9->chip_info->did);
+				     vid, did, RS9_REG_VID_IDT, chip_info->did);
 
 	/* Register clock */
-	for (i = 0; i < rs9->chip_info->num_clks; i++) {
+	for (i = 0; i < rs9->onecell.num; i++) {
 		snprintf(name, 5, "DIF%d", i);
 		hw = devm_clk_hw_register_fixed_factor_index(&client->dev, name,
 						    0, 0, 4, 1);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 
-		rs9->clk_dif[i] = hw;
+		rs9->onecell.hws[i] = hw;
 	}
 
-	ret = devm_of_clk_add_hw_provider(&client->dev, rs9_of_clk_get, rs9);
+	ret = devm_of_clk_add_hw_provider(&client->dev, of_clk_hw_onecell_get,
+					  &rs9->onecell);
 	if (!ret)
 		rs9_update_config(rs9);
 
-- 
2.43.0

