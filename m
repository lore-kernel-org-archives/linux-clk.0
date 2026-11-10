Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317540;
	b=Dm0yZz+I0ItsqVczR73zz2RZOzsr7AJQahdItuLqO0UaZbp/hFaPPWZ2F2wm0u0PD5oy
	 mJL+Ef9V7QieqWxBDZX/UdisGfkPI2WpElID4S9Ryfc4+X+UvZ7NR7lXIQanhAQv2Ay0I
	 W9fIJdFvKUYnWERQaLML3ir3dmAe6MKI7I416xSiXhnjQZrmT76YVonBrEY4MAS+tX0H0
	 18z/Asz2/W7Q89TYwbMYiRnGGncDetnzK/Wu4iP/y1pnOHkPHE481ZulElAA3Rp4o5aBE
	 RgF2b6ycx6wsJ2u3BAlXkJs4R3w/jvbQyAXoITXmW0fgQg7zOtftAwkXleztEST1+wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317540;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=dq1cBQ6iyCTiQzj2dMA+Vh5aAYILJ0VwOYo8PbD6sdY=;
	b=QCow4JjmzEy3cHuztgz8EIYom7PNsAa1UqCbS49I4JrOigVzNVmS7dzoiC3L40xVaPQT
	 GyoluHoUBTx39QnZTGBjpRHf+drF8m5oZ2JFtuiBhZYJcu8PxmpVBoEfFnUhtkKMiefr0
	 HtDQddB6olsouFATIdwg6goJtnvjiMEQGE06+cZasDJ44SpPD5cvQdEu0Clrr+/XARqH+
	 hMfEZyEipcUBq0MC6Jn9YsD3wwJn4Gm+nCwPtNUNAn1tWr3Jtg+zzeY2dV0MWt5YMfADt
	 0UtWj60CqJicsQq6HOTjW2FKxXbJOsXOTpNthkhS84aOcgWe+zaoZt40M1JHGfISTzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B706606A768;
	Tue, 10 Nov 2026 13:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B706606A768
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.1.1] (unknown [223.166.93.97])
	by APP-01 (Coremail) with SMTP id qwCowABnj_nVHPNqe_62AA--.3592S2;
	Tue, 10 Nov 2026 21:32:06 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 10 Nov 2026 21:32:05 +0800
Subject: [PATCH] clk: eswin: Keep the TCU AXI clock enabled
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-eic7700-tcu-aclk-v1-1-72db82bf59c1@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIANQc82oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MD3dTMZHNzAwPdkuRS3cTknGzdxJRkoyRT41QLY3NDJaC2gqLUtMw
 KsJHRsbW1ANW2mmxiAAAA
X-Change-ID: 20261110-eic7700-tcu-aclk-adc2b53e8371
To: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>, 
 Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:qwCowABnj_nVHPNqe_62AA--.3592S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1kCw1rKF4UZFWDuryUJrb_yoW8ZFyDpF
	sxtFs5uF1ktr1fWa42yFyaqrZ3Aa1UGa43GFy8G3WkZ3WUKr1v9F48Kas8tayUZw1xXw15
	tryxJay3GF4j9aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRMHDGry1-3bzQAAs1

The SMMU TCU needs its AXI clock for DMA, even in bypass mode. No driver
claims this clock, so clk_disable_unused() gates it and DMA through the
SMMU stalls. On the HiFive Premier P550, this hangs firmware loading of
an RX550 graphics card.

Mark the clock as critical.

Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Tested on the HiFive Premier P550 with an RX550 graphics card:

- Without this patch, amdgpu stalls while loading the RX550 firmware
  and CPUs can no longer be halted.
- With only the TCU AXI clock kept enabled (the TCU configuration clock
  is still managed normally), amdgpu initializes and the IB ring tests
  pass without any manual register writes.
---
 drivers/clk/eswin/clk-eic7700.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7700.c
index 43a47fe16ab14ae1d1cacc3a0da0203e412541c0..7c95055f13eb782a03723e4475d63060d37711aa 100644
--- a/drivers/clk/eswin/clk-eic7700.c
+++ b/drivers/clk/eswin/clk-eic7700.c
@@ -832,8 +832,10 @@ static struct eswin_clk_info eic7700_clks[] = {
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_D2D_CFG_CLK, "gate_d2d_cfg_clk",
 			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,
 			CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_D2D_CFG, 31, 0),
+	/* DMA through the SMMU still needs the TCU AXI clock in bypass mode. */
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_TCU_ACLK, "gate_tcu_aclk",
-			EIC7700_CLK_DIV_DDR_ACLK_DYNM, CLK_SET_RATE_PARENT,
+			EIC7700_CLK_DIV_DDR_ACLK_DYNM,
+			CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			EIC7700_REG_OFFSET_TCU_ACLK, 31, 0),
 	ESWIN_GATE_TYPE(EIC7700_CLK_GATE_TCU_CFG_CLK, "gate_tcu_cfg_clk",
 			EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-eic7700-tcu-aclk-adc2b53e8371

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>

