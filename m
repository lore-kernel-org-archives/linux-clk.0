Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD282F693F;
	Wed, 26 Nov 2025 03:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764127618; cv=none; b=niX4qbSHbuGPLbeM6Jko1P6sRSi3NgEccgmb/zP4+A8fONjpwO5lgTTtR2pKZXR1sGA+83a95GBWtx3cfr0/QN8UGmxdO1ztQqCBU3kynLtGXelZZs9kkQS9GgVCNWAcBLJzGGEhfJ9W9T2Of+M0COcctm9IkKboXaibsHgWlp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764127618; c=relaxed/simple;
	bh=rjwFl4C0qhr2JjzAmGIGU9d0MFC6CJsFrmggK9XtmoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DogIwpgzR0gfrjsH1qUfcO5idSXHPyB3Y4d0UtpZJFT2vG5HjCi1JIhgZgHd4PEIMi5GJuTSnd1QBjGsff2DfdIdoPHoMbKr6sj0A/su/Jd/ntdjTxpjOAyqDk5rMWOSNGedujD3E/uULuzCLgXsGyzcfCVDpjgqR/RJ8b8WSj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABH3s1scyZpodwSAg--.5509S2;
	Wed, 26 Nov 2025 11:26:37 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: kernel@esmil.dk,
	hal.feng@starfivetech.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] clk: starfive: jh7110-sys: Use devm_clk_notifier_register()
Date: Wed, 26 Nov 2025 11:25:34 +0800
Message-ID: <20251126032534.1628-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABH3s1scyZpodwSAg--.5509S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JryDtrW8ArW8XryftF1fZwb_yoW8JF1Upa
	4fCF95AFZFgr4xCa90vF1DAFWrAa48XFWIqas7Zry2yws8GFWUJ3y0kFWDXF17Jry7Zw45
	Jr4qyr4rZa15Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUj_cTJUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8SA2kmR+quFQAAsO

The clk_notifier_register() in jh7110_syscrg_probe() is not unregistered
in the error path, leading to a resource leak and potential use-after-free
if probe fails after the notifier is registered.

Use devm_clk_notifier_register() instead to automatically unregister
the notifier.

Fixes: 538d5477b252 ("clk: starfive: jh7110-sys: Add notifier for PLL0 clock")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 52833d4241c5..4f915038bd4b 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -430,7 +430,7 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
 			return PTR_ERR(priv->pll[0]);
 	} else {
 		priv->pll_clk_nb.notifier_call = jh7110_pll0_clk_notifier_cb;
-		ret = clk_notifier_register(pllclk, &priv->pll_clk_nb);
+		ret = devm_clk_notifier_register(priv->dev, pllclk, &priv->pll_clk_nb);
 		if (ret)
 			return ret;
 		priv->pll[0] = NULL;
-- 
2.50.1.windows.1

