Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8822F388
	for <linux-clk@vger.kernel.org>; Sun, 23 Nov 2025 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763881827; cv=none; b=TZjmVfZem0Y7l7bO73LLRiO2tLXs0vmtteeEl3bhCdzY/5xYxPdq6pWOSqDeJ1tJnjPzzME1nogHnHQZOXRnkQi03ENduCfE6jq/T8+15PmAyAwflyH82BI6OiTBpMK49peu5uH5idSfKuD3OgcGEcPu6cl91m2eHc9Ri+mMNlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763881827; c=relaxed/simple;
	bh=AS35UIrgoocgbMvT61FfcV2mTciDXfKlrtWsEDDLnRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L93R2rNJEAV/BmPr0hCg66nyBL89YNFuyz+kEKUe+Z3ISYhNlaee3dm967q+Ml1JcyDRRFRzlDoQ9R9Jq0gcave9+Q5BFC+UfO65HBEOFJ2OEEL7+OFAKjXLAWdEUJAbPzi1Dhno9hfoBVlqtOfGQ6aDF6r7qVXGct7y+qs85x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmnFJO4Q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmnFJO4Q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ec50477aso13533915ad.1
        for <linux-clk@vger.kernel.org>; Sat, 22 Nov 2025 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763881825; x=1764486625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PwG2NvtqtgTxx/LedM7ZSRwupcpxNiROYVeju+b13Js=;
        b=mmnFJO4QAOtVAJEUlWBf0lXKPlLfD3mryRzjjZ85dM/A0x+7GA/Mr9ECcX8nfCI9en
         e3k03MchP7StgJJ7z4cDCpj7QTVdEd4iT0rINSIZp39kQjgLv9AYxtNFgz8iUGdBUDa8
         OSsFYeOESP0EG2LJdKVLV0J7LIbRbAlECYnFS+l47vozeiQnmt+/hs9YvmVcK63wYtDy
         65pcMUkXXlauK2kqh4LNUnwXbBVPyrxenIRirMAB0LGgHnq3m8U4CS0FDFi9FBF5IA1X
         MO10nHVUl1EMyozSajAmbtLQUnvEqYABCA74llWstIilEJhWL7D8R2+MI3xjjtviLi6d
         TXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763881825; x=1764486625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PwG2NvtqtgTxx/LedM7ZSRwupcpxNiROYVeju+b13Js=;
        b=waJ970c9PFqmKFElC1IRff6NFsO+Qe8XCc7sH5+B88PmezoN9cSpyPbDqq7ycWZhlQ
         3v4Ijh98TwlWv+7UmdvqdZ/ouSHW4rgkNZd3pRi2c0cYfbZmYWeboRdQWVoat1bKyNiW
         fD5kgf3TAnhQMRVzrgIioLzngrXCtzHnBopf9iqbDZiuy95uXGgmtmms/wxkWqWL3Icy
         WWxesfNMTnUrc7Pq5UJ1U2L0OFsauIJWSf3Do+7bQLsKFrcqr7oo5x1vytOCy2yJNfyM
         fjTbP4BIF9ZuoBBS7nFsObbb4VVC/XHF/TeEkzqHnEUpX1L+yfetsYJh3YvPPJWPTawS
         bqrA==
X-Gm-Message-State: AOJu0Yz975JcBwyl03Z5odmN+1pA1H1SRFxJbRvxCSlaJBWWAGwla+E9
	9hSTmlGNDorxgZwDRv07R0ld6pDzw54IRHhYBYsGYjwJKNjydvqCQff/
X-Gm-Gg: ASbGncvex7qQdzqaOStWztmgABgwjiv3/P4B6z22Z1eZAt7fAG8QvzVxqfkWR98mfS+
	Y6U4M77kxYExSj/cUaozlA+Z1vzaswLFvW2f0tGk9ZU3kNCOJ0C7+VKqz0iX3Ne62OFjjC9S8+y
	y6P1kJMkUhaqzWmsD7lJ6J9sSGp/AlWHtMeGcfjoaIFeCWmKVfZG9tEgvGA68vS2i5IzC/PTD8P
	D/rVbRGJ4hF8MC/BaTVx7CrCjrR2fu2Pu0JiilApwnLG1ge814zaJw8NhKEhyBh0JU6MVMOUmeV
	g2kJr6KhG8zRnG/eR1aNLnoZMXs/s1RiqOxo08sCwtUMuUd9N7wCCz3g8ZeKNaxeWVwjvVdbIXn
	rXrIYi0KvHHSu8yeHCL7OD/Sxrczmm+Hr0MIhTueHqm4R9Y2E0VQAXtvKto1Ch3Q2AX5umz+Btj
	SGhmglpm/8
X-Google-Smtp-Source: AGHT+IGOb2SPkDuexkN6TZJ/1imTC0LGqAJENCoa3Npb4oSStvaDCmaZVboHY52QWjAi7Q8yBVralQ==
X-Received: by 2002:a17:903:2f0f:b0:283:f19a:bffe with SMTP id d9443c01a7336-29b6bf0db2amr88567395ad.7.1763881825449;
        Sat, 22 Nov 2025 23:10:25 -0800 (PST)
Received: from t14.. ([103.170.245.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2ae1c3sm102091315ad.92.2025.11.22.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 23:10:25 -0800 (PST)
From: Sidharth Seela <sidharthseela@gmail.com>
To: claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com,
	nicolas.ferre@microchip.com,
	sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [RFT PATCH v2] Use kmalloc_array() instead of kmalloc()
Date: Sun, 23 Nov 2025 12:39:06 +0530
Message-ID: <20251123070905.93652-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor to new API, for cases with dynamic size calculations
inside kmalloc(). Such calculations were found using grep in the
sources. The patch compiles properly with multi_v7_defconfig
and multi_v5_defconfig and generates object files for the following
driver files.

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---
Changelog:
v1:https://lore.kernel.org/all/20250924145552.55058-1-sidharthseela@gmail.com/
-refactor code and run checkpatch.
-use sizeof(*ptr) not sizeof(void*).
-add RFT and the how the issue was found.

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..01bf557034e0 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -754,9 +754,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (!sam9x7_pmc)
 		return;
 
-	clk_mux_buffer = kmalloc(sizeof(void *) *
-				 (ARRAY_SIZE(sam9x7_gck)),
-				 GFP_KERNEL);
+	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
+				       sizeof(*clk_mux_buffer),
+				       GFP_KERNEL);
 	if (!clk_mux_buffer)
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..91a5615f724a 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -1127,9 +1127,9 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (!sama7d65_pmc)
 		return;
 
-	alloc_mem = kmalloc(sizeof(void *) *
-			    (ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck)),
-			    GFP_KERNEL);
+	alloc_mem = kmalloc_array(ARRAY_SIZE(sama7d65_mckx) + ARRAY_SIZE(sama7d65_gck),
+				  sizeof(*alloc_mem),
+				  GFP_KERNEL);
 	if (!alloc_mem)
 		goto err_free;
 
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 1340c2b00619..a12381f6c068 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -1004,9 +1004,9 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (!sama7g5_pmc)
 		return;
 
-	alloc_mem = kmalloc(sizeof(void *) *
-			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
-			    GFP_KERNEL);
+	alloc_mem = kmalloc_array(ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck),
+				  sizeof(*alloc_mem),
+				  GFP_KERNEL);
 	if (!alloc_mem)
 		goto err_free;
 
-- 
2.43.0

