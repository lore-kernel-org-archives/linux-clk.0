Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461523C661A
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207694; cv=none; b=aixwFUKqk+7alqTx8kPYNCWYFMcvrhQTkinMFzzk4I9v8OMG8AmiZR+O5krDfbkO9e3GPwZ9qAOkP3Xqb/A0oEBSnEto3KYKCQVeejU/1jUpgokBm8XkzwubFe+B5Wny4sr/XwU5mNO9Zt6S4UWo5PmcvKPyAN3aaBfFxD7zTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207694; c=relaxed/simple;
	bh=zr8hwqY180WIlpyUsuAChZb+brSoXLdvMBNtpNj9nYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOCclFHb6hshK3sMot2UndxoDSmILPVS9mbX/3Kx6FUu5wuG8Kn/7zgpEHUrtVvDHkPRyhTcRMT9w8cx2GRYIz7xP4XLddfA5Q/FHxSGSDQUDbOM0Vi06ZPzTTjWhnD5fbo0poRIJt2hEoNlisoqkufeHCRrKmH0V+wdZSadnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpRvR2Ku; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpRvR2Ku"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84232e83ca9so2256233b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782207692; x=1782812492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=;
        b=gpRvR2Ku0ASNRIhgJAFEPFQwuF84WEqdBv1977/Yos8N79u1IHkuO8DInbwq/auzCL
         P+nLiKSDAozAScQj1Kf7kTOqB2Gd6iYEs4MkHe0cWPoz46HCB6U6H0DupSPWLfi/O0ZU
         H5EnWpCpFNsG2fQOUOetOLXw+V76/qgFrvYzzCNHOw1iAW1SF5UF0t2rhoO3DngftQpG
         osI6VvArz5TLMwBlpH5SiPDWfY1v+5rNDZxNgj78Z9RonqZZGnMsTl889Jv5tR6pxjFI
         2b6MlFPOzhOyd9oha4jQoBmjs2R5/4OJ/x7j2/x6gAOchwYZJ39AW51j/j0EciCc+Grq
         Oukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207692; x=1782812492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEY4mxBInTV31P334VeLm1dxOKL0Pc0LaCfP0/xhKcY=;
        b=eXlcaBIrMtMf4LzL8OKQtoiqUUGD86aS5mIMNSza2TNFSusCueye7F/SyqHqYFYaR+
         dpBhrcyOMSARXIp5keQIkr2Zy0M2Og2ciVEhMa1eA5bQF/TzCzWqkWWjINsygqWn2Ma4
         3cCB2pT//+7QZZ4mda2C5ESAhekZJIEwDN2chI8Jda5Ayf1pwzSmK1AMJvHkKhOyXHcf
         8QQL9aRKKLcGw3ZWraRSS56Yw9Q2Ix/E9l6KLSRKJJfjVEdS7zpgbKi56k2tfOnZlkXv
         rTpngsSZGeALF3BSpAeF1vtG3tqQUSPjJ1navB8j2CBrO2i4yGm7cSarcHW1tjzVDy32
         JmPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QMypIptJGSxCWWhorsrEdF2vPZ7VQ65tbzAZ6VqyzAMo4oEEn9lVlb7yLUy0jYnuE/0dJ022nt7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzinXChy4vCc83cmPfdaArVAHw2+3o/R9xGN3fFbgnFpXe3zZ0V
	v4RwZMuuKMP1If5CMRoQGuJA5jibgdc0lmgXFGh1ta+sEKNosNF9AaY=
X-Gm-Gg: AfdE7cksaydY8tf2teyOfHOEMfPt64EmHYbyrox1FgK6v+9pA+ctlv4V/zShP9BAcfD
	1XOY72TnX/1pXxOH1yVRFOXRskIvWC+PUdUjzUNdRYXV+9rouhK6EYeZXaGFDti6U8uDqrn7FY/
	8m/49rDGtl9okzBNtltctO4WEktmx1OxgBTGrUENCF3/8EVtpkZTGodkNrgwgi4xbEJvHHrrRz7
	7tLbrDwep0vOMsmxf/WCvqKrPFb/bhuLDBm6WTTMkG5lULkh2ZMKXYaobu+K4SI8yWoF9VOfxq+
	voRVBFbS0crz/37L4j9BTPTeJR8YFGfDJo648ikesCMYPYZy3HRYsiL1yxc+OqqLnzUS7WFdSs1
	LK2+ItlKhBGxvmrfBAQHuS/ECYK6QVxXlfEsOiJHEiOwNEeo/UOlnQG6SyxmG2l20G4No7J35aW
	ZHwET7a59gstDYDvRzNXdOFZXkmRyI5jEEPJwLzEQ0JsIoEje6Ey6dcKpTGKHDv9DMw7w9riWkL
	pM=
X-Received: by 2002:a05:6a00:2196:b0:842:4387:34c0 with SMTP id d2e1a72fcca58-8459524d475mr2570456b3a.5.1782207692530;
        Tue, 23 Jun 2026 02:41:32 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6bf73sm10180079b3a.5.2026.06.23.02.41.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 02:41:31 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
Date: Tue, 23 Jun 2026 18:41:11 +0900
Message-ID: <20260623094125.95791-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, while
clk_mt6735_apmixed_remove() unregisters them on driver removal.

If devm_of_clk_add_hw_provider() fails after the PLL registration succeeds,
probe returns the error directly and the remove callback is not run. This
leaves the registered PLL clocks behind on the probe failure path.

Add an unregister_plls error path so provider registration failures unwind the
PLLs before returning the error.

Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
index 9e30c089a2..04cf9665ec 100644
--- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
@@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platform_device *pdev)
 
 	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 					  clk_data);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to register clock provider: %d\n", ret);
+		goto unregister_plls;
+	}
+
+	return 0;
 
+unregister_plls:
+	mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_plls),
+				clk_data);
 	return ret;
 }
 
-- 
2.47.1
