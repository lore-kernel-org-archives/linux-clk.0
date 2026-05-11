Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7058F3624C2;
	Mon, 11 May 2026 05:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477588; cv=none; b=QHRj/2kZ6VBbJ/ty2lGXn51rHR39TKh+LszuU/z4zWoyHQvHR8kOtUmgNQwjFgABYIXszXhWkPTYo+UJt7oIs6Hd+Jj1X0Y1nlwQL8WYwL/1/h/HV2dJLp4bv+uPO07CiVMrJivJLeEDo7bFFTA4xSj+SBjJCy5r7K8VkRU6oso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477588; c=relaxed/simple;
	bh=w9gwQDCXrashyxwWZA9eCykizovNYhQX7dsfKGeV4bI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=I75xG9Lz5UfVt62C5fbnwmh6K4UkLjOgGiqlVtFegjOuzoMxYzisjtRbmvNEkI8ke3y1gl0gfrqaywJMarUuCAffuJIVut4/qq2a9ObCpfaFSwjUcuTRevAVRZUV7lAv2vHFAo1t6bgew8Q0ESP6Mb3/hm3Yc37z0mq5QSBP41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Q3ngipXo; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Q3ngipXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cD
	2+lgBuFI27KghVIEd+Gx12BhJgjpDVT7FGyD3Emgs=; b=Q3ngipXofwHkcZ7DNM
	Ad0VOVn/LjcaNxRmuWoqo5100xV3ey44KdegnJWe0Wg4NqC+0G9wA43R791h2Z1/
	5wXd44jqJW0zXe8OHhlnkhuA8E4UqPd6Vk4E9spCgpV/YZFgPg35HgzMKmh5dCEa
	yYhk3i7m3Yimltd+8tXRYdwyc=
Received: from zero.localdomain (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgBHrTrkaQFqsjjaAg--.57493S4;
	Mon, 11 May 2026 13:32:20 +0800 (CST)
From: Min zhang <zhangmin2026@yeah.net>
To: Wei Xu <xuwei5@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Min zhang <zhangmin2026@yeah.net>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller
Date: Mon, 11 May 2026 13:32:14 +0800
Message-Id: <20260511053216.538035-1-zhangmin2026@yeah.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgBHrTrkaQFqsjjaAg--.57493S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFy7Zw4rtFWkWrWfZryDGFg_yoWkJrg_CF
	WjkF1Uur98KFWYkF1YgFW3ZFyaya4Dur10qa43KFnxta4kCw45JrWqvr4Uur9xW34fury3
	CF4ktrsxA3ZFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbHGQ3UUUUU==
X-CM-SenderInfo: x2kd0whplqjiysw65vtdko0vbw/1tbiIAVuE2oBaeWniAAA3Q

Using devm_kmalloc() does not zero-initialize the allocated structure.
Uninitialized members in struct hisi_reset_controller may contain garbage
data, which can cause reset_controller_register() to fail unexpectedly.

Replace devm_kmalloc() with devm_kzalloc() to ensure all structure fields
are properly zero-initialized.

Fixes: reset controller registration failure due to invalid dirty data

Signed-off-by: Min zhang <zhangmin2026@yeah.net>
---
 drivers/clk/hisilicon/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 93cee17db8b1..c3b7daac9313 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -91,7 +91,7 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 {
 	struct hisi_reset_controller *rstc;
 
-	rstc = devm_kmalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
+	rstc = devm_kzalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
 		return NULL;
 
-- 
2.34.1

