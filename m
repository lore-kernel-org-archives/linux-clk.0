Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19D2361954;
	Sun, 13 Sep 2026 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320617; cv=none; b=Azbhe0sXL2h7if88geJ7N2yZyTtDwS4SoF4uXiSpu+SHH57/LGKaRVRicF7K2dMawiMxeUfOQq/C2Dk/79iqE2Nh8sMmXZ739/mFr/hj2CaGQQZ+Wwb6SaF5OKHH48FxUusBUHMpnqzU+LVRxsnZBNYawD6wp4xw71dQ+FRK5V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320617; c=relaxed/simple;
	bh=srkcEAyojx1b6cUg0sJcTwxCa9yjd5mik5kS2jv97vI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIJcc7HIDO5K+MxrL/P2SIGgpgopl2yoIpcRMA6A8r3DFnzRCggyP45dyufya4OKD33dOjfO57qoAIAd7AMY7aOMbj8dRfeZZYlc3hzKrU/KcwPBcU05TauG/shUltJqgeUVyZrJQzb4xRK+E5N79dOwcrupckHqt82c4VseG20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhEv4X8h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhEv4X8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BD21F000FF;
	Sun, 13 Sep 2026 17:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789320616;
	bh=iAcMuIqZGbpwdMHtB5bzg48FC/3zvuOUad9CpLHqF70=;
	h=From:To:Cc:Subject:Date;
	b=jhEv4X8h9ByrCXJDNs3YaimMo0M5OjPUbZZ0p7ju8cXr2IO5MovAdJtCLKBaUXulk
	 0azyUJHT7wimlY77J2ta35rbokmiIpWMRCqr9q8Vd8tvWDsy4jt1PNPaBqZZaaxeat
	 YNuY7dZwI7E/OXXkBFZXawH7h1p0MUafZ+iRv+m8YlkTnAr6DmVpyNXhh0qbGHRZeU
	 RSL6F9G14LDV66ai5NNBm2kSvQ4FPujSVM76cGii/pUUvvQulciJ5pf4DNRPOa5PD1
	 Z0ptp8K5il3HwwOCeVwbkZFUW5/2EI867pF4cHmlbrNEldIcOAOKVXpizeX7pt73K+
	 jxWJX/g5ftoWA==
From: Sasha Levin <sashal@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Sasha Levin <sashal@kernel.org>,
	kernel test robot <lkp@intel.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: renesas: r9a09g077: Add missing slab.h and cleanup.h includes
Date: Sun, 13 Sep 2026 13:30:08 -0400
Message-ID: <20260913173009.1164899-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

r9a09g077_post_init() uses kzalloc_obj() and __free(kfree), but the file
includes neither <linux/slab.h> nor <linux/cleanup.h>. It only builds
where those happen to be pulled in transitively; on arm allmodconfig
they are not, and the build fails:

  drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
  identifier '__free_kfree'; did you mean '__free_pages'?
  drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function
  '__free_pages' must take 1 parameter
  drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared
  function 'kzalloc_obj'; ISO C99 and later do not support implicit
  function declarations [-Wimplicit-function-declaration]
  drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer
  to pointer conversion initializing 'struct regmap_config *' with an
  expression of type 'int' [-Wint-conversion]

gcc reports the same thing as "cleanup argument not a function" plus an
implicit declaration of kzalloc_obj().

Include both headers explicitly rather than relying on an incidental
include chain.

Fixes: 810b8b6c4e02 ("clk: renesas: r9a09g077: Register SYSC regmap")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 0495e3206973c..5a0e7df1eb06c 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk-provider.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
@@ -20,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
-- 
2.53.0

