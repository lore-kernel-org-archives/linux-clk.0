Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938548;
	b=URgWT8GtzMLaq1mgcnk9Ad0A9xQJv89Ixs+txcd5v13x1g+EwBxXnVYPyr/ZJ/rsQ4fC
	 NbdWCMxqt92BOcptoHGgz/HKBscm5Za+OhORaeRjmmUt73Kq5atFhQAYIHrZ8RQqh9JPH
	 HVRzwRB0eMWk6Lubp0dRLOSk+WGAcwnwa/qSwdpAPb9zuelC9gUCIyrZXSSvyjQGbklii
	 N0fkLie09uLAbHSDV/yldoh9m+ibBzyUlH9zMlHjz1L0uJX75eMmvSL6uIEOjV58WNfHB
	 jUen83tXvcZQpKZ0Sl7WzMmCdlxzHrYP8HGVl1AvjF7No0qKHhhSdEpP5W3tJLWgZqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LUSq9nc4G5TSskG6C1rih905uzp7QL7BPN5/lyxH9s4=;
	b=0CqH+ncOYOhysq4RZm4Y0SLEHklL7xzotjwUZ77DvEtQ8UXeeFORzvDO7cZsXLH8R3EF
	 pNJnhsN2LVuKb4p+Qe2DZgONjcEPZm4L+rc9Zm+/gGDcZDdrnP6DAqKNfCneY5adpiu82
	 gOJuDBVVBJWb4S9ZK5PrtM8qA+xEZGo9xpwEeu+CFFcy1tE+DHfdpH+p1iSCPpRMeIlW9
	 79OARWdwVHSDRoNpjUDJ3cEJb58TyrOpHu2ypr2TZjsFunx9lJ0XgFB28CP87FWMkbU3z
	 ZX5zkwzE6jXOPxb849qfmHbkKAw9TW0Lkj+kEOIy/0ZX8m3/zOxgW2WprwmTk4e+RPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fGZ637yC;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50644606A31C
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50644606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fGZ637yC
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491846221ffso35095f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938547; x=1795543347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUSq9nc4G5TSskG6C1rih905uzp7QL7BPN5/lyxH9s4=;
        b=fGZ637yCDJmeOheWD5eY76Vd+azazywXgF0D35bQwMcBrz7oe7ixps9cyxXRTyzRso
         HDVxtoxutIiu/pT74xJR6oQyPYkn7AL9/Mxddh6dEXZlfdUPQ2WY7/aMMnOgoec85XLb
         VO+I+5ZdeDPKOA76/Yc6UOkjTggCCpdh4gvuSxPTiHhvsk/MB+jndRdt/tLqaGr2ZorW
         aBJGTwzSh2taPFuwStmieLCR4rwJ2QjV/tiSvAWz2OwQ+rx44TYcpcsNbmIGXETA9FSV
         UrpYZIBb57cds1MoM7GNpiSAx/2cLKY0h58lAMBHAwXRmWm50nQBck9kGvceXr46OKui
         RzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938547; x=1795543347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUSq9nc4G5TSskG6C1rih905uzp7QL7BPN5/lyxH9s4=;
        b=rJbJNsA39iBzYUcdYm2LSBYL5SB9FyhkG2nElRTuUQUG6nomMqeekgvSTEyKoyTK/B
         X5eqLF1TdQCyiphUEWHD/SgnMQA2nbjWUogpHRC1uWCk//7mGrY19qaxucF7pGjihtG2
         E/Sa0U198ySs6Hs7kKOpCsXtES30mafR4wk8LvEnJF7jOZg6MgJsCKhRdS8sdaZ9Iwkm
         4o1QLXOYzc4JQzz0mU0obFsuMgHsshPCkKeJ/LezMepuHJO74URyKyDUqCX1ERngvTpP
         ZFJRfex2qu/19RFSKucUj1M4/4687rbjD3XRl7x+0Kwx58pkhKzrV5i3xp9KJOOrX/jW
         Utzg==
X-Forwarded-Encrypted: i=1; AL+hErGTHArPVKxF+1xwcT9wA/6u4uaaP5OVfSOtp8qC1cBNomcnXL2eWsjpNoajVOQk+MoMIWotDOpvbME=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AoUCHX24SbEoYsu6aqmS4hoCdl6P3qIYhzeL+wVVTaC6vRkZs
	XG4MY5J832YqdyTUuXoz7cpr7GYKl5LLs+pk/trx14KhqEzbMak6Mqld
X-Gm-Gg: AZFdTZeShmHJFYUfqzB2QtPbEVW4WUVVsrveV9bw+dGQ0ri+IO+KOAKzt2Ca21ok0pk
	6+QFP40YyDuBIy02omumoBP9eiE6pWCQm4whm/OHKGD6JshiOIctmIYYtVzjw4FRIsZ80Y5r8aN
	F6wDwFwA2cWXsvLw0kymEItRfJMDDUdIU1Ll/ClLoLKmYoeFU3XKdCp++LCD9G46AvysfWOvv08
	x+DwSwpQiEO1v0D4VfBd+gVa7zsQQ4Hg14nTXsK034z5scx1mhWYR0yhElI1y8r4UhisGe8L/Cq
	Ou0aqFBynNWXotfJYh9v1ljwP+/iEnxGoUbhItKx+0sEtAbnnokCTCNXcYzNxiYnVM1VmU/+CG1
	ONyEP1oegpdsKa3QOcpQrvt1CESv5Ok4zYN8NU9cmJhMGkeObU+W12ODMCMXWn4Gmp6zBL3JPS/
	5jtlSqlnJv5Gh89E0tU+5hkg4YK/FUj8QZXL4TLB/YAXM3WzcGAm2VRKVdID699afZMvpaiRQcR
	2h9bdVtYHfr0xCxDcsUjHQLrHApJ11LyE2PqcsTfdlB+CYNDb9akSsPbcsYOXoanIfIG6duIR3z
	Fynswc1gK2KqN7iBwIWJ5UymHnPXtP/FJ82UY2HGdjxRdSb5bK23K+3kByvILtXexDcfGWhLBM+
	VzyipbaVrjJedxloMONhBQxxcdQDJ5/AS9+1ueKOe+N9JGdpqSXhiDPM=
X-Received: by 2002:a05:6000:993:b0:493:690c:8365 with SMTP id ffacd0b85a97d-4a63ad6077dmr475575f8f.29.1794938546190;
        Tue, 17 Nov 2026 10:02:26 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm52567f8f.36.2026.11.17.10.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:02:22 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 1/2] clk: en7523: convert to full clk_hw implementation for en7581
Date: Tue, 17 Nov 2026 19:02:11 +0100
Message-ID: <20261117180213.88046-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117180213.88046-1-ansuelsmth@gmail.com>
References: <20261117180213.88046-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs for Airoha EN7581 SoC.

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..27ead83b639e 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -126,6 +126,12 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_clk {
+	struct regmap *map;
+	const struct en_clk_desc *desc;
+	struct clk_hw hw;
+};
+
 struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
@@ -741,42 +747,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
+static unsigned long en7581_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct device *dev = clk_hw_get_dev(hw);
+	struct regmap *map = c->map;
+	u32 val, reg;
+	u32 rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
+			desc->name, err);
+		return 0;
+	}
+
+	return rate / en7523_get_div(desc, val);
+}
+
+static const struct clk_ops en7581_clk_ops = {
+	.recalc_rate = en7581_recalc_rate,
+};
+
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
 	struct clk_hw *hw;
-	u32 rate;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		struct clk_init_data init = {
+			.ops = &en7581_clk_ops,
+		};
+		struct en_clk *en_clk;
 		int err;
 
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
+		en_clk = devm_kzalloc_obj(dev, *en_clk);
+		if (!en_clk)
 			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
 
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
+		init.name = desc->name;
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
+		err = devm_clk_hw_register(dev, &en_clk->hw);
+		if (err) {
+			dev_err_probe(dev, err, "Failed to register clk %s\n",
+				      desc->name);
 			continue;
 		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, base);
-- 
2.55.0

