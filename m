Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371253DB98
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aymJVjGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7ECC433C7;
	Thu, 14 Dec 2023 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702551681;
	bh=yWvb1FzC/LQ0zIM53RNXJVNdCzBlRFmPP4IvR0lED6w=;
	h=From:To:Cc:Subject:Date:From;
	b=aymJVjGZ0c6Wz8Q/9vkMjqb9E9hqLcaMz4j481/++0UIev0aRRPySnWl/1j04B+mj
	 Dq++vUTOx5NgqQ+ffd5uv3NhDYtpxjAvu6pb3tih8nN9YnnPI9gcXX1tlvq+HXorqc
	 cjS9CP43GzjwxnU2uVBRMPBSz6CYXi5GHV0izKwBoOQeKW4GLgarZ7ORyX/1IHvehK
	 OmvBzKO418z3dIrLO9+ExYGyAowAuJ5+Lhqbgfm/EGvvaiTqL/id3M0H9jhOuKWedO
	 7uWkY4B6rNwzNXXLiHtAmNfEeb52ZEDKALw6dVebwJ/v1FNpyjf1Hjkh0oWkB9dkAe
	 AbIdtAqLOkVGA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: microchip: mpfs-ccc: replace include of asm-generic/errno-base.h
Date: Thu, 14 Dec 2023 10:59:57 +0000
Message-Id: <20231214-dipper-earshot-72eef3059961@spud>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=uthDO4MEgzFI/RKi4V+giwgtXg1nFE5ZOPfmIqVEYHc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlVD7Rr5ubMtU/Uc2Zf+bVZ/Njua47TKsLWcJsL2ueLb H96YsfpjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEn5+R4XGtr+2aPxKuz3Jv nAl9wvZTm0nkoOCkpKv/PDrz1Z9WMjH8j/8bee3i9YX/8k/Ni9Pp5GQJKmSsNj4kwPbEIKGopOI oEwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

As evidenced by the fact that only 2 other drivers include this header,
it is not a normal thing to do. Including the regular version of this
header is far more conventional for drivers.

CC: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
--
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
index bce61c45e967..3a3ea2d142f8 100644
--- a/drivers/clk/microchip/clk-mpfs-ccc.c
+++ b/drivers/clk/microchip/clk-mpfs-ccc.c
@@ -4,8 +4,8 @@
  *
  * Copyright (C) 2022 Microchip Technology Inc. and its subsidiaries
  */
-#include "asm-generic/errno-base.h"
 #include <linux/clk-provider.h>
+#include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.39.2

