Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339243DEBC;
	Fri, 11 Sep 2026 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789127359; cv=none; b=o56ZAfHjXYgEp+/ut7tCVCAD6LLUAPbw8UAN6nCJ+BcdDBX99r5bVkIVCt8lOSbbrmOyImwe6WJMUPbHA0x3e9IEVhgyRF3QtkWc1TIuRAUvFpQTx3fgYXMSptjofA9WSwt3n/KaVeTVf7cq2ZER2WS6pv6HorS0HHFPswxYT6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789127359; c=relaxed/simple;
	bh=9RgdBUl9B26qFx1vgPdhdPoOIx74xjxmqQoBgNcFyD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XL16PU1hOta+VWmUs2P6O7jUOMKpVSEo1K1hK8GzkQtOK9U/hvUNkvMMrITaMHeZdopAm5eCwj1lpkZLBC0RbbsYE8XqiQOEHHsiQU1Vvkx3YbD+hxB8d4acsCxUYQjGV5ww5a8kwqYBM4/la6YXQDZ2m1QoWpLCEi96bkU/0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WITEqmCr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WITEqmCr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B204C653FE;
	Fri, 11 Sep 2026 11:49:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ABB04601DE;
	Fri, 11 Sep 2026 11:49:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E859A11C7AF8E;
	Fri, 11 Sep 2026 13:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789127343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+6pLw8cR88AzZdJv/BBjT2CzdKtKKYqeFDXgAQaILz8=;
	b=WITEqmCr5XHG1GTfonHNMXMI1kk+mVdrj55O8C8aNAV7pocUqk8RHOvpbfDRUWbj12o5BX
	PEZGCb/BzobBcsWeQc1INHRmJX4DVGzd/QAqqPnIjc0QJJSoinaNNTeDToPXxT7zPPnAy8
	CfhH78RfJgdjQfI50MeWzNH8WBQZ3rJlhw5oLVlAaSOm93nYfGWIf6d+GdX/jN2XDAln9V
	YeBWh7vWGI4/3ME4E7jtISoQOoNVpo648wLsdTvACWt+Tbuizt+3nd1ZfLF+Afop69tejs
	cpf4Edusz0WA4wH2Qjd27w/PnZwDWnr1fu7SuLeB5Eg7vSWzBO9sMkpVLa8Q/g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 11 Sep 2026 13:48:47 +0200
Subject: [PATCH] clk: eyeq: Use devm_platform_ioremap_resource()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-clk-eyeq-res-v1-1-39b04542db38@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJ/qo2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MD3eScbN3UytRC3aLUYt2UlKQ0C/O0ZJO0FBMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAIO5tBHAAAAA=
X-Change-ID: 20260910-clk-eyeq-res-ddbf87fc4fd4
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Convert eqc_probe() from the open-coded platform_get_resource() +
ioremap() sequence to devm_platform_ioremap_resource(). Besides less
code, this requests the memory region so the OLB registers are properly
reserved in the iomem_resource tree.

Move devm_platform_ioremap_resource() before checking for device match
data, so OLBs bound without match data also get their memory region
mapped and reserved.

Add an entry for mobileye,eyeq6h-central-olb without match data: its
clocks are all registered by the early init and it has no auxiliary
devices, so probe() now reserves its region and stops there.

Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index cf37feccc734..bb680283b6f2 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -513,21 +513,16 @@ static int eqc_probe(struct platform_device *pdev)
 	const struct eqc_match_data *data;
 	struct clk_hw_onecell_data *cells;
 	unsigned int i, clk_count;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
 	data = device_get_match_data(dev);
 	if (!data)
-		return 0; /* No clocks nor auxdevs, we are done. */
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	base = ioremap(res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+		return 0; /* Early only clocks, stop here but keep resource reserved */
 
 	/* Init optional auxiliary devices. */
 	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
@@ -1175,6 +1170,7 @@ static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
 	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
+	{ .compatible = "mobileye,eyeq6h-central-olb" /* no data, early only */ },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
 	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260910-clk-eyeq-res-ddbf87fc4fd4

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

