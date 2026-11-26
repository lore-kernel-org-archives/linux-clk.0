Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704787;
	b=lKaNVYI5ZPD3dusH3scgNLr/JM8FrwCOUIJ/okJn+FucvWeqNTzDqkorIVdX48rytJ7H
	 p/afwYH4HCYIMyLJKlLMfwsYcphTXqxibPmX5gPZyhM9vVHGLqHwFAhec6FCI5gmGj5B8
	 Ct6xt4YS8WA+SiECyEb5zXFeEmvPVW/icw28cjZ9lMLgTiCRwn/uE+0lQFT4y7Bxl8C+k
	 Y0MoU/+jETR9v18ZUyBBaFYDAvtjDJSF5d+GwjxvWRF6BLU4CyUsxfeHdvY7lJkpdYGP5
	 qO3xj9ztnZF7j9Ne1AO7acXO7jF7bfk7fLr3WfBUEOfI3sAAfoYA9iEy/gn+JDsfLDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704787;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=dhg9yeADsNHpXQA6o1ApIwgcZvzNhA3MGOJqzw1kW1c=;
	b=oTueh5S2ceclisxpOtpiZZ0k9LWwoV2yo5D5qqL160dcKGRL/9RYQSMIDpMlCTYU9xhr
	 BEr5sX60BH55zNtaHWBocLCqjdst+Czjk1WxIuMes/ZN8NYwSQtMwvnhndlMqTF+jrScw
	 BOd2Y2J3kWy3MGRTVlPQJsOv2kVCXTKvGuYHEqrc+NCRkjVkbHXZHmVww9pWdPpJ5VXbR
	 6G/2a8aVy+t0RXIH7qYovCK90BnvQsHA/egxxMh6DDHM7kE/3w+TTAMf0yq5yJAoXg4bm
	 vAJLyoTflw2usXFIAXIeB5XunHXYcgSZbFGZRffVp7NZGQdHEuc/8xndwQaVdtUezFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YTz6949K;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4D6606A31C;
	Thu, 26 Nov 2026 14:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YTz6949K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=x5lh/SnBYdgauWzgJW1VmYgxUZi6pNiqdl7QV0jMsrk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YTz6949KHfr8mdBagMCR2CgGYzxmiplxtPmb9MnJ0q8YZGhVTdp0lY0huLTM4pB3B
	 ti+Q8/D/xg+NJMYLqYvlR7J3MlHDHP72O/9MKiBARLi24uxyq8KC+0CeWjwa117HeY
	 mxscrymJI0otyDhm1eDYYJNXVDb3GTQ0E8n9N/yeIuzmsASJ01mM3W3jKSbGJd3FAn
	 iv0oRFZlFDQjQsSOh7v+k8DJqT9rGBOMpBzRmGOWdk6R7FRym60nd3DYpjbfAIw6UK
	 aDwk0G0rcJictqxoBvk8aCqVdvpef1cN6JpC7qKBHewiUUuf9iG13MexDxjmozki+X
	 NWhJzA2bXB3Iw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A850C17E1031;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6549D480035; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:39 +0100
Subject: [PATCH v3 4/6] clk: rockchip: rk3576: add missing DFI clock branch
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-4-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=H3GQwfzHoY547JOCdlVlgpdhn/jFBxUHgJfat1u3O8c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9CI0k97g43kelSDCHB0tQh+Rpo9MpeO2
 1lTgkHucpFBn4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qapxQP/AlPhxLBsLoTs+8YnEjTYy2dcO1GigrxwtQmnIq9xWle4QPvNMpyscDJnNKAn4ZAhEx
 rwb3xF/sr01Sem+yjTy8E0DLZjaoIJm8YsBhxEbqgGbnr+/6UpyC/Wjcau0+MprYR8YrJ88iT5z
 6YOymiTobEePb1jqktHAVCzvQJZC1cJu3G47hMMMkAKPRcnnqr7UxoVpR1GcTSEgCC7ORTz6CNQ
 AE0RxqJL0Cc1nfNnXP9YfClP46Sx5xTN/lY0hyghUcMriaXXVi038Vxv+PWRAiMiWLvTw6cFoUX
 JkIEdQS6vSiWMevccvrskwq0oQQcxzKruZ/XURINLHMCX7BhU57FTbXLaBnsHZxEKE6aAN3IUMC
 KfULhKSG24wTc+Y+/ZWnR1Zvt0OAi3zPOB+IKCn8rY/MJ5ASYipyHTS0NYMXjv0UZ9s6P/sfN1t
 H2ZtGyHEUk8n04lUk4Vd7f9icGVq5aklzWX+7SyYLF+HLPLHMceDLeJxPOhR6GRYYDlkDxAXGpr
 /IJu9oTpUYjYMTKQxXVthJUNU3vLnearUMLg6/s+QMjzBVUgATJMBfGKgYUeXiyOE9Ye53oE2VS
 oMuvrx2Iyhh52C0XFsWms3skaZnankxL72HF9m1oW1c644ygB6151HS3CNcxkJ0zZh8WqBsGmkZ
 EMlwAp7YS2J51imdxZcUpIg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

RK3576 DFI has one pclk for each channel's monitor. However, mainline's
clock tree does not model this second DDRMON PCLK gate, and got away
with it so far because they both default to ungated and there is no
upstream RK3576 DFI driver.

Add a clock gate branch for it, and remove the CLK_IGNORE_UNUSED flag
from its sibling. In opposite to RK3588 we can add a mandatory
requirement for a clock reference to the RK3576 DFI DT binding.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3576.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 577100659593..a48b7556df52 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -883,8 +883,10 @@ static struct rockchip_clk_branch rk3576_clk_branches[] __initdata = {
 	COMPOSITE(PCLK_DDR_ROOT, "pclk_ddr_root", gpll_cpll_24m_p, CLK_IS_CRITICAL,
 			RK3576_CLKSEL_CON(76), 5, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3576_CLKGATE_CON(21), 0, GFLAGS),
-	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_ddr_root", CLK_IGNORE_UNUSED,
+	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_ddr_root", 0,
 			RK3576_CLKGATE_CON(21), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH1, "pclk_ddr_mon_ch1", "pclk_ddr_root", 0,
+			RK3576_CLKGATE_CON(21), 14, GFLAGS),
 	COMPOSITE(HCLK_DDR_ROOT, "hclk_ddr_root", gpll_cpll_p, CLK_IGNORE_UNUSED,
 			RK3576_CLKSEL_CON(77), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3576_CLKGATE_CON(22), 11, GFLAGS),

-- 
2.53.0

