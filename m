Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858844;
	b=Jmf0HbJEbFBN3DDfw2VWP/JXtnNBAhDcqtSjYQoimuVW8aC5Yfa1YtGzjR3vgUngmXmO
	 LAbgdRZxfHpreo8IOcQ4MfSsdPNkHIoys7Do7KIXcJA+VXQNz016De+oTHmocljrHUCNB
	 qeFEn7X8uFS2A5b2OxA64RIecDyRmfWhGBZZUzzlts3v5IVmx4QkANeJl1GQpBZHkaYYE
	 nXwyslyceJqwXhSVAlP4Ukg52BjcPVmMT4p/4pNwsC6xQgQ2XVq7Y3fuaOGHdBksKALBL
	 pmgxrZz7CTUnh+Mw9MsDXVrAk+Hc8D3WsD8BaaFFqWPJLaroZCq48qZzNmKZ4rhwf/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858844;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=QG3WHQia8FITFkeu5NqngdME8rjprW3Mgty5BtBQ524=;
	b=LZMWMsdn2uAGL1o8T5lQnys7K7j8PgFU4PshgdI3IaAdArW0kz7whSpRyHtkZTd/H/1b
	 ZSpA0LOd9Xy3SdgD4gJsBFQYMfDvnfEAdZ8hv8umzy1++i7S63346FBdnB5fftHLkQT1Y
	 ItTj9dpaVwQ4BFDp116B+9ZoxBzymrfPUW3NyCzV+GUliTOtIDnRlNiwKEZGMYeiiGhCP
	 B6hjkx3BCVbKO9W34C8d6dkgmuc7lzNbboVOZPR6JKLfver9l8jMoPSuG7rNsU6Iwgkrx
	 07ADWn647KsUTvDGpFTd2Yj/PUnZidPrinKCSosS8/4hMby2WWmsphrEYnS8WDh6T7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bchFdxuw;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A1A606A323
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A1A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bchFdxuw
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07f6;
	Sat, 28 Nov 2026 17:40:39 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	purna.mandal@microchip.com
Cc: linux-clk@vger.kernel.org
Subject: [PATCH] clk: microchip: Unregister the PIC32MZDA OF clock provider
Date: Sat, 28 Nov 2026 17:40:39 +0800
Message-ID: <20261128-f81b700d6c-u16-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa2218738e003a1kunm08555832451ca9
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ0kdVklMH0pMHhoZQ01OSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bchFdxuwpcQk6IeUS9Kli2RWblJOpJantMvo2FetTU/ARcnOVQx3MF4hL7yn9xu4anj8ZYPDh0WHXs7FRfMeSc7HZD6oL1XInKXKCiYVqWoKYnrvCQy8BJIwM8QzmwQhFGv+CsUH8Ye8herDm00gpYCRid4AnV4bJHR85mRZo28=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=QG3WHQia8FITFkeu5NqngdME8rjprW3Mgty5BtBQ524=;
	h=date:mime-version:subject:message-id:from;

The PIC32MZDA OF clock provider points into the device-managed clock
data. It survives unbind and failure to install the failsafe notifier,
allowing a clock lookup to access the freed table.

Remove the provider on both paths before devres releases its data.

This issue was found by our static analysis tool under development.

Fixes: ce6e11884659 ("CLK: microchip: Add Microchip PIC32 clock driver.")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/microchip/clk-pic32mzda.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
index fc4357ec7103..e889cb813016 100644
--- a/drivers/clk/microchip/clk-pic32mzda.c
+++ b/drivers/clk/microchip/clk-pic32mzda.c
@@ -241,7 +241,16 @@ static int pic32mzda_clk_probe(struct platform_device *pdev)
 
 	/* register NMI for failsafe clock monitor */
 	cd->failsafe_notifier.notifier_call = pic32_fscm_nmi;
-	return register_nmi_notifier(&cd->failsafe_notifier);
+	ret = register_nmi_notifier(&cd->failsafe_notifier);
+	if (ret)
+		of_clk_del_provider(np);
+
+	return ret;
+}
+
+static void pic32mzda_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
 }
 
 static const struct of_device_id pic32mzda_clk_match_table[] = {
@@ -252,6 +261,7 @@ MODULE_DEVICE_TABLE(of, pic32mzda_clk_match_table);
 
 static struct platform_driver pic32mzda_clk_driver = {
 	.probe		= pic32mzda_clk_probe,
+	.remove		= pic32mzda_clk_remove,
 	.driver		= {
 		.name	= "clk-pic32mzda",
 		.of_match_table = pic32mzda_clk_match_table,

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
-- 
2.43.0

