Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A781478E25;
	Tue, 15 Sep 2026 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464469; cv=none; b=EDUIz+dimms1zjOk1b4E7GyGYc0dAx/9uAmF7bNyJjF74X+d2GMJMVj8w0KgaNV+/ao0gs3WS2JzBLkcpsmL9RvW10NgYWeSSeRsHCSNheSF8eWtcsSxYRfj4pro66pHW1PAfgMCG8n1MhIJ6NlKuzb2CVV26SiVE3yzqWNsw1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464469; c=relaxed/simple;
	bh=pHHLU5mEhTrcsZXkgtfWaWrdA6AqMjp+/cG3jZ+76cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c5o8dirKFM2tEeUY+c0NGU146c/NGsxhwGDmXtASEdaVDsxGeBy8GGKpThdlS30HKXoimLOWZ04djWZ5r9bBp8/m27zgoIz/mddM+NrbkSxaibA82S2JtD+aP8hID3RuJBSlg0kDJcpU1smZreCcZyfoVqJ7VOmt8wAaIISbi18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKdDZnCp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKdDZnCp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAC30C2BCB8;
	Tue, 15 Sep 2026 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789464468;
	bh=pHHLU5mEhTrcsZXkgtfWaWrdA6AqMjp+/cG3jZ+76cM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MKdDZnCpfW4MTW0ilhNtfuZgyyafxinkK3j3XlfdUK1qi1n9lsiz1R9Sg0td4OZ5O
	 C43RbvI1FHmETt0Ow6qHOxwdBAEr+zwSgZv9cQaAa+sXhRCAs1FfCAeiyqHc8IBBW5
	 zDcu9y+pm4E0NiONOnfcA52C3e94H8m8vH1Nj/bLFGxnwiErECKXPkzONSEUesA3ej
	 97FdHLsGRGwuv40g1HBO4lnUEZ86RndzV4vMwVq6BPAMuUQsTRVdXSqld8pAow6oHi
	 t0mp71mW0UuOka5drVt/Z8iQj9xR3Q+4pPFcRY5LCeVCejKYcDLds++ok1Q+mFDYL4
	 Nzp4ner0u84GA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 866F6C88E75;
	Tue, 15 Sep 2026 09:27:48 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v5 0/2] A proposal to add a gpio-locked fixed clock driver.
Date: Tue, 15 Sep 2026 09:27:38 +0000
Message-Id: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIoPqWoC/33OzQrCMAzA8VeRnq2kabtOT76HeGizTIsfk84NR
 fbudl6GODz+A/klL9FyityKzeIlEvexjc01h10uBB399cAyVrkFAhagVSlr9vcusaRzQyd56Hy
 qZI3gkbQN68KKvHlLXMfHR93tcx9je2/S83OkV+P0v9crCbJQ2lEwUJrgtiF1J04rai5iBHucE
 KtgHsERIbTGlpXVBn4QPSH5l3lEZwQUkQfvwXj7g5gJcVjMIyYjvKYyaIfBKfpChmF4A+BtX06
 GAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789464467; l=2482;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=pHHLU5mEhTrcsZXkgtfWaWrdA6AqMjp+/cG3jZ+76cM=;
 b=V/uF4f5MjmuHdY7wLqc7A7A/h8M21hHv7OddW2uff3EnCqLHK/HtcjsaPRelROgCAKomQ7Otd
 83Tsh0nBuWcAqf25ZO4MnsL9C5OCVNEgb3X50qo4VX4IAM7oURwBeje
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

A gpio-locked fixed clock represents an input clock, which state is 
determined by a GPIO signal. It's similar to a gated-fixed-clock, but
GPIO direction is inverted. Consumers can use the output clock to wait
until all input clocks are locked and only then initialize / access
dependent peripherals.

The usage example for such a driver is when peripherals depend on PLLs in
a FPGA, which can't be directly accessed by the CPU, but need a GPIO pin
to check whether clock is actually usable. E.g. some of the IPs might not
have a proper split between registers and IP core, which means that if an
external clock and/or PLL lock is missing and one tries to access the 
registers, the response never comes, thus the CPU stalls.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
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
      clk: Add gpio-locked fixed clock driver

 .../devicetree/bindings/clock/gpio-gate-clock.yaml |  32 +++-
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-gpio-locked.c                      | 169 +++++++++++++++++++++
 3 files changed, 200 insertions(+), 2 deletions(-)
---
base-commit: 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


