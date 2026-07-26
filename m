Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F83D953E;
	Sun, 26 Jul 2026 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087631; cv=none; b=g+ZL4yxTnZB2LGR2dppb5lo2z7qOSSrUi2yIGL+C4zZDeF6TU8f/++APgNCxMZgwE7tUE249ydcMP5+ekxH7Eppg8tzK2Wd6EamgTG40Pds+wDi9wxSree/ajyoI07Spb1qPtqvfMADov3xRtL7J6QwtN+f/JI0u55SwbJ+p6I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087631; c=relaxed/simple;
	bh=0BGKt1m91nvEolRdnYWTfp/T+RfvOFvPKeLAV0WvmMg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CEnw2AZbfIawzEUGG0CS1rsM7PNdSEVqwfRmZJW+rFo4+FaN4jerIvs06rqR/9MlgjpbNEvCf7TRTXAFur8qZP2yuB/Rq+aZg3EYOWZYZddnAp3DsJgT1p5oiu6Gq8dQVcTFgNbXt27JmHlDa83lHindb9KwpXlmZJAkgkPyMoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2H2PA6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2H2PA6z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD5EBC2BCB3;
	Sun, 26 Jul 2026 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785087630;
	bh=0BGKt1m91nvEolRdnYWTfp/T+RfvOFvPKeLAV0WvmMg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P2H2PA6ziBfqos3MLlI4RAfBDRmVLWhRFXuPVXCkXE/d3YM8P9vOHwGWZ/DUEUE+/
	 NnSehOjl4ca4319rB0GpVCB7pUNigJ8LeC7hac1s8Kjk3mJWk3+oU5a+3aKdsumErm
	 Cibpw8D3A38bkyiGe3qCow37o/SuuzVkMhkL6ICkrV0V3rE30JcWfz8UZX7mIsROJ9
	 r+NbtTYVGHUT19KJFn7fY/Xury2qDJy1VuS8Dg/lItusvek672AGVEURsA17sAsFAt
	 IvNcBLnnVXeqNGZ5ipuEa2A7xa17yFl1lEOnc7o5MslPtXzOr6/ZZ3RPgATQv2zT6w
	 XAYoTg5L4FLRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8867DC5321C;
	Sun, 26 Jul 2026 17:40:30 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v4 0/2] A proposal to add a gpio-locked fixed clock driver.
Date: Sun, 26 Jul 2026 17:40:23 +0000
Message-Id: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdGZmoC/33OSw6CMBCA4auQrq2ZvgBdeQ/joh0KNCiYAo2Gc
 HcLG2IkLv9J5puZSG+9sz05JxPxNrjedW0MeUgI1rqtLHVFbMKBpyBYTkurh9FbivcOG1qN2he
 05KA5CmVOqSJx8+lt6V6rer3Frl0/dP69Hglsmf73AqNAUyYyNBJyabKL8WNj/RG7B1nAwDdEM
 dhH+IIgV1LlhRISfhCxIfGXfUREBBiiBq1BavWFzPP8AcrEKWxBAQAA
X-Change-ID: 20260318-feature-clock-guard-f20a2c35b965
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785087629; l=2038;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=0BGKt1m91nvEolRdnYWTfp/T+RfvOFvPKeLAV0WvmMg=;
 b=U5P+KGTE2a51jq9XrlPK1UhndU8uYVaFida+8VpsN/WEAM2lhyW8CHJUA/njEUAET9sGkUyTf
 TaKEPZWuIGJDZlAvpxvn7UA0Uo/lOzG3j4TQ04mdqdLe1qih/bt2q1M
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

A gpio-locked fixed clock aggregates one or more input clocks and/or one
or more GPIOs. It's similar to a gated-fixed-clock, but GPIO direction is
inverted. Consumers can use the output clock to wait until all input
clocks are locked and only then initialize / access dependent peripherals.

The usage example for such a driver is when peripherals depend on PLLs in
a FPGA, which can't be directly accessed by the CPU, but need a GPIO pin
to check whether clock is actually usable. E.g. some of the IPs might not
have a proper split between registers and IP core, which means that if an
external clock and/or PLL lock is missing and one tries to access the 
registers, the response never comes, thus the CPU stalls.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Changes in v4:
- Removed driver specifics from DT binding
- Link to v3: https://lore.kernel.org/r/20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com

Changes in v3:
- Removed unnecessary dt bindings
- Improved HW description and commit messages
- Link to v2: https://lore.kernel.org/r/20260510-feature-clock-guard-v2-0-6c25458d5340@bruker.com

Changes in v2:
- Renamed to clk-gpio-locked to express intent.
- Provide enable() / is_enabled() operations so the clock behaves as
  expected
- Fixed DTS errors / warnings
- Link to v1: https://lore.kernel.org/r/20260318-feature-clock-guard-v1-0-6137cb4084b7@bruker.com

---
Vyacheslav Yurkov (2):
      dt-bindings: Add GPIO-locked fixed clock
      clk: Add gpio-locked fixed clock driver

 .../bindings/clock/gpio-locked-fixed-clock.yaml    |  59 ++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-gpio-locked.c                      | 306 +++++++++++++++++++++
 3 files changed, 366 insertions(+)
---
base-commit: 3dab139d4795f688e4f243e40c7474df00d329d9
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


