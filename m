Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD820DDD;
	Fri, 26 Jan 2024 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293768; cv=none; b=W+uKisf4NufWMktrsLrlzRM3kCsmhYQ1XZ/hsvwBTrhhuZNAf+z7dHHpt/rHqi+ZOYTguY4DzkodrfPU4Q7AWyZWI+rSloSQa20EVcWQv2SneL5hYRXWb1nUIvck7JZ7LC0TCzPR5X0LKowtrgDl/LG65+KxZK7z5R0JrYUtM1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293768; c=relaxed/simple;
	bh=5rhOg385ALxMZC2NP0YG1CGe+OyMaqjG1bdXKQfeSHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jZjqMGRCRhV48cF2AHq/i3p9q/V42RjFLi/AdaBVd/B2S/Y1SDoZ/yfPp+FycFCMUIY8ymcRlmvySHgyd+9lacInmQxXWwTwYzJ63/NjQrGsPut1y5QOyFge5HBaQ/1jkWx3CH2WHgsq8OdCemnfViZm6T+eg+z/3507RUi0wf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BdTfDq41; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BdTfDq41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706293762;
	bh=5rhOg385ALxMZC2NP0YG1CGe+OyMaqjG1bdXKQfeSHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BdTfDq41VU/P7akV3KDhG+i7wDoMWbECjwWpaGuKM9adWyJNAXyhMinqs08A9JcI5
	 AJNPxTVfAy418MIMn0Lg9gDwoft9zcfc0fJLvgRXz8CMQNzgzRA+LAT8eNe6IsN+Y6
	 8wFeZRcSiRu1DZ7M0P/0MpAYQYi6GBlWdnk1dYW5VgZ8RLbyjZZcVO5W84vshygFRf
	 oPsI5GeA5572Pi6Jq2492f4Ro7fpmQe2zLsbyWxpygJYSQvu6TopQqMBtYfLySOHf1
	 3kC/jmCJxAgIdANWrM+cg3/mMA5Y/V6+W13Qqcd+EOzii6t6YJObPOCdfCDWHXAXVP
	 YvD11zLA6kjKQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 704353782081;
	Fri, 26 Jan 2024 18:29:22 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9B205482AC9; Fri, 26 Jan 2024 19:29:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v8 5/7] clk: rockchip: rk3588: fix indent
Date: Fri, 26 Jan 2024 19:18:26 +0100
Message-ID: <20240126182919.48402-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126182919.48402-1-sebastian.reichel@collabora.com>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pclk_mailbox2 is the only RK3588 clock indented with one tab instead of
two tabs. Let's fix this.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 26330d655159..2e8bdd93c625 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1004,7 +1004,7 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	GATE(PCLK_MAILBOX1, "pclk_mailbox1", "pclk_top_root", 0,
 			RK3588_CLKGATE_CON(16), 12, GFLAGS),
 	GATE(PCLK_MAILBOX2, "pclk_mailbox2", "pclk_top_root", 0,
-		RK3588_CLKGATE_CON(16), 13, GFLAGS),
+			RK3588_CLKGATE_CON(16), 13, GFLAGS),
 	GATE(PCLK_PMU2, "pclk_pmu2", "pclk_top_root", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(19), 3, GFLAGS),
 	GATE(PCLK_PMUCM0_INTMUX, "pclk_pmucm0_intmux", "pclk_top_root", CLK_IS_CRITICAL,
-- 
2.43.0

