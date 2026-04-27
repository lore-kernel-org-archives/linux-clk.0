Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF282222A9
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 05:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777267454; cv=none; b=a9z+W2hOPvOxg63j/1QUrD+H3WwC2L6iPtW4odOluUXWKnRRgKGn+8aqaUNKAvsDBEyKaGqtq/ycEwmOyo7ZB2rugmTU2m5HMP6SQUrqgmONf61VnfMiMKAXVIPADUN7f/asARVtsV6vJuiKtXr/vm5dLyClQzB5BiVJNPe9m5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777267454; c=relaxed/simple;
	bh=l11W8PI8c+M5bwlw5TKPlMrZM2MyZyFkyl0sQ25FAO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8FDDz8RJCIA8e5Y5sy2ax6IawxKBdQfIUVmhU5gDswOxLJePJSSeAPLKEyEYesI7tD6daNfLCHyJsZP0Har6136rXq7hUYD/CN9j8LwrmKynzTRQvuxOReM9nXdsSSRGav7D5H73q+LhwzcDlssq6kahf7M9anrbru81XC+XTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8zBj3I+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8zBj3I+"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82418b0178cso5959474b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 26 Apr 2026 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777267452; x=1777872252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7cgapv9WrlKZqpduVRvLpMpm0agY2GxRID+y/cvI/0=;
        b=o8zBj3I+uOoXyVNYQ2fXG4H18d35y0CtURD5firDtw4uh/dzl9pDfgboSKkDIfrn9q
         Fd+anIcVXq05fRp0gHJF4cXf2KSKvcTAM8BU2h5wZOADCM+NtRqcXBAiJLDYVB/gxpTy
         yACKdbQueKjzIZOecacGV+mjImUMaewIhOZRWuaTPTAOr0fmSNE6MniIasifybBug3TY
         quswJ4rFw/4FTgN03cZ2BIm/3xnLqEPQWoZTKA2TNwMtCAjdr45XzxAu14bTPB85+yq3
         tsRK0ctLmEN+0lnod9u5XE8SRb+bWxdE66ZPzRN5dwl01CZHC+cEFUO9pueCgR7uEVHe
         3oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267452; x=1777872252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7cgapv9WrlKZqpduVRvLpMpm0agY2GxRID+y/cvI/0=;
        b=WlpP3ib5qTQ3oAp6cLLTLr4RES5Gj8KHM8jRbSgK44fdlseKaYbfcsHnM6yjQldSwt
         CTleJjW5VqAlk5SUOsleNo0Vczn4FAMkqXvVtck88wswQ6Dio3P2N278FDyFAlMUntWB
         w50F88F6t8yul6/2oUvb9+BDpvxGLmRTe338TwV8CeMOkYtr7BPbgv/+NiyvKMJPXNgG
         XdgROPJ8w6ixzyzJUVJUsY7trB23tFRViDw0uALg67znmOre7KVjH6yIuZmy1gpqvLdQ
         KepFKXDocfwRxYYrPB5dWeFnLG5wyceypn8H+/u7VUfePzvZqHY+b7RBJXmUmkTkodcg
         zhgA==
X-Gm-Message-State: AOJu0YykefWmiqhVHKW7WpRmvaK5hnd6aCLnYW0wmE5g2NdHL4BbjeL3
	pyLc254N0B7TZd2KpmLMuOL9dtNbYyrchnMpFDHF7Rv/VRhwjONbnoThdz7MKg==
X-Gm-Gg: AeBDietO0dYDclYWUUJGEC7G6tK1eAvkhmqYTm9AGkprtx7O5buk+LA6ONt8hOudRnj
	xeJU0WYRnI540NKjODKdfdiswpFFj2iBS7rHzndWg0eq+t3QIvM7NgyLSbQYjR5xa/XwXlnLk6v
	S/1P2lin6ugiy8HWjzFKnPRsZIJi0P2TdlhINHefg9GedH8skmYaf0q11oChlsI8fe0Psdi+GAs
	kMiH26Id3KihSRt6Sar6q+ezdASdbSrB20ixfcgSydIYtQ8S7ucG4/fNcWGXJYZ3Kx4AObvCTXo
	7u99J5cCE2u2SXueAo4cJEd4v9l/ZrpXsDKygTZFNymgPpeVD5eRvzBTMHo2XxF5lotJEnp+eiP
	z2bUlwcLjO0xzrNSDnLtiim96ik/XZVxhFN7JiJPKYjh4RbG4luaxrmJGA/wytOwpVpAbjqIVV1
	TaPY7+oMkJ6aPo/+sH5s8taNCgAFaOOHACmQTmFLdBCPwZu9wrh1ucWF6QMoP8nfmn/7l0WveUU
	bcNTlBCaTsDFwC+ddEfsTlqOA==
X-Received: by 2002:a05:6300:8088:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3a08d716acemr34573138637.17.1777267451992;
        Sun, 26 Apr 2026 22:24:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703ddf8sm23670308a12.28.2026.04.26.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:24:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: davinci: add Kconfig symbol
Date: Sun, 26 Apr 2026 22:23:54 -0700
Message-ID: <20260427052354.959139-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add COMPILE_TEST support as a result so that the buildbots can run
through this driver. There's nothing architecture specific about it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Kconfig          | 7 +++++++
 drivers/clk/Makefile         | 2 +-
 drivers/clk/davinci/Makefile | 6 +++---
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 06a7ac971edf..42d84c0ed5fc 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -317,6 +317,13 @@ config COMMON_CLK_AXI_CLKGEN
 	  Support for the Analog Devices axi-clkgen pcore clock generator for Xilinx
 	  FPGAs. It is commonly used in Analog Devices' reference designs.
 
+config CLK_DA850
+	bool "DaVinci DA850 CLK support"
+	depends on ARCH_DAVINCI_DA850 || COMPILE_TEST
+	help
+	  This adds the clock driver support for DaVinci DA850 platform
+	  using common clock framework.
+
 config CLK_QORIQ
 	bool "Clock driver for Freescale QorIQ platforms"
 	depends on OF
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 0fc8f20b0fb1..6e13c001a544 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -118,7 +118,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
 obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
-obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
+obj-$(CONFIG_CLK_DAVINCI)		+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
 obj-y					+= imgtec/
diff --git a/drivers/clk/davinci/Makefile b/drivers/clk/davinci/Makefile
index f9d5c9a392e4..5ff30ceb2092 100644
--- a/drivers/clk/davinci/Makefile
+++ b/drivers/clk/davinci/Makefile
@@ -1,11 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 
 ifeq ($(CONFIG_COMMON_CLK), y)
-obj-$(CONFIG_ARCH_DAVINCI_DA8XX)	+= da8xx-cfgchip.o
+obj-$(CONFIG_CLK_DA850)		+= da8xx-cfgchip.o
 
 obj-y += pll.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= pll-da850.o
+obj-$(CONFIG_CLK_DA850)		+= pll-da850.o
 
 obj-y += psc.o
-obj-$(CONFIG_ARCH_DAVINCI_DA850)	+= psc-da850.o
+obj-$(CONFIG_CLK_DA850)		+= psc-da850.o
 endif
-- 
2.54.0

