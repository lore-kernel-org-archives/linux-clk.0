Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CFF42E43D
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806408; cv=none; b=NSKlvOxoGqYGEQNogO6615G+zc29um4HfkHmIqRK0HCYZxFQWbrujUvjkM2lNuve0+NJgJMlR7NSAOCFQVKqIcnyFWeHAcPeacyMc1aRo+UZKSCFy6SvrWspnZ50q1kZISGd00XCWYUUvogzVdB6/I9fvNtd8JPhsTUdvF6CvSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806408; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4CXCNOERqVp76qea4ZfntxRTDtLiswZSVAe2x80K4g+2TifyPXRF/mkftfKFpkxz+KcvbVu/pM23ZDEXP/PWuZOxhWmtmRssg7Ke1EBmvxJ3rWZRq9sMqKqelr2PNfitU/nLvMPa6kUo+c+7jWb/A+BPB9JeilwHyruB060b6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnWYnHTL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnWYnHTL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1234138f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806404; x=1792411204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=DnWYnHTL6YoT5MuVJVVqsvH1H59BXGPOkczHSPV0C/sSny3nQBW5x9oh+sx2mcGydo
         c/gQtqmBqyk3VEW22SruTCraadK0OKsZc6c+hSGl3gaShni2Nkwvx8kvpVLyFrAN7cvM
         +tAjYO5+3YVsTHUGMDy+6gVUlEGi3IVgAwynPWCaAgBpnk+kPr2G7XlfuaUmzrATokXn
         JRrE/UgW4X6+G2wpFr1BPQ1h3tmKkyOe1szZ8eF+6dh0BWLCv5QPZje7eHCC2Qv/N07L
         5A4wBVlXGhxdGafJO0PrS3C1sAFb7FGMy1hDQcN1Jpkpkgm4Wo8nACrYeqbTY9p3AotC
         DBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806404; x=1792411204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=syef1hZ+U6SOetcYHbqJa62LakU3YzxqwMxuKzkWzAgZ7ZSi5GkTt2/9IEcBn4lWW5
         /q+yhjC9qy364nH9Y22OTbuGy+XKEao/vnYq+4KHAlUl4yaUN5hgR6HIlwCF7ipaM3NB
         t79smM/0FhPtLRq1AZWzQk9ULNozfKQQRoN8iBApsg2MOeRbTf6hKhzKSD0axVlw5nnH
         XzuzhqEWkylEtmcD0Wu+KA4Ycrm5ZkL+SfONgO/5YgLoSgLFJMEGkyUNoKQX08TYLz2M
         4yDj8KZBqHK6qLTz28E3FPsNhkZhCzQkDJkdZBBripo08cVD1nJpKcejEaiC+jRzXeyq
         jONQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+E54BFwETfzPMHz+/bwyv9SVmpF7hKYJZKebLk/z7ANUPMacDuUncAuy+fCstt5QfuOjIU1pcBa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLtqW3YoBc1e6/eBgn2HR9ujhg/zuHJNdzg3xLxIFhxNXqJvhv
	XfMRxTkjxl/LyHKHO00LV5SSN/I0UFmW2ER2pyw0TTTujNIWZL5UI9fM
X-Gm-Gg: AYBFou1Jveaxq5h7h/7Z8gkVJ/wHysJbSRV1Qb8IptRTpg50qC6iKAvo6HtXRXVtPjw
	C2gpG/+vTPM8yJjFpMTORoNAxgzkILM01mZ1siCoJRDIPAm6kAAEwSJ8CFHwJVLe2tBXj0+a3wL
	9dvqBaKjGz55JjbzMvX4uyt/d2daXFGPo8QynRL16CYn/x1QtZKXcfGmL2vodjP+BSsSKpPJR+Y
	gDiYfB+fCA0bRZWkU0BsBY5CnKsBMEJXVWsyjt8u4Dbx43a7Ivz+5YTj3b3ZfQBw6d5ahokjh6x
	x78YcWdE4D1NCG5CrUsqhvlka3pikfWitoiEPnXRisocGQMU4TBlA56ppg8Jew3GjvQ6bKOVyLY
	7FH0B6F27QVbZzH4fXNArxPoNdD9x2mwPp/uswWp69fz4w0Yga7qBbDEF52lxHmSj9LOup76WVA
	PuKovyriiHPZ39KhWEiGPfAaxTpZndLz9lbOJhoCYDAVi2G/PUDdSqZ9jEY2lXrTSbgYb3bi+Ey
	chXkbn5VGyr+Mfngb/8yR12qwwTDhHcdk41M5hFxmc3I2gkFUkNb47UXt26EEFkI5SpCpwemmrK
	S4Utd7TFJ92FUYEtLqO0duY=
X-Received: by 2002:a05:6000:27c6:b0:48b:11a5:d42 with SMTP id ffacd0b85a97d-48dbacfc1demr10357286f8f.30.1791806404238;
        Mon, 12 Oct 2026 05:00:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:03 -0700 (PDT)
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
Subject: [PATCH v9 2/3] clk: en7523: generalize register clocks function
Date: Mon, 12 Oct 2026 13:59:52 +0200
Message-ID: <20261012115954.92718-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115954.92718-1-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
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

