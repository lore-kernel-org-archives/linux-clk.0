Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919444C670
	for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744772; cv=none; b=j53SaIxDGD4/ky10V/Yxi3DqiSSeIJXLU2WbhIZdJuyu6nxbzGYS3WgXJuH56788mxBxxNOM1RjY825tCo29J6f5rwoVlQnxt8ZRkd/MBMhdvLDitl5AIpb+hFBGtPBSJp/O6t7y9k+ZnreMAhBWOjpWI18KyGgTPZSDFfSnAB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744772; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIvVPAjMYistLN+hNIj2XAKmW8Kh5KhKIpURO7KLVuU20FKw6Q3zTPiY3hWjuDzBFgMyVQfP7Nf6YDSRcbcEFcf57eVRK0FZArg59XjMXdpN4vbupm+nW7A5fpMOaxyPnJMAMRI1RXghLzIBbsE403EtQhBA97Sz0Saqs5XKJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGRfIW/2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGRfIW/2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so10027415e9.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 11:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791744769; x=1792349569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=NGRfIW/2lFAlhowVck3jYiqZ4c7+jQDnVXjrgPYUTpjjzkQcmFTuj4gkFuedGtZnb7
         TLlp7hryQaIbOMlvQ4opSoYI6UcFIUEIkI1tQxXICiMEeDEoEAlpaAlX8KANVDI/JW90
         btNXQAu5P8u/IKzqestMR9rQXKWZFMUdl9cqVTtSZtW8v+urkBHaZUrhgLIsI6Y+jDZy
         syMrybqtVfp1bCHkjdb27q1IW5dt9SHL/K9cfFc6HzDs0ORE7s7WHXp/B7EXvCebiPKh
         IoCttESWV2mUIM3D2LKN2MbIW7XO0AxgWT3lSrV/JWoQDk3zZdDHJ/MtoPiHo1hsztdZ
         OLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791744769; x=1792349569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=B3tJI3w8SvB/XRai1ehZ/olFlAdFncqJuITCeaKb67KRV35WuCSru2EL5weBDvsOYv
         4gIPxsjFZsrHFSv64epyrrPqh6WIKi4jQ+Qrkn01gwJFjAMJWSZnOCvu4sUyKrUV2x/r
         gEB9c6CCLEdWgCjJhzwBo/4fg3QMW5ZGS7URqF5vGPdN7CYWby//34aYg/9dd5mqmMik
         xCxWSG9ZE81tdPW/QbhD+nf+lOdFOXBhsDhwOYhIAc+PU5Y3XBEppsCoRP3bV0/gNCNl
         TLP+7on46LwA0gLYdWPhPelJglo5ev9pJriBmGVRQkwRbHSrduw2rumoffRCepaE9qzw
         78Mg==
X-Forwarded-Encrypted: i=1; AKwUvBzJOEniTHHdoYjpGlOxaEtuwzfp9K5uyHbRu0haeqCVI74l45x1aazrTYSSO4MEZFGoDV+Og+z6Um8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyM7Hn2VsX5w1uy9Cuw8qIYm8lmWF1xfLnwbi5E1K9F5PBSBcZ
	TD6kK4iMq5wqLVzmK7Vf4e1YX8ssUQP+/JcHoQlzWuZuqa+0MUzoAhGCU/Q89Q==
X-Gm-Gg: AYBFou2nEVfGZDz+lD5wAfFWfqLYsa2wDVbLAMLE5JmZTcVctjQuBa4qqvkc7N8buP3
	rzFMGNNR6DzXubC564RkxESJFjJYYFEfHpoLS8s4LmlsEW1MQa4SDXYCD1GyttJUNQp3r6OupkD
	SWezcMzdq/s60tQZ3J8M2k4ifTyYUoeKFKJTXIXkZdlujHEyQ/AtJ0MVLg/g8WNYmbRfT1DXPs8
	idzEhcSdQ2tbLNZOpYfyGtSTR3/iAqmFw7hT1T2fY9ZLU1Kfeb2PJ3MOfpnj1rtLj8fa3uUdBn4
	AvbnUgi2GZLWbxvfTV4Kq+mjFT1Sa60kfQJDq/J+xhQcHjAdMbNMc6ylCWwktRV+l87/OAB/Nnv
	NglECeuGnooORbwEI+uJEligG79TeKW4OmuoBdXapddszq/ABFqRsVr3t/4Lkqbo0rW5DLBbWe6
	RfBNpAADs9eT3YLj4nzi69uJebxGSGm9zJoKU0RWuNBjggA6+Xp9SoNT60pyIyeaUKBI+uzKjrH
	Q4uP6+PR/3VWvKjmbuwHuoNrvIfqy6GlkMT/ot+u9igQ4glL/oHh4VtGwMKmz9i+koQK2BX0u8e
	Q6ncjNcQRqsxhr9dYpLBE7w=
X-Received: by 2002:a05:600d:8644:20b0:4a1:9eb2:b2a8 with SMTP id 5b1f17b1804b1-4a19eb2b2dfmr12876165e9.29.1791744768598;
        Sun, 11 Oct 2026 11:52:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm257418615e9.10.2026.10.11.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:52:48 -0700 (PDT)
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
Subject: [PATCH v8 2/3] clk: en7523: generalize register clocks function
Date: Sun, 11 Oct 2026 20:52:36 +0200
Message-ID: <20261011185238.52229-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011185238.52229-1-ansuelsmth@gmail.com>
References: <20261011185238.52229-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
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
index 24fdec2e6198..ec66a504d4c5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -745,12 +746,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1226,6 +1230,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

