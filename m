Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE337188B;
	Wed,  3 Jun 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488244; cv=none; b=NbFwGO7aeHC71sj079c8ywiPWAkSoqu68DMQvaKZfZ/DDRpecQkzC0E9FuRSwRWj3fIUSRo+zDh4aBi0xsO15tITW3wAj1R9xKgq20V0sVjPpayznQ7HAuLfGSgVHNJgG7RThvII/NUEDl+eWxa2EWDFAkT+k44g2HxuSUPiRW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488244; c=relaxed/simple;
	bh=JkDzMQd2L4L6r0Yr9fg6b/1lXleiCN8jZ/P5N4eWY4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DMIRM+wiDvtmsWalGH0uSr7XT4hw+79SzkrV9i7TjSS2BZXwsYitOP78k1a3lkecpw9FhefSe6qXYf2jvcbnZ+C4/AQ78Z8UcxHl6m/1EzPGUHUil2SHVOyFt3jY3CI22jx5G04TETLqmRtYwd84CVoTKKW7zEIIHSxvz2GkUPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odbLhLXl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odbLhLXl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E2D7C2BCC4;
	Wed,  3 Jun 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780488244;
	bh=JkDzMQd2L4L6r0Yr9fg6b/1lXleiCN8jZ/P5N4eWY4I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=odbLhLXlpLtSuhUtJ9DKV+ldHHwJAbutDD0pK4WJTlMzx/LY5wEKpGSmXrg1qrlVc
	 8MIXLRgimKC62P2XdV/VbHhavnQUpBJdvLQsH7xZ1f/cDoiBQmPRrkOZROPh+LwzuP
	 T0d/PjVk8ZT16iiNlzYmwgVZ4ISKvufWHVaDwwD4aDbdUQJPwgy2fjqToxgqPU/BIK
	 BMPUE4jZvopaTLo2F3nOOo/3AIfuX29yjpE31utnsFtHMC/fB6NHS7KDaEEoft1BN4
	 bUM4L4+tIzYMU151B8SB4wig4MYS6DM0AUAhuIixXa/3qeKQm6EsjpWKUlc8Ft+/T3
	 bxJg4DA1j4eSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2821CD6E56;
	Wed,  3 Jun 2026 12:04:03 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Wed, 03 Jun 2026 20:03:55 +0800
Message-Id: <20260603-a9_peripherals-v2-0-ee1b8c0a1e6c@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACsYIGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNj3UTL+AKgloKM1KLEnGJdEyNDk1RzS3MD05RkJaCmgqLUtMwKsIH
 RsbW1AFtuaQ9gAAAA
X-Change-ID: 20260603-a9_peripherals-4214e79705dc
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780488242; l=1319;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=JkDzMQd2L4L6r0Yr9fg6b/1lXleiCN8jZ/P5N4eWY4I=;
 b=2JsWtytZuobV0Qw7gQcvTiZipvvm8BxQ3CILqhIjANBz/nZlWHk/xmAvem9fl9NgLWkkR6afE
 2kBATLbGq//C7SIfDiCVJ8u+nqhQSKOYN8Ft7jW7WhUXbJFOFsHccgg
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

This series adds Amlogic A9 peripherals clock support,
including dt-binding and peripherals clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Split the A9 clock driver and send the peripherals clock separately.
- Add COMPILE_TEST in Kconfig
- Drop the 'optional'
- Rename apb4 to soc
- Sort the header file
- Rename hifi to hifi0
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data
- Use CLK_HW_INIT_HW to describe clk_init_data
- Use CLK_HW_INIT_PARENTS_HW to describe clk_init_data
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

 .../clock/amlogic,a9-peripherals-clkc.yaml         |  160 ++
 drivers/clk/meson/Kconfig                          |   15 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/a9-peripherals.c                 | 1927 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 ++++
 5 files changed, 2455 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


