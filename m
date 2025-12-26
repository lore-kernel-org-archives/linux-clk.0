Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2762018A93F;
	Fri, 26 Dec 2025 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766732168; cv=none; b=QcLKUXmgfLK4qwcgr9eqmQWIBRPsvqdCQS3PpEeg04spaa50NXcOHTRxEbiJzEJ2h0N2qegmEssOoH1u02v7OxFRvB+a6SzBucf0i9QdVJpNt0ZqiNOByCtBBlW+bWf06aDtuMJ2JaJk7omfFORNyLfC6432K6FyFaFZrAMBa6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766732168; c=relaxed/simple;
	bh=iXQGtbst7HSGFd1x1UD6Mbf7sKGICkcsk8p9F0XKLng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=na/di4nfu7pAIIFtmQvIJtZgjNGeLr33g0elifiqZDAn/VZ5PqJyccUl2jyhawRqDdj32aHvfwNjsNvlKZK7k1l8VZ1rzAuAaxMOXyJOxUUfalScDKyt0a1f2S6PRDNcxsCTSxa7zA6I/3hP5qUhKtGVqFFrQEzbjdOwWPBAYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id D8572340FF7;
	Fri, 26 Dec 2025 06:56:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 14:55:25 +0800
Subject: [PATCH v2 1/3] clk: spacemit: prepare common ccu header
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-06-k1-clk-common-v2-1-28b59418b4df@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
In-Reply-To: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=iXQGtbst7HSGFd1x1UD6Mbf7sKGICkcsk8p9F0XKLng=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTjFziZV4+t/TQxLXrsx21nn+sdYgMIlQeSkao
 gvLVlBgV2yJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU4xcxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1W1w/+Ix0WncaPZ9YxSaKtIAT6dj3lQhiufqEHDPrn81n7dyZLsxpTMuvk0
 mc6ejQBhET4qcEoiGDkKJgcpg7PZjj5coggaHZS+38hXBbUi7GC45Hlx4PToVDMyYdXS8W5JMJ4
 Z5fZ4D6I60al0g1yjIgbUOZ0oZGszTzcz65kRa+/y+dGWl0+2Wq5h4juZZv58mM51Q9s0V9TRr8
 sFqICxGOVilIHukp+mprDgq0Zb4VEnJqSOX/fDBFp+rA/cs5ZmPTiDs/IiHP9qHcQX4NXhuydZi
 z8eHkbbAE4U8zxB6zxchE1pjg5UpugMWlBZOLy7dYNA/jezZ1allwy+ecdfYYS7zr1PKDX1+5LT
 BW1znyE1Gs3qOMZQx07FWqI9U9gPVMZMSmkzS+mPEm25Mx2M/oVsPwaY4eqJxGPhSQ2Idbo4IfM
 hlUzY/0HMHHMSH4VqqkwGNuuzOSrQQab465ka8PjuH7uO60OM+aFymmApllLHT0qe41A1QqRlyc
 DG1OZgtJPIiMlfxsMBrO1Jv5Wk0vOsn+0jv8ZilPUNAzMqXmFaTsI7lfskYRl+oK6GYk7fGqJ13
 0Vd9grmpic5svjY1+b98DVjvdL7IqcPwKhdvqbkojb2PmCoIw9Y2dqokMqpjIb7W9e3q8aFnjr2
 L+GmXHkgADCjekzSdvhxYmCY/PRBU4=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

In order to prepare adding clock driver for new SoC, extract common
ccu header file, so it can be shared by all drivers.

Also introduce a reset name macro, so it can be both used in clock
and reset subsystem, explicitly to make them match each other.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 13 +++----------
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
new file mode 100644
index 000000000000..84dcdecccc05
--- /dev/null
+++ b/include/soc/spacemit/ccu.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_SPACEMIT_CCU_H__
+#define __SOC_SPACEMIT_CCU_H__
+
+#include <linux/auxiliary_bus.h>
+#include <linux/regmap.h>
+
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
+#endif /* __SOC_SPACEMIT_CCU_H__ */
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 354751562c55..13efa7a30853 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,17 +5,10 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
-/* Auxiliary device used to represent a CCU reset controller */
-struct spacemit_ccu_adev {
-	struct auxiliary_device adev;
-	struct regmap *regmap;
-};
+#include "ccu.h"
 
-static inline struct spacemit_ccu_adev *
-to_spacemit_ccu_adev(struct auxiliary_device *adev)
-{
-	return container_of(adev, struct spacemit_ccu_adev, adev);
-}
+/* Reset name macro, should match in clock and reset */
+#define _K_RST(_unit)			"k1-" #_unit "-reset"
 
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100

-- 
2.52.0

