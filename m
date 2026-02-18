Received: from courrier.aliel.fr (pouet.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAC2989B7;
	Wed, 18 Feb 2026 11:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412496; cv=none; b=crvahmMpF2MHoK6n2RmACHlqe7/ceRIfP8n94mhiWJl0nBh+A6dQWW7jmFYXUAxsO0tq/O88NSwdz7nlG8P1V7Wqoyr8pZIPavuaHdiDt1YNstMSSiPfDHfmfpQcRcUCxThu6NuvruKQb6hGPD85PxJWc5quTrLveI1mL19LdNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412496; c=relaxed/simple;
	bh=Bf1BGfpVaFE+vAbk5iBAFQe8t1I69MBvOFnXlOZ888c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EED97eM7kew0oqJjsQPqTua/XE6+brCP/FF27mY/Dw9lc1S73xghfslZ4i8l/e9LveVNP032EWBHRbKC3h5RfQHLweK9znBxYvJJDviEzndQJdVpdxsnd5M4M5I83ES+yT9Pthq4DQRbSwqQNi7j8DgAws0ChwhagMGdpFtWRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=bu75AyLR; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="bu75AyLR"
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661D-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 1AD08426E9;
	Wed, 18 Feb 2026 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412492;
	bh=Bf1BGfpVaFE+vAbk5iBAFQe8t1I69MBvOFnXlOZ888c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bu75AyLRF52GkTzk46PW6Qb7f7JO8/32CdoEl7wzsQVk/qcPUJSgdJvljKs+u2//N
	 Pg9hZzDk0UoDOtJnGGpSVbX/pRrUBxbjRBdtUI9FdkCFb2ARY9r1mFyVOvdeQEPAeY
	 3UCQnhmXWHoD4Eg8ix5eNlAYjEV5okOTtzVXMKtY=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll support
Date: Wed, 18 Feb 2026 12:01:25 +0100
Message-ID: <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
index 32c4b62037de..0cda8edfa7cd 100644
--- a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
@@ -224,5 +224,12 @@
 #define CLKID_SYS_PWM_AO_CD		215
 #define CLKID_SYS_PWM_AO_EF		216
 #define CLKID_SYS_PWM_AO_GH		217
+#define CLKID_SYS_A_SEL			218
+#define CLKID_SYS_A_DIV			219
+#define CLKID_SYS_A			220
+#define CLKID_SYS_B_SEL			221
+#define CLKID_SYS_B_DIV			222
+#define CLKID_SYS_B			223
+#define CLKID_SYS			224
 
 #endif /* __T7_PERIPHERALS_CLKC_H */
-- 
2.49.0

