Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681577;
	b=eCwI5b7IyyEIThF5ODzcqDzn4ClV4LaAUWjzbjGPGunTtcFmvMMvWxbIZDl3OhSDJWv2
	 4db/ziFukpSfA3lvG84hwokrqAfzm4XRoieeG58kwrZ3QQF6VRoDI5Ad9hrVsK6BUEs8o
	 izzWy4Nwc6CL1tH3BiNDwm5MeA2ClyToEpWfW3zCUvlRAaPbTYjLUHc/g8dQHMign8KQV
	 4UCtIu6v8NPL7R+CGvNdmc4qu3hjRkrkjdmv0+mHJygqylFueioqiE01FVbrhCU91fvJD
	 8pc1IeCcQmTECyuzgLIZbEIdNAYvu8j5VEUomu0/9815hbaCd+Hq8D0MsrbN7eZMSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681577;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=UzedAFa5h664fztzVBr2iN5QA1eULbJ1Z5kDseqFZL8=;
	b=0FJOI0OtBGTg7qmBjpqD0ES3EaAZOi9m4xyv3aE2vuXCD8C1ktNdN0ioJK+vAXAaf4Yd
	 dQ0xxMtCz+uK6VlwvgNKFWj+09QwIgSw/kXcLINEr3SWjSU7HQmuAgb+hKsd2wjLxVRHM
	 GJEVf7B3edMVIPkvj2ejVUKw9l/ldWPMS6RyCevmMkmofR5qUDsOotaa3V6fqws2BpKsE
	 0HSXZ7I0rZtfYO0eImTntIFeVmkPt0KvkAEn0+bFdALrHIFIaVEJSD9knGJuaL1MEJ2QI
	 4PI7c1oeiCbnuI6G/Eox1VnnU2KyNUR6eNx8nBExe1m08FmHq4ya6xXbMF7X6KUSGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=TgusRLnw;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA1606A329;
	Thu, 26 Nov 2026 08:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=TgusRLnw
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726907;
	Thu, 26 Nov 2026 16:26:12 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: angelogioacchino.delregno@collabora.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	msp@baylibre.com,
	fparent@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:11 +0800
Message-ID: <20261126-a35bb25eb5-u14-3@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa216f655cb03a1kunme85e8f6d3c29f4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQhpPVhlDGU9DQhpCGh8YGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=TgusRLnw4DCYyyPItZpKaNriu0ziXvFv/DjLBoZpJ6+WANAb7JUZHZd09UWCJF5tOUux+Uvf7qTmT4sAs9uVjwGfhkhWI9E9Ww2COvVPvGjFC85m3QdJigLd9af/bNp6PkbVCPKyL4iJna1Wu6F5F6I6c3/U5WO/8fGoO3cA/m4=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=UzedAFa5h664fztzVBr2iN5QA1eULbJ1Z5kDseqFZL8=;
	h=date:mime-version:subject:message-id:from;

The apmixedsys driver leaves the OF provider and clocks registered
on unbind. The clock table is device-managed, so the provider can
retain a pointer to released storage.

Remove the provider and unregister the PLLs during removal.

This issue was found by our static analysis tool under development.

Fixes: d46adccb7966 ("clk: mediatek: add driver for MT8365 SoC")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
index e331aa28a4bd..386b0c66bf4f 100644
--- a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
@@ -141,6 +141,8 @@ static int clk_mt8365_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
@@ -149,6 +151,14 @@ static int clk_mt8365_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void clk_mt8365_apmixed_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8365_apmixed[] = {
 	{ .compatible = "mediatek,mt8365-apmixedsys" },
 	{ /* sentinel */ }
@@ -157,6 +167,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8365_apmixed);
 
 static struct platform_driver clk_mt8365_apmixed_drv = {
 	.probe = clk_mt8365_apmixed_probe,
+	.remove = clk_mt8365_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8365-apmixed",
 		.of_match_table = of_match_clk_mt8365_apmixed,
-- 
2.43.0

