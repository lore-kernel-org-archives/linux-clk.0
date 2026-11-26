Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681571;
	b=BgACVzNPR7CIhckJMBKjoAOlH0VOUMOScYuX8Pg9dRwnqwKP93UU+RzVEylUFzZFiHE9
	 70J/vSJsnP82GmlGEQVBRcKFPfadD+bkR0eI89njheLzmQ1x/TzscvRQFg7wLVg/J09An
	 mFntjsLrr72OcX0iG324dVPfl4vE/a2yLpJQmcohF0bTZttD7VJ4B0HGj/KIm3NXjBNS8
	 0RDqI3NEA2QDoL0Zhv4HJFW9cFPcQ4SSzrd9uuc6/Q/a54xWBI0f68yzpthSl9+0ROm38
	 +T5+TPpjdeU6bp0aXzQ455ed9Dslu74Rf+pXCnqX4XhG2jS+MJF1eU5SnNXGvfV4y/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681571;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=nELR0AG6ykj7IewQ+VEaOZ+4U+W09QWTbbBa1f2/xd4=;
	b=Fhf8btMTVq4AMII/p0MX3YYGa9nUbNWToM8nFsRRW37LwEjDhWDp9zvDZ3ZUgTR9XKwk
	 OnJJM10KnV9rrV9sF5V2PMG1A2lTw5HEWTc3Ujllw1kPGYJO8R+LyINujvPVznvmi1mLy
	 9xhxqlQqRyNdNfl0Wk42KFn+7FSqIzrjqv6uUcUicJkaDheNYIKd/6uatAOwdOLun5hqm
	 M/5b96RZWFFgENQBdM4HbSJEZQSrbYePmett/woNaPIsqvWVEteKTGAowisY+Gt2yj2ve
	 wIjZs4BK/OixYjktXxRxWwUfVjfstipT5kk8NaYXSZzjrpws7XxhUTrINqshXxWc/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BLWEzal4;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC818606A326;
	Thu, 26 Nov 2026 08:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC818606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BLWEzal4
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5617268ff;
	Thu, 26 Nov 2026 16:26:07 +0800 (GMT+08:00)
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
Subject: [PATCH 1/4] clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:06 +0800
Message-ID: <20261126-a35bb25eb5-u14-1@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa216f6415103a1kunm20e7a42e3c29de
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx1IVk8fTEkYQk1NSU9CTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BLWEzal4XvSB1FtMRPcR2zi66u/DFRv2/3iDFIo85SpEAU+jnFM55EMrlLMJduJLM1Sg9PN1gPlChu9BtPNDfhbOYzh2NDvL6jAEJQRmeXOUxbG+OjaDWecAnHJ7PJNx1xL72rD5HC+YtbCHaHLWLVLVIokAzu9mFZjTtkj12Lk=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=nELR0AG6ykj7IewQ+VEaOZ+4U+W09QWTbbBa1f2/xd4=;
	h=date:mime-version:subject:message-id:from;

The apmixedsys driver leaves the OF provider and clocks registered
on unbind. The clock table is device-managed, so the provider can
retain a pointer to released storage.

Remove the provider and unregister the dividers and PLLs during removal.

This issue was found by our static analysis tool under development.

Fixes: b27284336aa4 ("clk: mediatek: mt8167: Move apmixedsys as platform_driver in new file")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..70fc5e5215e5 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -118,6 +118,8 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_dividers;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_dividers:
@@ -128,6 +130,15 @@ static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void clk_mt8167_apmixed_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
 	{ .compatible = "mediatek,mt8167-apmixedsys" },
 	{ /* sentinel */ }
@@ -136,6 +147,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
 	.probe = clk_mt8167_apmixed_probe,
+	.remove = clk_mt8167_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
-- 
2.43.0

