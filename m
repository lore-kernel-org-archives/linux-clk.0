Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BB1C6B6;
	Mon, 25 Mar 2024 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395378; cv=none; b=uiFWtBMPwguEdWeY7/tfgN3OI4+sCujvGetCcinu4P1/rhxiOl1IGIY4ZeHTT2kVgupEqxqOA0BNMH/XrVeoW3m5DcOVOEChILbKAMoT61SqoQ2Oet9KkbNeLsD2nEpYPHzU01IN4Bk/nxp8WalUbyuumqnWXz7AUU4ub7pScpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395378; c=relaxed/simple;
	bh=hAH9JfnF/oWPF5azFrsdH6WoJrOjS9HW0tUPNWlngE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QY/w31RADosZy/Va40jYk9oqbukjNycpmZmXrXE3u84OHyxXvLcpUQBf+F/s68Az8B9Ebs70bX76i5bDZljbGDn6QORUo2D/o7odfgaSKn4gEZEmwxLDDGG8J2zFbChB2vpN3LcdLLRWooQA7SZu4Yd+csTtYw9V/KBldQ+Fm7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OFuHmFYU; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OFuHmFYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711395372;
	bh=hAH9JfnF/oWPF5azFrsdH6WoJrOjS9HW0tUPNWlngE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OFuHmFYUyBPH2yLqm5XdUgj7yC4FGz3MdTgTwjcmfSV8X9N1IjH4Oxhe9DiAGk8S2
	 Izxa7O7BDfBgi/ZSMS020vbSEYTuxkX0WaVLPC1JxBvo2++xXNHYVOjmy6UvzvBu0M
	 ZHchWs8A2sqpgDgfxq1s6C54PyaXavUa5aUwxBj+5SkBcsl/1rDql2azEKFiqpI5zc
	 QHdAwbRgGGjJ+1LkItpYCrigxbcBze6MhlE3NuKTlh/y0lv8G9p4tgyR9X8OesmIUM
	 SNYtj+b/3BxU4zp4Vp52GtkYj3jVCHTePSnhiAJpR2CcRHkSxcVbHQOL2A+QHKVwBw
	 hTBmBKf4CCAwQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E984337820FC;
	Mon, 25 Mar 2024 19:36:11 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 182D94800D2; Mon, 25 Mar 2024 20:36:11 +0100 (CET)
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
	Michal Tomek <mtdev79b@gmail.com>,
	Ilya K <me@0upti.me>,
	Chad LeClair <leclair@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v9 5/7] clk: rockchip: fix error for unknown clocks
Date: Mon, 25 Mar 2024 20:33:36 +0100
Message-ID: <20240325193609.237182-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325193609.237182-1-sebastian.reichel@collabora.com>
References: <20240325193609.237182-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a clk == NULL check after the switch to check for
unsupported clk types. Since clk is re-assigned in a loop,
this check is useless right now for anything but the first
round. Let's fix this up by assigning clk = NULL in the
loop before the switch statement.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index ef2408f10f39..e150bc1fc319 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -444,12 +444,13 @@ void rockchip_clk_register_branches(struct rockchip_clk_provider *ctx,
 				    struct rockchip_clk_branch *list,
 				    unsigned int nr_clk)
 {
-	struct clk *clk = NULL;
+	struct clk *clk;
 	unsigned int idx;
 	unsigned long flags;
 
 	for (idx = 0; idx < nr_clk; idx++, list++) {
 		flags = list->flags;
+		clk = NULL;
 
 		/* catch simple muxes */
 		switch (list->branch_type) {
-- 
2.43.0

