Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A86B4F30C1;
	Thu, 15 Oct 2026 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074174; cv=none; b=kjc2FcDzoLAqnTEffCGa7v7Bjdp2Gnlj+ugHe32Dva8Wn4jnWp9UWK1zhvMG9PVwiJV1O1ozrPWUaPrIcPPoZPszSvRyPqgtuUQeXNEcTMmNU76E5SMODmwMt/bkIuVRqFzHgFERdZi49a42ZfCxobDt0MOYlf18ySFoRBl8TLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074174; c=relaxed/simple;
	bh=U0moA7hG8cZFQMuoS6kww9Ed1c45Em2nKl7I+kC/DQc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KaKqnUK8FTDlQLVRO3tdtshU5PDAEsia6bB3rEWw3bwkGLQTAqKOvdb0uOw1Bdw8ZmGhNRyZisDdmrwozYRk9bgp2K/RYJzML2+DHy8FGTO/X8D6rwEYrGFxjkysjMzPptmowSb+SkuEWUXc0s6JxG1GHm3p/4g8tQaETVb/QlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srkYXxSC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srkYXxSC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EF82FC2BCC7;
	Thu, 15 Oct 2026 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792074174;
	bh=U0moA7hG8cZFQMuoS6kww9Ed1c45Em2nKl7I+kC/DQc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=srkYXxSCkQ8MIt+0+1udUBYoWTh5TBpG3OofDpBJpU7DDf4FrHK/F8ie937Wam0No
	 Q4bwi79OnkahY1HEVpN4IasKfq/7FJpD9eUlyZnd0v8Jq7KR1fcud+c9cBkjQtUnlr
	 pzoZ8EDeH1qwor7QmteidpIj4XZTtIKy0xRmy82UMD0mPl21mMogySgbEFt18gqyVO
	 /5+vDcHMdn9QsjmFepddFw7Rz2xg+Zy5Lc2DNMG+LuJPpKJlst7RJgwp9lM+XpRw6M
	 +l7FExXN/Qc7q8v9HXskGi92QeMxhlgRHAZf1ktg0lIYa6YCtnhiyGA3tz480WeUja
	 G0oBD7nb+jHrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBFECC6B33;
	Thu, 15 Oct 2026 14:22:53 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v9 0/2] A proposal to add a gpio-enabled clock driver.
Date: Thu, 15 Oct 2026 14:22:49 +0000
Message-Id: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrh0GoC/43RzU7DMAwH8FeZcibIcb534j0QB8fJtmqwonSrQ
 NPenXSXglqhHf+W/LMtX8VQalcGsd1cRS1jN3T9qYX4tBF8oNO+yC63LBDQgVZB7gqdL7VIfu/
 5KPcXqlnuEAhZ2xSdFa3zs5Zd93VXX99aPnTDua/f9yGjmqr/e6OSIJ3SnpOBYJJ/SfVyLPWZ+
 w8xgSPOiFWwjuCEMFpjQ7bawALRM9J2WUd0Q0AxExCBIbtAzIx4dOuIaUiJHJL2mLziBWJnJCq
 7jtiGGKRkM2tyRAvE/ULQryNuOgd8DDopXRgXiH8A8Q0JOatoXciRlkh4AAnTdzREHYoGJPUHu
 d1uP0YK9K+aAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792074172; l=3490;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=U0moA7hG8cZFQMuoS6kww9Ed1c45Em2nKl7I+kC/DQc=;
 b=+tp+9bGYxNzSkl6RzAruP7+oILQQQasT8aKHZNYCHQI/XL5K4pHrnP/udqFIsCtkyn1pkacQ6
 +V8n30+3TtJCmcHrqc8OkhKYpJDowZNEr1jXkM3nJxwCvqsOOT4VjSS
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

A gpio-enabled clock represents an input clock, which state is determined
by a GPIO signal. It's similar to a gated-fixed-clock, but GPIO direction
is inverted. Consumers can use the output clock to wait until the clock
is ready and only then initialize / access dependent peripherals.

The usage example for such a driver is when peripherals depend on PLLs in
a FPGA, which can't be directly accessed by the CPU, but need a GPIO pin
to check whether clock is actually usable. E.g. some of the IPs might not
have a proper split between registers and IP core, which means that if an
external clock and/or PLL lock is missing and one tries to access the 
registers, the response never comes, thus the CPU stalls.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Changes in v9:
- Changed wordking from "locked" to "enabled" to be more generic
- Use a separate DT schema file similar to other clock drivers
- Add a timeout for polling in enable()/prepare()
- Depending on whether GPIO can sleep or not use prepare() or enable()
  set of ops respectively.
- Decouple the implementation from exisiting drivers
- Link to v8: https://lore.kernel.org/r/20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com

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
      dt-bindings: gpio-enabled-clock: Add a new binding
      clk: Add gpio-enabled clock driver

 .../bindings/clock/gpio-enabled-clock.yaml         |  53 +++++++
 drivers/clk/clk-gpio.c                             | 161 +++++++++++++++++++++
 2 files changed, 214 insertions(+)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


