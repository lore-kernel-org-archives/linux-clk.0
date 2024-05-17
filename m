Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206CA59;
	Fri, 17 May 2024 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715948923; cv=none; b=d+qka1DPnrtfTuQIXRdFR/zTr6vW3T6QcVCSYrvIJRIZvCPw1Lp0K00Fv9o656v1TPWBG86N7cLv72syuqyNfBbHoszceHnemurs6r5OnVjwXsGdeP7wBLwMRNt10EZ0UQxNCg7FvQ3PVuM+1EhXsPKY471eKlGJ0u1u0jAiM6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715948923; c=relaxed/simple;
	bh=y3Gb44W3J7FEgywcpOeoYATqmV1WeXnpeudzxnsZYII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NHl46pamk9x7M0981pZXYkAhA8beUWMGjNGBWICux/tvVGnm0+8cvl3A1fln0vTDy2yQFMMFyvwos9UiWrQAQLbWrUB52NRAgr0uJj+WXQuMramXKy1JMRSwpH9O18RcAEZlmDK+P6BTfZ8/oyfmuyDsopU5lDTqKLjLQOGKLHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnTtY7JT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnTtY7JT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8513EC2BD10;
	Fri, 17 May 2024 12:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715948923;
	bh=y3Gb44W3J7FEgywcpOeoYATqmV1WeXnpeudzxnsZYII=;
	h=From:To:Cc:Subject:Date:From;
	b=jnTtY7JTSRTmYBpHYNGdIwgceqJyVJhp+6iWtdecMqIE8Hn157UlgvgjE5Evrme6X
	 0Qqk+Ul7A8Kfroco437tAPkH8S9Wnzo1pg683hK8U27AA0C4aVR9FIEgdK9f8x8Jcp
	 8q31TA/DSFY0kXSDqckuHk/ZXywSQdCF03VCXi16LD4Kh2NPFim8KobC6SAj8VZgrg
	 R0ARKPQC0IWrrUTLRh9yIaqsoExoA3hR8U+xoKw6BSYfixolVKYLS4Yt7yPl+BMju6
	 fELOecReSShtLx+XFmhWAd3J/ddh8gNk4olvuQfXJc2un7gJvnqbah7g12GmDCdI7U
	 dToecvNpzJfJg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 0/4] Add reset support to EN7581 clk driver
Date: Fri, 17 May 2024 14:28:10 +0200
Message-ID: <cover.1715948628.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset-controller support to the Airoha EN7581 clock module.

Changes since v1:
- squash patch 1/5 and 2/5
- introduce reset line mapping in order to take into account possible holes in
  reset definitions
- fix error path in en7523_clk_probe()

Lorenzo Bianconi (4):
  dt-bindings: clock: airoha: Add reset support to EN7581 clock binding
  arm64: dts: airoha: Add reset-controller support to EN7581 clock node
  clk: en7523: Add reset-controller support for EN7581 SoC
  clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC

 .../bindings/clock/airoha,en7523-scu.yaml     |  21 ++
 arch/arm64/boot/dts/airoha/en7581.dtsi        |   2 +
 drivers/clk/clk-en7523.c                      | 230 ++++++++++++++----
 .../dt-bindings/reset/airoha,en7581-reset.h   |  66 +++++
 4 files changed, 278 insertions(+), 41 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h

-- 
2.45.0

