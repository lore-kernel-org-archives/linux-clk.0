Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC9D28E;
	Wed,  8 Nov 2023 06:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JQ9YS+K2"
Received: from mail-m25473.xmail.ntesmail.com (mail-m25473.xmail.ntesmail.com [103.129.254.73])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7070E10C9;
	Tue,  7 Nov 2023 22:28:01 -0800 (PST)
DKIM-Signature: a=rsa-sha256;
	b=JQ9YS+K2TeSv6VPrUp5ha/ZcZV5v0ebwyKo9b/+UYL584zoPILrwFLnFfZNDdFK9bHQ7nSIK5Xmgf4YXFnhNznROO1RyfX7KnIjBIn3BJdPhVVDb/tjQcjOSGiBJxt/gIT1Yb2nWS85ndD/Y1gbefde8k00Z8TJpyGovby0PGFg=;
	c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ZNeB2wozA8E90INwwcWUSVp2xe4Q7ySaQgoaY7gbCkY=;
	h=date:mime-version:subject:message-id:from;
Received: from localhost.localdomain (unknown [58.22.7.114])
	by mail-m11877.qiye.163.com (Hmail) with ESMTPA id 5B78B40030F;
	Wed,  8 Nov 2023 14:18:28 +0800 (CST)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com
Subject: [PATCH v5 1/4] clk: gate: export clk_gate_endisable
Date: Wed,  8 Nov 2023 14:18:19 +0800
Message-Id: <20231108061822.4871-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231108061822.4871-1-zhangqing@rock-chips.com>
References: <20231108061822.4871-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlLT1ZNSkIdSUpOSB1PTRlVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
	kG
X-HM-Tid: 0a8bad950dcc2eb3kusn5b78b40030f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mz46IRw4DTw3MQoqPChCSE03
	DTEKCT1VSlVKTUJCT0lPSEtCSElIVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhLSUw3Bg++
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

make clk_gate_endisable not static, export API for other use.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 drivers/clk/clk-gate.c       | 3 ++-
 include/linux/clk-provider.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index 68e585a02fd9..531bb84a5b3e 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -53,7 +53,7 @@ static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
  *
  * So, result is always: enable xor set2dis.
  */
-static void clk_gate_endisable(struct clk_hw *hw, int enable)
+void clk_gate_endisable(struct clk_hw *hw, int enable)
 {
 	struct clk_gate *gate = to_clk_gate(hw);
 	int set = gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
@@ -87,6 +87,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 	else
 		__release(gate->lock);
 }
+EXPORT_SYMBOL_GPL(clk_gate_endisable);
 
 static int clk_gate_enable(struct clk_hw *hw)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index ace3a4ce2fc9..76b050d73feb 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -630,6 +630,7 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 void clk_unregister_gate(struct clk *clk);
 void clk_hw_unregister_gate(struct clk_hw *hw);
 int clk_gate_is_enabled(struct clk_hw *hw);
+void clk_gate_endisable(struct clk_hw *hw, int enable);
 
 struct clk_div_table {
 	unsigned int	val;
-- 
2.17.1

