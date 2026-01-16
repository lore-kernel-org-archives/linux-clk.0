Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844CB369218;
	Fri, 16 Jan 2026 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563557; cv=none; b=N88kbgCpW107XU77J+g0e9k8JHg5oDAkDbV8p32O0sS0in1Xald3MR/uWzbVXboi7P6mCZf3yjzoOSseZCz+Tee7qwnFTXkShna/AmaEulJgTPiIeMPgo0vlATbMKnD99ZDCUZzHXxOBDp70/ItZc2ModTsmoK28SMMxw+ISotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563557; c=relaxed/simple;
	bh=fT/BnHCWjD1ABfa5cgJaDhLQAgxsF/atAKV+YKoBptg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ORI/Lr1nS6jjcDwavCL0xEimF806tKJ/8Vv2O+xE3l1tkC/YpJnWyOGAhUAMcXc/5xSr36TeWAKIjn6ujZxSn1cegPPjP34sTsG3czojXyrC1FNROlOZ5GJ2+PbPx+kC6muJRmvtiLWjmxowAaHvB9JRGhtvkgHQ7RLfbyPzG54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAC3TBBMI2ppZbMsBQ--.56400S8;
	Fri, 16 Jan 2026 19:39:08 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 6/7] clk: st: clkgen-pll: Remove redundant kfree() in clkgen_c32_pll_setup()
Date: Fri, 16 Jan 2026 19:38:46 +0800
Message-Id: <20260116113847.1827694-7-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3TBBMI2ppZbMsBQ--.56400S8
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4ruF1DtF1Uuryktw13urg_yoW3CFcEkF
	WIkayIvw15Gr45Cw1Uua1fZ34Fv3Z5ZFn3WFn3t343t34UXryUGrWaqw4fXw13XrWfGrn0
	kw1fGr1UCr1UJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6kFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	A2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYcTQUUUUU
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAYJE2lp3x-UCgADsN

In clkgen_c32_pll_setup(), pll_name is actually pll_clk -> core->name.
This variable will be released in clk_unregister() -> __clk_release()
if some error occurs. Thus kfree(pll_name) will cause a double free.
Remove this redundant kfree().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/clk/st/clkgen-pll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index f748e1fce735..89f0454fa72e 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -826,7 +826,6 @@ static void __init clkgen_c32_pll_setup(struct device_node *np,
 	return;
 
 err:
-	kfree(pll_name);
 	kfree(clk_data->clks);
 	kfree(clk_data);
 err_pll_unregister:
-- 
2.25.1

