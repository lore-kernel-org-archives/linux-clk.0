Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8571A6805;
	Wed,  3 Jun 2026 11:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780485408; cv=none; b=QrmMPvmIeI3fMeKfdw9Yy97Qf2Nmn7Vn1jigShJjeD0ZnULaW1DE/0IKN3D4MJz0ngBaRbSZzXQKZUpJu5Ae80jG4o0oIIpKEv1fkjscLDGV2hJyV+EUJbos+TVaqPaqxczZvx6X2BR3U7tCrNzhDE6Us7SLeUbhVsVbos/4Jkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780485408; c=relaxed/simple;
	bh=alv/btNHkE/iL9Nc10ShLGdYuZdIxYG7w5LN9JYVz5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F1CzpIQCZiV/qiFtENVCcVWfKuR9RV6EXSerVlEiP41MQJECMeX3CpZRy7zcO5hbhg+Ggl2bDKR9/JgHtE1jOg9ZSTQ66SZu76N4b2n73MIabwarD6zO4ZNDAXfPAmVuaFydrZP0rufH+/S+ayEYKteFwVaD+iNbhQjLKhMtkRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGHRcswq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGHRcswq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5209CC2BCC4;
	Wed,  3 Jun 2026 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780485408;
	bh=alv/btNHkE/iL9Nc10ShLGdYuZdIxYG7w5LN9JYVz5c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uGHRcswqMJGgJ7fXjyDSfnmXh9ft2Lt1/C1xuD21YWvHXoLQgENtBvNqrPQa3pCld
	 tLt77juBwtSzma2IxD0lXjvbA7M5saidfGqGJMYDwtPwJR5e/vizypUuef4sBwVYJl
	 lI04kqfVt6bZAD3N2jAGJyf5oN+wK6mEP+dgCjA4IziLBMyd41mRlSQCYfdGqw7v7j
	 ivVG+QAJS/guuIXlUoYTRObpe1cevV+UWKVixplgG0bVKtihBSdMJzNd39mSCQYy5k
	 9cA9AtAm3dGCDiM07YF2ZGg6K+C/4wXC2N2KEzH3KBv7qmFUSFYY5EueWPzLk7zTCH
	 KyBV86g9n9pFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365FDCD6E4A;
	Wed,  3 Jun 2026 11:16:48 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v3 0/2] A proposal to add a gpio-locked fixed clock driver.
Date: Wed, 03 Jun 2026 11:16:41 +0000
Message-Id: <20260603-feature-clock-guard-v3-0-01cca0aa04a5@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABkNIGoC/33NTQ6CMBCG4auYrq3pL6Ar72FctGWABqVmCo2Gc
 HcLG2NiXL5fMs/MJAJ6iOS0mwlC8tGHIYfc74jrzNAC9XVuIpgomOQVbcCMEwJ1t+B62k4Ga9o
 IZoST2h4LTfLlA6Hxz029XHN3Po4BX9uTxNf1v5c4ZbTgsnRWsUrZ8mxx6gEPLtzJCibxQTRnv
 xGxIk5opataS8W+kGVZ3j2A2LD8AAAA
X-Change-ID: 20260318-feature-clock-guard-f20a2c35b965
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780485407; l=1878;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=alv/btNHkE/iL9Nc10ShLGdYuZdIxYG7w5LN9JYVz5c=;
 b=SIsVHzquE8Ik497MkXzHhAun9GN3f5utMkU35Fj4sO5aiDlAgS+bGq5HXd9/kJ1RusmBAtcCx
 bR2yZvEqc4HBpZ9xWryz6UBvC3r8yZA3AJpGKr2FlfUvpvbna7B7CDH
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

 .../bindings/clock/gpio-locked-fixed-clock.yaml    |  70 +++++
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-gpio-locked.c                      | 306 +++++++++++++++++++++
 3 files changed, 377 insertions(+)
---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


