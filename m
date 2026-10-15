Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF35545297
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083300; cv=none; b=p1IYUCj7OsUsJgo+i1UVsf7T8dXaQX9C5uDG2ZMs6hdP2/nsQkG3TYBnOZ0mFSaJlq3LpCfUzVLirwseEiuC9Bi9c4Ts22ussyhzd35qbL3hm5x3cunCeztdP2pH0PiK5zZICAZyN7THgPNRmEmZ07cCfIrrvnhQpNJjkiZTLJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083300; c=relaxed/simple;
	bh=tZS+V0XYmQR/33FT7lz4yE301PBro4nxTrz0wKP0eVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsEZwN21JHOq6Ukn3n0jZtP2+OH8JmMEnmFJY2O0Nsos3c3akvq3IUXEtnReMzXVhuID+aGB/mnCnd/rPMf9GzcZwgzua+INJMSUArFUkdRya2dySY901WTvNYClwbyjeb1yRf9E+toIOqF4428jxX9dqvGOH9aWng6egAB8FoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FE8bMlew; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FE8bMlew"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48de72fc832so528895f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792083285; x=1792688085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8Z6aSQnXT/0lTDli5ZKb3QSabz0js/0lenkmcruU08=;
        b=FE8bMlewXmlKmKjs1iQVQzu/U35xnYtzfD+H/4z78UUWXI9AiGgFZIkWMuQ+CgbLPt
         cnzI0M8mdngdg/EI0VFsDHVlCVolPGGC52CpXRp7mLkEkMX1/G7SkE6m6Y4IAj7VDfef
         IkXedeabUma3bkHXSa3Eaiidqqgl/oNhKXRVNHFcc8cH5laRtMuwfJ7HD2CwELa1adPA
         d2hnKED561tH+nMYNDZizJLd3MJ+kuQoz74h9mexj0RwxoFvZUStehscdSeqyW9hUKt4
         mFjqxD4ZQVAw0/OAEGX8tHx/1C9bpU4NHkuDKxSEXlpiCaMck9g389GzKgRqQ/4bntfx
         5FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083285; x=1792688085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8Z6aSQnXT/0lTDli5ZKb3QSabz0js/0lenkmcruU08=;
        b=CSNk66SjZqJpejrSJ4FBvUkFN5IzSwQiak1vYfMczAYBx2C/lZvwhjpITmP0Hlm3Po
         nrmPgS0aq/URT4TxJ6qGfR7oEwEFQHEVezQggYBx22ANDapIp7/p2pSA7ICKn8hqcXCL
         /39Yct/iQTSoqR0jsoKJYVluhUikUlT1XTbxR3EmNHsJsJqsb8vF0zZ97EyKrqUGVlhh
         q8rDi7HNKO1Y9qrMeAnPoqvZKA+PaL8LyQWDlIFz4YmFoktxdi/5Z4TaswDNK1mgAc8D
         aTmR5XN5wiETT5oyky3o1Nh/Bkvsrlts1jntCIt2aF1q3pklJHbB4rXZztLd0u27V3Lx
         VtCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH5Qv4yS+CQ7aHaZvpKux/I8Z0tIXNGwnhw0p3VO49PBZ45ZplKF+LB6yKGZoOCxvY8nK+JZ7l1TY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOcMfV5n1Gzl90SfloKcPZ+S9tsDOaSzZMmN1yad7Y7c3Kj8fj
	Dck3rQurIy3kGKFj+av9MLrWIJKCZFEe6Jcd9eNkq+OhaV26MPwptShUXxxDzw9Uiebkq3T3pHB
	kZd5ZHFA=
X-Gm-Gg: AYBFou0mbY9PDjLHhq+HVHrfqzK7DWpyjdU/tYbomzbySDqJMWb7xFIKiRN3HCcZ1D+
	Etn272ZxAenxOPxAK9gQ8Bg1djWj0x2aOM3fAYE5CI96Pvzlga0qVUJB+GiX0WauvfzHMmT0zWY
	YC5WhjlunJwfcGiK9CjHT1RD6iZKY8ICMH/scjH0KXOWHISCWvZ/dFg+tAWTZZnIafEChm7lIhh
	XmM2rGsfdfZ/xI/SvzxUcb5cN7QEVKvso23PFJ7PHXmY8CAQiHvYyhlpKVrVCsK0IjC+0Qjnv/3
	zyj3uP/6KMhSCBLNJrZr9MDT2OdPbXgIAsWfiHpAJt399aNlF6tyWgQBjvOx7kqUOv+80tcuuPi
	cgT9vHPwmsvcH82JP6BSBAY/KAXb4KFrViyseJCL/Z4zoDGU0GsPy8zob5THzVLF/1VwNfIzx7R
	AfPSHx8ay8sz/fASsog73SMIzY2CG7jjY/vt+Vu6GLAEF9NIkiOKfbX72JWSeu7ML9LeotqE4Vh
	8G/fgkg8VHHHtK0JKzhjBdDqTlI8jBCaoAQ7ljx0EGw04q446DchqmSFjqYMjhptvr+AA==
X-Received: by 2002:a05:6000:46d6:b0:48d:c20c:cc4d with SMTP id ffacd0b85a97d-48dc20cccd2mr21863604f8f.23.1792083285166;
        Thu, 15 Oct 2026 09:54:45 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa5dbsm20775664f8f.12.2026.10.15.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:54:44 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Thu, 15 Oct 2026 18:54:30 +0200
Subject: [PATCH 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-patch-ektor5-dm8168-clk-v1-1-8b99c5cd5541@linaro.org>
References: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
In-Reply-To: <20261015-patch-ektor5-dm8168-clk-v1-0-8b99c5cd5541@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792083282; l=2116;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=V1lJHYLAgA/nBlfBnu6hravYqMFQUVNrtE+t8AZRuXU=;
 b=Wl37l+fJKC0jK9zAPXXOWj2SG/X4dwbai04ly9CrEmdpnrWfIfzXaNzQvDyoVeVdDFxEhCdIx
 raOlehQINIZAcIxEa5JqQf3TA0zCfLC8m3u9b76SzZaqMAJeDGcprvJ
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The fapll driver uses multiple `clock-output-names`, so we cannot use the
DT helper in this driver because that would assign the first clock
output name as the parent name. This change do not affect other SoCs as
the only consumer is DM816x.

Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")

Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index e54b1df3436e..ae2f6fed10f6 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -10,8 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
 
-#include "clock.h"
-
 /* FAPLL Control Register PLL_CTRL */
 #define FAPLL_MAIN_MULT_N_SHIFT	16
 #define FAPLL_MAIN_DIV_P_SHIFT	8
@@ -541,7 +539,6 @@ static void __init ti_fapll_setup(struct device_node *node)
 	struct clk_init_data *init = NULL;
 	const char *parent_name[2];
 	struct clk *pll_clk;
-	const char *name;
 	int i;
 
 	fd = kzalloc_obj(*fd);
@@ -559,8 +556,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 
 	init->ops = &ti_fapll_ops;
-	name = ti_dt_clk_name(node);
-	init->name = name;
+	init->name = node->name;
 
 	init->num_parents = of_clk_get_parent_count(node);
 	if (init->num_parents != 2) {
@@ -592,7 +588,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	if (fapll_is_ddr_pll(fd->base))
 		fd->bypass_bit_inverted = true;
 
-	fd->name = name;
+	fd->name = node->name;
 	fd->hw.init = init;
 
 	/* Register the parent PLL */
@@ -639,7 +635,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
-						 output_name, name, pll_clk);
+						 output_name, node->name, pll_clk);
 		if (IS_ERR(synth_clk))
 			continue;
 

-- 
2.56.0

