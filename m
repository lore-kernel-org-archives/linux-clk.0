Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A5231F99E
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196460; cv=none; b=Ws5wlslB2k3ZF2B/F1sBlhpsmLYQ/SpVSNFEkRw40XyI6yKwiousR15R641VQW+agoRU1fWJrK+TKHseByFSGTvfN72U7WzGLzowZvaXoGEmeVSU+wHJ7fUAdO0dnnTHBLk7m6Z+mpaEwZRjxEYRPUCl595CYkqvjCDFCPLFxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196460; c=relaxed/simple;
	bh=4XlumCp/Xv4Z2A12NCGaE5efLc7vIsAUAdlJ+AL8IkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ro12A6FGiaRVdMlccLUeD1+HpVzxeNf4TEzqQn5i3PeWe0zy7n/F2gDHsoBOg1o2ErPFxR9BwOANWtvDjMEmZDXaK+6nIUqUm2utdqwuuRftYZLRkxhre+yVd5DBXNgay6xZ5GAMV5hJmrfR40zA1c0r9OvOUu/059aDQR4jOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWjsLreu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWjsLreu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cf906b007so3499007f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196457; x=1776801257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=;
        b=WWjsLreu2NffCOqg3VCcgPcWtdmM7Uo8j/+eZfrHpTHWNw2G7TuL/UcSD7uonYK9Pc
         GGzi4NmELh4MeRVxg1a/LYNPzWy20DLgyeuPispIcgiiY5ZkChpLI8nq57iGylooBERo
         7kmJ9uLPIP/iCVuR5Tl3exOt4FoR/ZgUGokFAaM1LuXtLFps+36WxLJOZJePmQaPH2Ab
         zdi5kK738X1hi25USmq6GJlyv4q0zRD+hajg6P0VbvD0xxhbkWVTJhws7G/IBjZ//4g0
         OZojANypj0UUA87cL4EJcQ9caN8IVg8CMQ8bSl5w0xiuW4sgiGUEhzpKDmFxDyX7v350
         xlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196457; x=1776801257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jF7dBZ/WN9rRtO0aE9An/UmCnaIWqDXi0co5rgeFG+w=;
        b=WN7Vs0/QtkENr4L2DGZ03zyGcytnJOoRRFo2EXFFdjmI5GdfrrY1mNcGCmAv5W6hty
         pKV7xWqu8c79Hmiz1JQSd7fjrvzeXmRN2Rf9nqP7vzpSS5b/E3S+mkdv6/LbJvbE5sbf
         j6pKONivjNqHPX90cABhurqhGrubPtIzkHpBUog1PKO2g55zvss1Cmj3EtUp4vohF+Yh
         k22BmG8Y5u+5nlKF4/tn1Kt/yZX0e95s8alubh7HFS8lN/hMxZylZQR1vU14rRB/6rrV
         YSYpw/V7IG6KNln/jTIVCGyvpoCK6Asd59r+zJ9VqW6qEGX+khe4ZGXP+ZYtRGkUPzYE
         iU7w==
X-Forwarded-Encrypted: i=1; AFNElJ/HlcF8Sd15dIPvYHVxdFsUmKJk9cimi1Nnh6COyrxhhhVRRjIyLj4BRsczk07amkly5Rsc3UXW0+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IQmY1pi7StfbaZzMZorUjVqTgoa5lnqPVgqorNssac06CVSH
	Btp0txHR6LBOv9osmQEoFud0ukdmJi7JJk7zI32sH9+/m/25jqD8WnOT
X-Gm-Gg: AeBDietBlpY18I7gH1LGDTLdNambjuN+gIl4j+jhv5zOhzvE10GPm96OuS/BSOn5dgK
	3FmOuzMuBx90hBQub/JCy+R2aeHT8+7eveMt8FonCjCCkdj1JFTdQrg/8m7hndaVxvyB2gFA537
	Oaya6hIf+PYLiDWBxS3xYX9F8Vl3LWRBu2Ko2ntC9ybe8D6JcMgjkBOZkB9ckmwd+yk7LfaDAOC
	WahU49jG9PnS8HN1YJEbysu3zk4I+zkTcZkdtd45x1hxq3tZBELKLNjMd69/y/aSNjrq/DvmWR9
	bvBO2CDu2Z+zD5mOp8x13AXLW4tGtgEdMMsOfwfT4rbCCQ6MMkMJj+B+lFPpj9Sn3TyLhmJ1Zo4
	Gpp3vO9umCX/BPt95YfqhRUEJCrZjtoOwK7HgTCrwqPUGgGGIKhBgZMjf3XGTa1maUUKO9f4GnF
	cw3BCgYr8hSDdZEwyY5Pfw5DDI5fKslbxipVE5RmNLnk+SAS8KqOI/txFsX84+1EBtB6RU1x63t
	hD7epdfXO2B3y6kpWanBUw=
X-Received: by 2002:a05:6000:2689:b0:43d:c95c:4259 with SMTP id ffacd0b85a97d-43dc95c427amr7827550f8f.30.1776196456620;
        Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:52 +0200
Subject: [PATCH 3/4] clk: mmp: pxa1908-apbcp: Add reset cells
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-3-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=Q4T/ABQPm6i5MvVgGhQo6QXav/d3IJrFZbQDihPCsb4=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU68vyn38galmo13tMuVhFiqpQMnXzXuEHfdXjElS
 P0nB29/RykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgIkcecHI8MnrdNWd572+f04t
 Nn95Jikr1JNT4tmEB2uPreebskZo1mOG/75vxbsYZHsXO5ef2WNUMWtDa+3sc56tN5PXTzr4xft
 KES8A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

It has been concluded by comparing the gate clock masks and vendor code
between PXA1908/28 that PXA1908's APBCP, similarly to PXA1928's APBC,
has controllable reset lines. Describe these in the driver for
correctness.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
index f638d7e89b47..1aa476103553 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbcp.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/marvell,pxa1908.h>
 
 #include "clk.h"
+#include "reset.h"
 
 #define APBCP_UART2		0x1c
 #define APBCP_TWSI2		0x28
@@ -24,9 +25,9 @@ static DEFINE_SPINLOCK(uart2_lock);
 static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
 
 static struct mmp_param_gate_clk apbcp_gate_clks[] = {
-	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x7, 0x3, 0x0, 0, &uart2_lock},
-	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x7, 0x3, 0x0, 0, NULL},
-	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x7, 0x2, 0x0, 0, NULL},
+	{PXA1908_CLK_UART2, "uart2_clk", "uart2_mux", CLK_SET_RATE_PARENT, APBCP_UART2, 0x3, 0x3, 0x0, 0, &uart2_lock},
+	{PXA1908_CLK_TWSI2, "twsi2_clk", "pll1_32", CLK_SET_RATE_PARENT, APBCP_TWSI2, 0x3, 0x3, 0x0, 0, NULL},
+	{PXA1908_CLK_AICER, "ripc_clk", NULL, 0, APBCP_AICER, 0x3, 0x2, 0x0, 0, NULL},
 };
 
 static struct mmp_param_mux_clk apbcp_mux_clks[] = {
@@ -43,6 +44,28 @@ static void pxa1908_apb_p_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 			ARRAY_SIZE(apbcp_gate_clks));
 }
 
+/* Taken from clk-of-pxa1928.c */
+static void pxa1908_clk_reset_init(struct device_node *np,
+				   struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_reset_cell *cells;
+	int nr_cells = ARRAY_SIZE(apbcp_gate_clks);
+
+	cells = kzalloc_objs(*cells, nr_cells);
+	if (!cells)
+		return;
+
+	for (int i = 0; i < nr_cells; i++) {
+		cells[i].clk_id = apbcp_gate_clks[i].id;
+		cells[i].reg = pxa_unit->base + apbcp_gate_clks[i].offset;
+		cells[i].bits = BIT(2);
+		cells[i].flags = 0;
+		cells[i].lock = apbcp_gate_clks[i].lock;
+	};
+
+	mmp_clk_reset_register(np, cells, nr_cells);
+}
+
 static int pxa1908_apbcp_probe(struct platform_device *pdev)
 {
 	struct pxa1908_clk_unit *pxa_unit;
@@ -59,6 +82,8 @@ static int pxa1908_apbcp_probe(struct platform_device *pdev)
 
 	pxa1908_apb_p_periph_clk_init(pxa_unit);
 
+	pxa1908_clk_reset_init(pdev->dev.of_node, pxa_unit);
+
 	return 0;
 }
 

-- 
2.53.0

