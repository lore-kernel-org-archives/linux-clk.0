Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E753D969B;
	Mon, 10 Aug 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364146; cv=none; b=d6YGT6hxvGg8X3K7Kri2kXugUfNVhV6JD7OMkDUakLKOBiW/elTqLjwLpbHiEnU7ZBVfFddrMvM6FDWRYQVdRzHVUdOYCxlW1TEINpfp5TNNIx5p60dNJ2z1QGM+3WGhwcmyvuMVFhodnoST7MyjyXfd2ouJLZvPWKgLQSotigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364146; c=relaxed/simple;
	bh=9kpZc3zCVYNc7OjO/sbGTOXmDC+Zl9ah6ei6e88BSKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grZWsfsg6jDRAVxwrTohnMsnMW60z2Nw5SincUsvndrga2kwZmpYjeeXT5Km9EPZXSOILLDzFXsSDkW9QYWF+tBNIzbMC8AbQNEQUoxLmALAma9jw3nPV8Qws1XmdGx5WXP8xdvg5OKfnKrhCYH9RySS28UpR4l5t/t+q+rY5tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=jd2e4Mtb; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="jd2e4Mtb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CB72C0516;
	Mon, 10 Aug 2026 15:15:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364141; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=v1XLSf6ZDB/wEqrRtkdlR8YK8IVnmgU/VbtIqk1IzZk=;
	b=jd2e4MtboCVn2w1QPDe/Im5f/LMETb6HuTl6ESnZ4NMjl7H/x6TkM3szAKfDAbQDrU1S0r
	Xoj2sdSLWDJFDtqPT9hlfMiPQpSH1EQhU04PyARXyehUa4SvzGMVy/ayGzXO8FT2uBKMVF
	VJLEJSXxNbYUcuOUMrz5UYjOedsXukd440taUfpf1sMxTLEeXCAf1l5DOLKSrVwEIRH2Y+
	6I7LJLeiW3fa5alzAf1ASqUUYkL4OAk+LykgL7P30kq3l75MerT4ShUdS61brB1xIBc4LK
	8zHWxqTy4JACFR+c+4XL3g0a0MiNoNlKuquogslOVgqcqjoPCQJm9hua47Kg3Q==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 03/25] ARM: dts: rockchip: Add reset bindings to RV1106
Date: Mon, 10 Aug 2026 15:10:54 +0300
Message-ID: <20260810121121.210040-4-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Include the RV1106 CRU reset-ID header so device tree nodes can
reference reset lines by name, matching the reset controller support
added in the previous commit.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 70d3da6bd03e..fa5d0d7f4dcb 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/rockchip,rv1106-cru.h>
+#include <dt-bindings/reset/rockchip,rv1106-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.47.3

