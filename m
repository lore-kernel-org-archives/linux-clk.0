Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71B246BCD
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 01:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548199; cv=none; b=HvIDa+niv0TY86FdJV/oFZcTJA6nSNeHBDqe+cgeHcUCbiu8vsOXHlpkZv64ys4qVtsyyfcRnehvK4OU/u5xZvJYDvLPuWQpeCV70BVFI37gfVaxt6jwt68Gjc9t+dR7a/mgcxtwMjG7WCUYzEk4dY8VfFAPARYUejQG746z6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548199; c=relaxed/simple;
	bh=bqil7zBaG9kspya4dNdqi2txgIzDULQeKLYoZtT7SdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QFUCWxc6lm7v6EGdzjXeCSXqEo+OrwVJZ7QoR+SEgehrOYgr96eF1YhqHb1ZZE88c8RFngtpW/OYpFoVN+uOPLHuFZ1+VmdniAtfJJqcx5rocFeV3tXgmkOBHnKG1G0TkFbxXKVjSjSWswqOWwHqLUOOsHckV3sxOaoXP2DSHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbDLSMs8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbDLSMs8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba4a1a0325so34990865ad.0
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778548197; x=1779152997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3DBOM8+Fy+ckqlLDqnvesNP2xfgGGtX6J+w+g7xZ/w=;
        b=dbDLSMs8dyfkrMsAB4iZXRS9B/03GlsYNyDX46ObcRZgJ5vndVY3OWFz/C0VqipjLi
         iKDo/jwHSYZts2OFekyFi2STPSdqBb4F4dbypmNaskmnUbuuVEeXkL+RiRR+EgU60gEV
         PWKc9X5z5BPsD3Z9DPdb33yB8VVSy1eNJmq6SwdqqmB0m/ygqoxIG+alqFv0qtTZu24K
         2cTqphZVz5eTL2of6JL09CWOYXpSAREMtPNxPLhu3khzR+q7/e9umPqyuCsFBMIvhW+F
         0/2S30FSIw5xrhLPBRg1fFxDE9PKnN1742JMjIWtJ6wPUFZddeL0XEhn1i9ZHFidLNqz
         gvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778548197; x=1779152997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3DBOM8+Fy+ckqlLDqnvesNP2xfgGGtX6J+w+g7xZ/w=;
        b=UF/31ofZw24CXw1TU84RUSpc14kcb7aWCF4scK9Otd73SUxebj3FERXKRHRbE+sWtq
         qUIRZbDUW2QRhVxnNCkljRqMd4TRLceNNbVHFldzbKbzmUD1OX8FnTD80vn74VLs5P3O
         071C+GFVq1WPVG7Fuuc2Dm/cKUmvUFqgLMKVo5Dmhdba8SgNVthHO6xYIbr43/8Z0D1a
         ZHcZ4Q1wQVB3e9W+qZG+UJ+arsAB7vOR6ygzpioQWre5dy7jukQ3cyj5zYJj58FNMGVK
         LA025DSgKby4QnY6AuJpOsELC3PGoItv8NAgl8zFvimNPc2E7jJ0fE/q1vh2lyo2NltU
         rjBQ==
X-Gm-Message-State: AOJu0YyEgP5vyHaQDKj5V3mxDT37G4n7rWtPUcwJBPavKU+MwYppYYGy
	FzprLmQccSJAD/sR3B1/4lVVIePZEX5TZGd/ulTv+JvdYiJ2XaMYN+PtENupGR5a
X-Gm-Gg: Acq92OEzNpttDygsF5NTz8+nVeQm6wLl14Gz9Vma7RB/sSO6If8TRyVut0H8v8DF+yU
	7RhnCKxTSNsrq4NMdo/+aid06+mScCbGo9yerHuABLJWmJv0s0xI1j9ka7ZZQm44AT8WrhVIqAe
	tVpNn2x/au/oNR5aWYFXxlFZk9GyyogS9rA1rejeH0jMFVNKB0RV3JgqTMc6pnd6oqaJtdjTmU0
	EhGCConUIGs3N6xZ8a0MQMYYgvhZzhZteht0Wp0tAgIzLPCeRPJr4gqaeaF3IZbfTIMi4pKUH89
	3wJ1hTnvIc9XM0PESkxqfh5XTsvbb3htxuCizEDvvPZ7Gmza5J5OKIbgyhcM7at/faNXLOwhr2p
	jf9blxpQAwZ+FSt0BFuiNcRZ30mnsUR8hkBJ6ZfGcZArzcebVNGKTbZH/Oa/xJ6EyKTdbCq1PpK
	a2nW5BqCBSfLPWTWCEbQlLdbOFHHu/UQtuRZeKlqooTLa7hGE3QTIyPKyyU85hV6t4KG/6x7BFJ
	pYfefaBR0OrZJLDVcaXDv7aKUqQYTKMvoQ=
X-Received: by 2002:a17:902:e552:b0:2b2:5840:809c with SMTP id d9443c01a7336-2bc7a97bd6bmr137766125ad.1.1778548196643;
        Mon, 11 May 2026 18:09:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d4057fsm112290605ad.21.2026.05.11.18.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:09:56 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: pistachio: Use flexible array for clock table
Date: Mon, 11 May 2026 18:09:38 -0700
Message-ID: <20260512010938.41114-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the clock lookup table in the Pistachio clock provider
allocation instead of allocating it separately.

This ties the table lifetime directly to the provider and removes a
separate allocation failure path while preserving the clk_onecell_data
lookup interface.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/pistachio/clk.c | 15 ++++-----------
 drivers/clk/pistachio/clk.h |  1 +
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/pistachio/clk.c b/drivers/clk/pistachio/clk.c
index 80c722c77a1b..03e28779011f 100644
--- a/drivers/clk/pistachio/clk.c
+++ b/drivers/clk/pistachio/clk.c
@@ -17,28 +17,21 @@ pistachio_clk_alloc_provider(struct device_node *node, unsigned int num_clks)
 {
 	struct pistachio_clk_provider *p;
 
-	p = kzalloc_obj(*p);
+	p = kzalloc_flex(*p, clks, num_clks);
 	if (!p)
 		return p;
 
-	p->clk_data.clks = kzalloc_objs(struct clk *, num_clks);
-	if (!p->clk_data.clks)
-		goto free_provider;
+	p->clk_data.clks = p->clks;
 	p->clk_data.clk_num = num_clks;
 	p->node = node;
 	p->base = of_iomap(node, 0);
 	if (!p->base) {
 		pr_err("Failed to map clock provider registers\n");
-		goto free_clks;
+		kfree(p);
+		return NULL;
 	}
 
 	return p;
-
-free_clks:
-	kfree(p->clk_data.clks);
-free_provider:
-	kfree(p);
-	return NULL;
 }
 
 void pistachio_clk_register_provider(struct pistachio_clk_provider *p)
diff --git a/drivers/clk/pistachio/clk.h b/drivers/clk/pistachio/clk.h
index 2f4ffbd98282..1b9b311b9656 100644
--- a/drivers/clk/pistachio/clk.h
+++ b/drivers/clk/pistachio/clk.h
@@ -142,6 +142,7 @@ struct pistachio_clk_provider {
 	struct device_node *node;
 	void __iomem *base;
 	struct clk_onecell_data clk_data;
+	struct clk *clks[];
 };
 
 extern struct pistachio_clk_provider *
-- 
2.54.0

