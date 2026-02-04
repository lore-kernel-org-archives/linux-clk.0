Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AD37F8A1;
	Wed,  4 Feb 2026 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186945; cv=none; b=f+10ndJ2hMzhKhx+O6cGvYerlpJgxK1TH5BJ1dSfMBdn9zwkdA7qYlnbJl7OUAw/IykfQmrbB+X4NIPXlKK2qaAT6DhWZUOL9RmabfR1q0uN34MVKdqlGlJkI16ErtFbX2nuFVCvgF4oOQXa5Zxpdd6spkA1fvaX5sSp8JyaE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186945; c=relaxed/simple;
	bh=hmWkaU2iC0O60EGEhGz1dlpnnq8a7xdzdmwYgRBQdR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZM+pHxcaUqqx7TraRb4tuoGXZWCIDegLJ6Y45Ha3JxyshNUtyNNX7PAcUAU7TnCuLJJBfYOKPhDTvHfmEUnZqF3+1UpvXwJ3ltVvEih+bM02aL+zlywxxLdAK1k+0oJJkcNjDQxR8Drm7HycxChdVAZ7zGmhVP/tjQJSYb0Cu+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAC3Ym6w6IJpVXkeBw--.25971S2;
	Wed, 04 Feb 2026 14:35:28 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: linusw@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	liviu.dudau@arm.com,
	sudeep.holla@kernel.org,
	lpieralisi@kernel.org,
	robh@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clk: versatile: vexpress-osc: Check return value of devm_of_clk_add_hw_provider() in vexpress_osc_probe()
Date: Wed,  4 Feb 2026 14:33:32 +0800
Message-Id: <20260204063332.1791986-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAC3Ym6w6IJpVXkeBw--.25971S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFykArWDWr1xGr4kCry8Xwb_yoW8JFyxpF
	WxJFWxGwsrtr48W39xtr1xuFn0va45tFy8Ja47C3y8Zw45Cw4ktF48GFy0gF4kXr98Aw4a
	vayUCr4rAr4UZFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjmiiDUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Return the value of devm_of_clk_add_hw_provider() in order to propagate
the error properly, if it fails due to resource allocation failure or
device tree clock provider registration failure.

This ensures that the probe function fails safely rather than proceeding
with a potentially incomplete clock provider setup.

Fixes: 03cc105f2edf ("clk: vexpress-osc: Use the devres clock API variants")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clk/versatile/clk-vexpress-osc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/versatile/clk-vexpress-osc.c
index 9adbf5c33bd1..2292fee4e423 100644
--- a/drivers/clk/versatile/clk-vexpress-osc.c
+++ b/drivers/clk/versatile/clk-vexpress-osc.c
@@ -97,7 +97,10 @@ static int vexpress_osc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get, &osc->hw);
+	if (ret)
+		return ret;
+
 	clk_hw_set_rate_range(&osc->hw, osc->rate_min, osc->rate_max);
 
 	dev_dbg(&pdev->dev, "Registered clock '%s'\n", init.name);
-- 
2.25.1

