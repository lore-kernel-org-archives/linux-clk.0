Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B01A95E;
	Sun, 27 Sep 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521152; cv=none; b=PIepxuScabwKHD2BWOWq2+N2ndLGpysJfKyGQArBQHaPBLbjqcBc5yor86MSJisTIuE7I8ZmJZrC2R8BQnTwh51/acyZy1ESGPfxU68mYqstdyhe1tK1qdtTAEWb8NMhr7CcntzEKuOlva51KGbH4OB7Zsdb55DUN8rhh10pKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521152; c=relaxed/simple;
	bh=YmGxEJFzXbTFWzE7ulh7aHe3IiKiro4uJZWRmXMUOd0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X1Huz6dPhZov7BHDjeguZTylxTPg2SKqHAnwPUXt2uFBxr7sUQq/nD++Vp0A6VHH9JFCiZQYDdlDTmm7nbDKQD/TpncMxacwGQrkg7Mmve8IsefJgL/j+/iGbOLm47i0adpfdDzjocOHRzThy6BoQGuf+5BbvyDUh3som1CyF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8YsWMcz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8YsWMcz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3F1AC2BCB3;
	Sun, 27 Sep 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790521151;
	bh=YmGxEJFzXbTFWzE7ulh7aHe3IiKiro4uJZWRmXMUOd0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=E8YsWMczeUFp/Ps4S1C35qOItIhMEQTogovptCnGpBA6Sr4GeuzG0hJraEZvjTUGs
	 Hl4kqdt6pLem2wdOmwG2krvftXJe6z+fz8fvQ3BPaK9cCw0LX0vZTfFxyr0qoEgErt
	 eAbi4OYCzDM0oQLH0hH62l3v1bwXj1iGPDlWJKgIhVs56iPq0NpUtipglxkUTYwjO0
	 B3/gwKWqhYpCCPmpV5rVeB2+ZTkMxI+nB0EXyGiU8o9MLpK8LUFrowhMesLHCIqw+z
	 92sdN3tMYDSP2a/N19QFg3M4qrzqBSXUCD+fwv+9UAuqc69XieSP1aCfIOPwjte2sI
	 8GjcQ1zmH0yFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F570C98332;
	Sun, 27 Sep 2026 14:59:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v8 0/2] A proposal to add a gpio-locked clock driver.
Date: Sun, 27 Sep 2026 14:59:06 +0000
Message-Id: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADovuWoC/43PTU7DMBAF4KtUXmNkj/9ZcQ/EYjx2WqvQIKeJQ
 FXujtNNQIkQyzfSfG/mxoZcSx7Y0+HGap7KUPpLC/7hwOiEl2PmJbXMQIAVSnreZbyONXN66+n
 MjyPWxDsQCKRMDNawtvlRc1c+7+rLa8unMlz7+nUvmeQy/dubJBfcSuUoauF1dM+xjudcH6l/Z
 ws4wYoYKfYRWBACo41PRmmxQdSKtFv2EdUQIYlQIAqNZoPoFXFg9xHdkBzIR+UgOkkbxKxIkGY
 fMQ3RgNEkUmgRN4j9gYDbR+zyjnDBqyhVJtgg7h+Ia4hPSQZjfQr4G5nn+Rskt7IkVQIAAA==
X-Change-ID: 20260318-feature-clock-guard-f20a2c35b965
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790521150; l=3080;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=YmGxEJFzXbTFWzE7ulh7aHe3IiKiro4uJZWRmXMUOd0=;
 b=8jdU/HvfBCRhKNpwUXhkVNz2Z1Nq5LWDI9YNTvgw1uO3VoBeFZGUgSDoEveJs6yWg8gx7UyDs
 AL+9oQytxlyCn0qaJAbwor0IKt7aCDTTAUG0Tu+GSlovK2g4EbvyXaJ
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

A gpio-locked clock represents an input clock, which state is determined
by a GPIO signal. It's similar to a gated-fixed-clock, but GPIO direction
is inverted. Consumers can use the output clock to wait until all input
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
Changes in v8:
- Fix return value of clk_gpio_locked_prepare()
- Link to v7: https://lore.kernel.org/r/20260927-feature-clock-guard-v7-0-8dd19568d9a2@bruker.com

Changes in v7:
- Fix compatibility strings and schema errors.
- Update GPIO pin name
- Link to v6: https://lore.kernel.org/r/20260927-feature-clock-guard-v6-0-007983b13ec2@bruker.com

Changes in v6:
- Debug messages dropped.
- The new driver is now an extension of exising clk-gpio drivers.
- The controller doesn't enable the parent clock, the consumer is
  supposed to do that instead.
- Link to v5: https://lore.kernel.org/r/20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com

Changes in v5:
- Use existing DT binding with an additional property instead of adding
  a new one
- The driver is simplified in a way that it represents the actual HW
  desgin without additional unrelated constructs
- Aggregation is removed, now it's one clock input, one clock output
- Link to v4: https://lore.kernel.org/r/20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com

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
      dt-bindings: clock: gpio-gate-clock: Add a new compatible string
      clk: Add gpio-locked clock driver

 .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 +++++++++++++-
 drivers/clk/clk-gpio.c                             | 50 ++++++++++++++++++++--
 2 files changed, 77 insertions(+), 5 deletions(-)
---
base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


