Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880692;
	b=nyid3+4QMZ5XiyWvntrp1ZYnPb0Hwj07T+MGEDYwHKn4wVJRupd2rGXkGhBaL6m0DBUt
	 qrQvdgbcqgA/WPaWqhgr5EFTEMIE7B4RjBgmfQX2kfrcNAG75UhINtNjb3NrQkjUvO2T2
	 hfJPN1/BRMdp0liiNFdfrLLNZaIGVBdsB8VTtjg8y2LHirqQUwVYPzRJNoRb1bmsKRZKe
	 GTHNCH1Luv7WEtc9M8tm2rv3K+Sp12b+cnZ9H+UxOzH7+sx/Cd0JyW/vBViYqVj/u5Fns
	 /+kytO3rcaqDlTibtNKW5BZq3GSXaXEtcCb88tYbp4H0iAhJbdLSFGwpjjHJI2IVvCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
	b=HQxcWhyL/IbRX+rMciv5qdF6LWLHTzbKwGnBGfh4AKTZGJzaXuqS1fu+rl5a9JM3G3mK
	 eFSlJWrxENocSECZ+bNQ0udncnfUPcCnKuXoH2bqlwjpHazZQekCn0WN4SARh/0awAJsH
	 KLsVUYWyb3z6217mE1t0PcOCbg3TN6WO64NEm3CuergOXZBqExMx2wZftV6571pWpNMgR
	 EBhawXhlshZn9vEWm88RrmXYl66KSBGS7Uj84rSo+UKRYd8l8/kVtsxcWiWHn/YDofKa2
	 RWznEO9HSgyAzq66ynw14ObWU44vCguFYewfqZAvzpB2pO+BPdYukXEbAYp/Oc9iNCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TR8OsAv/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F36082BD4
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 12:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 738F36082BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8OsAv/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so16854065e9.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 04:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880690; x=1794485490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
        b=TR8OsAv/YsPNWNpVrMCE5cD32Tibu91NPJjk+QzARhYEOFihEoqI/xYFDIKRS6ifZx
         0jMqwnOZRKUKkP44KANXGDxObBYqSff8Hn40lFWcx1SARV26sZSpsSGfJzWXWBYysW0S
         Rxdmikr5RKS1eaJLDF2AuI8LTgGpAnvta0FQLjQEnBWwPhTeCX56TFnsWYoqat45JtxK
         IVlW9RywwZys9dtkRQ90IK3nRnZ1XKO2+7m9WGHMM+BstqFlGDdE/LjP/VkWTLoZXEHK
         ABWQKuPwqPiAuQiv3J0YCBKF7X3m6CX+tDnX0Dbsn/jSRHH49b12nVWdXPgJKX11m2a8
         h/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880690; x=1794485490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+CmWncL7kwlaiOlUzGSlbN8SKe/VBMyBDE+45su+XU=;
        b=uA9BM8eZfLmQkidXb87vo8m3f8o4o+QBEaILOspbWSV3NmjwXiWqsBgvab+v8NbrJS
         SwGDYZsE2wBf3iHpII6SvOycur7ol57CWXMPsZotafm81+RALQ0OkLIV90+j/tqKXIq4
         3+GPCtTbdx6yLviJ4VROuiVwLKLFcYe4OtZEMpeH3cO63lYxtXquRobflcZZ3qeT3Wmd
         Dbg+7pqdWv3XzJeWNKsmWw42sNnL+i1r2A3TBAxBwBrYOoERX4tBTSZFWSwui/zAfMno
         Q4DQ1azDguLieyXfLJauSac8ZDqbmvkv+IHXR//gZJzhyNQqaSnxr0ngbZd5x4qgzM7V
         +Qeg==
X-Forwarded-Encrypted: i=1; AKwUvByT85HSKiLwVa61QB6Mpk5EyxPbFHnFCb+6b1Kt038kR7UlEIgmmRwO+vwRKAVucDJ0ZYY24+Q1eQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//umpg3X3iXaW7iHugCj4gfPjbwZ0aXRlnAmCWEejPajX0YAFF
	/hJ49xZpOokMWv+5Mo2PLSEGnlHAg5P1CQB0tZOahl3BBMxtH8minfxr
X-Gm-Gg: AYBFou0+iEoS/NI03O/6JXE9/uOQ0GTsrZIdxX6jYmTTPI5OIkjCBVdT6hIMzEE2+ck
	E3ZSvyDpipJMRRVExrMFEm6G8hahSZobxdiZN19kM52Iqmf4I6+UNHpXQjdQSsSgqQsekimDic2
	FUO4mVJKVz4LZDsUjnlOh1/+aRCJ+NzRkkHklqjhV9JNfTH1VIdpQRrLw2ymXIwca9wZmPbgM3b
	IbqILqPRIHIh+6CICJpX/TAVHDd65TlOajRsT0mp5bkCpOto/E4kc427ae8G70/kqvq6Gf6eiBd
	VV9S5MWsocQJaIDrW4iagl5FX6LVSsDgvDQunAvea6c5tmzMhlGbt7V1rvtO05ABPi04/xR6J1g
	Pcn7voH2s7Uc9F36UhwObYF4h2W7UeDuzX74neLcDY9oo5avBH8jo/XnMTwJdaPUP39XVubdhSD
	FTGiHQlBT8vHfLm27IRjHsmrezZTg3K3NPcSsSYaWX/qVVjSr5VFS5ACHU3pJWZ27m2FvPJ4Dk+
	0f8/IByE060EHMMoeZb6KT/u9QsGXI0u9cITiz9xt1LcW7gfZZ1mHkm0/L4ShKIGtj08vYg0z18
	u4fX9EKlIpelrp1TdxwTK0Bh+FqmKOTlWiT5i/0fpxAokc9OkP5nsUBRTTjpcjv723/SbNO5B8t
	j6fKKBuiXR2qUGBIpxohyjqGl
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr439395475e9.30.1793880689556;
        Thu, 05 Nov 2026 04:11:29 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm58869885e9.7.2026.11.05.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:11:29 -0800 (PST)
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
Subject: [PATCH v10 4/5] clk: en7523: generalize register clocks function
Date: Thu,  5 Nov 2026 13:10:57 +0100
Message-ID: <20261105121059.11201-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105121059.11201-1-ansuelsmth@gmail.com>
References: <20261105121059.11201-1-ansuelsmth@gmail.com>
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
index c05d0bfa2340..979dd9c20a4f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -151,6 +151,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -801,12 +802,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -1290,6 +1294,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

