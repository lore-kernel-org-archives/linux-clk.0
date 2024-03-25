Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E71B80F;
	Mon, 25 Mar 2024 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711395375; cv=none; b=pbqH7dMGnWCqqRf7iwYO0vLMnIvU3+hBk9qFLlNi3xBoRBVJTd3B6l2yOMj4Y/CjOmCsh39twGJUxlOsHMGDeNgfqgJjsrTACNYhzDQs2CYVP5ZRXEFu5/ocCfCKHfpBWcQ+ZacwrK/K7sNBiTl1Zv4oaUDWBxyNJKaB+dDxGhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711395375; c=relaxed/simple;
	bh=YWCk8MFNsSxQYcCPL/DtpufPtO/DvTFn4RE2bOKP/Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzeu0CwWM21atsQjvR5l9hFINsAtao7vVugnjxVI3M94bbl+oAz8lDaoAFzcbPcTkjXoT1nFoTvBgsXyofXggGh5bPdiSfRkvrIYBeeUmB3B9N0keMyYf/EVJMtMJG9K0pb2QSOU5/x65VqxfCmaPRxQrjjpHJnXhyLR2v7mfe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oTJx4Ak3; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oTJx4Ak3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711395371;
	bh=YWCk8MFNsSxQYcCPL/DtpufPtO/DvTFn4RE2bOKP/Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oTJx4Ak34ohM4kLxH/TRkAQ96+ogADwoEnXxd9YOSGyLalbY57Y1CUbhYMr1lb23G
	 G29lT28nzYhhDQh/EKEsuWIBXDlXhShbxTLFGyXVtRv8KWwiA8EK6uZzCb7tpjMKNN
	 Foa0tbRn4PToIboYcUKXEb4pE0MeZtEOSWHCKV3CytUi7DYAmd3I0ueIYE6BQ02zav
	 Ld0vZOx3NL659+C8sS5tLm+2YUx6GNDp3w4oOlNsQ3Meqy3FfneL26lRBzeAQpBFkw
	 NtAj0qjIKSrjAGpvgH8ghjEDpvviZ4m6S+hPBQHd3Wqq5bD2kKolHhj8s3Cb9ifKf2
	 SnFHjXi9EAbHw==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 739AC37820EC;
	Mon, 25 Mar 2024 19:36:11 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 126E74800CF; Mon, 25 Mar 2024 20:36:11 +0100 (CET)
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
Subject: [PATCH v9 2/7] clk: rockchip: handle missing clocks with -EPROBE_DEFER
Date: Mon, 25 Mar 2024 20:33:33 +0100
Message-ID: <20240325193609.237182-3-sebastian.reichel@collabora.com>
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

In the future some clocks will be registered using CLK_OF_DECLARE
and some are registered later from the driver probe routine. Any
clock handled by the probe routine should return -EPROBE_DEFER
until that routine has been called.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
index 73d2cbdc716b..31b7cc243d82 100644
--- a/drivers/clk/rockchip/clk.c
+++ b/drivers/clk/rockchip/clk.c
@@ -376,7 +376,7 @@ struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np,
 		goto err_free;
 
 	for (i = 0; i < nr_clks; ++i)
-		clk_table[i] = ERR_PTR(-ENOENT);
+		clk_table[i] = ERR_PTR(-EPROBE_DEFER);
 
 	ctx->reg_base = base;
 	ctx->clk_data.clks = clk_table;
-- 
2.43.0

