Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E22DECCB;
	Wed, 25 Mar 2026 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774419744; cv=none; b=iA5Bipr1+cX2LFRVCAPS5qFUeeZ0ZcOUEaoRgyIkBC3RTQOmc+iF52BMwFtn9Aajb8lCUj+E813IrqVb8DjHWOAFq64y0K01/eEjDVx15LpxSUUYx4UBc0Slv3cTWBtsKi/pbQmsgozB5t2/idGamv/0qcvfrvOMJseGsVEY6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774419744; c=relaxed/simple;
	bh=FehqyOWyi3bfrz+u6yEmY5D089wR8kzYPlzSGzUh4ws=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u4n6YFuTBQwGe1p4EFQewe2OWfG+wNsGHrKHJHDdr9GZbolU/KkhhRK+zsh3/s80UZLijUiWZDBNqyIjAI+jcyVhAOyb+NvIOm8rC3Gv/s3W0axMyBc6zckxtj4QS8ZRyu8YaDDMjRneC1+WMfYknxN0Bcd1rH4lq++VWrNgaec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRAOf8NpSmFsCw--.50284S2;
	Wed, 25 Mar 2026 14:22:07 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: vireshk@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] clk: spear: fix resource leak in clk_register_vco_pll()
Date: Wed, 25 Mar 2026 14:22:04 +0800
Message-Id: <20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3zRAOf8NpSmFsCw--.50284S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyUXrWfKF45Zr17ZFWkZwb_yoWfGrgE9F
	WrA3s7trZ8GryrCFyUCw1rZryF9F48ur4fuF1Iqrnxta4UZFyDCryIvw45A348u3y7u34D
	t3W7KrWfWr1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUBVbkUUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwoRE2nDXPpvqgAAsG

Add a goto label in clk_register_vco_pll(), unregister vco_clk
if tpll_clk is failed to be registered.

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/clk/spear/clk-vco-pll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spear/clk-vco-pll.c b/drivers/clk/spear/clk-vco-pll.c
index 723a6eb67754..ceb82723fa8c 100644
--- a/drivers/clk/spear/clk-vco-pll.c
+++ b/drivers/clk/spear/clk-vco-pll.c
@@ -343,13 +343,15 @@ struct clk *clk_register_vco_pll(const char *vco_name, const char *pll_name,
 
 	tpll_clk = clk_register(NULL, &pll->hw);
 	if (IS_ERR_OR_NULL(tpll_clk))
-		goto free_pll;
+		goto unregister_clk;
 
 	if (pll_clk)
 		*pll_clk = tpll_clk;
 
 	return vco_clk;
 
+unregister_clk:
+	clk_unregister(vco_clk);
 free_pll:
 	kfree(pll);
 free_vco:
-- 
2.25.1

