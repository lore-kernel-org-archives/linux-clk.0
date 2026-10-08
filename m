Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8538734A;
	Thu,  8 Oct 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482818; cv=none; b=dJS/iVWVbxjhpokaXdstk232GCRTBJk9p4JHqCJjuGY3Dw27HAsxPaoMlZMLXLP71GD54tEH4zwDGHXkDyMe00FkCoYWPiee2YFWatB5ybGUqcvri1LL7cmgufx6PBGpljR5ksAXg4Z+K1F2Rf1S0/GUOUjSsEzK6J/GDO9G0bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482818; c=relaxed/simple;
	bh=saGXw7QD0k/G2G4hUUWh++eNezhSC8dz6QsjXbqNOMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O0l5BsVZ48ea4iLPBdfCqhfT/ta0aQxBMO0nz/8nvbGca3tbWWcIbvrbbRLBUWqLeIpyTqSMcVoochSqnPcrLOrZKv8/yd3s7OTWRrodmIfCnFIqWDJsjcfXil6hNL6VNWNXiM0yoGNRF2v1LSQq2is8e0rK59wKWP8agdDhBek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3QkC528dqqQsQCg--.12759S2;
	Fri, 09 Oct 2026 02:06:50 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: composite: fix NULL dereference when the parent clock is not set
Date: Fri,  9 Oct 2026 02:06:52 +0800
Message-Id: <20261008180652.2756849-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3QkC528dqqQsQCg--.12759S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZryrJr4DJrWDGF4xJr4UCFg_yoW8JrW7pr
	WxJFWjyrW5Xr12vFnrt3ZrA3WF9F1S9asrWFyvva4rArn8W3WxZ34Fkas8Zr4xurWfKrWa
	vr4qya18AF1rJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUklb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JV
	WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8CtC5UUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIOA2rHpl173gAAs7

clk_composite_determine_rate() reads the parent clock with
clk_hw_get_parent() and hands it to
clk_composite_determine_rate_for_parent() without checking it.
clk_hw_get_parent() returns NULL when the clock has no parent yet, for
example while the parent is still an orphan, and the helper dereferences
that NULL pointer in clk_hw_get_rate(), which reads parent_hw->core and
oopses the kernel.

Return -EINVAL when the parent clock is NULL.

Fixes: 2f508a955a67 ("clk: Convert basic types to clk_hw based provider APIs")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/clk-composite.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
index 11842bce5918..40d64ef2d325 100644
--- a/drivers/clk/clk-composite.c
+++ b/drivers/clk/clk-composite.c
@@ -75,6 +75,8 @@ static int clk_composite_determine_rate(struct clk_hw *hw,
 			struct clk_rate_request tmp_req;
 
 			parent = clk_hw_get_parent(mux_hw);
+			if (!parent)
+				return -EINVAL;
 
 			clk_hw_forward_rate_request(hw, req, parent, &tmp_req, req->rate);
 			ret = clk_composite_determine_rate_for_parent(rate_hw,
-- 
2.25.1

