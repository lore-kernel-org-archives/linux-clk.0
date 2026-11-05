Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884269;
	b=0ZwnPiWXJnkAu1Kl05bEUTmibivSmWPYl1F0uEz/CAgvrrP0mPPEbp0b41OnQN1/pvlL
	 yPz+YykZDgymbB4UgVrL1ujhtaQb/38PcraafeX3bt4RvMUYl5jJ3+8aYN+uqsQ7dqss8
	 7dDfl9VgsMITfFGlk/DgEJsj5kQmLzLHaVDT5Dr29qZnm90Njtp08YdVHNZxBF892V5tw
	 7q1ITWURnxPsolo3OgMnOL3quPvkwN5aOf3AEmsGCWr3sciK11maTLXo+SrWDzYMOkuXt
	 cN0Ax6aVDJwp2WpWyj9cliN9wdzjOQkBdQ2zlni2oT2nO7CukRoltXt/88unGHuvk7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884269;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ivNxKcAn45LgRAdbRDkt0pkV8uD+BoFKTnn4dwfgvgs=;
	b=deZNKhw4B91xbdJzYMjmHjP3WEbWFnrMZGh0IGSBULcFEwk7m20YJR/vP0tuv14hab8h
	 XUJqM4ovdz5MKX7K1OOhWItuPqkv67aY82JIRNG8hwePxqKER6HI9Ep2n3cUXF74epJ93
	 8De2TXMoFM01/LDu68U73A+DPQdiysfjxjdj4fNp58aRq0gvrWowWGE59mKpG2HxRGhXO
	 QN7Xp9xK4QnusJlRexOkib9Bt/UZO9f2hTJKxRcJzmv2FHBbMdNCK+9O5HwvfDwxuhJbl
	 cD4ET7FxyzNbV5Y4YVJSBE0fPjGM3BwPJB2Zoilv4kwaPpR+dh0jxVsnAnySy/gg/Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b="QG/qky5C";
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3427606D80E;
	Thu,  5 Nov 2026 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3427606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=QG/qky5C
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 931F914966D7;
	Thu, 05 Nov 2026 14:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793884302; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ivNxKcAn45LgRAdbRDkt0pkV8uD+BoFKTnn4dwfgvgs=;
	b=QG/qky5CCPw01/XvolJ5EN6sGxhJjpmL2flKlxwbm0ueWx6uqt1AeOsXA45fBbU5BNZYQS
	O8wiyIZ0caZPQOtuTeGKeY+nMTW4f0osOg/Ls1pD2LqwYJLg8xYWqdMLpzcWCYjmu8eAF+
	NLzIifM1p4RNmZwabwHXjoElllV/Cgg2sO0Aqg99am7vrihpQgnPAT8dIJsFiCAuLH/pYW
	RcVJMCimAFhwNLNTnz/GgQGHacRZi7e4K2VzXbJ2WmxOiBsYH+w7jpfQ0G16zuaxzKq3jZ
	qMWADXJMPMgeDx8faVAp4cn4z1MJ9tjAvqnWWzUG0H1NGzVQXIfIyrFdlfhq8Q==
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
Subject: [PATCH v4 11/16] nvmem: microchip-otpc: Expose UID registers as 2nd nvmem device
Date: Thu,  5 Nov 2026 12:06:47 +0100
Message-ID: <20261105110715.2486432-12-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

For SAM9X60 and SAMA7G5 the Product UID x Register containing the Unique
Product ID is part of the OTPC registers.  Expose this unique id as
trivial nvmem device in a similar fashion like the soc sfr driver on
SAMA5D2 does.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Add missing include header for iomem access (thanks Claudiu)
    - Reword commit message
    
    v3:
    - no changes
    
    v2:
    - Use dev_err_probe() for error reporting (thanks Claudiu)
    - Move required register definition over here from removed patch

 drivers/nvmem/microchip-otpc.c | 39 +++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index 4286365686563..e10291f59a3b7 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -25,10 +26,14 @@
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
@@ -230,6 +235,16 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
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
@@ -239,6 +254,15 @@ static struct nvmem_config mchp_nvmem_config = {
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
@@ -269,8 +293,21 @@ static int mchp_otpc_probe(struct platform_device *pdev)
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

