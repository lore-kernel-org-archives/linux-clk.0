Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AFD441048;
	Tue, 20 Jan 2026 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923913; cv=none; b=jXiUJarJnwXLqot0xS7xS2sB6u9vYTJPaMnbKrpEdg5wZAuYAORNxAxiO474DSfC5HcLZsiQMOHH35Z53l5fmnt+4qqRKRDJshh2D4OoK9W5jPFWO8NOIKKoEfgtm52isGAJgv7tYnaakhgjzq+o7FkDGEIzoyb5F2dEzQREOic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923913; c=relaxed/simple;
	bh=MrzdPhBUci1zYJK7hvuXCS+eCmE9nVICFETQlx7Jbys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uw69M1fJ6ezjI2iQ/A30VFjFLJ55ux3FXXiQpgBUNdeFVTMfhGs1C/bTbXb2UkpT6NO0+yRgWf8bOjY+6EDqswkwBw1AjufLS7AQJnV6KGwlHWhZ/+97Zz343efNe7P+Yzkkf5hsJhTFdEAorWGxrr+GNEkpj+rV98+pw3efKCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=dqGuTuRt; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="dqGuTuRt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21B44148AD5A;
	Tue, 20 Jan 2026 16:45:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923909; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7NkEtjVarcSoHp8QOC/pznn28WeOYOUP6CtTrfas8ew=;
	b=dqGuTuRtpVogREVnWV1N6aV6D2osb3MFMfy2v/X1Xr3m2zdJAD4/z9iFtK2xFiE4pYF6lf
	H/JVPnqCQb2mU2Exirnxo9dU7jgjJd9Z0lW4HvwxKz8BbzcPKWtK3C4FmZvk8qDCwm7R3+
	Hn1jo0x14Ibq7/V27iGrgRh6vEjCU5UpVLnfq2TzVqJ4X5CfncXEzcbi5bhwiRlIctD8LG
	NmJO1cR5XmHgNLPxfQ2qmE8yCtpBr4aTvl9U615wTVKvVFrITfac6Hp2bNArnoSxIbs9+T
	b/nR7kt4Qau/tNf7RUQ7k5F1SxBL/IIAa2qFJKH/UrQk/WyWTZWYPZOAk0SWvg==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 11/19] nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
Date: Tue, 20 Jan 2026 16:44:45 +0100
Message-ID: <20260120154502.1280938-5-ada@thorsis.com>
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

Makes no sense to have a timeout shorter than the sleep time, it would
run into timeout right after the first sleep already.
While at it, use a more specific macro instead of the generic one, which
does exactly the same, but needs less parameters.

Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Reorder tags
    - Add stable tag
    
    v2:
    - Add Fixes tag

 drivers/nvmem/microchip-otpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index e2851c63cc0b4..bf7e5167152cb 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -85,8 +85,8 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
-	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);
+	return readl_relaxed_poll_timeout(otpc->base + MCHP_OTPC_SR, tmp,
+					  !(tmp & MCHP_OTPC_SR_READ), 2000, 10000);
 }
 
 /*
-- 
2.47.3

