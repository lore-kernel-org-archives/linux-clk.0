Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C503724DFED
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566321; cv=none; b=pXWpGmYoMWDl/EAd0xHRM6nrRxDaiBTP+Nry5ctU2cRjaFEzTRVvH7qdRhDKV8mxwAatOHqB1IZTYdKvxU04E8a0QSj0bIHvHSbCxZGnBlUMcbIgLyr4N8C7AuatoMYKCF8EeyKASPwP481sQjMJy7jeZSpAhYzIWaOE3SP4jns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566321; c=relaxed/simple;
	bh=5ViMU98ehxd8Jt8NC941eN+n6sz+HFSLrU/Lq7seVIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=my2FwpT6xhVIjyK2UzQ8lYOxYpASAotCZWBm4WuGWdUOKaszip7IKyOzFHErz3hzFyXEB4dIxlD/BMPlimUP9P01BYDze2xhdZH4nCEJUBUOQLpBwtvc3ZRyTo/ip6LdIaAs1+42+42+z4umWpzg5Ai4qouIYqT3GyGhZIHx4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B3241C0A;
	Wed, 26 Feb 2025 02:38:55 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 650C73F6A8;
	Wed, 26 Feb 2025 02:38:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] clk: sunxi-ng: mp: provide wrapper for setting feature flags
Date: Wed, 26 Feb 2025 10:37:33 +0000
Message-Id: <20250226103734.1252013-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226103734.1252013-1-andre.przywara@arm.com>
References: <20250226103734.1252013-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far our sunxi clock instantiation macros set the required flags
depending on the clock type, but the new "dual divider MP clock"
requires us to pass that piece of information in by the macro user.

Add a new wrapper macro that allows to specify a "features" field, to
allow marking those dual-divider clocks accordingly.
Since the MMC clocks will be a prominent user, combine this with the
postdiv field required there. Users who just want the feature, can
pass in a postdiv of 1, users of just the postdiv can pass in a feature
mask of 0.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index 6e50f3728fb5f..1da1dcaf62ea9 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -82,18 +82,22 @@ struct ccu_mp {
 				   _muxshift, _muxwidth,		\
 				   0, _flags)
 
-#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+#define SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents, _reg, \
 					_mshift, _mwidth,		\
 					_pshift, _pwidth,		\
 					_muxshift, _muxwidth,		\
-					_gate, _flags)			\
+					_gate, _postdiv,		\
+					_flags, _features)		\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
 		.p	= _SUNXI_CCU_DIV(_pshift, _pwidth),		\
 		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
+		.fixed_post_div = _postdiv,				\
 		.common	= {						\
 			.reg		= _reg,				\
+			.features	= CCU_FEATURE_FIXED_POSTDIV |	\
+						_features,		\
 			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
 								   _parents, \
 								   &ccu_mp_ops, \
@@ -101,6 +105,17 @@ struct ccu_mp {
 		}							\
 	}
 
+#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+					_mshift, _mwidth,		\
+					_pshift, _pwidth,		\
+					_muxshift, _muxwidth,		\
+					_gate, _flags)			\
+	SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents,	\
+					     _reg, _mshift, _mwidth,	\
+					     _pshift, _pwidth,		\
+					     _muxshift, _muxwidth,	\
+					     _gate, 1, _flags, 0)
+
 #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				   _mshift, _mwidth,			\
 				   _pshift, _pwidth,			\
-- 
2.25.1

