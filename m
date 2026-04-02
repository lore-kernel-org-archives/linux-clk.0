Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7181A6830
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775089231; cv=none; b=GYfUD/Yu2E7gJrmT44sCA48DoSC4o4oALrxBqOhYJSXhxSCNXkx2E1B+TRbSm7wwAascm/69rI+OA18laJ9YBA8jpySBD4ZjreN4WQ5ITTF0lDduZfe6vDQNXqSnRy14et9zzvZ5u7hvRCT7JOEEQzX/9Q0iaj/6RHeNaFcFuNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775089231; c=relaxed/simple;
	bh=/6ausaTtB1EwdmgBARDVXnzjs0gUU73ZHyMDrVpLs0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jVPwNZDZeDAHWVixws8ikKKMIProSyb5PYs5dkVHcR/kRJrkvvlwIgZ4ci1H2C39l7pcNU9RC0JAGQ95pHWq16SScpBJ/r9Ogrw1PgcGcJkNawpQGY4P29vPhXaS9yzCABGJiQYXwsjJR26lBPR0LvqiOEkUKcb0IUCVeSS2deE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8Isjxek; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8Isjxek"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c156c4a9efso405736eec.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 17:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775089229; x=1775694029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXMgCcTK6RGFXVFZT8A9Tz2PiBZRhwxEuoWHnwTbJPI=;
        b=R8IsjxekSOxOi4ABxGhyASsYvZLZl23DcWTwybApc/AO2ClEQRFNfMujwhFwwU6/hb
         zVFyQ3ZDhVNjYyumIym7iB0/A1fShBlVwpXc2/GD7k+fE2VnlingOBZq9BZMFJ5jcFoP
         olW4vflenDH2mOthfmuBZXzEvdE0Cj9zM7jOx/UAArTZfgiFEyUa4E9x1uF33XL45RYE
         hE0aCP8mEtuIS9XazBiZNra5xioWTfoDosJL8D01f6oVG2tVmZHArNnvHvH1lbDVbQSM
         lDRZ6oumSV5PL+iZsRVaIe4QfmF5MnLxl/7ViZUOjyZqPk2kkIC0+liON7VHeTVoU+Ol
         z75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775089229; x=1775694029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXMgCcTK6RGFXVFZT8A9Tz2PiBZRhwxEuoWHnwTbJPI=;
        b=mqPZPFwmlis1h7bDeMmAs/TToujp06kFX3hro/39B1s+4zCb3uZFtjXvIL1ts51V3h
         IXdQFodIIpnHbLxr4ariTLJPk8QcalXZkCDgmfpSLaXwaH+SGyNc690lDZVcZ7C2yLRG
         CAXU4ar1cEQH+My8gi6ao+MALU7WGvOgmkbXA3h1N4KHIwIsIz42XYtlTjc7WeJZe8FX
         wWWR7lEEqeHW+NrXFTaiYWXEyv4JC7GnUA2TZP8AaOycXAUnvNQrWEs/adB3in9l+O7H
         qajHRH+Arfi+llKBKwtKiRV9/z5tRa4k6dB2xd91qWFeM3gSuGE6/RLqVD5DiDpuu44p
         Sgfw==
X-Gm-Message-State: AOJu0YzFwHrnNMLxu1nFjtvuXQbCfdmpPwusKQPhGAltjqNocHrxWSUr
	h86ZaR7xNeXobFafOdmrnkhGN8tbG0KaKPXcK4/gG+OMV7WSUBekqEVNIxNA4vAn
X-Gm-Gg: ATEYQzzf+swuFq2ISXiLRAfAr+AUH7e6Rskx7hQPM6up3TTjtv1ZkjRGEe5hYqUVr+Q
	K3ys6RCr3Sr2bKEbrBh8uzZvJGwMo1uM1kDEbJMgw8wohlYG/YCLdbS4w6GiMAojvHiFsAEeC36
	5b4rQt4bF0F8HrUYSPWzN1rBiBSEC09AASE7R6yNbgRPfViZbUZPaD9ToBZz2555SH83s681/zx
	ki6NL9bR62QIb2VYGYclyp4/oTAbfsHvcs0ULFM2iGP4BNRJ2iYt8S5iv/ITpje4srgS60mtr3S
	ZA0QGDFjAW8396ZhAJe9DLX5KpHf+uW+tuIHAjMRUwi1yex+tG4RAq9tPWMO/vUSR2WKnM9zZjH
	hJ2eByOHtPqkFuwd25lIOi3Ldx0GH6pZKfRjixClFe12GyhhZ6SxUYh/YHh7ipl/+zm4nmU9JaQ
	uFnWYoNJL0CgiH24kDoXEenm0+OlqUmSBwERR/ALEa2hqRdDejSLSpO38=
X-Received: by 2002:a05:7300:e613:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2c932eb27abmr2824768eec.26.1775089229350;
        Wed, 01 Apr 2026 17:20:29 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d93bsm1031337eec.12.2026.04.01.17.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 17:20:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: mvebu: use kzalloc_flex
Date: Wed,  1 Apr 2026 17:20:11 -0700
Message-ID: <20260402002011.89926-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine kzalloc and kcalloc in one
allocation so they can be freed together.

Add __counted_by for extra runtime analysis. Move counting variable
assignment right after allocation as done by kzalloc_flex with GCC >=
15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/mvebu/common.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 28f2e1b2a932..4129690fcae0 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,10 +189,10 @@ DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
 	spinlock_t *lock;
-	struct clk **gates;
 	int num_gates;
 	void __iomem *base;
 	u32 saved_reg;
+	struct clk *gates[] __counted_by(num_gates);
 };
 
 static struct clk_gating_ctrl *ctrl;
@@ -257,24 +257,21 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 		clk_put(clk);
 	}
 
-	ctrl = kzalloc_obj(*ctrl);
+	/* Count, allocate, and register clock gates */
+	for (n = 0; desc[n].name;)
+		n++;
+
+	ctrl = kzalloc_flex(*ctrl, gates, n);
 	if (WARN_ON(!ctrl))
 		goto ctrl_out;
 
+	ctrl->num_gates = n;
+
 	/* lock must already be initialized */
 	ctrl->lock = &ctrl_gating_lock;
 
 	ctrl->base = base;
 
-	/* Count, allocate, and register clock gates */
-	for (n = 0; desc[n].name;)
-		n++;
-
-	ctrl->num_gates = n;
-	ctrl->gates = kzalloc_objs(*ctrl->gates, ctrl->num_gates);
-	if (WARN_ON(!ctrl->gates))
-		goto gates_out;
-
 	for (n = 0; n < ctrl->num_gates; n++) {
 		const char *parent =
 			(desc[n].parent) ? desc[n].parent : default_parent;
-- 
2.53.0

