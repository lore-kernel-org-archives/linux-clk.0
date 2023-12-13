Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GZi1WSye"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1F2E8;
	Wed, 13 Dec 2023 10:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493477;
	bh=N0mIgq8eEj9Yqh5g1KsiM6Na4KJDpVX1RztufTMFpis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZi1WSyeHXB2ydEQsUbMcKWzsbnMCt4y9afAbUchHFz+FCjKgb4061f/PhPMQgcBn
	 m6qDka2bvKVRe7jx0Rr/ww+X3Pdw8mjgNgcaFOqfhy8FYCe15MrEOKfe/qlntuojqF
	 //TMcGHbV1qplJ7oxbjX8viDqPC/IQD3bkQqIP74G9vA1pxpQaq2xhSDsMYxDA/4OB
	 5gs9HIjde6GNZN7cp1Kt6GgMkxdj6rgI3XrGqzAs6aBcgTEUuAwYTAE6NATc2egzwD
	 EOaIxpUW+PAV/kPh4oUCDGeBpgpUrmFMR6eTvYIQe2pVZn9cUAnzxlozLdnMaMfbBz
	 +P5YJSi62m2jg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B4555378149D;
	Wed, 13 Dec 2023 18:51:16 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 38827480105; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
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
Subject: [PATCH v7 3/7] dt-bindings: clock: rk3588: add missing PCLK_VO1GRF
Date: Wed, 13 Dec 2023 19:46:48 +0100
Message-ID: <20231213185114.47565-4-sebastian.reichel@collabora.com>
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

Add PCLK_VO1GRF to complement PCLK_VO0GRF. This will be needed
for HDMI support.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 7c6f0ec7c979..0c7d3ca2d5bc 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -733,6 +733,7 @@
 #define ACLK_AV1_PRE			718
 #define PCLK_AV1_PRE			719
 #define HCLK_SDIO_PRE			720
+#define PCLK_VO1GRF			721
 
 /* scmi-clocks indices */
 
-- 
2.43.0

