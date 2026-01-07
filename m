Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C382FE560;
	Wed,  7 Jan 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767777782; cv=none; b=VzYTjMoam6jfTTvqdB/DcNFAt8BSOuSh0Z84UahmY6S/NrU3YM0btqk0lzuWNGTkvRepGCv526Yjk7wons3eWIvzWYnbrzI1Y64nul3YRAX/R7yVDpQB5LAuqAAzGL31paYkx5rZJ/vp7yQeuVvw0vAdfQ82/3/mAKJGX9UlIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767777782; c=relaxed/simple;
	bh=ivxwLV3FRmH0lqMS19Wzy+ciUG9zGHSGXy52zH4zh58=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s0NQqwq1TpqcV39g1jr0mh8p6Jr3WWRg3VFM2Ul9ZWVnZZ2vyHlMAxpHveKRFEBjZEVXtw4SHG5a97Do+LiyqKPmGoBq2uEcs7zWMBQouvSECgcDOUMPyjulvU2p6gK/j21MoSq7SFsXPtmHJiOFuep6gvawZ2DuWmFW6upnu8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-03 (Coremail) with SMTP id rQCowAAXN97rJV5psvDzAw--.12821S2;
	Wed, 07 Jan 2026 17:22:52 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] clk: st: clkgen-pll: Add a cleaup in clkgen_c32_pll_setup()
Date: Wed,  7 Jan 2026 17:22:50 +0800
Message-Id: <20260107092250.3423379-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXN97rJV5psvDzAw--.12821S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrykuryrGryUGw4xtF15CFg_yoW8Jw4Upa
	ykGw4Yy3yDXr4DWF48ArWkuas8W3Z2gFyxCFWUGwn3uwsIqr98Jr4rWa4v9a45A3yxuF42
	qr4qyrWxZFyDAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUU
	UU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwkAE2ld-eePpQAAsZ

Add a iounmap() to release the memory allocated by
clkgen_get_register_base().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/clk/st/clkgen-pll.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index c258ff87a171..cc1dd9523fb2 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -777,7 +777,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 	clk = clkgen_pll_register(parent_name, datac->data, pll_base, pll_flags,
 				  np->name, datac->data->lock);
 	if (IS_ERR(clk))
-		return;
+		goto err_unmap;
 
 	pll_name = __clk_get_name(clk);
 
@@ -785,7 +785,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
-		return;
+		goto err_unmap;
 
 	clk_data->clk_num = num_odfs;
 	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
@@ -827,6 +827,9 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 	kfree(pll_name);
 	kfree(clk_data->clks);
 	kfree(clk_data);
+err_unmap:
+	if (pll_base)
+		iounmap(pll_base);
 }
 static void __init clkgen_c32_pll0_setup(struct device_node *np)
 {
-- 
2.25.1

