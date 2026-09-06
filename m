Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E72116F4;
	Sun,  6 Sep 2026 07:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788678454; cv=pass; b=qpLa63eBmrrts+rPpaf/w8XA1xYuzhKgKyrFTl9cYHpLmIQqRx6q8zWJTYI9q+ptEZYEbsM2hZvuvvJcs7Fy64YlrhfQ0RloWboTmxiu6+nt7zvCjCsn2w5F3xgEIUcwK6eLtao37pbYc9bytCMynQQKRP9t/lyWHVXO73DL3yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788678454; c=relaxed/simple;
	bh=3rliFb59kMUShQX5C/SuuQHnHhhNnJ/BJJbg/03BpRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jKd/fjvwxMMjs60S6Bwe5/H6xVfn3tBYsDsIJ6B58FQQYuHeaLgEwQJ1hvm6w3jIpK5PCkkvRfPpmhgJLz9FBpSAj0Nu782ZC0urvo5YVsIN3rgfD9vIEpJ6Js5NqMG4pWvV0k55QNPv4Po/hrc90ey1jQInClglR3iilqN+Znc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=e4GZpIUN; arc=pass smtp.client-ip=165.173.182.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="e4GZpIUN"
ARC-Seal: i=1; a=rsa-sha256; t=1788678435; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XzkrWwNXhmHhgXTfmUzzt15a2E9fsLY2rFdEk14IYJI1gEKvNJPkVtIsizH0TwtE9qWQReSsZ+8nBbaS7oMCbPyEio6q+4Pi7lmDNH0NXMivtEX3kwAvwL9JnSj41zCnoWJcuJhFqC8uEChVzHA7kuReaC3XOIQKtOSBB6PfPOg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788678435; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5kwa35a71ZPo+sybP/X3LF88saD0zkIeKsdxVVsoYRc=; 
	b=Jz1o7dVcwzHVVyFhgrRFd4dl7kHH0eUMXpa8gjr/V7dBUEF2J8J3UkG4Xm48mmTn5s9Fnf0lDW94qtkmfXJJXj5n6Fdg4M8AH4poDJLTIjVVc8CEH5z57XZ0zQyTYLTUYPMn679PnbJTC+ByiGu5XDHv8HQdYJnazae9xArOU0c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788678435;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5kwa35a71ZPo+sybP/X3LF88saD0zkIeKsdxVVsoYRc=;
	b=e4GZpIUNO+9/o7O7Sj/ffZDp183c2wndBjiT1qSC+s71d1S+UViWzJrtcMnzheJ2
	KYiyA6eptpPPqoAV59FSz0+d9ZaXMwuEwpdz9kbmnwgHQp50dip2qwzwLuOhEz63hyJ
	hjvVI8z9MZ8cxnb5+Q+3paaTe3togU8ClJ7ot/40=
Received: by mx.zohomail.com with SMTPS id 1788678433543920.0568449569804;
	Sun, 6 Sep 2026 00:07:13 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 06 Sep 2026 15:06:38 +0800
Subject: [PATCH 1/4] clk: sunxi-ng: div: Add feature support to M clock
 macro
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-sunxi-clk-no-p-v1-1-cbde21c9fe69@pigmoral.tech>
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
In-Reply-To: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=3rliFb59kMUShQX5C/SuuQHnHhhNnJ/BJJbg/03BpRA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLLmCnLcyTm2+cFksZqfO+8eV1sztzjZM3mL6nKz60c1a
 xOSdkz27ShlYRDjYpAVU2Th8hf/Z63D8+2IQOt9mDmsTCBDGLg4BWAi1RUMf+UNLhh8YtTMeXhp
 8er8/4xZeiv/hYcJ276cubDtb/nuBG2Gf8pBl3J5DiTlq2anXV4RynN4H5dTvGf3BKFlukc8L+T
 e4AEA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add a variant of SUNXI_CCU_M_DATA_WITH_MUX_GATE() that accepts CCU
feature flags, such as CCU_FEATURE_UPDATE_BIT.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index a30a92780a05..6d3541a3b519 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -212,16 +212,17 @@ struct ccu_div {
 	SUNXI_CCU_M_WITH_GATE(_struct, _name, _parent, _reg,		\
 			      _mshift, _mwidth, 0, _flags)
 
-#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
-				       _mshift, _mwidth,		\
-				       _muxshift, _muxwidth,		\
-				       _gate, _flags)			\
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, _features)	\
 	struct ccu_div _struct = {					\
 		.enable	= _gate,					\
 		.div	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
 		.mux	= _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
 		.common	= {						\
 			.reg		= _reg,				\
+			.features	= _features,			\
 			.hw.init	= CLK_HW_INIT_PARENTS_DATA(_name, \
 								   _parents, \
 								   &ccu_div_ops, \
@@ -229,6 +230,15 @@ struct ccu_div {
 		},							\
 	}
 
+#define SUNXI_CCU_M_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
+				       _mshift, _mwidth,		\
+				       _muxshift, _muxwidth,		\
+				       _gate, _flags)			\
+	SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(_struct, _name, _parents, _reg, \
+					    _mshift, _mwidth,		\
+					    _muxshift, _muxwidth,	\
+					    _gate, _flags, 0)
+
 #define SUNXI_CCU_M_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
 				  _mshift, _mwidth,			\
 				  _muxshift, _muxwidth,			\

-- 
2.55.0

