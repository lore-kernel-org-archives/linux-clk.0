Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795267753;
	b=4X5bB8U+6w8F9TswbernK0qfpQqEov5G+bazBtD9kChTjsvSDfKuUZDHj9FuHyIMcYcj
	 F4i85CpkEAuqSL5RgeiidByd0h2EGfYsZKUmsoU0lNypGuQnsp080sqC555/9jv8iGRe4
	 FBma0nLuMVILk3Sze/v+5KyCGNeay3ZT4cHvfgTEI977XqT7i32qoL+93nuv2K4pMTOBS
	 IrvoGjx5njFkb2fFYYRaU3kxGTsxOD/zFgs6IrSQfN8NdZAvYjJq2bSFLap3VS/zHyRkv
	 Bz42Jepth+tx+1cgvlGrH02yCGuOcUbnyFIMLgPQJLZHtJOkkZ8rorsvA5veYyLSRZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267753;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=0J0CEVE7qSNo1b4j4cKSy7W+GHzEnQ21QRzz9TujCcY=;
	b=XSpOyvtswkpD9ckv3NiLmfdMOVZH/k3R2NY43EpJpUVMCkRU60j72eJeSHh9gehApymZ
	 6VH+Bt29U0j0WXESmwXBTm28trvKt9QtSORy+1tdlPHYArkQVdUTFP+vo46+63svi4ES/
	 yllWocd5NTkE5ZROILn8PydiIybQOYCwOQdZXOiRyAgSNzTTz6yrzYqb0cA0Fa4rfHGtq
	 b1TprdFoj+SygLt3um8iuIKTbN/SjUHJNX0fxzH0j0hV/nH+0EIdxHOEORgbCpNduxHek
	 nnBgvHhVTLa3dPn1TFciRmWGM201fL62R13E1xT+LQ+SwMGWhZ9oO7UNGK1k05Y568A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaUTDi70;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBEA606A331;
	Sat, 21 Nov 2026 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RaUTDi70
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795267753;
	b=yagum/mOZc9Z/LeRUGpRY/OvcoKTQEwgNlukl6KblG3LCNZIf3BY3K+lKgzo+Ws9N8qe
	 rieWUhVPZvyneSpdKg5Utfct5NdBDe0QkHAV6s1ilyVJTPgg9WswUoIQfVI5OprzTp6h3
	 LbKtSTs2B3fUm+9enmS05z3tD84+barFeJEZgHDPX/tFJWOPcrkc34oV4FWZjuhQvOdsc
	 Kl6GZxi2exhkaVrQvQRcmD7CwaQQ5wdSqzqi+eLOfAOwKW1KCYY5lOInzVhy8Bw1Goqav
	 n7JuEbNocy02ho4cenCJ3gGGU+syzU1uPomHQMwqLZ2BwKgnNJRChpxJZ9sqP28cnRQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795267753;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=0J0CEVE7qSNo1b4j4cKSy7W+GHzEnQ21QRzz9TujCcY=;
	b=hHPJyhkKNAGmbFkIfEj0AAB8fSG+ld7v29tCgkCHvyMTcKwQJuWuNtbgY/QqUMZyN3xC
	 u/LXvzJH9kqeil58Sz5T1OKMUZFDFWS9ZIQuiY+ZYRePnV2eGY6u/pt+zsYAY1VHjEjnd
	 yQXq9NJ+c8dRfjhaAad7UPeI9KVNujD37aEa9JuJpNOWgMrf7OPTxy1KttmNYE4Q+Rc5/
	 1vHtlJYrrgM/tsKpm/glAqrfYZU9BmCRD1kTcTMGhvYJ7TttKgTbvTqr1ljtQ8F+bvyQm
	 Hzl0igY9WW3vdvvOmqBakK92JtwIrDGIn1jJqnA+kWPe3B+k/ZrMNNmILOln024Efxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98E971F000CA;
	Sat, 21 Nov 2026 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267753;
	bh=0J0CEVE7qSNo1b4j4cKSy7W+GHzEnQ21QRzz9TujCcY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RaUTDi70mP/j0h+GcZQTNolP7lzIm5UbU98gjvGBDYSuEPOdkZ95UTNPfq90JfyJW
	 nMcTwwZvA7NnqZtS5GNbzp3gnF4S3kcRGmDIfPxlifCiaICDMHh5Tu9WtWqRyfWRPW
	 kDteKsdjTp+vVfb/yy503tb3vQWYzpkw15S6fz2Cwct67BQMp1ckxDaoSgAFoxtBra
	 OmHDBkfn0AMBTD/ug1/w+E+agpNm8CFowyCLn9AU3nXdbP62KjRIMY0Bpx87QZWYIU
	 XoWrjMmRf504+P72HgOPWkdLKeke0lEhDplWsnYNzloB70t0x/smfYUsDUfBn7j2gd
	 xNcbGy8hftaVQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E9E1F4BC85;
	Sat, 21 Nov 2026 13:29:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v11 0/2] A proposal to add a gpio-enabled clock driver.
Date: Sat, 21 Nov 2026 13:29:09 +0000
Message-Id: <20261121-feature-clock-guard-v11-0-00c633a667a2@bruker.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWcAWsC/43SzU7DMAwA4FeZeibIzn848R6Ig+NkWzVYUbpNo
 GnvTroDBaVDO9qSv/gn527Mpc9j97Q6dyWf+rEf9jVAfFh1vKX9Jos+1UQnQVpQ6MU60+FYsuC
 3gXdic6SSxFoCSVYmBmu6WvlR8rr/vLIvrzXe9uNhKF/XV044Zf/3TihAWFSOowavo3uO5bjL5
 ZGH924CT3JGDMIyIieEpdHGJ6M0NIiakdrLMqIqAshMQASaTIPoGXHSLiO6Ijmwj8rJ6JAbxMx
 IQLOMmIpoSdEkVmSJGsT+QqRbRuw0DrjgVUSVWTaIuwNxFfEpYTDWp0At4u9A/HQdBUH5rEASN
 kj4QRBu7SRUhJHBkA5TKw2CMCso8cZvqzsRJmkdnAox+r/3uVwu32F2WYAnAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795267751; l=3876;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=00ntbknJXnTsl7yhYWwA7NDIZsMtHtyHroivAhPDrTI=;
 b=3/7fmnNerO/5AoHCD4+EZUdT4lCmD88dnB/Ck6mmF4nmN62r0cgfjgnbUYXBQ0gClt2RckaCT
 yPn/tA1zZTGAbtr8FLyRfQQV/lK4jl1Sy5zSagyQQNVlpyPhmDrSQGy
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
Changes in v11:
- Address sashiko feedback
- Link to v10: https://lore.kernel.org/r/20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com

Changes in v10:
- Use only sleep capable ops
- Make commit messages more generic
- Improve error handling for clock_prepare
- Link to v9: https://lore.kernel.org/r/20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com

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
      dt-bindings: clock: Add gpio-enabled-clock
      clk: gpio: Add driver for GPIO-signalled clocks

 .../bindings/clock/gpio-enabled-clock.yaml         |  55 +++++++++++
 drivers/clk/clk-gpio.c                             | 107 +++++++++++++++++++++
 2 files changed, 162 insertions(+)
---
base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
change-id: 20260318-feature-clock-guard-f20a2c35b965

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


