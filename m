Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F71F4631;
	Wed,  3 Jun 2026 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489075; cv=none; b=FwcmM2v0KxGtP+bGix7mwZMpeM/Ca0PEWhxduxGGhJ9R4L/OBNBqAN+FZdhV1Ras3d3vH9ET5k7p/PkHoDqfBTKcPlL9d/dsR4W4P9Qy8ww2QA25/pW6AfryMGmOUdWvG7kWMUpogbdAOvhPDAUS1Dz25esf3UG8YIVp7coiDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489075; c=relaxed/simple;
	bh=3b8ojS+wH3roAMNHRcDrF0wXOLt4aC7rq6QhspbwGeA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jRkzGF6gxldyQ6HeoHYv99Rmib/bOvvZCGhecm79otieZ/4Kq3c435ZlYxqs9tgDgFCaMnh51HaoReia2cKcoe9jdRLbIIIX+wWmb6gqRDqao0/Ngd5pWSvEB2SruqKlw/fDzy7q2HDDdo1GrEkuvBgxZ6Kjm7Ki2Fkl1txibrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3q7tFjP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3q7tFjP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E24FC2BCC4;
	Wed,  3 Jun 2026 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780489075;
	bh=3b8ojS+wH3roAMNHRcDrF0wXOLt4aC7rq6QhspbwGeA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=b3q7tFjP0DPfgMaZXA4I59zMm2oI+NgqnoVZqn0fqjEu9ip7iTWIyuV3l8BAr0yqi
	 NHVKg2Ka0lD0SWBdRK4lVl2juTpxdL3jBP87m7eGqYwGO/pz9m+CQURHvr1F7T2GHn
	 0ajoAICm8rTwPDV/XMpjTnDkZOwOpuDB5dKmTZLvkX7/OFVKcjEPYL0+gYbBkJ0wzv
	 k2v1Zy0uKxLk5GiArSn4MmS6hpbic2uaKW0U3u1aZ8wMCuy/mY9ODfatBNutjfdjNq
	 3rWo24pso3l02WE1xK76c/oAdPQ4k+7rlrOZx/+JIRmqCPeZfSx1X7SAam+Eu+fNta
	 UKlf+q25KxL4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71438CD6E4A;
	Wed,  3 Jun 2026 12:17:55 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] clk: amlogic: Add A9 AO clock controller
Date: Wed, 03 Jun 2026 20:17:51 +0800
Message-Id: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG8bIGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNj3UTL+MT85Jxs3aSkNFNjw6TElGQzYyWg8oKi1LTMCrBR0bG1tQB
 R02h7WgAAAA==
X-Change-ID: 20260603-a9_aoclk-bbf531badc63
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780489074; l=1192;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=3b8ojS+wH3roAMNHRcDrF0wXOLt4aC7rq6QhspbwGeA=;
 b=ssW7h1gUuATez6aWv+fBCRGzJntpeuLBQ4A8Vrptr7WNRt9/TrgwUOWc2LEco4uYitv/MDWiX
 KpgiwDA5gRBAqTptP6F69TKi1eT8yDuGO/BaNym0agsgG+nAx6cSItU
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Split the A9 clock driver and send the AO clock separately.
- Rename aobus to soc
- Use CLK_HW_INIT_FW_NAME to describe clk_init_data
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data
- Use a9_ao prefix for MESON_COMP_SEL
- Correct duandiv name
- Fix pwm b reg
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
 drivers/clk/meson/Kconfig                          |  13 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/a9-aoclk.c                       | 419 +++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
 5 files changed, 585 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_aoclk-bbf531badc63

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


