Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13BC347FCD;
	Sun, 27 Sep 2026 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516074; cv=none; b=vF4NdygDs8fXWtSfE+6rPlAews6D2APJ+6t1ph2NpoJYyfJeysn18lpuQdLNFcaTdNTdrsjGkWN3Ru2wWwQy2EvDtcbW6X50w8ubJdUaKzQhtJ4Hw5B6FweEMgmqJhX5BiyquU+qBMS6Px7W/6QeP6BT86blcuFd7SfAfEoKD7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516074; c=relaxed/simple;
	bh=sn5chmuPwtIXwrbs8pNP2cmuS0jdkGjdtgKSe76bkEI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CVYu7hOz5gXcAHv8CIVx22V9mMh1gd8Ux8hqWRUArJ0BdTsPbnrvyuJfzCoPWLCXxq86svWPGTa8Ui/8ogcaW39ee9yOdZyoPYiEIHjr2sD1wGVMWZlvTmpPKtcn9fw8VA9IlAmxQVDxRy3cllCZkeBD5j2yeBsEMYyczvhybM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iWM9/nBl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWM9/nBl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46A8FC2BCB3;
	Sun, 27 Sep 2026 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790516074;
	bh=sn5chmuPwtIXwrbs8pNP2cmuS0jdkGjdtgKSe76bkEI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iWM9/nBlsYLP6EKbLTO7lMIuv2AS00HEMCBuA6rYHMQKCCCHF/6rMjHtgz5f+WtTu
	 2RpfbIXya/upaN0G5HYdJBG89x7t/C6pd0dIZi3VKC+Y08I3+dwa61n5/g+RJzhtf5
	 uttZmFTdxfdMqr4NpUs3g+9eZQ35nvVR9Ww1cXh0tbi5xwY9d79m0kzTdmitiTPsBW
	 Yzw5gAfJEQ4OqB5EVP38GYF5DbEflSN0bT/G2apZOx3+zIEEKuDviasnV5pAtER0Tr
	 DyH317HHgaOkyaySpRXEWoj0j/dSPnzEMt1/uouX4+BTj9Zj23ixqndAw+6EXMPWgP
	 WtcsH83b2VHHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D54AC98332;
	Sun, 27 Sep 2026 13:34:34 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v6 0/2] A proposal to add a gpio-locked clock driver.
Date: Sun, 27 Sep 2026 13:34:09 +0000
Message-Id: <20260927-feature-clock-guard-v6-0-007983b13ec2@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIbuWoC/33OwW6DMAyA4Vepcl4mx4kD7LT3mHpwTGijbmUKB
 XWqePeFXtAE2vG35M9+qCHmFAf1dnioHKc0pP5awr8clJz5eoo6taUVAnqwptZd5NuYo5bPXi7
 6NHJudYfAKJZC40mVze8cu3R/qh/H0uc03Pr88zwymWX6vzcZDdobW0lwULtQvYc8XmJ+lf5LL
 eCEK0IG9hFcEEFyVLdkHWwQuyLll33EFgSMCAMzOKYN4lakQr+PuILERupgKwyVkQ1CK9IY2ke
 oIA45UCuWPfMfZJ7nX3Uw7hbLAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790516073; l=2727;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=sn5chmuPwtIXwrbs8pNP2cmuS0jdkGjdtgKSe76bkEI=;
 b=drG3NjrEeb74mSepUCo/HUMLxRSEaf5XDDY8x80zRZwiuwC3IQpgSt8sIgCzYh/4c7yJ0sGXu
 +O7LLIu/ld0B3y52iFwib0Db9JrhDz9xu0zFXGqbwcVhBYPhqrdQHHC
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

 .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 +++++++++++++++-
 drivers/clk/clk-gpio.c                             | 44 ++++++++++++++++++++--
 2 files changed, 71 insertions(+), 5 deletions(-)
---
base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


