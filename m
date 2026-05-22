Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD738B122;
	Fri, 22 May 2026 13:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779454856; cv=pass; b=Q47HyvoQ83xIojeBgvvw5paltdSKsMiATp3K8DUwb4grOlIXljS7f34VNpsZFx//QyTkONiSXqZEuSVtcjiVFLmBAGHM/ZhD3Z8S3A7tlZoVMpHLgsRcKLMDvNVpmlQ0BKVYCYOOAUblXrdmhNYHdhXets3B/dnXijVIqCgAmR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779454856; c=relaxed/simple;
	bh=2a2Ues8oit5F0hamVRvNnhy1TDmBusJ+DQa9IX5JqNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZMBEKrB4Ldx0xeLTWQC+YpK4oXSfU2Bl4yMjNX1pSOYD/v175fJpnQxhKz3wZCNNxbg4vrXGOi/qO5wpFCk9XSOmed13Mft/7/xYs36LQvCwoFGRWrdDOJUF229y8GUZRg94YqH9M9QfAMMi2sFa7alVd9v2b6z9ojq1owWKvno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=LZNgU1Uw; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="LZNgU1Uw"
ARC-Seal: i=1; a=rsa-sha256; t=1779454836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mXHalvZ2De87nqdd+Qu9KejK7X7MjBsUkinnEita0NpFch6ur7DdcDRoqF5KC5Fj2Omk3eO8X5XSy6IlZ6FHTc1qMRoWoKvCSOM2xNmqSoXRG9Z151NwXa/ZrEkNpJxzXONpLjgP5qtYE5n+/WFiun4t0GzFG9TtpQus8BHteIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779454836; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JX4/HzHgr9Ln2K8EGkhp70E2oDhc6Dp0qS3CpdjxcfQ=; 
	b=JEB+Q9kwAq8S+OunkVsGFsekfZ9tc+ZY9ZUMJmV+1qFYAqVV40vfTA/POq7At6oj0T26IfumIjLbAg5GyJtMeJbZPE+BTP4wW/psuUaiygKGa+C7vmIA7SbuyIZqA2UqH+8eKTWPuAyyt8LElyvywS9ai0Em995/TpUUQI5qzu4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779454836;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=JX4/HzHgr9Ln2K8EGkhp70E2oDhc6Dp0qS3CpdjxcfQ=;
	b=LZNgU1UwZJKElt8ZqwmVKwQcyAxKscQZEb7E8wVgPi/WkeBfHNVYQnTs6MOWtlOc
	BAI7vOXBBOJLSH2zzdyPXRvm8cGL1feHbggGYDzMDI4ECTwwOOE9R1hw18GPbhSWHrc
	UKP6Xgu8diFjXdUgXtSu5j6JyS9wyLvvbZsq5C2Y=
Received: by mx.zohomail.com with SMTPS id 1779454831935958.224223537089;
	Fri, 22 May 2026 06:00:31 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
Date: Fri, 22 May 2026 20:59:12 +0800
Message-Id: <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: zu08011227c6335346a63148b9f6cec2f70000b3c03c513edafb3405058bc9ea8ac70ec1c949f9169db7a4fa:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External

Fix all sparse warnings detected during LKP randconfig testing:
- Replace plain integer 0 with NULL.
- Add static modifier to k230_plls and k230_pll_divs.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 drivers/clk/clk-k230.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
index d883a1e1118e..cfc437038e4e 100644
--- a/drivers/clk/clk-k230.c
+++ b/drivers/clk/clk-k230.c
@@ -270,12 +270,12 @@ static const struct clk_ops k230_clk_ops_mul_div = {
 	.recalc_rate	= k230_clk_get_rate_mul_div,
 };
 
-K230_CLK_PLL_FORMAT(pll0, 0, CLK_IS_CRITICAL, 0);
-K230_CLK_PLL_FORMAT(pll1, 1, CLK_IS_CRITICAL, 0);
-K230_CLK_PLL_FORMAT(pll2, 2, CLK_IS_CRITICAL, 0);
-K230_CLK_PLL_FORMAT(pll3, 3, CLK_IS_CRITICAL, 0);
+K230_CLK_PLL_FORMAT(pll0, 0, CLK_IS_CRITICAL, NULL);
+K230_CLK_PLL_FORMAT(pll1, 1, CLK_IS_CRITICAL, NULL);
+K230_CLK_PLL_FORMAT(pll2, 2, CLK_IS_CRITICAL, NULL);
+K230_CLK_PLL_FORMAT(pll3, 3, CLK_IS_CRITICAL, NULL);
 
-struct k230_pll *k230_plls[] = {
+static struct k230_pll *k230_plls[] = {
 	&pll0,
 	&pll1,
 	&pll2,
@@ -296,7 +296,7 @@ K230_CLK_FIXED_FACTOR_FORMAT(pll3_div2, 1, 2, 0, &pll3.hw);
 K230_CLK_FIXED_FACTOR_FORMAT(pll3_div3, 1, 3, 0, &pll3.hw);
 K230_CLK_FIXED_FACTOR_FORMAT(pll3_div4, 1, 4, 0, &pll3.hw);
 
-struct clk_fixed_factor *k230_pll_divs[] = {
+static struct clk_fixed_factor *k230_pll_divs[] = {
 	&pll0_div2,
 	&pll0_div3,
 	&pll0_div4,
-- 
2.34.1

