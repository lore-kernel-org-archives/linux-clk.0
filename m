Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8F332EC8;
	Tue, 16 Jun 2026 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613032; cv=none; b=QOIpEYHORaBqptKoVc/XxpF4GDdNmp6VFbBxtFw/OqsQ5R2zzkq89dZth1O2gcrnxmV3PFLf7RYapSwCV7vgVv2NZk5bPIGW1kmpCSjSKLFDClmVaz5hE9xySKJBTjBamHzmpAoXW2De7juTdc0AdmduYAueiKC9qpen7O2jVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613032; c=relaxed/simple;
	bh=XEYD6roccu4mBSSXJYwdYqGd7vdfAEBD0RydUbVWXHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uh8c0JM4acYwoNI3hjmqw1u8pUGdeLXy1o/PWIAgDELb0zHXP2MkmSblm2aG7WY70ry2cwRdaDHYDvgV/8lVXVJxrTa1g3FJE//gLy3I1ncNl6Bt23f/B1LnWW/3fiLkDSanSerzFo+RLfmkIvutDzStDUZGaxm4V27LxIFxkoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADXYQXRQTFqayHBEw--.14646S2;
	Tue, 16 Jun 2026 20:30:10 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] clk: mvebu: ap-cpu: fix missing clk_put() in ap_cpu_clock_probe()
Date: Tue, 16 Jun 2026 12:29:36 +0000
Message-Id: <20260616122936.1669366-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADXYQXRQTFqayHBEw--.14646S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWrKr1rWFW8Xw1xWF1ftFb_yoW5GFW8pF
	18GF9Ykw47GrWj9ay7tF4DuryrWw1xtFy5Aw40yasak3Z3JF1UGr10ka95ZF1UurW8X34a
	qF4UG3WUuF1DZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JjjLvNUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwAA2oxFfyguwAAsh

The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
reference to the parent clock for each CPU cluster, but it never
releases it with clk_put().  The returned clk is used only to read
the parent's name via __clk_get_name(), and the reference is leaked
on every successful cluster initialization as well as on the error
path when devm_clk_hw_register() fails.

Rather than adding clk_put() calls, replace the of_clk_get() +
__clk_get_name() pattern with of_clk_get_parent_name(), which is
the intended API for this use case and handles the reference
counting internally.  This matches the pattern already used by the
sibling drivers clk-cpu.c and clk-corediv.c.

Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v2: Replace of_clk_get() + __clk_get_name() with of_clk_get_parent_name()
    as suggested by Brian Masney, instead of adding clk_put() calls.
    Also correct the Fixes: tag to point to the original commit that
    introduced the leak.
---
 drivers/clk/mvebu/ap-cpu-clk.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index a8175908e353..1cf63c7a0bc3 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -288,7 +288,6 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		char *clk_name = "cpu-cluster-0";
 		struct clk_init_data init;
 		const char *parent_name;
-		struct clk *parent;
 		u64 cpu;
 
 		cpu = of_get_cpu_hwid(dn, 0);
@@ -304,13 +303,12 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		if (ap_cpu_data->hws[cluster_index])
 			continue;
 
-		parent = of_clk_get(np, cluster_index);
-		if (IS_ERR(parent)) {
-			dev_err(dev, "Could not get the clock parent\n");
+		parent_name = of_clk_get_parent_name(np, cluster_index);
+		if (!parent_name) {
+			dev_err(dev, "Could not get the clock parent name\n");
 			of_node_put(dn);
 			return -EINVAL;
 		}
-		parent_name =  __clk_get_name(parent);
 		clk_name[12] += cluster_index;
 		ap_cpu_clk[cluster_index].clk_name =
 			ap_cp_unique_name(dev, np->parent, clk_name);
@@ -328,11 +326,9 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		ret = devm_clk_hw_register(dev, &ap_cpu_clk[cluster_index].hw);
 		if (ret) {
 			of_node_put(dn);
-			clk_put(parent);
 			return ret;
 		}
 		ap_cpu_data->hws[cluster_index] = &ap_cpu_clk[cluster_index].hw;
-		clk_put(parent);
 	}
 
 	ap_cpu_data->num = cluster_index + 1;
-- 
2.34.1

