Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B72DEA97;
	Wed, 21 Jan 2026 01:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958573; cv=none; b=di0YsL6PJUjq25AkfF5KopJQwfOj0A+44P7dWYMO2zjkKZOUfrB2NynTD2EN/1EWjjwI9/WD6HDzI8J2US1hSOMUMXzPGW3tMM4dil0JggCya4AMWS7jk1qgRd2CTPq2gts1ZI9Aj3LB3GVXucikFKjlPJ8ittf9kEh8e3DHE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958573; c=relaxed/simple;
	bh=qcBzSlikjwgktBRFNfiEhXzWSxLomGgatXcz6Y27nsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pKsXPifXojUjE14pHPhGB1dxIYyV+ESWYRbJCu0EP6odGAEkDH76nm6yGBlKprnwJopvEO8dVseo0C+RlyELjKpswFZyoJgZ5jRB9+E7CFHcNOGOgncd7usj5ab78kdHqEVUoSWOOgSDl2y6ueOAUZ/JPohYy7rCD8xS8NOItR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.108])
	by APP-05 (Coremail) with SMTP id zQCowAB3zhFdKnBpw6_aBQ--.10840S7;
	Wed, 21 Jan 2026 09:22:46 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2 5/7] clk: st: clkgen-pll: Add clk_unregister for pll_clk in clkgen_c32_pll_setup()
Date: Wed, 21 Jan 2026 09:22:21 +0800
Message-Id: <20260121012223.186199-6-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260121012223.186199-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260121012223.186199-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAB3zhFdKnBpw6_aBQ--.10840S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr18tw1UAFW5tFW8JF1xGrg_yoW8WrWfpa
	yrGw1Yy34DXr4vqF48JFWDuas8Wan2gFW7CFW7Cwn5uwsxtry5Jw4Ygas293WUA3yxuF4a
	qr1q9r40vF4UAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r
	1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbx9NDUUUUU=
	=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwkOE2lwF5s6OwAAsH

In clkgen_c32_pll_setup(), clkgen_pll_register() allocated a
clkgen_pll memory and registered a clk. Add clk_unregister()
and kfree() to release the memory if error occurs.

Fixes: b9b8e614b580 ("clk: st: Support for PLLs inside ClockGenA(s)")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/st/clkgen-pll.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 073180754a56..ddf7673a52c5 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -764,7 +764,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 	int num_odfs, odf;
 	struct clk_onecell_data *clk_data;
 	unsigned long pll_flags = 0;
-
+	struct clkgen_pll *pll;
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
@@ -787,7 +787,7 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
-		return;
+		goto err_pll_unregister;
 
 	clk_data->clk_num = num_odfs;
 	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
@@ -829,6 +829,10 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 	kfree(pll_name);
 	kfree(clk_data->clks);
 	kfree(clk_data);
+err_pll_unregister:
+	pll = to_clkgen_pll(__clk_get_hw(pll_clk));
+	clk_unregister(pll_clk);
+	kfree(pll);
 err_unmap:
 	if (pll_base)
 		iounmap(pll_base);
-- 
2.25.1

