Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D832AEE9;
	Tue, 31 Dec 2024 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.32.228.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735626364; cv=none; b=PBdYje6pTIa28ElW2DSIy7y5zZSliVI5UH5Z7l5wF2Gc9vK2CirD/TYejM50vOHvUi5jUKLCEj6JcOyk0O10MFQGTmkMii1IaAB1XTcpt6QtjebFH//LOk1tqDcIRMxvTQLKzbQSIFpdze5zhDyXLTtchRM3JQMLJiBSc/h3BVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735626364; c=relaxed/simple;
	bh=IjldY+4RFYwGPiAPu7smHYgO4sc7rK5EpBWzZpC6K8g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TBqlkSJaEbMZka3Gax/8wqHDmIKuoIKIYaD1bdgaf7E8Zz1HE2WNRQSqRPE1OEkVMgqC2kYkCp7a8F4lY3r6xW6SYwmC/1HLvvMMdtmOEswlrI95VciUnQD1zfRpVankMhiLnWJFs4gCKASrFPAo7lpWzIhy7Ue23XgqEOHbc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=58.32.228.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Tue, 31 Dec 2024
 14:26:00 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
CC: Jian Hu <jian.hu@amlogic.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] clk: amlogic: a1: fix a typo
Date: Tue, 31 Dec 2024 14:25:52 +0800
Message-ID: <20241231062552.2982266-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix a typo in MODULE_DESCRIPTION for a1 PLL driver, S4 should be A1.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/a1-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 8e5a42d1afbb..d71109b9bbca 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -356,7 +356,7 @@ static struct platform_driver a1_pll_clkc_driver = {
 };
 module_platform_driver(a1_pll_clkc_driver);
 
-MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
+MODULE_DESCRIPTION("Amlogic A1 PLL Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
-- 
2.47.1

