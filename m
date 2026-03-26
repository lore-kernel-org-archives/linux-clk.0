Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A42F2914
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774500824; cv=none; b=q8r63CADcbXvx4cOz3i82lEiwSgriryd5LwD6C+sQx8gXpweJAanB/lUI5RLvKGwS7peZTw6W2Ps+hR45/okMwruPVgU71JoBBMjzNiJo630gihWXaZc4h7Qd+yOv0OOLRw/tyle9duwkTy44Wq022GvAAnc408ebgEZbMifKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774500824; c=relaxed/simple;
	bh=AE+hrnkxYwzsnP73p/8jhN1UfIvWjLh0eI2CoDwr2NE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQfykOWurwoShT9R4Y5YKta48rx+aCi+GUQ0eFdcLrEFj/VFt88XH9EsD3X1QOPlijzHdnbObjSGGEvy9++hS4frCdfnYWjUcvqvKkHG79zhWdtEAcaSo+NdCQyVp5UoQH+W9ESTRC0xDOV0Eaf4puxeDxGvM///IJpwXOxQTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBsslEVm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBsslEVm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab077e3f32so2286515ad.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774500822; x=1775105622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8CT+l+wfSvXRtXeW5bTLnPhjYdMNmeNRgewcvM6cYM=;
        b=TBsslEVmq2Qi4RsXbN2iUu2QKMEP5G8hfD+1u4OABL3N1QcOyZhTTACB1UgneDFCob
         TmNgeb49amkoXt7RGzNfzXXg/9pfzPy96rsDy4lm/yuN7HgW3ddSvNh4SqGEkjGOV8dU
         sFOwbqOYDQy8sEmYOk35qWs4JFvNQ8jfKlyGcIAwpcBAATxJr7uFolqdvuLPe3Tqj8mO
         hG8pYbvwWB795emgyPDykjJNcENXCPp8dp1QYXCgMUGEpG10VsEuj5c02C6bnMKFaSl+
         wSkvLJcc3fogWj6LxdKhZG4Ib90Tgxvx2kz6GZbJ72DD/FTHNUFUpzL6tyQx3Pc53BdH
         vNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774500822; x=1775105622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8CT+l+wfSvXRtXeW5bTLnPhjYdMNmeNRgewcvM6cYM=;
        b=KSaLGDtffHkJDs7JIXLBo+rBSKVk2bfBpto6Hi5oEeP/t9/RnS2Wy5t4NkEmsdkcw/
         LJv7xAui0Tboq9/enzuovpFWN58LEUanYs59Bgy/dRu5fI92Pc3HUxd9eKoF4p7KgGqg
         TStMlwPnU4D7z0WA0VGPf/xm/moZgZZJbSnuFYE6YCZ70GWAjjIHq8uZxMvyAoAApM94
         Osith4fA21xU13SkOFDMKmjomXNrrlT6mE+KLyLl6IUrCzSyY+AtJWwRgFPybJ8AKIdC
         GR2VX3RVI2unxoZ2VDvkFajwD5NV7AL10kGnRC2CWXTIH4Mo7u1sY2vW2aPzIyMmv/Fr
         djkQ==
X-Gm-Message-State: AOJu0YxO3sbOJ8vEoiQ8nVmOGNT3nkasNsfyHcwsDERymub0FOybgE98
	g3ZHjG7W+VAkY9v10JLqX1K45kQwbygY4J2AlrHZnVb61PRViB95WHXWbsHejnnd
X-Gm-Gg: ATEYQzw1LNyaYtKdrgoPoDgYC+29ysTl3jffx+Up9k6wDFqZAcmllpkjzHvAXlqCCTU
	MimNhdgp7feI9IG5s1ei4uKNEkkUL9yLczMXVmB327aMeZ4EtuMZPZK6W17fDvlG7byTbqlO17H
	0E4Il27d1GUOdZ9wy55/gvYiL8btL5zph9Pcaf3uT8bejrvQvU+KniECpaex0j2HLjmy2ShKeoA
	ypA9OgAB9RHTVVtIK5P+Qqdhniy+ThRjsgdTiFhDFwQaWQCcbpRr1924pungT78D4SMLrDhIs1d
	uRCmteF556YgHw6+FIdZtplOJDAe8PxeaxjsK7bk0zjnImj8LcE+lxSGOsO5IE5YLGwAzr0yWor
	Si+Bas7U3IWURiyRnYyo8c+fyaXh1K5z4nu+STBdUq7MH04QSMNizvR4XgEfkVeQ+SaImFJQtXZ
	MboYoHuIcGvq62g2syoabJae1NxwDFsjcJD+iSZanLcPnXvxL1XU3ZJ8s=
X-Received: by 2002:a17:903:3b8c:b0:2ae:5a55:3ded with SMTP id d9443c01a7336-2b0b0b23849mr67968835ad.45.1774500822031;
        Wed, 25 Mar 2026 21:53:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7add48sm16079885ad.30.2026.03.25.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: bcm: iproc-asiu: simplify allocation
Date: Wed, 25 Mar 2026 21:53:24 -0700
Message-ID: <20260326045324.240150-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use kzalloc_flex and a flexible array member to combine allocations

While at it, take clk_data out of the struct and move it into probe.
It's not used anywhere else.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/bcm/clk-iproc-asiu.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/bcm/clk-iproc-asiu.c b/drivers/clk/bcm/clk-iproc-asiu.c
index 819ab1b55df3..56a813227981 100644
--- a/drivers/clk/bcm/clk-iproc-asiu.c
+++ b/drivers/clk/bcm/clk-iproc-asiu.c
@@ -27,8 +27,7 @@ struct iproc_asiu {
 	void __iomem *div_base;
 	void __iomem *gate_base;
 
-	struct clk_hw_onecell_data *clk_data;
-	struct iproc_asiu_clk *clks;
+	struct iproc_asiu_clk clks[];
 };
 
 #define to_asiu_clk(hw) container_of(hw, struct iproc_asiu_clk, hw)
@@ -184,22 +183,19 @@ void __init iproc_asiu_setup(struct device_node *node,
 {
 	int i, ret;
 	struct iproc_asiu *asiu;
+	struct clk_hw_onecell_data *clk_data;
 
 	if (WARN_ON(!gate || !div))
 		return;
 
-	asiu = kzalloc_obj(*asiu);
+	asiu = kzalloc_flex(*asiu, clks, num_clks);
 	if (WARN_ON(!asiu))
 		return;
 
-	asiu->clk_data = kzalloc_flex(*asiu->clk_data, hws, num_clks);
-	if (WARN_ON(!asiu->clk_data))
+	clk_data = kzalloc_flex(*clk_data, hws, num_clks);
+	if (WARN_ON(!clk_data))
 		goto err_clks;
-	asiu->clk_data->num = num_clks;
-
-	asiu->clks = kzalloc_objs(*asiu->clks, num_clks);
-	if (WARN_ON(!asiu->clks))
-		goto err_asiu_clks;
+	clk_data->num = num_clks;
 
 	asiu->div_base = of_iomap(node, 0);
 	if (WARN_ON(!asiu->div_base))
@@ -236,11 +232,11 @@ void __init iproc_asiu_setup(struct device_node *node,
 		ret = clk_hw_register(NULL, &asiu_clk->hw);
 		if (WARN_ON(ret))
 			goto err_clk_register;
-		asiu->clk_data->hws[i] = &asiu_clk->hw;
+		clk_data->hws[i] = &asiu_clk->hw;
 	}
 
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
-				     asiu->clk_data);
+				     clk_data);
 	if (WARN_ON(ret))
 		goto err_clk_register;
 
@@ -248,17 +244,14 @@ void __init iproc_asiu_setup(struct device_node *node,
 
 err_clk_register:
 	while (--i >= 0)
-		clk_hw_unregister(asiu->clk_data->hws[i]);
+		clk_hw_unregister(clk_data->hws[i]);
 	iounmap(asiu->gate_base);
 
 err_iomap_gate:
 	iounmap(asiu->div_base);
 
 err_iomap_div:
-	kfree(asiu->clks);
-
-err_asiu_clks:
-	kfree(asiu->clk_data);
+	kfree(clk_data);
 
 err_clks:
 	kfree(asiu);
-- 
2.53.0

