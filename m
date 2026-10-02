Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331B4D179C;
	Fri,  2 Oct 2026 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958568; cv=pass; b=ION/Rsy/YaD2EtkwsARdCSCs9+7/tl0ZAsblejwbJk0u0MClP7b0gxFHe10V7kQ6DChmCr/Ecp7EmQEUfcCiHJ16S5nRnZu+R0z1ZWsPsQiwye/IzafczGc8SGLIVLjTVAXguvJMWVBmnzTcogK60aSjSqRQjr3pOCHMoYPevMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958568; c=relaxed/simple;
	bh=IHvzbLrU31w9ckgQETxkKDJeh7K+/rYGP2tSLlCw4uU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LJpjWGwL1Ys7C4IQcjlGZR3Abwwb3FLvaQmzZhw8BE+Wki9LXeF3uwVgcuQjZS9Yn3Slnyz1e5KYf2KkCGfKkp9dx4jd+nCLvobA/kJsh/pENIzvEnAICPvwkxO7dN/+HJAqXpecdLaFBZsJ/n9rpdN8c3pwKaLLEQ9CmtDFkZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=AzdXh1Kx; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="AzdXh1Kx"
ARC-Seal: i=1; a=rsa-sha256; t=1790958545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aSIVhUj4khfoLk3lWl78yR+YHulD0x/Om2m9eERu8UpLaAi+Won1b09eHv6SOm1fk6uaCCMRz3UoffFnxYSIHFa9iVaqB0yiPwKOCfszeJ3RSGNODJsFTol+0ZvRjpyV/0/TTskX6NCYpBoC/PxxXxauvEObMS2r0LTpbX/PcIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790958545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hCAHqdDJ11ApEMn14+Ry9UN0txrOLWuLO9GRK+R3gmY=; 
	b=VlBduSsl0GijwcKQvE6/S766LWNahL26z0zZrmskab0/E7fxJTS/eQI6D9U5c2TrvSOi5Wg47wOPnkbBf6/Xz2iwNR2u9LIgLxLOCOo+Mr3Tu6hyfPBnnCK7/l/n4mHNYkAxCR/xNDMeJdh+qz2MV+pGJNhdcCKJq4RwBXTIHD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790958545;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=hCAHqdDJ11ApEMn14+Ry9UN0txrOLWuLO9GRK+R3gmY=;
	b=AzdXh1Kx8Kxq8jQ7qLP0kwUYhly6J7xMZdeBL3QIHe1s49lEx5wbz8mOz+zMkhuT
	u9qCjLz8PaFRKGhtX3SzraEtADPJuTAUf58C/KlYDgO/O5yHLIPjdMTvtCfqDb422yx
	Sj0Lb36F58eBtnLWIMxbw+t9tPDo2M5+saHYNFdU=
Received: by smtp.zohomail.com with SMTPS id 1790958543889765.0593727159765;
	Fri, 2 Oct 2026 09:29:03 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/2] riscv: dts: anlogic: dr1v90: fix clock dtbs_check
 errors
Date: Sat, 03 Oct 2026 00:28:38 +0800
Message-Id: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQ6CMBBEf4Xs2TXbgiR68j8Mh9IuUKNCtqXRE
 P7dgnePbzLzZoHA4jnApVhAOPngx1cGfSjADubVM3qXGTTpWhFpdKLSmdDKjC5i599IVV3azii
 jqIK8m4RzvDtvzY/D3N7Zxk20NQYf4iif/TSprffPnxRmLpnak6tsSe46+f45inkcI9sBmnVdv
 /uPXSfIAAAA
X-Change-ID: 20261002-dr1v90-cru-dt-fix-0463cfa1a104
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=IHvzbLrU31w9ckgQETxkKDJeh7K+/rYGP2tSLlCw4uU=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2394tL3wtZm3SxgWXL0e/Pf7rwq01RvvndCjGr5suU
 xo24dkS+Y5SFgYxLgZZMUUWLn/xf9Y6PN+OCLTeh5nDygQyhIGLUwAm4lTOyDDpl9LanKPuqjUX
 lJf7rWadYdcdW3jzl/1HEQ6TJd1e9ocZGa6vNxQzWn3vFtOJrNBF9r59Gzql4+Mv/1WRT+P3m+B
 rzAMA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

The external CAN and watchdog clocks are optional board-level inputs to
the DR1V90 CRU. The current binding requires both inputs, causing the
common SoC device tree to provide fixed-clock placeholders without the
required clock-frequency property. Consequently, dtbs_check reports:

arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml

Make the external clocks optional in the binding, then remove the unused
placeholders from the common device tree. Both muxes select their internal
clock parents after reset, so boards without the external inputs continue
to operate normally. Boards that route either input can describe the
corresponding clock in their board-level device tree.

Based on linux-next (next-20261001). The issue was introduced by the
original series [1].

Link: https://lore.kernel.org/all/20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech [1]
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Changes in v2:
- Update the binding to clarify the clocks description and simplify the
  clock-names constraints
- Collect tags
- Link to v1: https://patch.msgid.link/20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech

---
Junhui Liu (2):
      dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      riscv: dts: anlogic: drop unused DR1V90 external clocks

 .../devicetree/bindings/clock/anlogic,dr1v90-cru.yaml    | 12 +++++++-----
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi                  | 16 ++--------------
 2 files changed, 9 insertions(+), 19 deletions(-)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-dr1v90-cru-dt-fix-0463cfa1a104

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

