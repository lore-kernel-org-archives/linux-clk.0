Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24F0258CE9;
	Tue, 16 Dec 2025 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765856807; cv=pass; b=Ga9LjJyPBv9F6nUzv99rhVzYBzScTDZfYy6DM7eXFu7gE3hS/v+4GFnd6j08dP7z3Mzc5bb1S6fq1fPFmx04tALEAQZc9ZSJeIpLjWLjeQ6a6pCykCYmuwL8Gp1MRNXfNKN0aGMRYVWYVDIlLNr3lPomGTCY8xTLysV1K/8j9Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765856807; c=relaxed/simple;
	bh=fK7BgU/BsCw/m8NZK/G3uR+3FsBg5rSzgZBTmQH1e6c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o9EgdWLgfyWTELlHtOeiU3+QXmEmCqjyabGWJ1c+k4pALi6AUgCxxH+kKDPRCh6+QG8mPnmYbUJH/8C3DfQW5tQOp8rAYHDib2jPuZVQz+CgL/0H0uTIYXo3Lj2bpaRUcqt/w3kHtCibgASqGWgzcOiGRmf1ejRogkTLiVD+H8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=HhNLvf+U; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="HhNLvf+U"
ARC-Seal: i=1; a=rsa-sha256; t=1765856772; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j3xmjWW0rGfxdb6+nK0vN5gB2OXdb39kTjm5XSphHvWbw5eVgIJCHzGf7iclb/IRgs1SM8N4myABtakx3QFNfiFbvf2DB3tMFCjRRszwdp4QeYyZR1DGHJU+HV0ki2FxMzkRIzjEwg49oU1iyHMYHQnv+lpJnwTpIJ3FjLHMbxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765856772; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3jbWnm7yP/LIRGcpVIrC0Hwe46pPCDMrB/qxmd4Vit4=; 
	b=li8icaBUyReJ0s+xu2BiCFznD//M+iFeM6zv188Q5GctkDFmiwLa7reFdLyL9dd87XrFv1muJZgI7GWRRCts05a0i6tTIaRlqCzymL89Ntph+niiYPZCreXSFu8aGBjwCiB6KMsGRGmpngfJSFzXWW2jQPcCEsvcEQe4z5E5nT4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765856772;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=3jbWnm7yP/LIRGcpVIrC0Hwe46pPCDMrB/qxmd4Vit4=;
	b=HhNLvf+U1XcjOYNjQxqPKj+E+21rYVQnrj84qQsyi8imDBZ6yzM8fx1XgtW9ZmUK
	Xrm/OZ7dMuptrTTesuJP/Wld7rTpsJD6uU/OEwk/gJMrLOAcCKF4rzZ0n+R+AuUuuqS
	QN4ktjJT12XA8uEcTn7Hu3LMdYRd66m7i5SGu8eQ=
Received: by mx.zohomail.com with SMTPS id 1765856771748322.85027715020874;
	Mon, 15 Dec 2025 19:46:11 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Tue, 16 Dec 2025 11:39:40 +0800
Message-Id: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzUQGkC/22Nyw6CMBQFf4V0bU1fUHHlfxgXpb1AExW8hUZD+
 HcLJhqNyznJzJlIAPQQyD6bCEL0wXfXBHKTEduaawPUu8REMJGzUgjqkMeSUYsj1cpUilldCy1
 JEnqE2t/X2PH0YoTbmJrDZ2x9GDp8rIeRL+vfduSUUZCldDrfOVBw6H1z6dCctwPYliypKN46Z
 6L40kXSlawKbawrnHO/+jzPT84Ss+n8AAAA
X-Change-ID: 20250922-dr1v90-cru-74ab40c7f273
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765856765; l=3121;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=fK7BgU/BsCw/m8NZK/G3uR+3FsBg5rSzgZBTmQH1e6c=;
 b=GV54tO7n7K/G323Z2y2lV1F5e1g3msM/Y6Gbt1MwVNqXBbxc52XpCks0G/zi4synzFTBaDKzK
 Enxrxxcrr6kAoOtsomNC7kYX5MlzsU1XGMJzr8jogBvN8dcBGVYARue
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External

Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
well as corresponding dts bindings and dts integration.

The CRU driver framework is built around the clock controller as the
primary device, with the reset controller implemented as an auxiliary
device. The clock part refers to the vendor's code [1] to determine the
structure of the clock tree.

The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
core). Most of the clock tree and CRU design can be shared between them.
This series only adds CRU support for DR1V90. Nevertheless, the driver
is structured to make future extension to other DR1 variants like
DR1M90.

Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]

---
Changes in v3:
- Remove incorrect __free(kfree) usage for auxiliary_device in clock
  driver
- Replace __clk_get_enable_count with __clk_is_enabled in clock driver
- Add a lock to protect register read-modify-write in reset driver
- Rebase to v6.19-rc1
- Link to v2: https://lore.kernel.org/r/20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech

Changes in v2:
- Update copyright infomation
- Add the original vendor author's infomation to the clock driver
- Rebase on the v3 basic DT patch, which is based on v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech

---
Junhui Liu (6):
      clk: correct clk_div_mask() return value for width == 32
      dt-bindings: clock: add Anlogic DR1V90 CRU
      clk: anlogic: add cru support for Anlogic DR1V90 SoC
      reset: anlogic: add support for Anlogic DR1V90 resets
      riscv: dts: anlogic: add clocks and CRU for DR1V90
      MAINTAINERS: Add entry for Anlogic DR1V90 SoC drivers

 .../bindings/clock/anlogic,dr1v90-cru.yaml         |  60 +++++
 MAINTAINERS                                        |   7 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |  41 +++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/anlogic/Kconfig                        |   9 +
 drivers/clk/anlogic/Makefile                       |   5 +
 drivers/clk/anlogic/cru-dr1v90.c                   | 191 +++++++++++++++
 drivers/clk/anlogic/cru_dr1.c                      | 258 +++++++++++++++++++++
 drivers/clk/anlogic/cru_dr1.h                      | 117 ++++++++++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-dr1v90.c                       | 141 +++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     |  46 ++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     |  41 ++++
 include/linux/clk-provider.h                       |   2 +-
 16 files changed, 927 insertions(+), 3 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250922-dr1v90-cru-74ab40c7f273

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

