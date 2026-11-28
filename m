Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859143;
	b=2t21j59i81ZFrCZe/SliEeVv4avm8tLtDXJ56PaLQwbRwVqmAuT9oiSJb9tJitchiQJv
	 SXH+dxqGqder6/+lt8AOh7zfEmJAIr5s4TdqEoSQ312Loap+8j4Kr+fZFiOJ2PWOPucPm
	 vrHL/zxqAHpXQ+YGHiN0Od+6N8pTyhHT9u/lIWj7dDPTx3VCGq3jElI0QeFdXF02qyA9u
	 X6AjSoAVO7Bkab+MACJ4Orf/bnrctRsC/e488L8QPaNcYChx/BBS2xTSF77qfoezEoc++
	 PfPWzDu29nAQ6wl5XcJC6UTe44c3Rf0lC8m7pDfOJU31H408IjzyOy6hhuCPeucu+Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859143;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=3CAosbaI5LjZjgDzCWrtpfTjHB3ppxaqxWfqT3R7ekg=;
	b=5cbBqGLCXYTyTZbNI9jB7Dh4qoKClNEYPexSOEKE1gmgbxkEgW0wtldIAHKjjFaHWsXW
	 vDzmnrBe7K3jYYV+ssH/tExHDaaYcsWxVKIzJTYhkKOZSH2kxevQO5ThMH34z7XWtU/X+
	 bUrmYYgq7ie91e+0fcZfuXeVbUkBOj3l/7VR/4M/REwD4xjgDY8p3hahegLWEjdWVJqNt
	 WpT/jeac9UDUszSxyNrMpztLf5zGy3caAsI1r0CqwtPahixb+B/SjCUoLWv5Q4S2g2rnZ
	 HPp/HTBEkG955Ywpw/JVFyFrbgmhR3PtT+06QiOzPZtJZdbt3zyusqD6ks7+DWojhGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UL4N2UUj;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C0D606A31F
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C0D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UL4N2UUj
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0883;
	Sat, 28 Nov 2026 17:45:37 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	m202171776@hust.edu.cn,
	peng.fan@nxp.com,
	dzm91@hust.edu.cn,
	lyx2022@hust.edu.cn,
	zero12113@hust.edu.cn,
	mr.bossman075@gmail.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] clk: imx: Manage the OF clock providers for i.MX8M and i.MX93
Date: Sat, 28 Nov 2026 17:45:36 +0800
Message-ID: <20261128-f81b700d6c-u08-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2218bc4a003a1kunm51837f624520c0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0lNVhgYS0odTkpPQ04fSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=UL4N2UUjMvTKQaP3HkglMmjabxAWzwTwyt0mcNU0IORrI3cnAnQRST4GiBHAg4Duu/cTC/W87URiFLaRXJcqLKXMoKV7vxswPS96DIbAHPa3uICN1j0j5JeAhW9y0hwXaRuD/2uGiz5fPd5xDnqJUxTQwWp4kkFh+5wyTCL51vY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=3CAosbaI5LjZjgDzCWrtpfTjHB3ppxaqxWfqT3R7ekg=;
	h=date:mime-version:subject:message-id:from;

The i.MX8MN, i.MX8MP, i.MX8MQ and i.MX93 clock drivers register an OF
provider backed by a device-managed lookup table. When a modular
controller can be unloaded, the provider survives the table it points
to.

Manage the provider on the same device so OF stops exposing the clock
table before devres frees it.

This issue was found by our static analysis tool under development.

Fixes: 188d070de913 ("clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe")
Fixes: 878b02d5f3b5 ("clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()")
Fixes: 577ad169966e ("clk: imx: imx8mq: correct error handling path")
Fixes: e02ba11b4576 ("clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/imx/clk-imx8mn.c | 2 +-
 drivers/clk/imx/clk-imx8mp.c | 2 +-
 drivers/clk/imx/clk-imx8mq.c | 2 +-
 drivers/clk/imx/clk-imx93.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 9d4c3064dd2c..3d9f54c00d34 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -596,7 +596,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(hws, IMX8MN_CLK_END);
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MN\n");
 		goto unregister_hws;
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index c621beb1fa0a..a41616776dc7 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -866,7 +866,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 			imx8mp_clocks_apply_constraints(imx8mp_clock_overdrive_constraints);
 	}
 
-	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (err < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MP\n");
 		imx_unregister_hw_clocks(hws, IMX8MP_CLK_END);
diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index a1f34e05ef77..ddb2d4a43ce4 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -598,7 +598,7 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(hws, IMX8MQ_CLK_END);
 
-	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (err < 0) {
 		dev_err(dev, "failed to register hws for i.MX8MQ\n");
 		goto unregister_hws;
diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 1f10833659df..8c7373ca4441 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -354,7 +354,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
 
 	imx_check_clk_hws(clks, IMX93_CLK_END);
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
 		dev_err(dev, "failed to register clks for i.MX93\n");
 		goto unregister_hws;

-- 
2.43.0

