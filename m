Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB993DAAB0;
	Mon, 10 Aug 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364177; cv=none; b=UNL5h74HgoGZkdfnAd6DnTOpMem7Egec3GMmakxqsa6/9hGVjcSxmfnjgpcEbbhtX5rQw22Ev+43lI2aaZe7cbYv/x8X/otykVgMD0zjjYzK1dmfPko4qlaHowb6A+iFrhX2612ff5i0oWR8rKwF6I8cW6wNXkkiZlyuMFTfiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364177; c=relaxed/simple;
	bh=fBbBFCfL1qnbIrz+YRMXQG931bBeLwr3NZ5iAIymmy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcZG8gKFI1DF/WfPqrBZ6NydZRTQ+ujGHsxKAw47ltDC3q+tkO7bRTwmHtuCKez1bLkvMWMlo8Y97wCFi6TFWSYTo5fkxIIpRSEIelXiP7/vdda8McRwj5/ZZtFpXGioXxVfmQOvDlLlVoBwWGcynkitKYWkwy9fP5yWSdmenVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=p3lpEu4Y; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="p3lpEu4Y"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E28FBFAEB;
	Mon, 10 Aug 2026 15:16:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364174; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=P4h8dquu6slcO6eGmqY9QueeVQuamfZ2A7/alu4byEQ=;
	b=p3lpEu4YgBYMt+wFTdv6GcHxB2FgHpdNIsekfb3e0VR8ElDPJ5k6G4qGQJv04ZwbYKHXEs
	JqUMLMZbWVb9b81EemukQjlFHeq7FzgvuSnGTh4ArOsYZbUZJyqfbouyImWXGEeqqc4Y9r
	NJz5+EuQXz09JVf9jf2uTGllt3zoetxrHsiuEfjM+kiQ1XcCV2vtC9nayPxCov7wqVK60A
	tPoQfpQ0kPgi/cuP861AAHAdq7os26PvgLxzVQkAoZrRYBGHnTsSOUOC2KQe4qu8ePbr8U
	rTIZTN7j66KshiBYvadQPI7rhuKThzVmfhQfcl0HemlEVdNuokFc89d5I2kFOA==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 15/25] dt-bindings: clock: rockchip: Add SCLK_IN_SPI1 for RV1106
Date: Mon, 10 Aug 2026 15:11:06 +0300
Message-ID: <20260810121121.210040-16-vlad@zlab.su>
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

Add the clock ID for SCLK_IN_SPI1. This gate exists per the RV1106 TRM
but is missing in the Rockchip BSP kernel. SCLK_IN_SPI0 already has
a binding, so add the SPI1 counterpart for consistency.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 include/dt-bindings/clock/rockchip,rv1106-cru.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rv1106-cru.h b/include/dt-bindings/clock/rockchip,rv1106-cru.h
index 80244988e139..ec6e7cd36f08 100644
--- a/include/dt-bindings/clock/rockchip,rv1106-cru.h
+++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h
@@ -303,4 +303,6 @@
 #define PCLK_CPU_ROOT		286
 #define CLK_RTC32K_FRAC		287
 
+#define SCLK_IN_SPI1		288
+
 #endif
-- 
2.47.3

