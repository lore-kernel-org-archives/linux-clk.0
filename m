Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D08486326
	for <linux-clk@vger.kernel.org>; Wed, 25 Dec 2024 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735106781; cv=none; b=ieEfUDi8KZ1ynioot47NqYy/+LAMW+7shoh8Nw4UYM2Zrh4BlPNyvQG7SmkTVMMzJvkAw8BwIl40S2ldg2BnXURB9fsYxjNtaMLIqelreNFjVtS1KvoeBW2pC4+T7NPyBeySlYKvxafp7kChLlvb2fO/WlJr7auZ+Kn7wTbdP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735106781; c=relaxed/simple;
	bh=TZbcHTFnuugWaCI/UvMSIRSwvn8uWrQVBEjHxp9ZNDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVlXUOgR23c/8WAuGMO8wJBbgJxiPKqqsX6nyuIqJqBAZ58dW6n4P/RcpRxBAmcg3GNIjtNiSm2ZHO5Ov+jSpQc2qvskFu0R7m2eO3nbrXRQqtoawcDCSl0X+oB5TbhGVj2cwUZc+bFoMS4TU2RWC5HM/8Ze3T8MBlLQAo6ltrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8BxuuDXoGtngElaAA--.47896S3;
	Wed, 25 Dec 2024 14:06:15 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMBxXcfUoGtnl4MIAA--.45830S3;
	Wed, 25 Dec 2024 14:06:14 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	linux-clk@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] clk: clk-loongson2: Switch to use devm_clk_hw_register_fixed_rate_parent_data()
Date: Wed, 25 Dec 2024 14:06:00 +0800
Message-ID: <20241225060600.3094154-2-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
References: <20241225060600.3094154-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXcfUoGtnl4MIAA--.45830S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw1rtrWxKrWftw47Cr13Jrc_yoWkCFXE9a
	yIvr18Gr1DAwna93Wjy3W7ZrWS9ws7ur1xZa4YgFs3J340vFn5GFZ7ZF4jkwnrAa1UWry3
	G3WkWryfuw1kGosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU489NUUUUU

Since commit 706ae6446494 ("clk: fixed-rate: add
devm_clk_hw_register_fixed_rate_parent_data()"), we can use the
devm_clk_hw_register_fixed_rate_parent_data() helper and from then on
there is no need to manually unregister the fixed rate hw.

Since clk_hw_unregister_fixed_rate() was not called before, we also fix
the memory leak that was present.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/clk/clk-loongson2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-loongson2.c b/drivers/clk/clk-loongson2.c
index 7082b4309c6f..6bf51d5a49a1 100644
--- a/drivers/clk/clk-loongson2.c
+++ b/drivers/clk/clk-loongson2.c
@@ -335,8 +335,8 @@ static int loongson2_clk_probe(struct platform_device *pdev)
 						       &clp->clk_lock);
 			break;
 		case CLK_TYPE_FIXED:
-			hw = clk_hw_register_fixed_rate_parent_data(dev, p->name, pdata,
-								    0, p->fixed_rate);
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev, p->name, pdata,
+									 0, p->fixed_rate);
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "Invalid clk type\n");
-- 
2.43.5

