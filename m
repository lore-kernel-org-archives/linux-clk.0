Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912073B7B99
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410573; cv=none; b=GD0dJOTpnHvT0tfUQzoIsvZgpmc9E2G/IpRGuhAbzm7cW8d+xWs0BQENJ8Vv/pihS4AVCe9EaHdvC+VZDSBfXIHC0Weijlar4rU9PUIpfV8oqYmbCrn8QOVQoJF8aWixl+WWkDAK4DIzfLMIL+BxP3RyHOkficlJ5FMwjclJt3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410573; c=relaxed/simple;
	bh=m12Mb+TIX47mD3Oz57lS4dblNLbaem2kqTJU65hzxOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oG67dm307teEZs1pfaiTT2uTNMin2iKcpV0guQh+l8GcOzqipAwnEz2l9Sp5JbvSRuIm96z7OJ0WEx1YnjyDkr5t8I5VXSJawEirtMko1XNaal4J308KPe36wHup+YwajPGhrMGAk3eSOS6gMgWMUfNuxvYUdA8xv7f0ecUCgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8lTUkU/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8lTUkU/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2852472a91.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410572; x=1784015372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=;
        b=f8lTUkU/gnu+k1gWYp5/HLgim0fzhgNpmB+GtNrobD2h7+Vy+6+/hg4mo9V/QzztBG
         zCp3KqAd6sirL+bevssjv2pG+VByci/i/9hoxjq4LT+dKLaXQ2LQ9NGDifrAGDybwHTg
         wqqF/x2t29zpRn62602gowWeU3B/tgR8H4ZsXoFpC29n+pWsAsAdr5a3a4ItR+211GSn
         O7N4FXFAg1pdNJR3lH2OGw4wJ5dn8wvH420BL2NRHZFo4RPcYh+rBmceZZxNdSoBkfO1
         VnZcgng+voE44jggI3xccjNam3hqDfso6ghtssuLPO+TDzLFOXZNBSe29r2RrhVQA0+0
         tTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410572; x=1784015372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6aDPvskXT897p+or3xpt2a/W5VjcXH3b9UnC1ZCrck=;
        b=Jjzy+QW3PvptJoKXMe+SGa5up8+5ApbK/ofETv6/+xfrym/SvNiZmm3w7tyGTjesQE
         BbzxAdI6TZQxQoV51VzY+D/9IUqQ16bT76tycmVHkrqibJesRkVu51zp3jW2bp7WfOBz
         SWT0SDJGJAOqXzLzcLzeZXWLaEdR9+HlcMSYWxrRfSA2DDIU3OUFaYpo52qciwPU+EjV
         H3u/VEpowqAgqMlGWFfbNMVF4vNN+UuIXoDLi3aUV4Urn4+1g3a1qlYhJk+sjjPBnbAE
         vm/ZcX/F/DD8UHLjOkTiopmPF3AdZbZNBRTYYF31KukNU3zPbNsKbnOPitHJaE30ARqk
         iSDg==
X-Gm-Message-State: AOJu0Yz5m4niPHiwm5c9Oi0h+UYqyHD61WYW7x4phBDdAd+2mqeIy4yq
	Ez+DOb030jXLfEs4PAW3iPCrY5o+LI5b42GqaeQft67IgkfW9SwdHbbj
X-Gm-Gg: AfdE7cnSraOECmMM1iozISDeQGzfqaqp6/Op4td3nTRApebLBcQDp9qmIsl4jdYRfKH
	ZruiOP4WmO2BgY3LCP1ovLgPLmn6p+4dEaMy3IUKB2lnwR8v1jzGWxc9joCZfRYuLy+x12nt2RA
	r6Hjm7JenTufCtVulPVFxeGuX6SBie4/ATT1LL+LkhRewbdmr6TASwPAI1pAzJ3QeFHsOZzGn6V
	CgcxJmZyVRwoIZvX2pmakjTgiMCkTfBUifhfmQ7gVUNYcg/bSPFNROPSnQxKXN1CQAAw2LiJADv
	sbF+LvzivRTuJXfWbrDlSx3WIjlSXEWKje+/KjVMZ3yWsM4J88VzyMMb8Byh0sYnBDFLu/B9dlP
	/AaHp64nyf8AFNxBl9HWLUWNRrIVSWeN/AOcTVmqbocyVWSQkmxSwjxFGRj0P2LmOLzr+pftUjH
	jNmCJu1lTsAJXmOXHA5JDYhOnusuq5aA/2lJEO3vCByxp3utORqKlrHgM=
X-Received: by 2002:a17:90b:4f45:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-387570c4074mr3687519a91.18.1783410571866;
        Tue, 07 Jul 2026 00:49:31 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:31 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:34 +0900
Message-ID: <20260707074839.240676-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..8b69009e1965 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.54.0

