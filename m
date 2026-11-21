Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795266973;
	b=kX/txf9FhzjA2kZYblF16KaVUGsnZb0Lncj3pXhhTKyDC0UFGkWW+RtdT7q9qPHb74sG
	 zx38ok6kxHWXT5Q9jcBpJ2MULwj4bortaMx6BNeSl039YDhNjFDsxYOkzPZpf6FTLk3GR
	 xycQTiudGcpv6wd2flaHB18zXMDGuuoZW3pyrtarWx8O+cXCxPhHCSFfSSm14CnObkWjE
	 f3IEqg0mOQkwHHjLR3siHuu1i5befqaAFUXIYp0x6TB8Rlp58YtF3mcosqiveZ27PPEML
	 HtJb1l2wBZTj6JdAtlxp032VZNyf/46wrL6NQtYs+NXmGp4sHIfIzMXgnDqjhI4aNnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266973;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jBtEkPNRck7QDwTZxqVQd7rLlwS/IspEELx+l2l31MI=;
	b=VweqoZI6XU0P+vn9tXm36ewfTQ8iVMfIdwQueA9dpoICNZvxyLXDf1US/4rYT7tOefwr
	 h+n6pmv6lYCDNUfuyzYQh9G6PHQ5UINaLQOEvtal6jz3Ykkm6UvrrJgjyv60nzl2lYelm
	 00K1EK5TTAHPIKZQh8GK/ytZ5wgJFhEFChA8QU4U28JbuGEuXfVVSmjjLuIrNdreJ0pK+
	 W4J46vnBOdLwg0Q7052k72+O7IgiYaBWDNewzGD5OdWikQ0QuVJpwjGb02ibqgpm8W8qA
	 /ng2fQ2ik0NdvjVXyreoaEB+HtQhojHey5+BEf6mRpbFb/ET8fCZPIAPmPCv/SOMgHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qxqy6ekK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E05606A330;
	Sat, 21 Nov 2026 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qxqy6ekK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795266973;
	b=LW0Y9W/UxtGrXtF9/P+KLARsL+kf9XDm1QPMr23IX3flzUVt9wa5Q8dbESBDQPA5DpyR
	 Cz8HwW729Ja0w2A9YtGdlj+Mf9SdfSeHx4StOS2go9ftQFgNtO2UGO2noQPl/m1WvfuTf
	 NdWIK//bo66rJ8BxWhZ34jwF3ypLqv0dAsBHiYBOSJyC9TOhLy4Vtfpi0Gk6Aqfjubn2k
	 97jhHOHMvAL8YJmsv5l/ItPVplM4xXSglyGEZ/SNhTRcKtnu/C/n5kq3Js6IQ5UApvPTa
	 FVuKM3CTcv7WF2KGEuPLCTGpdOvEC9a6kgVglidTpxZXEgSbpBBNxfUW12NtWfFVV7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795266973;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jBtEkPNRck7QDwTZxqVQd7rLlwS/IspEELx+l2l31MI=;
	b=DZNn7NtBZtoQ9gw2MbuMelqmt7oyhKY6E5xcbIWSmxqm3UDRin+4u32VJ9FHx/+XOADj
	 nQPycmNVZ7Hak5/n8ZsL5z7HyiQlxhG50N5iZUJo1XoWdCOa4tRcGFD1o6ilbJmrkP2yy
	 6T6BDRKL7Nu0X8kv993G+McA0XEPrv2aFwWI72j19e8XOCe/opuGuXV+s7b2u4KUampXL
	 gKeCl65skb4PtlL9HoLBeqqSt5zgI2kGjojvituJPR0wij82oPPbWZqekvBfjX4tTsuYN
	 wGeKbx0X4precGEpXsZNVC0J2lDGFxtucutOLwciqlLoGJF7WLMG0JsKsPBVv+L7wCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CF811F000C0;
	Sat, 21 Nov 2026 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795266972;
	bh=jBtEkPNRck7QDwTZxqVQd7rLlwS/IspEELx+l2l31MI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Qxqy6ekKOJi5s80BCeX6/kW3Hz3RwOs8cAcnli8xbiOUjiIZGxJEaiFMtHsvKdFif
	 9/z1BqiCfbgoeP00zUv/fC8ustIstHgZmiJBMIbKvWK7LDDT6JPtfq0ADmdwDE7Fli
	 R7auMMNFvrZE0e7JBFJPKvy0rIjuaqoWEh4SdwaGKsLtKDI5rP/Ufw1g6zi7xRYkg0
	 xpK8Ryw61uNyQ39b68GV+IvpwkJG6N69yGKaa76y4yFFI5/iQKqcl8ETTcFAXMCVjN
	 hqn7r3qR6DygBcOIIdWhIv6ZB1DnC7Z4EhPcr4dSfc0/D9wbb8585KCH018eBIBN+A
	 5DLHZBHjoryGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A008D4BC77;
	Sat, 21 Nov 2026 13:16:11 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v10 0/2] A proposal to add a gpio-enabled clock driver.
Date: Sat, 21 Nov 2026 13:16:07 +0000
Message-Id: <20261121-feature-clock-guard-v10-0-5d449739bb8c@bruker.com>
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
X-B4-Tracking: v=1; b=H4sIAJeZAWsC/43RzU7DMAwA4FdBORNk5z+ceA/EwXGzrRqsKN0q0
 LR3J92BglLQjrbkz39nMebS51E83p1FyVM/9sOhBgj3d4J3dNhm2Xc1IRQoBxqD3GQ6nkqW/Dr
 wXm5PVDq5UUCKtU3RWVEr30ve9B9X9vmlxrt+PA7l89plwjn7vzehBOlQe04Ggkn+KZXTPpcHH
 t7EDE5qQSzCOqJmhJU1NnRWG2gQvSB1lnVEVwSQmYAIDNkGMQvilVtHTEVy5JC0V8kjN4hdkIh
 2HbEVMYqS7ViTI2oQ9wNRfh1x8zrgY9AJdWbVIP4GxFckdB1G60IXqUXCDUiYv6Mh6pA1KMIGi
 d8Iwl83iRVhZLBk4jzKL+RyuXwBvYdRROACAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795266970; l=3728;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=WSW5wx/mSC8oXiBVGrOyu6PgJaHE0ySq4NfVc7Wh0q8=;
 b=SPtE3G/TBzqpzeunjO8RxfFjyPgp0QqlPRA01/7/K0JN4o6AAldTo0YDCtVG+AeJCoy5mFGg4
 96XQH9BzrYfBZXHynM9AbzniAw3TR3wikdUBXMGRdpBlnchcqe+LNVE
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


