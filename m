Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681574;
	b=RikO03xDEKmHVzKdOzpmNGz23ANym7MdVFakatL/egprb2jLu7T7952s1Ju/OrMGeSHH
	 d1csnNKicUKiXfk1+4dxRpfnCJaUCyQ7fWdm3LWnB1MQkW4xCqi74Kiz6lEjqqEKOOgjL
	 Uhx4w/LbMNxCARwFh91Y2KdG0CDbmcDKKjWrHl5z6Pu7NTi2ZDm31HrIOgkKyRw4GNmvy
	 /2CRHhkJC5pkSorB8ItBKWxUxpKATA2L4UVQzSoC6iqh9WTZ1wBqSOsUu1bpPLRJ/c5ct
	 665pEPcc7Dt48xNQv4tcccrXzaOB8c1KgOxu5EuVy81xLIoHPRNgKwpbLoiywMGEecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681574;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=Frt4iJSN4qjcmbAUkqM+QYh/uQluAlfo97xzc3WIxIs=;
	b=XXuFfBz5djPjh+YnpxzxQxVJ5SB8EQ7IHe8KmQv95U0qP7VzyxVl/zR/l7h1H4KqamAn
	 HDlMl0xmCL5SoxZ6FQTK5w3JCPf6Q9rMzqSSP3+W4EUWOC1s5pr9Yh/u++SDcuc5XlJW/
	 fdbkm/cXDyMME03seCW3CUDtoLt/FuHh0pJbwuROtFZvz82JKH/f/m+dHJuWomgS1tStU
	 bDBpc7pR1R4NYQT/E63dII0Q4/BhAoMWZuaRnAWcqsRhMRSiKjuHK1oKwBVv6SVsLsRZY
	 dqace8u4vwbu9YzhszG+NSu2Z2R+WEEYGKZLpzy3m40PG11mqQQ5yzL0EqJlzNSDzNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Mzhhcjjj;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55655606A31E;
	Thu, 26 Nov 2026 08:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55655606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Mzhhcjjj
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726901;
	Thu, 26 Nov 2026 16:26:09 +0800 (GMT+08:00)
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
Subject: [PATCH 2/4] clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
Date: Thu, 26 Nov 2026 16:26:08 +0800
Message-ID: <20261126-a35bb25eb5-u14-2@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa216f64bb803a1kunm1e3afcc53c29eb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTBhPVklIHxkdSh1DGUkeQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=MzhhcjjjKIoWIAcK1gW3hfyLLsjR2MKY4YA8m6VPAQUXFrqiL0RoHHBbhqkhR615JDMEuXqfChyfGh1LXD2poIIsXtrUGQtIkkwyoTaLO0+HQEjv4M88LsnLxZRnjxBiL3nLJGB8csR8ODFrHb5u60kkgi1pIUzF1tytmXH2dsI=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=Frt4iJSN4qjcmbAUkqM+QYh/uQluAlfo97xzc3WIxIs=;
	h=date:mime-version:subject:message-id:from;

The apmixedsys driver leaves the OF provider and clocks registered
on unbind. The clock table is device-managed, so the provider can
retain a pointer to released storage.

Remove the provider and unregister the gates and PLLs during removal.

This issue was found by our static analysis tool under development.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
index 6242d4f5376e..e1fc3f2beafa 100644
--- a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
@@ -168,6 +168,8 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
@@ -178,6 +180,16 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void clk_mt8183_apmixed_remove(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks),
+				 clk_data);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
 static const struct of_device_id of_match_clk_mt8183_apmixed[] = {
 	{ .compatible = "mediatek,mt8183-apmixedsys" },
 	{ /* sentinel */ }
@@ -186,6 +198,7 @@ MODULE_DEVICE_TABLE(of, of_match_clk_mt8183_apmixed);
 
 static struct platform_driver clk_mt8183_apmixed_drv = {
 	.probe = clk_mt8183_apmixed_probe,
+	.remove = clk_mt8183_apmixed_remove,
 	.driver = {
 		.name = "clk-mt8183-apmixed",
 		.of_match_table = of_match_clk_mt8183_apmixed,
-- 
2.43.0

