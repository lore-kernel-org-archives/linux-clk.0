Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618D85474F;
	Thu, 20 Aug 2026 02:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787194315; cv=none; b=jpe1VUxxgTXJnIJN4ALUTrwrm9JcBxDke4+W1SQL2Kc3/amnX+vuF6x/PxaJKkgVVFmWtdj+5bLTeD2t9W4NB6XfHh56Ei5ru4caTtN8ZNRNApxePLlUBfhA9PfX3e3cbkw9IhXJL/bKz8lbuhBLMpEmX18aMNbG46102PeYYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787194315; c=relaxed/simple;
	bh=Tbr5f4pXvR8dl15AGdNh1A56curnbUAAZaJXs5B+LQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g3AziVcdQMtWQYnaxIJ6D46z0AXsyFglSmyDUkp8zTxBqSyVFSHDr3wiYRam70rFlAGf8YUYJw6f2tR8uCJm1kWBZfmFR+eaCbmQ0lGI402eknLay3NrUkROO/YWk3QqHD7EaqpDvt/r3Lq2hbeAQGOkIV3XJUNjIZla45w6SGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=mQZIKCcs; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="mQZIKCcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	To:Cc; bh=+zR3JbKqlnqGjEc9RlVNong1ZuGV5UBuaUbdZmVuibo=; b=mQZIKC
	csoWJ/FusxG3sPMTvsEQaTjhkPQAYT2w+FVhiiqZzIpize8L4AmVR8ZTtJXgBQTb
	eV9kyIC0qqtG8U5Q5aM8NAco0P8IAXbFp2Rw/EPwJr6N/sT47Wk39wIZkh4PV9/x
	aSaA5I0XbZJgFi090AvDppMCvx4uxhCT/bvv8=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCXxs2aa4Zq1ZcAAA--.171S2;
	Thu, 20 Aug 2026 10:51:06 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Thu, 20 Aug 2026 10:50:47 +0800
Subject: [PATCH] clk: ultrarisc: Register DP1000 clock provider earlier
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAIZrhmoC/yXMyw6CQAyF4VchXdNkHC+jvIpxUWrVKgHSDoaE8
 O6OuvxOcv4FXEzFoakWMHmr69AXbOoK+EH9XVCvxRBDPIRjDDh12cjUGbkb+IU3nZEk0Tbt42l
 HCcpzNCnzr3q+/O1T+xTO3xSs6wdigVVQdwAAAA==
X-Change-ID: 20260820-ultrarisc-clock-fix-ae7a375294a7
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787194251; l=2524;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Tbr5f4pXvR8dl15AGdNh1A56curnbUAAZaJXs5B+LQA=;
 b=opyheXmk6eohVwrYXASuN5zDO9sk49F6stX7CRjxxgQmwd5MMa+vttXcuwjuJaD//OAQdp9xA
 6lxgQSCt+IDDsZ20zkrqWSQ0iGAJEs8p8yus1AWgzX6qTGLinxsfRg9
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwCXxs2aa4Zq1ZcAAA--.171S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4rZw4kCr4DKr4fWry7trb_yoW5GrWrpF
	Z8GFy3JrsrAr48tFsFya12vF98Z3WqqFWjg3y7Jwn0va15urWkWFZ7Kay5AFnrXr48GwnI
	yr4UArWxCa1q9aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUBVbkUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQACEWqBK-oACgARsz

The DP1000 PCIe and clock drivers both register at the device initcall
level. Since the PCIe driver is linked first, its probe runs before the
clock provider is available and defers.

sysfb_init() runs at the same initcall level before deferred probes are
retried. It claims the firmware framebuffer aperture, so the later PCIe
host probe cannot allocate the overlapping prefetchable window and the
GPU is not enumerated.

Register the clock provider with subsys_initcall() when built in so PCIe
host probing completes before sysfb_init(). Keep module builds using the
normal module init and exit paths.

Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Register the built-in DP1000 clock provider earlier so the PCIe host can
complete resource allocation before sysfb claims the firmware framebuffer
aperture.

This patch is based on the clk-next branch.

Validated on a DP1000 system with a PCIe GPU across repeated cold boots.
---
 drivers/clk/ultrarisc/clk-dp1000.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ultrarisc/clk-dp1000.c b/drivers/clk/ultrarisc/clk-dp1000.c
index ffea77c4cca0..8073e179c67a 100644
--- a/drivers/clk/ultrarisc/clk-dp1000.c
+++ b/drivers/clk/ultrarisc/clk-dp1000.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
  */
 
+#include <linux/init.h>
 #include <linux/module.h>
 
 #include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
@@ -147,7 +148,23 @@ static struct platform_driver dp1000_clk_driver = {
 		.of_match_table = dp1000_clk_of_match,
 	},
 };
-module_platform_driver(dp1000_clk_driver);
+
+/*
+ * PCI host drivers are registered before sysfb_init() through link order.
+ * Register the clock provider earlier so the host controllers do not defer
+ * probing until after sysfb has claimed the firmware framebuffer aperture.
+ */
+static int __init dp1000_clk_init(void)
+{
+	return platform_driver_register(&dp1000_clk_driver);
+}
+subsys_initcall(dp1000_clk_init);
+
+static void __exit dp1000_clk_exit(void)
+{
+	platform_driver_unregister(&dp1000_clk_driver);
+}
+module_exit(dp1000_clk_exit);
 
 MODULE_IMPORT_NS("CLK_ULTRARISC");
 MODULE_DESCRIPTION("UltraRISC DP1000 clock controller");

---
base-commit: ef96a64997e62fc5cc91fb3bc7a3fc1046fef259
change-id: 20260820-ultrarisc-clock-fix-ae7a375294a7

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>

