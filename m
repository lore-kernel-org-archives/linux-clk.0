Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681615;
	b=kehQb2u9GIDjLgYQuxdHIhySm4RWuB1n8/v5r+voWti6XhWmR0ijpZXP7HR6oDVsce6w
	 CAH2u+KzxZeXwaiYBV56m7dOsPtnhM1zmsRZwapr2BJPECGbOU+b7dafTY0dYJJh8UPAn
	 FjDQ4sFzxG0gSqVp7gkbejpoODEcJMqMeAkf/ERs8xL7ynKbPaGeOHrmEdu9xozHgXmiW
	 G/nswCLijZk8xlM92700fglXoarqG1fsao31Z0GNseKagnKsT4Hcv5ivbV95D+USWWAlt
	 zUZ0+NdG5YvBqjaQZJIJ8J7qOsB5dGclCLPECRs2+/hRx0yfq0FhAa1Wda8xil/ui2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681615;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=f5BoHCYmI3AueGUF8gtZThk/HSnjp4gpzVbfV1gUkLc=;
	b=T6eHMlinDrPkrvh11dyvGOnSTx02zDf7z3VpWw6PzMRdsNyoIVKKfI+F5DVfGFfA5L5d
	 xims4Ac93tBGQq51PdFcJmpadV6mYWcC6ftg8pjvXAMiJQRLymfvSN7HQyOE15Mb1HbGq
	 anHZobL3FimwsciXjTmmpyzsaUwCByFcAMsWWc334IYN1OpL2+LENQYZOFZnFvugZM7gK
	 Rz4Ljgy4hjhSLru+2InykV9ao6DRCVzElgp90DzXdQFqinI8TDMaP48xvKZsNZ0C7dSgv
	 IqAX918g1j9pau8BIj3kcpvwCq3KsizIHjxRxhNyTn3IpnD7NCfzPPv+kFHUmt45XCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cnSjooVO;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE06606A31E
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 08:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE06606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cnSjooVO
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726936;
	Thu, 26 Nov 2026 16:26:49 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	arnd@arndb.de,
	krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: nuvoton: Manage MA35D1 mux clocks with the controller
Date: Thu, 26 Nov 2026 16:26:48 +0800
Message-ID: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa216f6e77703a1kunm282c61bd3c2aef
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUhPVkMZHh4dT0gfGEIfQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cnSjooVOuMpS5jSUAo2Q5Hrqdg//m1kQY4FuXYpcCxIbDlRanWJf7LgpXmz1eP7q+UciBNoy2BXvf/nZSY2FfvIbeHt42SsTCfTs326fcVJpN5S4XtJUEU6qU8+hZQoMedXGctyOSKKoyY6RQFd8DdyGTr1DeDbizfQoV2oGsqA=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=f5BoHCYmI3AueGUF8gtZThk/HSnjp4gpzVbfV1gUkLc=;
	h=date:mime-version:subject:message-id:from;

The MA35D1 muxes remain registered after the platform device releases
their register mapping. Use managed registration so both mux helpers
unregister their clocks before the registers are unmapped.

This issue was found by our static analysis tool under development.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index e95f72bb8103..4428556b64ad 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -380,9 +380,9 @@ static struct clk_hw *ma35d1_clk_mux_parent(struct device *dev, const char *name
 					    const struct clk_parent_data *pdata,
 					    int num_pdata)
 {
-	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
-					       CLK_SET_RATE_NO_REPARENT, reg, shift,
-					       width, 0, &ma35d1_lock);
+	return devm_clk_hw_register_mux_parent_data_table(dev, name, pdata, num_pdata,
+							  CLK_SET_RATE_NO_REPARENT, reg, shift,
+							  width, 0, NULL, &ma35d1_lock);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -390,9 +390,9 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     const struct clk_parent_data *pdata,
 				     int num_pdata)
 {
-	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
-					       CLK_SET_RATE_NO_REPARENT, reg, shift,
-					       width, 0, &ma35d1_lock);
+	return devm_clk_hw_register_mux_parent_data_table(dev, name, pdata, num_pdata,
+							  CLK_SET_RATE_NO_REPARENT, reg, shift,
+							  width, 0, NULL, &ma35d1_lock);
 }
 
 static struct clk_hw *ma35d1_clk_divider(struct device *dev, const char *name,

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

