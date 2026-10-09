Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427EE28030E;
	Fri,  9 Oct 2026 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526694; cv=none; b=UhqbjyhbH785j34iISBxfQJQIfNLhFxGXda1hvR2r7sTWzMxBkkOaK6DszDy68dOzp/oeNeFLYHpFZyrQOUwkOjKcFcWo/0GRwzkZfX68UbuctYWojlSFf0mOgFuYDKxnRSnaP/gcPMuyo/rIadp/CpTu7zjkBDgJJRTzhUvW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526694; c=relaxed/simple;
	bh=SZmQhXlCcoR5tvmnf5De2r3+ym5Ip5M8iYEPFc4a3kE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NprcgtNGAI67m+8qCToosAqi6HLoD/KrF4s8NzPkE9MymD1gVAp+dx2i7AGxWfDdqavy0CmX2DuV1TU8xOPPPTi9neIYM2icN5uYUUR1n0wuWlZMrkhtyu9EpDnQwbb9w1zM5LaevAAJSqATdLVKRhhFq43PE3dPt7qPCyXhkmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADHzz0ah8hqltkdCg--.22649S2;
	Fri, 09 Oct 2026 14:18:03 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Michal Simek <michal.simek@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: xilinx: fix NULL pointer dereference in xvcu_clk_hw_unregister_leaf()
Date: Fri,  9 Oct 2026 14:18:05 +0800
Message-Id: <20261009061805.3172589-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADHzz0ah8hqltkdCg--.22649S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFykGr17tr4fur48Kw45Wrg_yoW8JF4Dp3
	WfC34rA34rtF4UJF47tF1aqFyFg3ZxKay8AFyUX3y7Arn5JFWfKa1rJas2gF4UZryxXrya
	v3y5tF4UuF1rZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4UJVWxJr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0rWrUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMPA2rIZ8pguwAAsX

xvcu_clk_hw_unregister_leaf() gets the mux with
clk_hw_get_parent(divider), which returns NULL when the divider has no
parent, and passes it to clk_hw_unregister_mux() without checking it.
The following check tests the wrong variable: divider has already been
verified to be non-NULL at this point, so "if (!divider) return;" is
dead code and a NULL mux is dereferenced, crashing in
clk_hw_unregister_mux().

Only unregister the mux when it is non-NULL, and always release the
divider.

Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/xilinx/xlnx_vcu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index f14bda375e35..b004c16692d3 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -516,9 +516,8 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
 		return;
 
 	mux = clk_hw_get_parent(divider);
-	clk_hw_unregister_mux(mux);
-	if (!divider)
-		return;
+	if (mux)
+		clk_hw_unregister_mux(mux);
 
 	clk_hw_unregister_divider(divider);
 }
-- 
2.25.1

