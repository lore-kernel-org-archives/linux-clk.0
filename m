Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269295;
	b=pZd0U2UFlItPqR1kLnxYhEmjRwxXXqA/taNreJIm6qORiMJO3rJBauefj+5mXexHQ/uh
	 i3Tzgv+qHGBLQWO3I/b+613GeIdIp0/DmmSlXG3+KQRVDpeaPZEa5absi0n0WdJPWQpEG
	 d+ZYI+GsP746Av/56Nn92uM4jQsVGiBuYwwflkIvLStlDGuRupQvOxcCZW5Pv7xuRFRq+
	 P7aOChKVMGEEz0l9s5W7BOjs4LaBbX1JGz9xip6LwZrEMP2ypmostu4RqgJXuEB5KyUet
	 2UaSR61mP8wtW2W0tqrv9vZvza3tLXMHHrR08KcIRfCmMPRy8WzKoqAyCIxbKOVk0Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
	b=pIvpOToH5gO5Lu00/oKWk1IUFu/bOl+pVPdhKPZtbhv3d2HRQj3ffT6c8BEVGExF9UKo
	 GBMHBjoMfIivTvAHYyEtXTD9JAcGqwRXn1irXA9Iyvq2GUaNOuQ5PJgjfiKRQLpWee0dT
	 oePMxY/pZqbfGKKsjmU8FuovpP/A7Reib3w7UekuB6wq1HqqWrNKrj9GH2THsl/agpfRI
	 7BOqbzxswYPTCY0rv0cTqu62m7z0xo/i1UpRpt+NuuymWH09fhwDyRS44b8wMINPyjY4P
	 phSEcBX2gxFPot/4XBY0e2udzXROPJSke72NpYTxQ9P8K8OXwB1dfNP5Setj+jkwosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY3ZSYuM;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39860A2634
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF39860A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CY3ZSYuM
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1074039f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 16:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269293; x=1794874093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
        b=CY3ZSYuMj6d1KBAuZ6mSZcQGtrsjTZEfWlgaZXhTn+GsyS2D+PfZK7YizsfmWrNXZe
         Trybh+Wfbt57HwdfM/se4a4grwhRBYczTw0XyuBmuTg8cjGxf/fvPlwvE6M9XwTmEM7x
         zKA4HCgkRuTjjizqx4XElLoNhedo2ri+wxoHbWa9mVBS1l9sz0zcPLyjdqRthZ5VNZDr
         aLUCld4zrjNa46S89hjyEpVOL+H/pc5OM+QntJsZVSgbLjdzxdh0uIIMOrCIqY+Nr/Yc
         dgLfLwoff65nz07LVtf0UqFBPO7nMmh5Qr3xpg9tI2y8Sav39wdVxzkqRTAuYFytFEjf
         hZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269293; x=1794874093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAKv7qC2wxPIbTea23GQAKBZyNJlV9zWgrcWZRncFq4=;
        b=WRUx0VqITZiW7GChugDjDyzNN/SefjBFZ4sBymHYUytrhDQwFa3xy7D1lGxP5579zv
         CQyUEzB74xN10zGDnqZuPr+HxYgSNdYfiJg+6rRlJsVvK8Q9WLtOZ5RTMrZLmem9+9SN
         LYTeSpu7E2UqhnguS/hHCz7boC6Eh5AiqYRqQGBNof62snA2m3LQTL49qs2vF9lzNTKG
         5CsmOMrQsAOi08OtRs0QqG3F0ENGeapk9s+rZOgjJMwnglxKnMncjbs7HfkLbjq7EAsd
         XpcsUxLWVdffodxQ1aw/usHJ1J/QqtSMZ4gxEB598Qdi0Mk03ogAQ9VTIgnNynYHHTWc
         MSOg==
X-Forwarded-Encrypted: i=1; AL+hErFcpTXRU9R2hpIJiP8NLBJDR7r0YXXmJwywxVIjpdtVBMF57kmQ0iIqyv2YV+FIPM3GW48nih20Sgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NfhjTuL9DI1JpfICnrixVENzSITjH8YYe1qdG3TIETPQFUEVH
	gEvaqrpCjYdIEkcDA+cyQq6ZSi4w3M72bYcaPeEG6aCcU55+iT+XQTqb
X-Gm-Gg: AYBFou3yS5hLOrvk3Ns2DXasQUImp9nHQvT6YD7qZ6eQEEPyw5QkH/KX4Vd5Ou1xGxr
	mgQ0bX5xo7ffo7wWdLILAZqGv6zBkIbHuj4SSbJZjKmiQ8S1SckE61Huyw3BcnIAszCozDukPCX
	edLovXxJlC8e6NDihes9yZVMeTnjL0kZJL4YKJetaneuW5h4Cp3v6KHbxWfhAgAZwZ6j2IaGH6Y
	ygKN07e4Zo8ntHdESOz2kFNWNMZj93VzPiQbCrVDXFEvxQePtkM+V4r9JQs2DNjfWKYrXjGVeY1
	X9P4CWunE8Hz+f0sMRK1IS7LZ8ma2zjB7f3awzXC+Y+bZcYxtLhQhU+NMGZTX0EUK2tqPHYcFYa
	JKyvva+VBC01oGbCaTmFXg+VFDE4vn2oSS5rR8O5dBlsTblQlVpbfpKjGMwubEleueeo4RRKnco
	bWZ9m3hQckZt3hZm48Ze3+wuEXOyrJCAZwvMdl23nf0xfWmRdEMYY6pfhWNUAym8mZzqyaK8ppf
	wM/FGWd2tlX060r8JZK3NiYIy3OtWzpAPyVqXP/8VfDp1GqiWblX5G5vpNCCVoS3BIfwGtP2Dwx
	TQqk4sZVCUsU6JYYJW2RRQXRUmklodKK9oQJEWr/B5EXqG/8wedkhGbZWQ3dXEHjyNA2dmA/Dof
	QiIj4gw1rAM1VhMTJVbwwM0OwTXJf/flDQqre0OClvJn/rCE0SYpcrP4Kzk1b4ICVC+YsqPE=
X-Received: by 2002:a05:6000:5c5:b0:492:3f98:5070 with SMTP id ffacd0b85a97d-498364d741cmr1563424f8f.12.1794269293229;
        Mon, 09 Nov 2026 16:08:13 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-30.retail.telecomitalia.it. [212.171.11.30])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm1704703f8f.37.2026.11.09.16.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:08:12 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v12 4/5] clk: en7523: generalize register clocks function
Date: Tue, 10 Nov 2026 01:07:49 +0100
Message-ID: <20261110000753.508-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110000753.508-1-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
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

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index fbe10e4c3693..7d302498c3d5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -823,12 +824,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1314,6 +1318,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

