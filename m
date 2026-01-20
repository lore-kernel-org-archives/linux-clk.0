Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB0B33C19F;
	Tue, 20 Jan 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927617; cv=none; b=bj0iAVvF24EE06iKvfUSBc4MSra8T0HQlxssE2nSViOdL49+01RuDWY9+w5THSMdvT7p9bT7a1R4PusikavebMoD5QFm43IPDcqXFUJ6q5tusSlBPrqiVUEMHY2lgWiGzoCjbCCptf+09j6PebcrMZ6bT7XNnn16YquwCSK4hxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927617; c=relaxed/simple;
	bh=tUfCFt6oqIZhIhUyRcFhsD5/wAUnkf3OGDGh+5ibk7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VpxesiuQpo0hNg9/AcocS1CXHCq3On/kI8t0KgBJpU2M+EfaQuG/3sUtC1KaU+Oj25LFOghEh9bw/VSXtZrpV+jiugq/47Z9a8NgS6Y/n6sMtx97eCzIV5uaiU5p5DPt2S0E52yt/mjF4uiBrCs9p6MozWCpn2MUbQPeqIZJvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=T1Yyb6qI; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="T1Yyb6qI"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 23B7A148AD75;
	Tue, 20 Jan 2026 17:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768927612; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kj8j1lSiFNV6ItVP/sSK3Apkmi5cG5J6MNdKKWb5RxA=;
	b=T1Yyb6qIJr0P3oXL6s19AD1RXrZqtP8PX91Ltp/gfeuDnTRVVqcNmZAWbPkvLeEmdmHNkG
	T0KfXaS/s0/cafX+kFzXDKNJTS1mxDUTPkZdlV2WnOEkXdJhGzGbwU32qUPwJiZkm5F/IZ
	t/N0nOlu2dJmKJ7YGpUAaD/KFXftSfOw1C3h3RISv1eVDq7ztal3509T/6TOwPBPaE4eZI
	hdUwrlko34l71tx24ilW8aQNoBkdPmd2NRtWgtNAOWfVvYKEBSfX1l8d5mj+Ttt//CfQVp
	16vDhEfcB6lJ8K29rp/AUAG4G5OzWWRFq42SkWwqqWptXQExw0OHtVV0iRDGbQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v3 12/19] nvmem: microchip-otpc: Add SAM9X60 support
Date: Tue, 20 Jan 2026 16:44:46 +0100
Message-ID: <20260120154502.1280938-6-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Register layout is almost identical to SAMA7G5 OTPC.  SAMA7G5 has some
additional bits in common registers, and some additional registers all
related to custom packages in secure world.  None of these are currently
used by the driver.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - no changes
    
    v2:
    - Reword commit message (additional information about SoC differences)

 drivers/nvmem/microchip-otpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index bf7e5167152cb..d39f2d57e5f5e 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -269,6 +269,7 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
 	{ .compatible = "microchip,sama7g5-otpc", },
+	{ .compatible = "microchip,sam9x60-otpc", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mchp_otpc_ids);
-- 
2.47.3

