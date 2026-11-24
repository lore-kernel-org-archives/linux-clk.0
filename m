Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515158;
	b=bCzd203dXa2xmkCELrRAGNZmCLPhqOMhbhiu140VTW05hQkx8KhyJf9kvF96SZOHafUH
	 NLytjtXgeUlqVrx00uTfQxFdt513ZRN70n5xVFBIqLMMmJK0xYvk0SsbBFkwSB06ejjaG
	 2NPJBbZrSY9Vc0v9jnLaboFdGHF3bExYqC6QINZatMozsPt6r/74LWFOId6OEkfGvktVi
	 U/iX5ZX1axal690Ho5t5QLnkDYb/WsDCEPpgWMp9NoHdF0gJlWGDZRH4ZFlHLYAaxvkCL
	 YWTx9oYHE6wISGXkRsaKU5b6IDqVJ7DQHu/APcqLArf+rKUBRU4/GmNMs8xQegrwpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515158;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7H+pbZMTpK8J+vDkshjQslwpLaNlZ2yJEtgHYNK0gzw=;
	b=0CpUENnLBxuQYob8RxrU3OmrSwSE9MRq9A8AcEl5HQrljTwfpfrP/4ONnisWNBSJTXcO
	 XJ1uCthWTLPNuOjZvHL2jxi1XQRbWEHQftFHSzEvOYAoO7mDps3e77WJ0+WRFWsNCL+5l
	 TdE/8ddbm+mnEnL1klsLPc7LKDgYoGSLr0IVNUr/jMSfA1T+l9PxQ+w5sWacJgyezor/h
	 I+XHBTu03ybKNYIngzYW3V9+XBYNTXD24b9Xw8bWWct/fhVv0moc0FAjMBEUrXJmx0nIc
	 gk9it95XVvQY+k/pbP6Q4FixMNUMNQJ7qkPW81HRED1JkeqkMJC0uaEe9iSwzmY6eKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EAD60A261E;
	Tue, 24 Nov 2026 10:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07EAD60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVh-007edJ-3C;
	Tue, 24 Nov 2026 11:12:26 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 0/6] clk: en7523: add support for Airoha AN7589
Date: Tue, 24 Nov 2026 11:12:14 +0100
Message-Id: <20261124101220.3888170-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7589 SCU is the EN7581 one with wider mux fields, new
base rate tables, new clocks and a third reset bank. This series adds
its clocks and resets to the en7523 driver.

Patch 1 adds the compatible of the AN7589 chip SCU. Patch 2 adds the
binding of the clock controller, the clock IDs and the reset header.
Patch 3 lets a SoC have fewer clock descriptors than clock IDs, which
the AN7589 needs because it has no GSW clock. Patch 4 adds the AN7589
clocks and resets.

Patches 5 and 6 are for the MDIO controllers, which live in the SCU
register space and are children of the clock controller node. Patch 5
allows the child nodes in the binding and patch 6 creates their
devices. The AN7583 MDIO controllers use the same path.

The series depends on the series "clk: add support for Airoha AN7583
clock" v15 [1]. That series makes #phy-cells required for the AN7583.
The AN7589 provides no serdes PHY, so patch 2 moves this requirement
into a rule for the AN7583 alone.

[1] https://lore.kernel.org/r/20261121212738.170775-1-ansuelsmth@gmail.com

John Crispin (6):
  dt-bindings: arm: airoha: add AN7589 chip SCU
  dt-bindings: clock: airoha: add AN7589
  clk: en7523: decouple base clock count from clock ID count
  clk: en7523: add support for Airoha AN7589
  dt-bindings: clock: airoha: allow MDIO controllers under the SCU
  clk: en7523: populate SCU child devices

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |   1 +
 .../bindings/clock/airoha,en7523-scu.yaml     |  30 +-
 drivers/clk/clk-en7523.c                      | 335 +++++++++++++++++-
 include/dt-bindings/clock/en7523-clk.h        |   9 +
 .../dt-bindings/reset/airoha,an7589-reset.h   |  68 ++++
 5 files changed, 438 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7589-reset.h


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
prerequisite-patch-id: cb7f4047f6de36dd2c1eb612c407847cb48b3be7
prerequisite-patch-id: 94ab63d8aa9fd575c8addab53d7fe6ab6064a31d
prerequisite-patch-id: 6ef84d4bdb8a219a1a0677cfb372b229c3ef6c0a
prerequisite-patch-id: 463419d96297c209bff6ce0e587c470877e547d7
prerequisite-patch-id: cdf4f7496650724d242508706b4857ce4ca6d6ef
-- 
2.34.1

