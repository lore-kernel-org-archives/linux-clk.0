Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6D548A8A7;
	Thu, 13 Aug 2026 15:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635429; cv=none; b=E0M4Bvu+azLDGmVm3AZMoYIqe/NfS/Z7OEOnq4VKoQQrZFtEsSe6L3gHcyAhEwuNEx2+MdvMOcOvQxmzxYNGW9I+bguO70CZ/HY68oBJpQFpwlLgQWt8jfMemIZDv9hMwDCgJmtmGztDASeL1KZGIKAMs75HtSIiGt8o3qPCweU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635429; c=relaxed/simple;
	bh=1ZOjUzEasQmspzp5856lSg7JSPNiAksoaag0llovkx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=urZIhmYBXy+IoRA5Z0EraUbVWg4U/bn/HJjfrPijFjpUxKfcgWILX6pTgK1LlMDIRXZ3/QlgmPus5+G8NTOUUFQF/CL7mb40XtIMczlViWx8j3Qdg4Btm10JIw2QWjziMRS0TOdeuQelBMH8PUTox+HnkU9CknwVuNBhvcW0d+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAB3Se2S5H1qhhJ6BQ--.9319S2;
	Thu, 13 Aug 2026 23:36:50 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] clk: si521xx: correct the SI52147 OF output enable map
Date: Thu, 13 Aug 2026 23:36:50 +0800
Message-ID: <20260813153650.44793-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAB3Se2S5H1qhhJ6BQ--.9319S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr48JrW7KF4fKFW3CFW3Jrb_yoW8CrWkpF
	WagryY9rWSqr17AryxX3W0vFW5uan8X34Ikr9rA3y2v3sIyr4jyFySkFW0gF9Fqrn5WrWa
	y3WDt3y3XFs5ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjZNVP
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The SI52147 data sheet assigns DIFF0 through DIFF3 output-enable bits to
0x17 in control register 1. The OF match data uses 0x15, leaving the
DIFF2 bit out of the map, while the I2C ID table already uses the
documented value.

Use 0x17 for the SI52147 OF entry so both enumeration paths expose the
documented outputs.

Fixes: edc12763a3a29 ("clk: si521xx: Clock driver for Skyworks Si521xx I2C PCIe clock generators")

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since the RFC: https://lore.kernel.org/all/20260624055810.49310-1-pengpeng@iscas.ac.cn/
- replace the table-consistency assumption with the SI52147 data sheet
- send as a normal patch now that the register value is documented
- disclose the use of Codex

Data sheet: https://www.skyworksinc.com/Application-Pages/-/media/SkyWorks/SL/documents/public/data-sheets/Si52147.pdf

The change was reviewed against the data sheet and source. It was not
tested on SI52147 hardware.

 drivers/clk/clk-si521xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index ceadc07bcb6d..d5be08e12685 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -374,7 +374,7 @@ MODULE_DEVICE_TABLE(i2c, si521xx_id);
 static const struct of_device_id clk_si521xx_of_match[] = {
 	{ .compatible = "skyworks,si52144", .data = (void *)SI521XX_OE_MAP(0x5, 0xc0) },
 	{ .compatible = "skyworks,si52146", .data = (void *)SI521XX_OE_MAP(0x15, 0xe0) },
-	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x15, 0xf8) },
+	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x17, 0xf8) },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
-- 
2.50.1 (Apple Git-155)

