Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MWLfB7DN"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837F0D5;
	Wed, 13 Dec 2023 10:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493476;
	bh=UCS+KPsxvcp4BORj2nXaNk+rHiVu0HA6p/TRoZ/FmIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWLfB7DNmAEZk5yiIGOD6VtQ4pER8tPRkgFLOrOA4h4Pjw28IbewKE/a+2gM/c2Yq
	 FrnzYLdsYMe9Ak7NSvh2zMzH4o9elDzhR7pwIeVpLYGMUu3RAiyZqCYG5kEA2H5vVw
	 zMeGdzlUbrUIhjbPCCSWfnqdurEbGBfYQEj/4u7MLSn4fapnnKuTCUeRDg7BO4sUZ8
	 ntm1DKz0/iBlKwWRig1G2x6qVCYQdvBwQQqTb8mqON0SMHT6TQgjdpmUks34RS4asl
	 v1V5BsWnVsRw40+2e3P6zxzXOFZ/Qit/kiSR2E0fRfZgAIOZ4GoOluWdXqF21oywNu
	 jspGazUgVi3cQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ABFDF378149C;
	Wed, 13 Dec 2023 18:51:16 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 36A64480104; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Kever Yang <kever.yang@rock-chips.com>,
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
Subject: [PATCH v7 2/7] dt-bindings: clock: rk3588: drop CLK_NR_CLKS
Date: Wed, 13 Dec 2023 19:46:47 +0100
Message-ID: <20231213185114.47565-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213185114.47565-1-sebastian.reichel@collabora.com>
References: <20231213185114.47565-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLK_NR_CLKS should not be part of the binding. Let's drop it, since
the kernel code no longer uses it either.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 5790b1391201..7c6f0ec7c979 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -734,8 +734,6 @@
 #define PCLK_AV1_PRE			719
 #define HCLK_SDIO_PRE			720
 
-#define CLK_NR_CLKS			(HCLK_SDIO_PRE + 1)
-
 /* scmi-clocks indices */
 
 #define SCMI_CLK_CPUL			0
-- 
2.43.0

