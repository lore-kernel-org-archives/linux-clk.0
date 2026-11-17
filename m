Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939895;
	b=cBXx83DJg1wjG/Bf5vOtP3JW2b2Ct0+bEhLm39EF9tcJM50Hp5nJRkOb7vUoo4cqxFNw
	 6d5etcXSBEf0hEU1HfRtzxju3R8Mn039ep7Iv0y0q8W0IMnuuq6DBEmvd366i1FQhTGn0
	 eBIomaOBnmW5H7L0c9/0whhdG9x64eudGwMYNvZoY3Ams9f81NLZQLco4e5CqfmiMarUm
	 0aRqtiVIkrTM3W1q+JuttHjAExDFpf2p1/pH21OgTyNgznxtrIIO8hMj6VnLgz7M5pH1N
	 4tJJS6Ibhnbet5S8nIaw7MFvVPSW+SkE4PzxiusfDkHJO98/pC5/h3kQuGvHoj44ZTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=LR3bc2xKpVxJGvEULJSTXl2j/Ln3DQvL690k/2sSG+FDoc0T7xQ7HRgteJEcurxxqyZ4
	 tSOkGTapM++xY7Kpdd4lCeZJVLZCPhacHxhEastcxYN4VBiBshjuV9KfFbKXch/9+xosv
	 rFZHjSaTkXIBNELHqT+DOKYGr0IfGtBR0lD4kkGJBr3k4i2yF9dzI20CCXJcRwqiXejsO
	 DBmwhOCQea5Khaj7MmEcwmlKFnpcuL3VsZZ7IMH+cRxvkGNvyc68xq02W+xVklaJTiKfc
	 J9yu85fFXxxLR9+SAK2sRKXUYmxo7AOr5TPjcItYM0g64Fv94S+kAxUUNYsi1xCC+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ1WGc9D;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A6606A334
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2A6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ1WGc9D
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so931225e9.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 10:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794939893; x=1795544693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=dQ1WGc9DNBqDAEUPg0aNC8KIXUWHJew2ixZ77l0HGgOgqHn9PiCbjqnXTxB3llBzHi
         GUvzLA+hwOWP30Hu1S8qsxTIj7LjOfIZG1Ou8Qt6t7zqvoD1gjT3hjcxa6oYlOI+/72i
         9yMlL9/sywi6eJsebPYcsBRzstIaduVNLGMzOoiX7cgBY0o9jMiUD8BjPlfbA62Rih+J
         JQYAXwEMV672sno1P2kdNJSPLn2FKvw0Yp/ZstcmkJpozFJoBjc55CiOMZANSqoLbp+F
         pos2aSzzjdXrJp3vYqwWfsgWFXyFzjOl8jtfWNGIjeM9NACZppGMtZkCN1T4YmbOCJb4
         8eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939893; x=1795544693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=I4pxae2GnP9BpdiBwvNUcuOcsdaZBcUOiQkuWf5jsnTfj3HfbFRTmfriyeNPI6x7qn
         vsLxH+eovP3PueqrQBX3QLdcw9cHtvYPxe4vvHN/8IC3YjbNs5IjpIKi2CgmG8Kt7U5d
         RqOpsmjfnCcMjpf4f94dPKOq9tcLygG+SfSXChYBMcs2WgLQeLwhLDptuHTxQMDHBSLG
         GVSK6J+QKi6ycsypPBWsCTJ0rigXmUhCLdW/EvXHfAz+1nWlTyv8A9vcIm8VxVYC2rjc
         6NbmGWB9U9FoZKAasc8+sncvUxgGi0ZfJV3jSNO+FngWiqtim9x2vW7opnTh88Rmyuzx
         Jhhw==
X-Forwarded-Encrypted: i=1; AL+hErH+4kjMhKdubpeEmthjzz8hPAuVaPGIlm4nL5fdmQohpzJWIz1kAlBBnT+Qtg851gJIgjF14bfzAoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/hzy2ARZee9jPA08h9A7lXz3UZentp5Iy1cq3oqsXNvcL99yt
	oUf7pgQ5MUVzUW9+UbCwC82QA3JX6PoAKSjAp5/6iRCMKFjKDdrQbHuw
X-Gm-Gg: AYBFou0BLLwZg3bqvxrIwAvxiS4qiWbBdQoKD2kUqbhjK7RN3e1RMGolibDFSYY0OI1
	FQMIMoE4lrHc+iTGUiN9MlJkF0Hkrcf0wuupWQha+zfwi2sCQbH5/4E5HgqjZ9NZ2akxrlwH2hH
	Q9F34xeXiochoY0jEyFrBvAo90omBqGBeIJKeDc1Gn0P4PzJxFDL0QJuAStiNm/K0UWCmvawdOo
	LG7UdBn391M1PzAPtFmbl/E8S+rjg/W4wIqhjlmr+6a6S3skXg1+eddQ8cLK4daMHgk6+g4gQeN
	48PEW03PkpnHuTijXjwFCbT0YIsoRrOvHlkf+OrGX6C57LelrfxBg4SV71I1HPrJqolPTXDVGBH
	ElRIYZN4cBC45fd4Lwh6+dMIw7CyZlg4fdzorvS1rqHP0J24DI87J9mCEy/BpZW5ffhSOlAi1oo
	3UQ3s+zq9ojspncUqbkVXdo8DHjL6+JUbHtrSf+PuSj+Sxu7jlmFbrv1xAVcvYQ8aEnt+7GBGcM
	/33E27fuAGCs+OVNo7MRuWgrkdb6w1n0qJDka3tTvUwpdnmYOmpSmY99A8gnFhWdVzgjzmP8LDe
	6bDWXrsSYLfXj5+6DLvBr4dflMufkxztLJtKxtM8ItZl1Q3aBoK6Fq9T4CS+LKBOybAlEVJulFs
	E2cxJlbAP3cqO2zU9eVczLIHNwRtjm8stXIYLLtH5lgT+GDzOrLcTL+E=
X-Received: by 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr1674885e9.0.1794939893246;
        Tue, 17 Nov 2026 10:24:53 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm134084f8f.44.2026.11.17.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:24:52 -0800 (PST)
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
Subject: [PATCH v13 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Tue, 17 Nov 2026 19:24:40 +0100
Message-ID: <20261117182444.103123-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117182444.103123-1-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

