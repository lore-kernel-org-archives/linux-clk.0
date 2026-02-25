Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C02C433B3;
	Wed, 25 Feb 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041499; cv=none; b=dO9S47EKQGL55Pzq+XhSKlvMgm0RsGGXONtEEuFBQt6XnkYwJU5JlB9p0424LW8/gQ+y59Asvw4xdYPdmXKfyASdqolV2TGgPta/7aCE9qNbjTRSz2fRY7EKrXEtZXZOFmKJXw8+80I3CGx79OITzc8/hAl75Y78VQjeRB09aWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041499; c=relaxed/simple;
	bh=Z7Cvp1EbSQZfWkvqX94zrjWYXfZdY92kAnqThNT0AgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j38CKWm82B6THhS3CJu0SRxeUb6lV+NcrEQRpY8yaAgNc0x3zt11DG2TScZ4kicBEAbt1BKq57X4QfwTN8tiqQfHjQ9Tu1MPCeqUwHXtwXpxLXvZyE3TxGT50j+/bhPfV4zp46lT96rZCOOQ+P5LrrWXPtWpREv5bnyHGJjwXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+l7w8kO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+l7w8kO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32601C116D0;
	Wed, 25 Feb 2026 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772041499;
	bh=Z7Cvp1EbSQZfWkvqX94zrjWYXfZdY92kAnqThNT0AgA=;
	h=From:To:Cc:Subject:Date:From;
	b=W+l7w8kOzKxCPPqXNXhO4Orw83f2TGm1mEjhOe9Hwb4KWJyDWwXIAdIo1ppfWy8xu
	 4BEyAjUujsA35p876x/OglkwJxyGKJWpGi9OekhwbFN0QrCn3xuXKoBZQ28ojf428B
	 6lHazoSQ6CN5MT/us1vksoB8e4xmSNgTQ+4o4rIAxU/TG5cPtUz22/zXqw3X+57jNj
	 LQbM0aIees/ip104AgJ5DVuUPyNnPixyh8lzJ0zqPMWOt5coj4mC2YCLmepEqiO5/Y
	 B9/3hG828RKdv66k9BFmbwOkJCFY+S/DRca0Euoj8gfw/klmwAbZLCury4RIab70p0
	 WwBw3sIRbC72w==
From: Conor Dooley <conor@kernel.org>
To: linux-clk@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Waldemar Brodkorb <wbx@openadk.org>
Subject: [PATCH] clk: microchip: rename clk-core to clk-pic32
Date: Wed, 25 Feb 2026 17:44:52 +0000
Message-ID: <20260225-puzzle-cargo-9d23eedf7957@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3097; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=n04hjTzCjDFzDSpVyfBxzNLn7M5DHibSksltj98yVsc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnzTYUlo7cnba8J33v5xnx/5gg5Gz8Zsw97Gs4obci2/ ZF98svGjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkiSAjw7/rKTcEf/3zjH/r 59MWP+HR7P9sq9O+n27c43nk548g58OMDOfbPuVmM15RzJhR9vo00zpxn/VbxPxO+bBPv/d0bd6 /F9wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

clk-core is a confusingly generic name, since it is only used by a
single platform and it uses very similar naming to the "soft" IP cores
for use in FPGA fabric (CoreClock or similar is what that would be
called, although nothing like that exists right now) that the FPGA
business unit produces. Rename it to clk-pic32, matching the prefix
used by most functions in the driver. As far as I can tell, impact
on whatever users may (or may not...) exist for the platform is minimal
as it's built-in only and the functions are called directly from
clk-pic32mzda.c

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Compile tested only of course.

CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Brian Masney <bmasney@redhat.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
CC: Waldemar Brodkorb <wbx@openadk.org>
 drivers/clk/microchip/Makefile                    | 2 +-
 drivers/clk/microchip/{clk-core.c => clk-pic32.c} | 2 +-
 drivers/clk/microchip/{clk-core.h => clk-pic32.h} | 0
 drivers/clk/microchip/clk-pic32mzda.c             | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/clk/microchip/{clk-core.c => clk-pic32.c} (99%)
 rename drivers/clk/microchip/{clk-core.h => clk-pic32.h} (100%)

diff --git a/drivers/clk/microchip/Makefile b/drivers/clk/microchip/Makefile
index 13250e04e46cf..8e60bc1a03ae7 100644
--- a/drivers/clk/microchip/Makefile
+++ b/drivers/clk/microchip/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_COMMON_CLK_PIC32) += clk-core.o
+obj-$(CONFIG_COMMON_CLK_PIC32) += clk-pic32.o
 obj-$(CONFIG_PIC32MZDA) += clk-pic32mzda.o
 obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs.o
 obj-$(CONFIG_MCHP_CLK_MPFS) += clk-mpfs-ccc.o
diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-pic32.c
similarity index 99%
rename from drivers/clk/microchip/clk-core.c
rename to drivers/clk/microchip/clk-pic32.c
index 692152b5094e0..9d128fba2cdea 100644
--- a/drivers/clk/microchip/clk-core.c
+++ b/drivers/clk/microchip/clk-pic32.c
@@ -11,7 +11,7 @@
 #include <linux/iopoll.h>
 #include <linux/platform_data/pic32.h>
 
-#include "clk-core.h"
+#include "clk-pic32.h"
 
 /* OSCCON Reg fields */
 #define OSC_CUR_MASK		0x07
diff --git a/drivers/clk/microchip/clk-core.h b/drivers/clk/microchip/clk-pic32.h
similarity index 100%
rename from drivers/clk/microchip/clk-core.h
rename to drivers/clk/microchip/clk-pic32.h
diff --git a/drivers/clk/microchip/clk-pic32mzda.c b/drivers/clk/microchip/clk-pic32mzda.c
index 27599829ea40a..e11cbdd982a61 100644
--- a/drivers/clk/microchip/clk-pic32mzda.c
+++ b/drivers/clk/microchip/clk-pic32mzda.c
@@ -14,7 +14,7 @@
 #include <linux/platform_device.h>
 #include <asm/traps.h>
 
-#include "clk-core.h"
+#include "clk-pic32.h"
 
 /* FRC Postscaler */
 #define OSC_FRCDIV_MASK		0x07
-- 
2.51.0

