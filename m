Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A7537B036;
	Wed, 14 Oct 2026 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948041; cv=none; b=aul4bdjPik6LoW4uneC6h+tKqVVrqUmTjtk8dF92QI82r0ganoyb36ZBv2w6y7m4IA2jPJNSQsTr+6EDeDs1pwaMZ4h+fuPpALqaH1vwCvtNHRnxKZv/CSNK+qbyKiIikTANW4YNc3axFUKI6gyfodB+xvnn5K7B1NoACwhRto0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948041; c=relaxed/simple;
	bh=XXP1Oe3O1uOa+CEogFFdON5HTK41bHM/PS2zSuyI5OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XahLOOWK0IOkrIKls+vYFS3hgHPvBTkl1EHv5OZj1AeVuPVa0hWpGR8a+hGih5Odm3/juaQVC52AKQNkyNVPxrM0TlvQFEhZYr4oIgzzPkMTpaSpN8nlPYtoOyr5NF6zY963airf+RADSpUxivjsX6Mcjs/lqY9gesTp3gqRB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=CR6ihR5B; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="CR6ihR5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	To:Cc; bh=IIxs36Bve+nby6anrsC5+87F747GmUbCD2cJNVWQmsI=; b=CR6ihR
	5BIxkbOhdOK4feaJabNeesrKA76frJiT6pPgSGFPgQPcRH/wpEV/+MhoIA+2PtaT
	M36C6cs+RqrN76LEG9CnLVulr33M9FpO3PudH9TpMSQp9M/SiYV1pCVzj6eK4SuT
	xV5Rhl8xjNTXhIpjJ+7ROYVeC0NJVYFVHdlFw=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAf79M5qwwACAA--.1049S2;
	Wed, 14 Oct 2026 11:20:28 +0800 (CST)
From: Xincheng Ji <jixincheng@ultrarisc.com>
Date: Wed, 14 Oct 2026 11:20:12 +0800
Subject: [PATCH v2] clk: ultrarisc: Register DP1000 clock provider earlier
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAOz0zmoC/32NwQ6CMBBEf4X07JqyIgVP/ofhUNZVVpGaFoiG8
 O8WTDx6fJM3M5MK7IWDOiST8jxKENdFwE2iqLHdlUHOkRVqzHWBGoa299ZLIKDW0R0u8gLLxu7
 MHsvMGhWbT88xXldP1ZfDUN+Y+mVqMRoJvfPv9XZMF+//w5hCChc0lNuy0HWGx5+1JfdQ1TzPH
 0P+o3rMAAAA
X-Change-ID: 20260820-ultrarisc-clock-fix-ae7a375294a7
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791948025; l=3148;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=8h8+LoiQkvg8Vpd3/qZ1CQngrjgBqVXpQHuX2VQR3eo=;
 b=E1/H4FTJQCAMbktT5Du4x26D3BPKbeojaAsY6Z1eniU5uULMOzFt+hiXC0b1lxRD2F3IllRVs
 NYk7X+HzqSgBIIZGG34ftZYFwSbD8Ml36Dt3RQrSZwuxkEvuM+aD9Y2
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID:AQAAfwDHQAf79M5qwwACAA--.1049S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr4rZw4kCr4DKr4xXFy8AFb_yoW5ury3pF
	WUGFWayr1DJFWrtan2qa18ZFyYv3WDXa4jga1UKw1Yvw15Zryv9F92gay5ZFnrXr1xGrnI
	yr15uryIkayj9a7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9S14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAIcxvE14x267AKxVWUJVWUGwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
	4UYxBIdaVFxhVjvjDU0xZFpf9x0JU4KZAUUUUU=
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAJDmq-VKkAAgAcsw

From: Jia Wang <wangjia@ultrarisc.com>

The DP1000 PCIe and clock drivers both register at the device initcall
level. Since the PCIe driver is linked first, its probe runs before the
clock provider is available and defers.

sysfb_init() runs at the same initcall level before deferred probes are
retried. It claims the firmware framebuffer aperture, so the later PCIe
host probe cannot allocate the overlapping prefetchable window and the
GPU is not enumerated.

Use subsys_platform_driver() to register the clock provider at the
subsys_initcall level when built in so PCIe host probing completes before
sysfb_init(). The helper keeps the normal module init and exit paths when
the driver is built as a module.

Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
This v2 uses subsys_platform_driver() from Brian Masney's helper series:
https://lore.kernel.org/linux-clk/20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com/

The series has been applied to the qcom tree's for-next branch. This patch
is based on commit f5672a3dff0291d6a45eb0c258b9d2baeb4dc577 in that branch,
which already includes the required helpers.

The v1 implementation was validated on a DP1000 system with a PCIe GPU
across repeated cold boots. For v2, the UltraRISC clock driver objects
were cross-compiled for RISC-V with W=1 in both built-in and module
configurations. Hardware runtime testing has not been repeated for v2.
---
Changes in v2:
- Use subsys_platform_driver() instead of open-coded init and exit functions.
- Rebase onto qcom for-next, which contains the new helper.
- Link to v1: https://patch.msgid.link/20260820-ultrarisc-clock-fix-v1-1-f27c6a980b42@ultrarisc.com

To: Jia Wang <wangjia@ultrarisc.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/ultrarisc/clk-dp1000.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ultrarisc/clk-dp1000.c b/drivers/clk/ultrarisc/clk-dp1000.c
index ffea77c4cca0..d7db55f7a31f 100644
--- a/drivers/clk/ultrarisc/clk-dp1000.c
+++ b/drivers/clk/ultrarisc/clk-dp1000.c
@@ -147,7 +147,13 @@ static struct platform_driver dp1000_clk_driver = {
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
+subsys_platform_driver(dp1000_clk_driver);
 
 MODULE_IMPORT_NS("CLK_ULTRARISC");
 MODULE_DESCRIPTION("UltraRISC DP1000 clock controller");

---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20260820-ultrarisc-clock-fix-ae7a375294a7

Best regards,
--  
Xincheng Ji <jixincheng@ultrarisc.com>

