Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42647396571
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904124; cv=none; b=axoSU4fCq/TesGyXBYpoaj6dVR0amLTLZDECCCT+qUSyyk4jJ+aq3AViUSuYGXKpcixdqPjMox0PfoctcF7ouLo/c59Ybci1ABYMkdHfzeEWakq471gvRkDA5LqiQ5dNbvwfYbok6ZLNyBGIKeCYP2CV1pvG73QPC6yf8c1P9jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904124; c=relaxed/simple;
	bh=8jn+fVkl/eNqRs3jl/U0wHO5LY3q+igW5+gBbA/y328=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/6sER6JC8t7T0s51NWebq6k/0Msff4jvLnu7UfiRjwpi0ckZPnIOxSBB5Y6Af5SgzRXrpTanyjGwvI4/SD/uA8QEJ6rh0hyrHH3eSLRZs1iC/zxFHvAG25Kj715hQ97fAZyr5Kdd/RDTiRCoHxp3a1YTxnVYS/+f0HZW70u5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOHSCJ7b; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOHSCJ7b"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad617d5b80so34550195ad.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904122; x=1775508922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuBN5LC4CCoVTyDBa2ABz4OuVl7GEpGiv+ePoy4pqeE=;
        b=DOHSCJ7bKnGPv1wBbYqAqQQr3KiN/lbWv76G9RN2AEWu/smmyMmulL+CY0CZzROGTD
         TTC2snE7LQPffsypvRQ2rUvO4UHtl8XyBTtsPdNUVjz187lLSsIB69wugQrEnuVyZyk0
         hcPqpVWJFllabuD5iFC5AIbwSsaFB+zV2rZgvzGpIrPfYLzn1Skvlq/18CprU5Rym/lz
         qJSUZgSMTe3VwyxqTVRxTuuFZ4rS9FgQ/RWrEBHcQUb2Bu5Og+wseKIpttPCfaQJSCcF
         5jNhxi+1L7H5mlM98f32t1lYdJrxQrFp3w/9wCitppDZRv763ilkdLmfL/fp24Pq8cbH
         +zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904122; x=1775508922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuBN5LC4CCoVTyDBa2ABz4OuVl7GEpGiv+ePoy4pqeE=;
        b=Bx37nFSri70wvkvF2wl6cG0PciIFOf3XVoFvBeqlGT0zrBMW3v9KIW12JdP10p3o9Y
         S1Go7K2X2Db0Wws6F9NRIdOmArlzAwRGSxCY9W9yMzR8Js9nYiq7Cg5T+eBaBTE4QoDT
         4Svfh5l9VyVEdet2qnr7FVACPRqxf5JpuoxSD0lhM/YK4ie/byxIixBAx+z1SHyEJcIp
         ruSN2nkwiJH8LbaFUl5/7Upd0C4ubGz/EAcfgG6e3JUGeaFmbQXrZBSSMpiMiC+GEOmj
         3kEFYRIXKM5Kpge/U1dUyyppAgs3AZVQirU56L0CJmn2EBl8WMOpYb8kqO9n3i9SKqsP
         mQGQ==
X-Gm-Message-State: AOJu0YxuzBxoP9sTiyclvI9OX8qnpJbTxa+5/n8QdfUPToaiOn93k+MO
	1gjHUKkThbhwRmI4OfAGdxbVP4e02xFI1y25NRVL9fziT+73BLuARd4Gvb44ZQ==
X-Gm-Gg: ATEYQzx7ZKPfj+KozhXz3jiMWREkACVNslA0QyRj1Js/xOgYt4Dh65eQvv8iW92t/9b
	4QyPtmxGo2bDXTYGNZzPKFyRBwVTQrS8QXS32NCaMVIM9SWsoJGWRLn5JFK8xX2gXqw8kgj3InL
	jADD0B1JkJPGW3Yhm2yjOz47sI0t0cwEJ24yypoym3sKQgD2QKqlukV8F4CtETlG7M6d29Igprw
	pt+/2C9XQJLA/hzhZ4BB+OV7oI1G3OpmEtOA0YA7uSCulW0F4lvUV1y3raAznQa4pDZjPGYkNVI
	QcRvaxZqzu0MRoq+9q6csnVR7jXuFJJq5FHCULaGPOwbBHO0ggRqpAumG1+BSnw6EjTWeVg5VMV
	496G7n8ouG3GgvODpmt6pGC40sulAmVgRsTpBKMs50XkIoTpViTT7Urz8dm0B0iMiGVysan8177
	JA2nTrQ38QvTOwwB/UR2N0QJSGnslE9F3LQbTxEdMhavYqQcjA0v4ZteU=
X-Received: by 2002:a17:902:ea05:b0:2b0:5dcb:84cb with SMTP id d9443c01a7336-2b0cdc240c6mr134127465ad.2.1774904122159;
        Mon, 30 Mar 2026 13:55:22 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642887sm104673825ad.1.2026.03.30.13.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:55:21 -0700 (PDT)
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
Subject: [PATCHv2] clk: kirkwood: use kzalloc_flex
Date: Mon, 30 Mar 2026 13:55:04 -0700
Message-ID: <20260330205504.10143-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member and kzalloc_flex to
combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove unused goto.
 drivers/clk/mvebu/kirkwood.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mvebu/kirkwood.c b/drivers/clk/mvebu/kirkwood.c
index ed061d82fb65..f4f62b241193 100644
--- a/drivers/clk/mvebu/kirkwood.c
+++ b/drivers/clk/mvebu/kirkwood.c
@@ -253,8 +253,8 @@ struct clk_muxing_soc_desc {

 struct clk_muxing_ctrl {
 	spinlock_t *lock;
-	struct clk **muxes;
 	int num_muxes;
+	struct clk *muxes[] __counted_by(num_muxes);
 };

 static const char *powersave_parents[] = {
@@ -297,21 +297,18 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	if (WARN_ON(!base))
 		return;

-	ctrl = kzalloc_obj(*ctrl);
-	if (WARN_ON(!ctrl))
-		goto ctrl_out;
-
-	/* lock must already be initialized */
-	ctrl->lock = &ctrl_gating_lock;
-
 	/* Count, allocate, and register clock muxes */
 	for (n = 0; desc[n].name;)
 		n++;

+	ctrl = kzalloc_flex(*ctrl, muxes, n);
+	if (WARN_ON(!ctrl))
+		goto ctrl_out;
+
 	ctrl->num_muxes = n;
-	ctrl->muxes = kzalloc_objs(struct clk *, ctrl->num_muxes);
-	if (WARN_ON(!ctrl->muxes))
-		goto muxes_out;
+
+	/* lock must already be initialized */
+	ctrl->lock = &ctrl_gating_lock;

 	for (n = 0; n < ctrl->num_muxes; n++) {
 		ctrl->muxes[n] = clk_register_mux(NULL, desc[n].name,
@@ -324,8 +321,6 @@ static void __init kirkwood_clk_muxing_setup(struct device_node *np,
 	of_clk_add_provider(np, clk_muxing_get_src, ctrl);

 	return;
-muxes_out:
-	kfree(ctrl);
 ctrl_out:
 	iounmap(base);
 }
--
2.53.0

