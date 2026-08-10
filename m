Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B963E5EEA;
	Mon, 10 Aug 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364179; cv=none; b=hcnnM7/GlW8pSnBUVcBUyNHef8c7hHzCIN3eSrEco/QCeIgFEEGS8AVIrW7JbNHLe8NZkGPaORvT3GYWqXFWCndrhVl7dupcd6vM0I7VqPFvewDEQAbFnoi5t4QepnfyOy/W5X9Bx2x3LROJ/Sbi9k52aetb7EwmMElEojoM91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364179; c=relaxed/simple;
	bh=s/5lgSlePgYYOK7g09Mf9z3bNr7jAVXO40yfhYktGik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lehzhJaX14mp9bqP2bgXI7LFUaupID4nf0ysL8f7i7TGUOZbmMwHMpi8Iw6TelcksBTmxjmL9nvckALV17m6X+Qe59ZoaLWTHM2wdz6gP3NBjAsSRSL3W3xC8ZyUD6ru5MA63yAVMKyTjejEhg7MBuUZl+27xFKlL+IGYlqgFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=iPD02Zdf; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="iPD02Zdf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36C5DC0516;
	Mon, 10 Aug 2026 15:16:15 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364176; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Hl1hvKOm1E58LS9l2PpGKlwAtOA5MDxmR8+JN0pJaI=;
	b=iPD02ZdfQxc+vaH1TjGukoKGpootB6Auc1YOxLOZUzGJvf+1121tcio/JCRCW2x8bzyPIj
	TG/DSX26HOk9a2ulZskkSreLj1ZiVVVsLu3VZrI1CNP2ZisAObbCJAn7b+lGExxVlU2dyY
	VVQi9BTdp6geQAI+upa/PEQDPc4Jw6X+1DV4GNmMg6AUhUPrdQu6QpAnf06Wq1czkMuLMA
	p/4k02H8PZIfkIbDy1jwc0uEa04o/QjnZ+F+Ffl1HCck0eCLmhdDHYCKta14EcBTWGma0N
	US723+GC5ND6Tg3CpzAPbeMbHapo7eVR1wiRADk1alYDkgYhSXOCMexRBfx6nw==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 16/25] clk: rockchip: Add SCLK_IN_SPI1 gate for RV1106
Date: Mon, 10 Aug 2026 15:11:07 +0300
Message-ID: <20260810121121.210040-17-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Register the SCLK_IN_SPI1 clock gate (PERICLKGATE_CON3, bit 8),
mirroring the existing SCLK_IN_SPI0 gate. This clock is documented in
the RV1106 TRM but was missing in the Rockchip BSP kernel.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 drivers/clk/rockchip/clk-rv1106.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rv1106.c b/drivers/clk/rockchip/clk-rv1106.c
index 1e3a110192bb..236159157c7e 100644
--- a/drivers/clk/rockchip/clk-rv1106.c
+++ b/drivers/clk/rockchip/clk-rv1106.c
@@ -976,6 +976,8 @@ static struct rockchip_clk_branch rv1106_clk_branches[] __initdata = {
 			RV1106_VEPUCLKGATE_CON(0), 14, GFLAGS),
 	GATE(SCLK_IN_SPI0, "sclk_in_spi0", "sclk_in_spi0_io", 0,
 			RV1106_VEPUCLKGATE_CON(1), 4, GFLAGS),
+	GATE(SCLK_IN_SPI1, "sclk_in_spi1", "sclk_in_spi1_io", 0,
+			RV1106_PERICLKGATE_CON(3), 8, GFLAGS),
 
 	GATE(CLK_UTMI_USBOTG, "clk_utmi_usbotg", "clk_utmi_usbotg_io", 0,
 			RV1106_PERICLKGATE_CON(4), 9, GFLAGS),
-- 
2.47.3

