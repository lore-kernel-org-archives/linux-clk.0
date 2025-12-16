Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AE279DAE;
	Tue, 16 Dec 2025 03:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765856829; cv=pass; b=ldXYKj3cCWdxumQqo+TmIZpIhLtFOVQJAz7Z9yNnfXsehCFV9UX9V2OoaFBX1253gx4lODotjqkffEGrwOjHfoggvtLYGHS8/GhljL/9YdTlqVb3k4nYxL8BQnJ2Ov5oIyp5igmgL6nAQKuV8OYIWyr5WtGXEf8Mab71Vi5EFyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765856829; c=relaxed/simple;
	bh=sFArHp8MxTT//WO8noDWEOyCEAt8z/zx+uO9S3+romA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UM9qcdnQB5C3H7+noEhAjU+wUSn7UTw1fAeyZn1c6iJh2W0a8xxJAwHL16lBkJpYjlxOvF7FQj7OFEPkt++tI6f4CgdxThiAouIXr9jXOcDM9/CJ3C1aa+xhAhq8oE6RDLrNMkr0nK2DeUYkDHFcyr80wnLGnoCjrer5YKxAyR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=D83RnUHu; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="D83RnUHu"
ARC-Seal: i=1; a=rsa-sha256; t=1765856813; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z2dKmtO2ATHJFwnFhiqKHJBC2VDL6z5LvMSfklStHM/4T3gwfQR+lP1kHbrwapHBcrKEgH3xwGpwexui+z9cDU/SLCMmZMgUaxyxPHQhubwSh3ft/JnF0SaAIB1K3eGxwJkgBnDfAFsr1nkDoBD04WT82bRef5hZMw7RbS9/SSM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856813; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ug+ZDoA4Rf5aQ/L3KHfd427l87YDPU42ReTHvUHZ8eI=; 
	b=R/M7YKxD+FzeGOZOEcnxAIh9Vh8RyRKj9Ze6JrFj4Tf+HNvX1tB5PPRuKsTJCXY/hQM7LbnO1m2c6+TC719oWGbsxA44ACZNPw8O8CFfpBYnuL+1IGJzzba6pKhITXTIvEdpTzCK/sfB4WuI95S8YKf2Z7NlwsK087TMPRuwLLs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856813;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ug+ZDoA4Rf5aQ/L3KHfd427l87YDPU42ReTHvUHZ8eI=;
	b=D83RnUHu5zapNG1/J+8VXR4ZpHiurHSa0xbecZXNY/xXgoZCCBoOaPio43cSBT5Y
	CUnid6R2AmvXfdrdW2aGRHqQFOmrsj3kKKep5PsgPJTjdW0M18Ym4xJfL2MnazI7YlF
	3IsDUTmZ7fTw+4I3tzxncIB8xIR4Oh/zb30ipUS0=
Received: by mx.zohomail.com with SMTPS id 1765856811386140.78787853841845;
	Mon, 15 Dec 2025 19:46:51 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 16 Dec 2025 11:39:46 +0800
Subject: [PATCH v3 6/6] MAINTAINERS: Add entry for Anlogic DR1V90 SoC
 drivers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-dr1v90-cru-v3-6-52cc938d1db0@pigmoral.tech>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
In-Reply-To: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=759;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=sFArHp8MxTT//WO8noDWEOyCEAt8z/zx+uO9S3+romA=;
 b=byowsbfcpmQVLRa60RaakgxIYq3+FbPv/WhkvWluy9LNYXVUAxemKPz93OapxIy4vS/7MCtqu
 ISXYnipt55nDcNJjmzWywkWrJRCn67AmmTZZHslc8f3OJOQSXOrbw3d
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External

Add myself as maintainer of Anlogic DR1V90 SoC drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9de1e9e43f63787578edd8c429ca39..3aab1ee3e2864397fbf510ec506a0fa498588e99 100644
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

