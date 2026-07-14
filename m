Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F8330B15;
	Tue, 14 Jul 2026 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007027; cv=none; b=rxEKZZb/QE5Bx6QySMiq7Fe2kBIbwbg1DeAVnTIMZHPgaOgmTa3EAIWqVebCI8PySoD3+8FLkeOk/CPUqCtdQND5PiUJ4rX4a9xTt1NI9JLwgpWOXmcz7e6m9WAi7vp4oapRq5gc8Geejk9LHtUMMko+SFYFNoQK78yV9lmH62Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007027; c=relaxed/simple;
	bh=OuZsFT6ZyujLtGTPWS2YG7rsmceuViOT0puxayu60ss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rm0TnY5qFJyRRt7Uxm8+ze1Ej7KNsXj46J4+5Brwt8F7BXMOMPHKHVILowNmgZAlP/xDgXjlJXIHHyTrzvFJC6DNQzAmdjpQ8YASQ+62lf5Qb28LyppxWA+0ljn7LlH4EF0bMJ75IPqg9YMQQJBDLSFKf2vQw6IJCHhFwAc2vNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABXq85cyVVqTjcmGA--.60605S2;
	Tue, 14 Jul 2026 13:30:04 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: duje@dujemihanovic.xyz,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: bmasney@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clk: mmp: pxa1908-apbc: Remove unneeded semicolon
Date: Tue, 14 Jul 2026 13:25:25 +0800
Message-Id: <20260714052525.3219644-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABXq85cyVVqTjcmGA--.60605S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DArWDXFy7Wrg_yoW3WFg_CF
	y0gr1xZ345A3ZxCFy5Jr4fZryYyrs5ZFs8u3WSkwsxA3yUur47WrWF9F47J347GrZ7KrW5
	C34kKryfCry29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbWv35
	UUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clk/mmp/clk-pxa1908-apbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
index 438ece4f047d..16c1f13bca1f 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbc.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -114,7 +114,7 @@ static void pxa1908_clk_reset_init(struct device_node *np,
 		cells[i].bits = BIT(2);
 		cells[i].flags = 0;
 		cells[i].lock = apbc_gate_clks[i].lock;
-	};
+	}
 
 	mmp_clk_reset_register(np, cells, nr_cells);
 }
-- 
2.25.1

