Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00120B30;
	Fri, 26 Jan 2024 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293765; cv=none; b=XT8w39DE866IqhMnWGU9TocbMAdiwYYrbRTJRvh19di5DydyON2cQTGjHkJfVm0Ng/6mLNsrPLOLjJC34bcHuFRg7J5f4ExjIEWfECUyvag/4CpAxqPAKD/L0CogajOJWHkaV0ZlceZp/gay7EMUpQQFMLk+8GpCIxTl7kAjNJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293765; c=relaxed/simple;
	bh=Q6tqBDARqY1tmw7h3ONBEyqVjEQtqcs0AbMecGzt8c8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkqv4HcKZaO9cod+UKMi2e9IWgxn5rL+q1e6744nvtJa0fsOHD1Qd+1qGDJkdLmh9eKTmmtsPSbJitg3FmDUrAL7hih393JQkaQAzOrrQSGG4ZuWm4G52i8NOxI1GMuThKqGtQ8OaVVSF2kDcapGW8OyapnU/JvAxzpO43rQX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=zrmUiaN0; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="zrmUiaN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706293762;
	bh=Q6tqBDARqY1tmw7h3ONBEyqVjEQtqcs0AbMecGzt8c8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=zrmUiaN0+3QUMafC4Dxf9UxwlpS7KK/bIOjvAWI4MeOiP0YcQ5AL1V4c+4ZzTgHGK
	 qzElfHofjzQOnbQkVCUmo1MgRAkLN+u7XK2rnoG2IaVSC/nHy2KTK+jGtrFuJDfvMw
	 MEolhDS+37GmDWWKoeybTNSXIo2kLaPVNLyvsAFJZHS8Qr0yfEaq3w4Vfau32rbLEs
	 hRKdfkiKF0AwPCXIKQaKt2cjbtUylIAxkj8pvguyPH4g6IOmVJcczgbk0ftYdV3vmO
	 hZWvqvZTe4dcavCyhVPofAaSYXYbCLueDagP3HHk10mLmJCg1OF/9Eefuam1efTwky
	 1LGatsXtQXV9w==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 034A13782076;
	Fri, 26 Jan 2024 18:29:22 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 95204480C4F; Fri, 26 Jan 2024 19:29:21 +0100 (CET)
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
Subject: [PATCH v8 2/7] dt-bindings: clock: rk3588: drop CLK_NR_CLKS
Date: Fri, 26 Jan 2024 19:18:23 +0100
Message-ID: <20240126182919.48402-3-sebastian.reichel@collabora.com>
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

CLK_NR_CLKS should not be part of the binding. Let's drop it, since
the kernel code no longer uses it either.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

