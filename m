Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464EE20B35;
	Fri, 26 Jan 2024 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293765; cv=none; b=hTlhuU6nyHXD9c9cXBUf+5qSW/WYjTUN1MUH7PHFwrGFseJE0lSfInUos3QafYyGRckdb/KenHYaf6Nopz+mPDsUDRC/2TggkLIbIXkxdXZhcAhCSm5BUhdD5vfdvJDPsrwp76X2RGpnUqumlCnXY/EDJXoXIhKORdKsiqVZm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293765; c=relaxed/simple;
	bh=zi8CSQutnIMZvId7S7zSLZKlJz5sGKgoi9p6iA4z0z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDtJw+QtE/qKZcQ9UsDr9djBIlGhh1qn3jXsCGTm4DBU2CndK1k/EmMB8LMEbHbJrvXx3FN2BnqNtHmqVKyAgZCpXZK2xhcRYrKovXOpGB3BKCBVc1ZSV2fiqiY+T41aNtz8dchP7Aw9bhR3NUG6vRAm89ZoEBgFdFW4NdHMwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yQ3rQsBW; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yQ3rQsBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706293762;
	bh=zi8CSQutnIMZvId7S7zSLZKlJz5sGKgoi9p6iA4z0z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yQ3rQsBWvISxScJhJOPVpESu4VPzD7zShKo5XJteBlZty2N50zN6DZaMm3zKdzmEN
	 ayUub0+Zr+EvG0cLrabWh2Mq8SBx0ZxKTZ9VjJ+prc5jDo3bm+chCscyHXNuPpsbUa
	 1aqKjYGcm9Hhsbr/3/skLONtUpmJlM7tPrVI008vJqCf0BPKkFWje2gCTtf/9rhgj0
	 IbprprzNIG/j3W3P4QBmfth4XqmM5w92/o+OFPEOR5CtCiJLCD1MlsE9N7hTSAfGW7
	 9FtpdBYPUTmluwKUIWT9cePMfArCtD8aZiG6dSx3jZ3ZuOVTuoj6b5XXmO19Szf3ti
	 wm00G9zKKRjTg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0AFA13782077;
	Fri, 26 Jan 2024 18:29:22 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 97560482AC4; Fri, 26 Jan 2024 19:29:21 +0100 (CET)
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
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 3/7] dt-bindings: clock: rk3588: add missing PCLK_VO1GRF
Date: Fri, 26 Jan 2024 19:18:24 +0100
Message-ID: <20240126182919.48402-4-sebastian.reichel@collabora.com>
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

Add PCLK_VO1GRF to complement PCLK_VO0GRF. This will be needed
for HDMI support.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

