Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ABE3E3D95
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 22:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177716; cv=none; b=F+lFmhkZRPmsLbqbQwYwoxpmKeYyPjM9KMrOAWcff9JQZ6SO8l3FC6UCbEJwiriw9kfVfW/cX5/UsksjodB6e+GJItuP33lzh39HDx5+tLtmiNl/6uIC8Zbl08JgrscYMO91sKbY7NHletJPhataonahpuIEZ1ZZdihZ3pekSB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177716; c=relaxed/simple;
	bh=Rv6whItDIcmUGSMIuRgbHjmoSSgoD1ibtk6GYIWC/CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHe0waVnllYhFws5rlonoSL/ZAslxtuw2CNqpSlKgmhHSjL9BqvmqmVLhYk+f2Jo3Zlt/4zarBulgx+TAJrWg5JBy+qKEXE4FqC7BALao9lgGfFnddZFgXFH2bLkSBLPimF8itvoOIqYs+6jD4nRHVs8RzuRtrdZwKLXCPbsGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COU4le52; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COU4le52"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f7027ca11so915215f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177713; x=1787782513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqWAE3/FZNMZVbcob+bjMAEwhBq6UWoejE3YQhxncXM=;
        b=COU4le525IY9jZ7ENVJ1TX8NKR+TWfvM118Ge+G66OyTzYo0gUKROwlh5stB6MALRE
         uXa/ZH0RAqjidOjUYkuPDLeqZez2uz/Kvbjbscui9q3UBMe+SDfTUYfxeOKQfqbGtFwW
         iNGamoXD44zEf/oLFa+K6mDMqZzspksTHmN4LP5/P9T77SDVaeaF4XoY/m3WhGixfCmo
         2jzW+Qtyffz0hpRrZJNa8wVL70mL5rm8XqVsJ8EYO3CnriV5187lBemJqCI4yZRn9sqv
         csD7vMmR7xoYNIfXevEF9tX15+uDtElZp4aYc74tdJrd2SLOC99H1eOdN3UzA1WhqJDu
         YLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177713; x=1787782513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqWAE3/FZNMZVbcob+bjMAEwhBq6UWoejE3YQhxncXM=;
        b=AqlZRroEcy+7jsj5jcIpcyu8gIRYYuLE/5Nh96O6XHfK6V2qXFC3bxDjzzmsUmrNEM
         uOh86LN1+2uIJ1SHve51IB5RvsQYpL05ODbVgWSaUTZqCDnS3x00/ck9bQ0XYVw00HY4
         7mTOs/FIkr2q12uBKM+4V/ekTIRCLO4sp1kzeuUIDHhdGZ1mG+FqjnSUB4PgapzaUGTL
         SRNmmfWZCjyTiLXkqxYVgEMtR0ls63+uSUEb4xS3lgr5BD6aQITuhO52jo5Gv7ipTDs1
         YlzdpSghZ/gS90ggMImebc8lAsE1Pz3DVv/+t8y3gruqcx5QRhHsH8tOKwFfRrzmMnc4
         idbg==
X-Forwarded-Encrypted: i=1; AHgh+RofgIA2jJmqH6sEX+9/if0riamJUa8QXHpJ+fCI1MzleGIKH3PdM/QQHJImQ9BsLuqkrWAJpxRkeJw=@vger.kernel.org
X-Gm-Message-State: AFuF++nxHcCc9rAfMCddRPUs/WDPp0SjN41P9OJ7OLICiujO+dY07cmv
	5NCwQUryi/nTIRmGsAf8XJ5Kc01IfRpM0+0qw2sdLFxH4oTLc/AEBVtn
X-Gm-Gg: AR+sD125QALRKMO+B3rH24f3Wigo/iqi7s3dHb4/zNRogUl4qK3Id2kYYtaHow8ASAy
	0kHQ26crdO9f/FEch8vqvL//41LmjsPH9Su+kBMe8cWaskQbSLUze7ydUl5M3fpYF1rAjzT1TDi
	L+T/gz2/dCqGct8IjTmPQjQddFUevVOe+iv+jlqUYTpUxiRNuWGMGMjCFqYJjnOBB5Uq/TER4cF
	0Irrhcp3777VkaieFkrWbMgMc80/QoXFbNRW/qANAcn5cmTADjx+8KngpYcPU9cMYOmEaBQz4SU
	3UhNArbRTOS8HiMQIB4NMl2ycdY7Jy7VxcQ4TpCJV/pxAfY1g3+CL5lyj1GyG5tr6ikSNFc+BOf
	0ycWNiW6TT8UIL+hi1LAAu2FPIQq70fZNjG/Nthg3W++qIxKbHuemkv01ssviQ6YoSJ7lmwFtR1
	OousC2uLFicNBNnfXN4LzTVKL5gXNG6gQGEYuIgx/GixO4Z/EROM7CsBE9gtOPJ/W4vegI9Esac
	JxngoFMQ4RCMTfvJJURURSKbztewGA3zyiF2dIw9kNQliVCNCzyLlrDUHL3o+nx9Q==
X-Received: by 2002:a05:6000:4619:b0:47f:5b52:5579 with SMTP id ffacd0b85a97d-482b1fe8a4bmr14796270f8f.18.1787177712697;
        Wed, 19 Aug 2026 15:15:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm9732950f8f.29.2026.08.19.15.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:15:11 -0700 (PDT)
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
Subject: [PATCH v6 2/3] clk: en7523: generalize register clocks function
Date: Thu, 20 Aug 2026 00:14:55 +0200
Message-ID: <20260819221458.30040-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819221458.30040-1-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
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
index 5c45aacb6409..924e4f3e36b6 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -116,6 +116,7 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -714,12 +715,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1014,6 +1018,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.53.0

