Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C132E72F;
	Mon, 27 Jul 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785138127; cv=none; b=dOV/3ooW4YMJxbJPOvbS2H6nkzbKUj+YoKPCb8ZY5e32CRUTr4wErX5dYJ422XfIgB2sSrwPE0vNhHfB81DLtz+nTjPww1UmhGrlQn9R1t1qtHIM33kkscugSe9eN1dbJ9EA735t/Zg7tb8WRT0WUscDxtEKAegAFU4jfg+Iq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785138127; c=relaxed/simple;
	bh=QNXOonuv1valg/nRJC7O5rj3IkEUwGcLuFVmHTk054o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/NWdFMSkTkgHLFQwTHJFwp+E+zs7TJbYiG5maFAHOxdf2C7iKH3tCwWqic7eahd814cj7B4ThuGPaGbZXrh/3BKONPJaFEMmJHEGoHgkAqsjZ7O7bSNaNnkVe8FmJJqm8GSo5kDPK+C7apXWORWDEX3lo4RZQDjoBXhJBVXNlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FCPL8wdr; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FCPL8wdr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9728B4E40F95;
	Mon, 27 Jul 2026 07:42:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BAD3601BE;
	Mon, 27 Jul 2026 07:42:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B1FD11C12195;
	Mon, 27 Jul 2026 09:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785138122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Eu044XGRNIGnhB0ETi2C5C9oTxkBSkJxiau0Mxs+vTw=;
	b=FCPL8wdru7YXqcJ+dJIaUGq/Xb+gw6Tw2gGJOUGc9FfzF3+yt9NoV4aNjpDbmM20chNkNi
	j+uqpD1UkDrux4vvjyRDY7AMVHqglnslsCtNLK3UhwHXF2VQy1pfE/nmxTt6c5CFIHetTN
	jNMhP/5jaBlXtetQ1CGwPDr17TqE4vzkcwFQZ+2278yVl58QNnENqREpK5N3G8t3ilbcNv
	tIMIy2fsjB8c9XTQ/UG8bJb3lNSOi1Ha2tKHRLbSP/9UITnSrliyBRV4VvnndoVG7Dlra7
	6Z6GgVeYXmaUxYjeyVdsySRmpvXTeOot+aNux4oL8R+asCM1AU7FYK7vShBNfw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 27 Jul 2026 09:41:41 +0200
Subject: [PATCH v2 2/2] clk: ti: composite: resolve parent clocks by DT
 index, not by name
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-mathieu-wdt-clock-theo-v2-2-c048a6394436@bootlin.com>
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
In-Reply-To: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785138115; l=3154;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=QNXOonuv1valg/nRJC7O5rj3IkEUwGcLuFVmHTk054o=;
 b=ukVarbgCaMjrUOZ0k97whDQsyND38MFMkn8iUL6ee+DvEstfZlLB/B4E2Lv9tFEPCv/uGuvGy
 wSRjomeBPyCBi4QEuiCJ2mbIDGIcTFIqPhQNeRMJeqZQ6HDlw0zQSRa
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

Resolve parent clocks by their index into the device tree "clocks"
property rather than matching names as strings. This makes it consistent
with other parts of the same driver.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 drivers/clk/ti/composite.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
index c379bbdae25a..01eae8995254 100644
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -52,7 +52,7 @@ static const struct clk_ops ti_composite_gate_ops = {
 
 struct component_clk {
 	int num_parents;
-	const char **parent_names;
+	struct clk_parent_data *parent_data;
 	struct device_node *node;
 	int type;
 	struct clk_hw *hw;
@@ -116,7 +116,7 @@ static void __init _register_composite(void *user,
 	struct clk_hw_omap_comp *cclk = to_clk_hw_comp(hw);
 	struct component_clk *comp;
 	int num_parents = 0;
-	const char **parent_names = NULL;
+	struct clk_parent_data *parent_data = NULL;
 	const char *name;
 	int i;
 	int ret;
@@ -155,7 +155,7 @@ static void __init _register_composite(void *user,
 			continue;
 		if (comp->num_parents) {
 			num_parents = comp->num_parents;
-			parent_names = comp->parent_names;
+			parent_data = comp->parent_data;
 			break;
 		}
 	}
@@ -166,8 +166,8 @@ static void __init _register_composite(void *user,
 	}
 
 	name = ti_dt_clk_name(node);
-	clk = clk_register_composite(NULL, name,
-				     parent_names, num_parents,
+	clk = clk_register_composite_pdata(NULL, name,
+				     parent_data, num_parents,
 				     _get_hw(cclk, CLK_COMPONENT_TYPE_MUX),
 				     &ti_clk_mux_ops,
 				     _get_hw(cclk, CLK_COMPONENT_TYPE_DIVIDER),
@@ -190,7 +190,7 @@ static void __init _register_composite(void *user,
 		if (!cclk->comp_clks[i])
 			continue;
 		list_del(&cclk->comp_clks[i]->link);
-		kfree(cclk->comp_clks[i]->parent_names);
+		kfree(cclk->comp_clks[i]->parent_data);
 		kfree(cclk->comp_clks[i]);
 	}
 
@@ -237,8 +237,9 @@ int __init ti_clk_add_component(struct device_node *node, struct clk_hw *hw,
 				int type)
 {
 	unsigned int num_parents;
-	const char **parent_names;
+	struct clk_parent_data *parent_data;
 	struct component_clk *clk;
+	unsigned int i;
 
 	num_parents = of_clk_get_parent_count(node);
 
@@ -247,20 +248,21 @@ int __init ti_clk_add_component(struct device_node *node, struct clk_hw *hw,
 		return -EINVAL;
 	}
 
-	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
-	if (!parent_names)
+	parent_data = kcalloc(num_parents, sizeof(*parent_data), GFP_KERNEL);
+	if (!parent_data)
 		return -ENOMEM;
 
-	of_clk_parent_fill(node, parent_names, num_parents);
+	for (i = 0; i < num_parents; i++)
+		parent_data[i].index = i;
 
 	clk = kzalloc_obj(*clk);
 	if (!clk) {
-		kfree(parent_names);
+		kfree(parent_data);
 		return -ENOMEM;
 	}
 
 	clk->num_parents = num_parents;
-	clk->parent_names = parent_names;
+	clk->parent_data = parent_data;
 	clk->hw = hw;
 	clk->node = node;
 	clk->type = type;

-- 
2.47.3

