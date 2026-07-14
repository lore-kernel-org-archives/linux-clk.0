Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615E33EB17;
	Tue, 14 Jul 2026 05:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007283; cv=none; b=JpGPLDjRqBgeal/SdQ1klt+MShOUVG5j8W79DnAUcviyDcabI0Wui3INzinCJgDYY6sylEVcO8BOyP2kTguS2r5B6ZeaytwPfuyvVDJj0TdAWUF8pxPN0C15cFec6MMezOvegF28vLufbcMn1CNAR4ABHf+P/SA8x1z5om/Pymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007283; c=relaxed/simple;
	bh=p1/E4zjtdOm9liqVtFQca1RiSI7fEp81HyZSVnVfHOc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fMO2AAyBtLsLGOPL0w48TSLQrO0Q0vq5FGJTvtTG9Pe3KpoePIz1vnYde0z1M3nGoPPGoiNJepdJPjp9UX8iBAiHs9kC+tHf2t66mHXCvzllUU75HVBFy6LEkdltFWW0ACyzc0frU7zmRYt+ueZ1RG8iEZ1X3nMDMKG1vKj+hbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowACXB+toylVq6FImGA--.60893S2;
	Tue, 14 Jul 2026 13:34:32 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: duje@dujemihanovic.xyz,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clk: mmp: pxa1908-apbcp: Remove unneeded semicolon
Date: Tue, 14 Jul 2026 13:30:59 +0800
Message-Id: <20260714053059.3219704-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACXB+toylVq6FImGA--.60893S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DArWDGr4Uurg_yoW3Arb_uF
	y0grnrZ345A3ZIkF15JryfZryYyFs5Zrs8u3WSkanxA3yUur47XrW09F1xJ347GrZ2grW5
	G34vk34fArna9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOMKuUU
	UUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clk/mmp/clk-pxa1908-apbcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbcp.c b/drivers/clk/mmp/clk-pxa1908-apbcp.c
index 1aa476103553..4e646e8b7440 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbcp.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbcp.c
@@ -61,7 +61,7 @@ static void pxa1908_clk_reset_init(struct device_node *np,
 		cells[i].bits = BIT(2);
 		cells[i].flags = 0;
 		cells[i].lock = apbcp_gate_clks[i].lock;
-	};
+	}
 
 	mmp_clk_reset_register(np, cells, nr_cells);
 }
-- 
2.25.1

