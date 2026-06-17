Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B312F7EE9;
	Wed, 17 Jun 2026 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781660508; cv=none; b=BI1LXtEWABifyI8liwXbdpqNt6XN57ZqYv2M2JgWKS+FeJqo9LRMoxddQtw1kvjj4sOIAot89cm9UfPt0EjXaKe/6DwVhfw4KRuT7mC8R4OknSZsm2vDvkU7j916gCagXbPoreThjyzzMUkYNEM4D+4gtru07tp6mRj+NRO1IbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781660508; c=relaxed/simple;
	bh=go0g7QcABmr12Jgo9k9XjM24WBqy7n4DdpdYjpisnho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TdwC+BQbsa1E4BEZUTB0iV46v3uYt4SdA4lfkuUsY6M06v6Bp/G1/G+Pb05ZF1MZ9aDTDwX5ttJ89sx7c9QfvTCohIgger6pL6WxJ+5M2R408pdAv675BumsAnTruAtVf0h8AdUcrvTaclVexFtU6LOgstMRB5SNakMj5XNk8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3mtNK+zFqFtz9AQ--.29079S2;
	Wed, 17 Jun 2026 09:41:30 +0800 (CST)
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
Subject: [PATCH v3] clk: mvebu: ap-cpu: fix missing clk_put() in ap_cpu_clock_probe()
Date: Wed, 17 Jun 2026 01:41:26 +0000
Message-Id: <20260617014126.1716291-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3mtNK+zFqFtz9AQ--.29079S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWrKr1rWFW8Xw1xWr13twb_yoW5Gw13pF
	18GFyFkw47Gr4j9ay7tF4DuFyrWwn7tFy5Cw40yasak3Z3JFyUJr10ka95ZF1UurW8X34a
	qF4UJ3WUuF1UZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ec7CjxVAajcxG14v26r1j6r4UMcIj6I8E87Iv67AKxV
	W8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E
	6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU9o7NUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcBA2ox7QI3QAAAsK

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

Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v3: Replace incorrect Fixes tag.
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

