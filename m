Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F341166B;
	Tue, 30 Jun 2026 12:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823991; cv=none; b=OUer+Lsw1mCuEr4fr2s0Bkazu10RmREJizOEj7rxkdWzOPOC0quVTG9TMKe6jgRZlO4KrPHlTD3fyO8P3zdOA+kGq1MP82V6P02DVKtokF4y9WhlPvo9XqdJv2mUTHJyAWK4akLdVFWZA0+4W9gOahAK3EtNvw4Og7VizBn26Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823991; c=relaxed/simple;
	bh=XMiN38N4l1GKuA3oH+IceEp2UCiSbmc05XA4hS08xG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRPw230/P3OvYRvEuSW5IuhzwJ/R7Ljb1Se+I/OmfsQ3bAY/bx0d/D4tJGwGyzbsKZuwBNsyfwfaUf/myJU1lnXbbvH2y17WDHVEYBHxHIKLt2W3wthVfs4r//6XiPFDvGNfT+Bkl8Fj8SJV1fZlKrWoJRxGCik6MVDFGQW/7jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YO/h45wt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YO/h45wt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00661F00A3A;
	Tue, 30 Jun 2026 12:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782823990;
	bh=zSDUv/9yLR9+lZ3l0mtMacfbiplXsS7ffrFPYpci2EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YO/h45wtuYjEZZcjkTL1aS4myAguYEH3YLZMkglG7ilQlpUa06vEWiCibUUxOX3qg
	 utSbYKNOM2Q1i4F75erYbl4htw8dCbFlgvEiZgYsXOE2pD8+izrb1nXqmvwD+5/Tyu
	 W+468db/Kk+HXQsOlowY5yiw8zVaejpSrkc2e5uHVX33PkVpCyus04nF/6wUQ7JmtR
	 WuglVXZXMaKq6BAfGK4jundsLelxJ1g5Hhh6NxlOt1vLJr374ybj2y99iazHhpZlQ+
	 LdxW6wjohgf4wWvDoXGEeGRYDMv1KugBYcf7BxJAep8vcA6rLzX698Osmb7uR8W6/4
	 Wyyqumx9eqYTw==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 30 Jun 2026 12:52:45 +0000
Subject: [PATCH 1/3] clk: spacemit: k3: fix parent clock of UFS aclk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-06-clk-ufs-support-v1-1-cf7521d1d0fe@kernel.org>
References: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
In-Reply-To: <20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1258; i=dlan@kernel.org;
 h=from:subject:message-id; bh=XMiN38N4l1GKuA3oH+IceEp2UCiSbmc05XA4hS08xG4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqQ7wmFkM6hVf1aW3TaQClkUfJeNeSPeZ5ecnAq
 4iGGIZHhXiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakO8JhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3MRg//UMQkqelwKy48WXQqxWyi+KVP1VWrMCqZaxH5/ypEOnMXdyXVE4Iaw
 wsIyhfXzAurTiAScWd7Db17+kqT5bCWmFUeKL2W7RKX6L2vlIY21VeLg5d46jTH4eSfiFLK+lv0
 rRs3RjVzEX3MAah2rpKCyjMpM/1HIVj4SrlLi3GQGMP6N7HXjSsQ44sVScvGrWxDb7l+jXcmDKc
 oRcjZ8mQnBd2gyR5umRGDgW0XgZyVa4QyWJXTFTHrWK6RbpzVJkfSHkA52uwVkbNkazT6iV0gqS
 LFGJGULy4fd153PjCMeEBlVS+iXNJWY4Xk4iWPx16WO9crHhL0Pz8RSABfADPVlq6qakpWz3FW6
 ddqXh3THcBnp2j2p7viBj7xy/V+NYDiJ1i++r3OWwKnSN9ZMAAJU8B4CkQqXigcZ8K2cL9ikZZK
 wELjPBUgxmcujY0M4SemwJAuSpn7zDeIbcdSGGZc5BinFnYYqPG+qyaIulaz2Sul8MwFuc41Zce
 OkE15JI7Bs2nSMr0b9tCDoGuhgUktRxISU2SrXFGYlXIpxiR1m215FhTeqTbuhfODUYhDHoVPmg
 OVp8nFRhTYcJ+rZ+EYXTnY8pzVH3DTAB+cG5DOLfZ3InRVKVqS9nutT9duOarvNzi8gpRTXhDRd
 qh4+NEnjAWajsCOQ/6pinuLUjwzA6c=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

According to SpacemiT updated clock docs, the previous UFS aclk parent
clock was wrong, the correct one is illustrated below, so fix it.

  --> pll1_d5_491p52 --\
  --> pll1_d6_409p6  --|
  --> pll2_d6        --|--> div --> gate --> ufs_aclk
  --> pll2_d5        --/

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu-k3.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..42293a38b098 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -926,11 +926,10 @@ CCU_MUX_DIV_GATE_FC_DEFINE(dpu_aclk, dpu_aclk_parents, APMU_LCD_CLK_RES_CTRL5, 1
 			   20, 3, BIT(16), 0);
 
 static const struct clk_parent_data ufs_aclk_parents[] = {
-	CCU_PARENT_HW(pll1_d6_409p6),
 	CCU_PARENT_HW(pll1_d5_491p52),
-	CCU_PARENT_HW(pll1_d4_614p4),
-	CCU_PARENT_HW(pll1_d8_307p2),
-	CCU_PARENT_HW(pll2_d4),
+	CCU_PARENT_HW(pll1_d6_409p6),
+	CCU_PARENT_HW(pll2_d6),
+	CCU_PARENT_HW(pll2_d5),
 };
 CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_parents, APMU_UFS_CLK_RES_CTRL, 5, 3, BIT(8),
 			   2, 3, BIT(1), 0);

-- 
2.54.0

