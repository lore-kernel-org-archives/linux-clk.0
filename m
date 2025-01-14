Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F7322DC2C
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859651; cv=none; b=LPhVuNPbfwJzmHYjQVU3j2CwRejrPWtTPUurImNPaUnVQ9sVX2nxGhoefSKOw8COEc7K0460YM5aoij6/0JOnJ9KH7hTWVF+I7Xt+k/2rV1xXrOKymkJgYNcs7Gf4s0O/sRkUXq1qbFcdmluGo4rqndEKnNY526FxCkpUkO25nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859651; c=relaxed/simple;
	bh=TZbcHTFnuugWaCI/UvMSIRSwvn8uWrQVBEjHxp9ZNDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3BPWGMwE9CgLpWX+pP4vkNLgvOs6C19xt5m3dU/haVe7KVV/Da5AxaCbY2L3izglbT5RhJKaylE6PvZ2nv2yhN57Cqk3Jk3wT9E7JhbiPpxnMAj7+IhZGQs52feON3Hl7KNbdMuJb62Xa2EEcD5NF1qzT+1/s2drCJQpWyZBTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.63])
	by gateway (Coremail) with SMTP id _____8DxG+L+X4ZnGDdjAA--.62844S3;
	Tue, 14 Jan 2025 21:00:46 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.63])
	by front1 (Coremail) with SMTP id qMiowMAx7+X6X4ZnhBwiAA--.3371S3;
	Tue, 14 Jan 2025 21:00:45 +0800 (CST)
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
Subject: [PATCH v3 1/2] clk: clk-loongson2: Switch to use devm_clk_hw_register_fixed_rate_parent_data()
Date: Tue, 14 Jan 2025 21:00:28 +0800
Message-ID: <8733a7485619bdb791de25201a3d7984d1849c9f.1736856470.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1736856470.git.zhoubinbin@loongson.cn>
References: <cover.1736856470.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAx7+X6X4ZnhBwiAA--.3371S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw1rtrWxKrWftw47Cr13Jrc_yoWkCFXE9a
	yIvr18Gr1DAwna93Wjy3W7ZrWS9ws7ur1xZa4YgFs3J340vFn5GFZ7ZF4jkwnrAa1UWry3
	G3WkWryfuw1kGosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_Wryl
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWU
	AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
	AFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
	A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU
	0xZFpf9x07jrPEfUUUUU=

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

