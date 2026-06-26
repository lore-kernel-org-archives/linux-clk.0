Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B63BB10D
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466905; cv=none; b=NCxSZANE6dLOwuTrsaPEb3jh00A4Bk5Q4SBNhGcX6LtrRBouu5oLiX4xHuKkP0YDh6UJZVUQhk5WV9DbAjpQqaylq8ahrnviml7Ht8vVSEPV/y8jDOYV/Dp8iDE/HcmeFJfitbvJ66m98+umGyaWref8pDgxf+F1oHs43rIIpY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466905; c=relaxed/simple;
	bh=MfAhvEObsV+KWrsGCI3P9Sm+CI6pojZgxHIyPBbaVtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tcosw6AUfjZQ+BKBZigOKuRq6CgsV1UX2JJZytC7HXmWTNgUoW1jU+Z5Btnr32M5EUuBLyUM6jPVmoHFrbpucWwxbAWu8tq4Rx8cu77BbUWFdQ+uEBiaTrzUv+ZTotiHh7Zg+O3Apni/UQxLUA2VbdDkqhNMX27LRLHDp0KQrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FePgrkES; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FePgrkES"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so594038a91.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466902; x=1783071702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7J5GI2pmCkcVilqZesKiSKQTUF3Kx6m9amj3OnCb7ho=;
        b=FePgrkESIGxeer7BHTiyP2TAgfINLAmkUQERMgw/JKd2LX614imH4Ghx8gRrjaE6fA
         2SL3G8m9j2PJOon+W4Z9O9NrDf1oHhWHn16lWs6S7subGUtX3+xR3O3Tjd8d3JXkVkC7
         EWZxJ+hHjfWyOnckINiF73QwCrFzsXaSY0H9mfr4L0DilRr07yPH7XpgKjXosE2lRpsg
         7x3sLv61lo2N0SF5hh0RUKlAgvu7FuSgzajhqGSW5rUBScOylNQorkK2ajAmOf/uIlJH
         oPPnK2Nwq5gSNqCxrF97qkimI0/HgaoeyH7u+Una15GUg7u3PR8fqvIVarMPDrBADAqv
         xetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466902; x=1783071702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J5GI2pmCkcVilqZesKiSKQTUF3Kx6m9amj3OnCb7ho=;
        b=G2qP0z3SuDLAJ2r13pWznvRYBHSvUmpWvslrO3xnfmLflFPez+wCuTAGOgCc1nDcGl
         OfWOVGbqusuMt8wa0T9Y20OGoBUNuTMgiOw8LgZbtCtjZM+DrDSPCkQxBoRbL3TLlrIh
         piuqWpcYQM1PHo6HcmL71JTbYXXrMtM6KvtQtUGkNhruP6FLy3GKljSjvfcEb+iwkB07
         +YaYcG+YE64XCtNsxla+dxDxoKDc8FoH0l5GIveVNKqQe93mcJrqw25NVNnvz0JNIpLj
         cwODWb/Z9x37nGLvNOUZFobeCJgRUz+0RzC7nc0lHJb6u8RQxWA/gSql/5GqGBEFF4bH
         at/g==
X-Forwarded-Encrypted: i=1; AHgh+RqXawWYiFDuEb0xweZRXzcZgqLGxLCFgaMhrzYwW8sLpWVIwzYipQ1AoBnZn/eSX8WtmQ5S5gjC8HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcBB+6e4/frEwuG1TSe/WePkyb0CtlGSq1422sgIzwv9+F5nCH
	YnpDaEVi+oLvV+KwDcUrQk23Oh5PFvcNWrccr3HrCPcaLyzywq2PcQ4=
X-Gm-Gg: AfdE7clWJfuJszzcdbbsZFTXhj7bhClT/7UPR7VxMfyIMNruB1HkQ+zx37WOLiCa5mz
	5SqARiAlH7Bg2W+FVfuSOiBlyvOBXbjAmKQz5+bSfRRpZr8g9Q8K0c2vJIkSKcfFd89BEMcE3Qi
	51o8lpXSHWXZ9ybT0YAK8aCA5kIHKj0kNqtgog/rgIY1AFbmplhp8BciZVZCWZh9nWo+GGUau3Y
	Tyj7q7suJN0xFm5tHkG+6tdYxaI2bKq8VWOF5TBvxIzdU6TPEePL9VSamjKGHwLMWxlJEyJ5SO6
	j+EJezvRRiyr2h/ge5YcHWSIzKXCctXS5fQQlx0JegwnnnNZNXZ1wMkHnLure48laIcG9hKFwOC
	0w7OPFqbQ5BjtYJos6fpPe/wSf7DGJeRTLhSIUNcABhiOZnBmfiZPN+MmZToGfny+qQuBEUdm9T
	1YoAy0gAR95GyG0cXqF3kHQhLz/Y2G/8+t7zaNErmRMAGQ6K0ETvC34QHhaIKruK8RpC3YKdPGg
	tB/UdaG5XgrTUyTijrDSTHLMtNGrDLW5pM6VfJXIu95SXDJTg==
X-Received: by 2002:a17:90b:384e:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-37dfa28bb98mr6256890a91.25.1782466902167;
        Fri, 26 Jun 2026 02:41:42 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12daa2fesm456408a91.2.2026.06.26.02.41.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 02:41:40 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: ti: adpll: unregister OF clock provider on remove
Date: Fri, 26 Jun 2026 18:41:26 +0900
Message-ID: <20260626094134.71961-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti_adpll_probe() registers the driver's onecell clock provider with
of_clk_add_provider().  The remove path only frees the clock resources,
leaving the provider registered after the backing data has been torn
down.

Unregister the OF clock provider before freeing the ADPLL resources so
the provider no longer points at released driver data after device
removal.

Fixes: 21330497f303 ("clk: ti: Add support for dm814x ADPLL")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/clk/ti/adpll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/ti/adpll.c b/drivers/clk/ti/adpll.c
index e305fcb..0c22e33 100644
--- a/drivers/clk/ti/adpll.c
+++ b/drivers/clk/ti/adpll.c
@@ -925,6 +925,7 @@ static void ti_adpll_remove(struct platform_device *pdev)
 {
 	struct ti_adpll_data *d = dev_get_drvdata(&pdev->dev);
 
+	of_clk_del_provider(d->np);
 	ti_adpll_free_resources(d);
 }
 
-- 
2.53.0

