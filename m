Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217757;
	b=Y4dSmsU1Nlc+ovv2MgfKbzjXjXMq6n8QVw726HQ8a8RmQOzRyRVjOJHcCyKE8eizFff5
	 976/hmwlzFa44bkjDkxW571xSq9tbuO4dW5rS2AZncDXrFV8ZFZ+O2Tz0MVHSqII1yXSy
	 Z4WXmqr9GC5/WUlFQvfALbjRqLIi0DQyBeqNzseqo2K2MM+QZSVHDtInyK0ds3S4U/BD3
	 kvEzPWJqVmQitYg2GNRKOvv8U7taeQskKZYPvusX2aDQ8kP3wGokHHmS5x0XqIFilohEO
	 FixetmOXwEg2aZfRe7j92gMfOeu4/nJOQzRRa3+vnpBjcvYy18Z1tCPCyK6CVzci2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=RkAYBjNsaml8I7RA7uabvpEZ4ami55IsgkrLp7HHp2GrrDn5B+KZJ9w9s+rddmCELoo/
	 dsntBhkjS3RBIROksfJI6bsl0NehBSpFlsMWkf0W1LhLIb+g5D1tUgrbG4nQHKxffkS7S
	 esaKmLqhtmBTi0Gh4ZU+AIBF9rWTuTNNLAae6tacp4Vbq5BlQwhJ2mlvNS5bf37O6QFuh
	 EbtYlAADSyuFsKWtzsO/9Y+uR9AlzUWQE78PIKhP9hIQZFgmWXKAkxaI5NMegXmEt6CnT
	 hoquGbZWnpbOfWKU3JLL9mAFKIaCZU/+MMADgE5d7/Leliy/tJAi5UDqsEFD2iUPU4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfkQXrHz;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725A60A2607
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1725A60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HfkQXrHz
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1251006f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217750; x=1795822550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=HfkQXrHzrjOE8TLe9tFLzg2TWy0FtmrnWZfm9roAjo/wtSVKw9PY4clHBwC7XJcy0z
         bwWPqzohcKLPGNz3AQ6QmXPemTGXrdylbNfHad4YyGLWJM5ORw03HxhsHGXohfToV41i
         3uBryz6X8UECS4RiAnOF4I0liXDW6wAFaLo8vCnzzECgY7BwHpObbkIJgpOPff03LGhN
         +B7cmmBY3NA3JY/3NJwvYL1w8UirxVVGH+FxvvSEDLwVz/1CspoUgooOXMdAmt5FF3bM
         xXJmGCGlYKhbxN/+r5YWoooGLC0C2lPFAx5gM907VJyxWFmBTQqn7YQKT+ZtyXqtO+4/
         jpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217750; x=1795822550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=ig53jUQ1tBYj0sA11ynhyjRlhkWUhb5ht9ERHFKVZ3GD/UdbLlPY5xWpj1rs7rQkhW
         jcCVatTFuECv2BIi5smvZGrQr9Q+m6XfDNamEyH+du5e3b4wYHjUwgM+trTs/F6Nfos1
         H9Evd6peP9Bwj5Ea1O4n0ZnvXIM4QsXgnhcsq3yrw1qx7PtQMNiz8BDh50/SkakmLuqS
         09g1Oa2zC97I0QA9G6QuEElKjGm8OFrU4XJPjuN08/dkIX64Qyf6/EsbrrY7vLmvmeEF
         ccJHbrf6Rm7DPUNIdfy5X0ucqSnlxDTHbC2/NlcKCFFQcOLnn96RVdbIzezPb53S7RWb
         VfTw==
X-Forwarded-Encrypted: i=1; AL+hErEXOq8MyMD4cox/i/0miDqQKyd/3/ApQhstz42IYA0/5BIg7FTQGd6LKZGogXsD+Tz9tBgu20szOdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lLENNvehw7OW69m9ogrPUJtC04WShUPMHdxItz/Uinf3k0MTK
	mmq3M5sOU1x+o4C/JDXfOY1O7V6a94CuHgBJOShCFu2WXSKqi78wpubzX1yutyf3
X-Gm-Gg: AZFdTZcf+Em5mmWXsllY3OhWXlk8Q/PBiOKhE2IHeXfc57LTuEGy6acnxTY9r6X7BUK
	qNTdO9xaOou3INj5W6VLBYOP2UPELdPXaRbi0zhfknTTe3qtC373OQ2sLqF9xI4z46h2f/RSByh
	cyKY71CebqJcAHScRMNjBxpt1cPJq9wpTKZiGIEm53+Z44sJ+vS5mkS7uULcX+vT3kdaozmf1Kr
	wyz/YUb55y9t9x6uEtxvaUqCx0apWY9DA0So+f9QqzgHLuTCqzVh8OeACyUbpsyh8tHjOW9kZWP
	d+EDbpI+CjHV80NZPC6Cf92YSt7Fha0zZByQuMzIVHXlK31SWHSsO1Mhkg2Ca9+9qC09gqiHhOx
	/5FEBPRI0LjlQMCAHUUIwBTePuV4TRnKrZ4tAyaZWkMav4gUZINodMX8T6szk+5yOn2xrjrCIoL
	OrrQSzw16a8ELy02tplRoUii6PABpYgQdDDrOisHFQx3RMWn+OwLGJQN45967Fb4mte+MeYv//0
	aWA00NEgF6cZMNIPnRUpPSy+59TiGHaPpZ8A/ShT4kSsaz9GzG1aFnc98MhqsWeBrhRCTBGrTF8
	LtwQcutojga6FmVAwVh6e8SCC210K3uol6Uao/V/xxkzOLHm5d49IJcs/peeXYchawk2O0PDBZy
	96e40FqNCoU5dLxI2CsH5uPedhUA+XqIVpKiH9b8l8zBLW7pQZFRg6rwNAXGzFFdRSmH4kfX4wQ
	==
X-Received: by 2002:a05:6000:41d2:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-4abb0c5d65amr9454742f8f.18.1795217750385;
        Fri, 20 Nov 2026 15:35:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:49 -0800 (PST)
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
Subject: [PATCH v14 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Sat, 21 Nov 2026 00:35:30 +0100
Message-ID: <20261120233535.164885-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
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

