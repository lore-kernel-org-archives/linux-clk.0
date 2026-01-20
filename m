Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A959C33C1B6;
	Tue, 20 Jan 2026 16:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927619; cv=none; b=s+CE5ghuikzRnDiBTgmRPaGlmijskyAdMVeB0/YJOh7+3wNx3E7ZE7ATub8fNYOSNRQ7eZN/RHE2D8o/q1O6R1oaBTXpeUuI/bm/02TZFIkBCc6faetjIRQLUW1Jcf2qRZL2csHV77eB9x1hR09BldiA9tseINruNFGlnzhoyQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927619; c=relaxed/simple;
	bh=V+WjWfo7uW8ljN1wEXMec4ZmlwgXSEKxSi7oKhZi0rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TFbeY/j+Xb9+u0SplU6uGYjTIPRnrqLA26+QVdz2oZmHEoieGCXUq8o1LNLVw8eQeV/O2zO8Xqx2L6iAKablMzRFnHFl2nfgNb7iJmFqnzJWS27xsTol6qWhOiZfE6hwlIJF0aSZhYUOUBrV6KdL6udUH2Wee7DYRGptHUgD/18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=wn2vRAPr; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="wn2vRAPr"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 190C8148AD7A;
	Tue, 20 Jan 2026 17:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768927613; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YR90EkWwJSLCfMczGEB5+HrU6/Wdn0NZfB5BOFTbURA=;
	b=wn2vRAPrqdP7/ry3T/94tRFINwothj+ZqrCFWA+e6JLax2OlQxP6kzwviYhuLliGhcsxBe
	zjvgfJUZxvqZ4+vMNFl487QKqDojHqWGDdrgxZIJiE2GZb7JMMWGLfjYnhpF3EDRR0MdtE
	OtMNKMsMmL1WJEpOOuO2p78+mx8W03QdzyjejyLbB5dFx64Q3jpPJZmCoX+f+11JP1magU
	5Oxt+d80fj409eA3X87e/ILvprgovwr9TWkjyuWckQpQ82SP17VlmifVHyUyk+TonVo+0M
	MC/bDmbDUj/wqRXa88yBlv7Ne7fa1a/nGzy10pFCU5S4CpYT4qzfM0iBuWQQQQ==
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
Subject: [PATCH v3 14/19] nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
Date: Tue, 20 Jan 2026 16:44:48 +0100
Message-ID: <20260120154502.1280938-8-ada@thorsis.com>
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

For SAM9X60 the Product UID x Register containing the Unique Product ID
is part of the OTPC registers.  We have everything at hand here to just
create a trivial nvmem device for those.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - no changes
    
    v2:
    - Use dev_err_probe() for error reporting (thanks Claudiu)
    - Move required register definition over here from removed patch

 drivers/nvmem/microchip-otpc.c | 38 +++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index 34c0d7611f3e4..b35ed13b004bb 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -25,10 +25,14 @@
 #define MCHP_OTPC_HR			(0x20)
 #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
 #define MCHP_OTPC_DR			(0x24)
+#define MCHP_OTPC_UID0R			(0x60)
 
 #define MCHP_OTPC_NAME			"mchp-otpc"
 #define MCHP_OTPC_SIZE			(11 * 1024)
 
+#define MCHP_OTPC_UID_NAME		"mchp-uid"
+#define MCHP_OTPC_UID_SIZE		16
+
 /**
  * struct mchp_otpc - OTPC private data structure
  * @base: base address
@@ -230,6 +234,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
 	return 0;
 }
 
+static int mchp_otpc_uid_read(void *priv, unsigned int offset,
+			      void *val, size_t bytes)
+{
+	struct mchp_otpc *otpc = priv;
+
+	memcpy_fromio(val, otpc->base + MCHP_OTPC_UID0R + offset, bytes);
+
+	return 0;
+}
+
 static struct nvmem_config mchp_nvmem_config = {
 	.name = MCHP_OTPC_NAME,
 	.type = NVMEM_TYPE_OTP,
@@ -239,6 +253,15 @@ static struct nvmem_config mchp_nvmem_config = {
 	.reg_read = mchp_otpc_read,
 };
 
+static struct nvmem_config mchp_otpc_uid_nvmem_config = {
+	.name = MCHP_OTPC_UID_NAME,
+	.read_only = true,
+	.word_size = 4,
+	.stride = 4,
+	.size = MCHP_OTPC_UID_SIZE,
+	.reg_read = mchp_otpc_uid_read,
+};
+
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
@@ -269,8 +292,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	mchp_nvmem_config.size = size;
 	mchp_nvmem_config.priv = otpc;
 	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering OTP as nvmem device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	mchp_otpc_uid_nvmem_config.dev = otpc->dev;
+	mchp_otpc_uid_nvmem_config.priv = otpc;
+
+	nvmem = devm_nvmem_register(&pdev->dev, &mchp_otpc_uid_nvmem_config);
+	if (IS_ERR(nvmem)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(nvmem),
+				     "Error registering UIDxR as nvmem device\n");
+	}
+
+	return 0;
 }
 
 static const struct of_device_id __maybe_unused mchp_otpc_ids[] = {
-- 
2.47.3

