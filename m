Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CA52288D5;
	Sat,  3 Jan 2026 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425213; cv=none; b=O5qPlGyOci6EfDMW1S16fxomgY3pLSctWiUrBbSnsPlry8kC4fQqyVBapBGqtSTp1vix+ZAuU9X33od8exIJg2vauIxOweC5Y7b7uzwAkNseCdIdLAV6xjwGnJsE7aZR2qDiRSnzvwa8OYRwE5ZE36Boa21zfv8h9sbqN7M8J2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425213; c=relaxed/simple;
	bh=xNlizd+/tLBFwWM/QUTD8wjj7jKVFFciZx8duLxiagc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsNYDGDliIRIGz9Mlpx6oVZP5VSogaf06iGLzquN2cy1s56M1Ute+OhNO2S+TG1IkhbZCKPISAtNKpFVsAvVQY0fJwNKMKgK5BCc2X/mEEZ6NX/IfTd9gG8BF86PXMoABtXJXSCTi7UfKU26/7SWZYaEetREvNSDODAdIKaLPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 30C403417FE;
	Sat, 03 Jan 2026 07:26:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:26:12 +0800
Subject: [PATCH v3 1/4] clk: spacemit: prepare common ccu header
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-06-k1-clk-common-v3-1-6061d9f69eef@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
In-Reply-To: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=xNlizd+/tLBFwWM/QUTD8wjj7jKVFFciZx8duLxiagc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMSjMsasj4EDOZgwIbQGVcwaiPbE8iIjU7r6p
 4583BmjhTWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjEoxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1DYg//UHandxt5TxGFWljk13yi5AVTCy4MAGyNLCxiIvQq/FqbkuYctKb7g
 hUU+Gq4QdNxFIdFnkEpBG/g1Vy5DRgYU/XPTjWfSeJB+6coa4Hj6PQT1DFMMs7KswIBggnK4k1s
 99tJKNhBOWEM4FVZnO8t/OYrwqA29GGWbTljD0xU453xqoSIE0rKrbtv50mhBaFT0xz0y4Nnz2R
 xUxZqufnHBF+3N8cF2Psd4KVpayaIszFF+86uRqkJJLpK45PHvjYvEMqr2t/bv8oaUIKYtDKFjQ
 glhlBdCRIrRM1uLUD9FadIl2YxmL8qzSQA4Bid8+Y2KRH9R+rzB1kEiRzm9esfWBKj99SgJ2mQC
 cQi05e0xwe5S9DUQO6YJnpOeMyBCdefDB5KeP9+k1luS2aPHL0v0N8nGBL0VnbZCK6ar+q8VUSQ
 OkWUqq72L+IjqosVNKS3kq3YR5j7j+WaQ0wCTtPRslCyAZrhk0NOHmFwaYUsQ5JYUTGvzcjRPL9
 jlCTzRG0XVqcYdTYnsy6FWMzunpjHR6VUh8M2WRv6qpOvJ2OacP5tQ7Wyp5xpvelo+Yyjq+F8cU
 /M3Cf4J6e5asxAQEqL7R1nvIehxzx5/Sn6t5V2ggkQxB0RXzqawn2AHlrhf0v8HsB2jSYErFQYa
 egbqdz/okiAnmyZsuCiBhPHvgy9wC0=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

In order to prepare adding clock driver for new K3 SoC, extract generic
code to a separate common ccu header file, so they are not defined
in K1 SoC-specific file, and then can be shared by all clock drivers.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 include/soc/spacemit/ccu.h       | 21 +++++++++++++++++++++
 include/soc/spacemit/k1-syscon.h | 12 +-----------
 2 files changed, 22 insertions(+), 11 deletions(-)

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
index 354751562c55..0be7a2e8d445 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,17 +5,7 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
-/* Auxiliary device used to represent a CCU reset controller */
-struct spacemit_ccu_adev {
-	struct auxiliary_device adev;
-	struct regmap *regmap;
-};
-
-static inline struct spacemit_ccu_adev *
-to_spacemit_ccu_adev(struct auxiliary_device *adev)
-{
-	return container_of(adev, struct spacemit_ccu_adev, adev);
-}
+#include "ccu.h"
 
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100

-- 
2.52.0

