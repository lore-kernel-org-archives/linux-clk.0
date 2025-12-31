Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410ED21578D;
	Wed, 31 Dec 2025 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767163452; cv=pass; b=a0jI25Y0KJkFOWHn5Rdp41KH9djU9AHd2mWETL810yV/5KQC1lotNQQn/Rhyuvu10Tdu857eu4vXxu6+1DHOSS0cTqLmu8t3WZJCdjolDipfbiU6aH5RZQB4OT88p+Bxl41zUp5RBu8pk1QowC0+vyiOAQF0OkJyttWxwkPtJEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767163452; c=relaxed/simple;
	bh=ATqRXHl+ngDJnLDhjRAdulmSE2sYWI+H9pHj2pOMFLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVWmdpFiX1sGlD7hPRYGbomQD4cTgGbmLaMBkpkc20Sw7eNVGUi9yiAPxu9Pq7ZVshqPYxeMkp4A7uF+wIlWcf8Lv/skSzYwGv5uHUWYxXf71RF3of9aKSSP6Oaz5NU8D8c72tbDF2S4oRNhpgOCWLoLWxNeqYExOFy1Wb1BpQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=rRPqzo2y; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="rRPqzo2y"
ARC-Seal: i=1; a=rsa-sha256; t=1767163438; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VI7nF2C8647w9PGcx259dOFPOn5CUM9p4nYFJ9kKbKwwSDCkHU6jzZX4dc4dhvcV3X6aPTvgreKdTlKQo91uXmVNMbcHdzejTnH1VW3gqPi/nXY2gJ3AExKpQtVtIbKbfz7FJUA/v4xy6Xz9IBhocJIpd/G+/PyoLzuy1bzWOiU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767163438; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1vYaaijdaEhbo2wB/eNaCW/MdEKtRIzlGEFILSYXQy8=; 
	b=D2c1pTYCOFp2t5bDVneZE/WXBBu6AUWtI7qKjlVg73RCGgg9ifjQGtF+C4h6y/QFThYvAjCqtrQu2Nxa/1s/udfnTtHszB7859aE0vCl17YRZrVQfeVI2sl/eu5A7U0fE4XYEWLdYrebWYEtep6dCW3trdakzoZ+B5ErW2sXK4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767163438;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1vYaaijdaEhbo2wB/eNaCW/MdEKtRIzlGEFILSYXQy8=;
	b=rRPqzo2yGcvcTNXs13dUmKLPYGRIgn7Tty5BG0XaKqS4nW4GQY4NDlHxIio1smcU
	a5QxcEavZ2dZxJZfgut0SdSkwi39gFkgy7p4Tm7GOs0HKebEeA1Ga+IXr0YLp5KtFT4
	+DT1P5S1Dhpnd540AcvfgFueGPgSmRfOw9q4Mbvo=
Received: by mx.zohomail.com with SMTPS id 1767163436476260.22639634500354;
	Tue, 30 Dec 2025 22:43:56 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 31 Dec 2025 14:40:10 +0800
Subject: [PATCH v4 6/6] MAINTAINERS: Add entry for Anlogic DR1V90 SoC
 drivers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-dr1v90-cru-v4-6-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
In-Reply-To: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767163372; l=703;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ATqRXHl+ngDJnLDhjRAdulmSE2sYWI+H9pHj2pOMFLM=;
 b=9hYTT01ohMrx5HY6jjKFaUAW6j1OiNFZI+vC0O+9i5xl2myC1NY938DR96qqWQzShRaaJ78X8
 OndtaU11SFcBwWU+M4AbowdDSAbcj44hhcIPrG2s2LwkIqKNyIiCPpr
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External

Add myself as maintainer of Anlogic DR1V90 SoC drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..3aab1ee3e286 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1841,6 +1841,13 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANLOGIC DR1V90 SOC DRIVERS
+M:	Junhui Liu <junhui.liu@pigmoral.tech>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+N:	dr1v90
+K:	dr1v90
+
 AOA (Apple Onboard Audio) ALSA DRIVER
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linuxppc-dev@lists.ozlabs.org

-- 
2.52.0

