Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D6236EA84;
	Fri,  2 Oct 2026 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790921346; cv=pass; b=Rtr9auCT4U/D//LMIAkgb9L/Brfgh3mCQfC47CshipHYiHuoz/nIoJtCZ0N4Y8cxc1rNV/nXkWkokofxVpADWfRIZ4yKOKWyZcehmW3RaCJvkI4j4WUeylWM27ZoFXfve7zO9JrPMPP/wfAur4++CZoql7vgePy6Z2PfB8Xu3Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790921346; c=relaxed/simple;
	bh=12bXabEjP7UeJc1aLl9bL1z/QcKD8ABIHMY7JVzWKy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dk9aUr5A3OCO9btHR0YBmwxP/j3H/zs2Hcd7v67dQW/BDrM+8q83+ZvkzujKXD72eb23tsx31cck/Ql797cgAURdSac54nzSRFLhQwu06HimsOhCgPJOK+1MA6ubC/RiG1yiSO0TWcsryEhWlOJqH1+IM8znwExiSb/otWR1Ebc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=BwmlKBEC; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="BwmlKBEC"
ARC-Seal: i=1; a=rsa-sha256; t=1790921320; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FHp4CYoXX53jLoSWEtcKpA3m+g8b3ny5d6fTFKQqrUix62Ak3P1TCwDBQpO42iC6roCoxQ6EfH30SNZYgWZYJeAbaY6cCzjF3Bj5ui4S9FLB8IG9WzOJk2wRRi0AjmmlMA1dNovOJXXeiVyjEi1g9j6CzhZ7qjQQnT9RJRf2j7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921320; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rb8nHi/CxSI1Yh6JtZ4ABJjs9vevLTrFHUXkNahjvzw=; 
	b=TdKHW9Kq9D8fdZHxllzwsJ++k7x+fA7kr8FLzsy3SnYgzYeaP0OpgOQam2z9yr69R1Yutu5hwcArUfplQTg8ViZY2tUfFRig7iWl52qY4jC8bjvXQpuKT1JTPwJd42Yy1Z/FQ2evJaS+bO7ouTGo7ZpHpwWJxgI3KNMFB6JGvVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921320;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=rb8nHi/CxSI1Yh6JtZ4ABJjs9vevLTrFHUXkNahjvzw=;
	b=BwmlKBECtCIVUucj7lHQveYeeFGF/gEebAW9V8GGKKo52abdJMyfjqgyTc0I2XXM
	N/5G9c0wPsJBWMgH+Gj9KBLg/ZDMb+eEq+PgUR88AmdP+1JJK5Oy8V8JqH1T/GtLO4c
	X9SPr1666XvSzckqsA6sG2i+TNZkdRxQj5jq/W9I=
Received: by smtp.zohomail.com with SMTPS id 179092131883686.4936962033596;
	Thu, 1 Oct 2026 23:08:38 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH 0/2] riscv: dts: anlogic: dr1v90: fix clock dtbs_check
 errors
Date: Fri, 02 Oct 2026 14:06:59 +0800
Message-Id: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1gaSqQj1KuJiOhPbdKGSUREG7
 +7YLr8H78+QxFQSdFUGk12TzlMB1xWEj5/eghqLwZFrmchhNN6fhME2jCuOeiA17SOMnj1TA+W
 3mJT51+yHv9P2+kpY7xCc5wWYzrEodQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=12bXabEjP7UeJc1aLl9bL1z/QcKD8ABIHMY7JVzWKy0=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e/n8O+SdONNwmvm0jhChqxPuJsZe9Q2YGn/gTEP+z
 uM3dts5dJSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCRij2MDO1/hQsUvy9tvsPN
 JHRzlsg+3qpfjiJ/shKNMmd0ite9+s7wh/f7pGbjfb1C2kUHnRcc3pezhL2fS3JpoOkZk3OPf5b
 mMgIA
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

This based on linux-next (next-20261001).

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Junhui Liu (2):
      dt-bindings: clock: anlogic,dr1v90-cru: make external clocks optional
      riscv: dts: anlogic: drop unused DR1V90 external clocks

 .../bindings/clock/anlogic,dr1v90-cru.yaml         | 24 +++++++++++++++-------
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            | 16 ++-------------
 2 files changed, 19 insertions(+), 21 deletions(-)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20261002-dr1v90-cru-dt-fix-0463cfa1a104

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>

