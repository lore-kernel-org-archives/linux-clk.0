Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F3B38D6A8;
	Fri,  9 Oct 2026 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516417; cv=none; b=uGWYtjNK7s6mU7TU5qjPPPESOrhRsKdkAoomI5ZKhx3NxdBlKCzWLWJwdmm7bNn0SEdMGkwgQ7b9jF6v5e48R1M1+HEfF3SflwLl0UpURGgdGFFnScWJo3yJpXF2ePIcErQMwR0ps+Pyf/ihYniFo+mZAutxH1B/GqanToGkrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516417; c=relaxed/simple;
	bh=9KbUaRvxBC9ojQfsY+RGhkGd9t2c9q0ipCLDcxdt0wU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DAK6IP0oiZIMyp49RnkCNH65SWGhqcBNUhx9nT5o1YyEBWZJMJuhieqrBqHrEId0sDFmUkBV9tb8eBSr3MlsZKWA5s/lPWlg4eb7qcFJAiK2S+IQrsiXgjLPuasxFfPz9ZJZNz+gx28CIgNF8k3pqK4bXvFw0xOEEvqIIyFmxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTz3pXshq46QaCg--.1824S2;
	Fri, 09 Oct 2026 11:26:33 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?UTF-8?q?Beno=C3=83=C2=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=83=C2=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: eyeq: release OLB mapping in eqc_early_init() error and success paths
Date: Fri,  9 Oct 2026 11:26:36 +0800
Message-Id: <20261009032636.3059201-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHTz3pXshq46QaCg--.1824S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF15Xry5AF1ftw4ruw1DGFg_yoW8AFWfpr
	WDWFW5Jrs8XanrZr1rXry7ZFnxK3WI9FW2kFy5Cwn3ZwnIkFyFga1UJa4UuFyDGr4rJa1Y
	vr4F9a1UCF1UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9jb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F4j6r
	4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7IU54T5tUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQPA2rIJHzgoAAAs+

eqc_early_init() calls of_iomap() to read the early PLL registers, then
returns to the caller without ever calling iounmap(). The mapping is not
stored in any structure, is not devm-managed and is not carried over to
the platform device, so it is leaked on both the success path and every
goto err path (early clock probe failure and of_clk_add_hw_provider()
failure). The early clocks registered here are all fixed factors, so they
do not keep the mapping alive.

Release the mapping with iounmap() before returning on success and in the
error path, initializing base to NULL so that the allocation failure path
taken before of_iomap() does not unmap an uninitialized pointer.

Fixes: 25d904946a0b ("clk: eyeq: add driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/clk-eyeq.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index cf37feccc734..257e1094aa27 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -1240,7 +1240,7 @@ static void __init eqc_early_init(struct device_node *np,
 {
 	struct clk_hw_onecell_data *cells;
 	unsigned int i, clk_count;
-	void __iomem *base;
+	void __iomem *base = NULL;
 	int ret;
 
 	clk_count = early_data->early_clk_count + early_data->late_clk_count;
@@ -1288,6 +1288,9 @@ static void __init eqc_early_init(struct device_node *np,
 		goto err;
 	}
 
+	/* base was only needed to read the early PLL registers. */
+	iounmap(base);
+
 	return;
 
 err:
@@ -1313,6 +1316,9 @@ static void __init eqc_early_init(struct device_node *np,
 
 		kfree(cells);
 	}
+
+	if (base)
+		iounmap(base);
 }
 
 static void __init eqc_eyeq5_early_init(struct device_node *np)
-- 
2.25.1

