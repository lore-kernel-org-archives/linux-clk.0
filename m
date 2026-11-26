Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795709484;
	b=BoghcB4tzNKRIAdQfFayFEYdFL9Bzfs6sLzk2OrNW4m6waC8hJgnAZkmSuOiBN0brCVI
	 vx8Vih33yV3sJIVbuV1Z4Rck4h4rhXwgzgXFiF0UJX2rDVZUx4xE+Ojn1Nt9lKlNk6sz0
	 Mtz3N7TcVkCU9SNKm/GLvBcIHqixxkH2rcRLIqDDQMVGpgpZwp6rgvKFImJVa3Dl+QkNd
	 8gA2okafC6amBZxmuHwqrtmeFUZKxOsSowJx+fZLJnw6C1xDC0J/2wf5LiX40ZFVhx4hc
	 qA56/cnStYxb144L+ZqCoe4KthKKPFjYt454znGSEmvApPyAX1gJvJG2hqiC4d3aTew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709484;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FGTA+x8ZDZt3VBrV+ZM1sVU1Se758NrPiWguyvIOfJw=;
	b=w26UNltlq4P0SNkCWFayzUh3lSHk5it/en8kSoTPQiFPc/KBiOsFr/sm0ywkNtDmoMtf
	 QeKBJ8BeI8x66pm3qno4T/nXoFPN+pAzRykzkdE1AIhQjgNMQTrubO4ebG1Owhvj11/1E
	 3Nlt6S26oKL4q9X/gBCdprujg7ZqaKDuP2J+U9RjfqWIxEt4yFG6oGLsyJutJQc2rmrg7
	 EMKghVZIZV/oyuvfJVQxIXi9FtnuddnjCgrjfkUjrJSlBXOu2eeW0lZlY0M3y6oLkNiN9
	 H3X9GhIhu1HKroN8SYwnYfiQf+PhQBoJCx5/5X8Nz0DV6kskrc+jAKPris8I32ulrzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJXzINEJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980F606A32E;
	Thu, 26 Nov 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EJXzINEJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795709483;
	b=3Igq7HoiBhyHCEmX6cZRHqBFln876MrIgxS5hODa8bjn2avD6JK9E7ui6OMK6cuBvZ2s
	 JQxQpaSFwzEN6I5zrJGJJe8h2lQ+Ahx2z2Mn/LbCRDnMc/35RI2fGATigSBaoQUe5M1ww
	 g0yMTyOyjvyCfl7vAPIzLZ1+h8/n1AnCkQA9QcJyswmJ8GS4y5++J/dIadesh3u4Qw9SW
	 RsGQ5/wWn7m+T7vzhPrHP49Uo8hAl3AK+vvGT4ACIJeUs8CsntW8PO8/+kxOxB7r/jsmk
	 Eo3Q18v+0TO5E1USh/URZe0HptkIUWvFh2bool/di6hX/m3r8Wk8n88DrDqXCr2OLoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795709483;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FGTA+x8ZDZt3VBrV+ZM1sVU1Se758NrPiWguyvIOfJw=;
	b=GgJ4gquAF/xeAYzBEBKthErJDZj92XHbpV1DGCwWncZniIGL0QvP3Pl8YGDX3eOUrR4x
	 Tt+JWFeiy1HN9PY+BJ6GNouDp30T3KYqc9WCNpM0Z+WKX8oXIRkxLpTEkvrI84e0SqaNf
	 tBGTSUbsUZrxoKXkIiXMB+gC237HaJnBsnJuhldAJRnfYQu9t8IHy9DEW0WhVR15I3ScI
	 qcN/Mbw3N1O+l/dD04ipFlFFuLpZjGpkQSqADVJ2E0p8YNyA+pvr+ZsqU8h/W1gVCKRJR
	 scTGIn5BPqg6W1HIdEkr89JFP05QhgciPjlkca+N5Tr9jen4b3ig9WMLjZVIhZZSV1w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C11EF1F000D1;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709483;
	bh=FGTA+x8ZDZt3VBrV+ZM1sVU1Se758NrPiWguyvIOfJw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=EJXzINEJgm+h4QADTLjz9Lc1J5pC7iLNKVBzyn3Qoptw4ouaXZ+OpGpumcH9T07Rh
	 bXzzz1Ryq4+7m0fm83iJmK0xwyQ+D8pzoMu6gV8su+LavZVU85BlNDN9alWJPVpbbf
	 2WuDKmVoxri5YlSjbnoDWTpChyfevYwwpx7fQLxSvq8XUpbxqh7b3erm9aJZrKtYWZ
	 9xjgWE2pOtK81jgPxlrOIGuTq8Jg97HhmPsTXxYvyPGhdrtq1Heipi2m/XOtogr3sX
	 fPinPc0wYU06cYMhh9WaQm8uIAqor1FxyqVaCaOkfO4WAp1pfB7KuF0fInzRJfXh2+
	 ZbaWdQ2SZcIPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BC924D700;
	Thu, 26 Nov 2026 16:11:14 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Subject: [PATCH v4 0/3] clk: renesas: r9a06g032: Add reset controller to
 clear resets for mii converter
Date: Thu, 26 Nov 2026 08:11:04 -0800
Message-Id: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrq3pDLSgK+9hXLR10EmQmpYQl
 XB3QTckosv/JfNNLxJFpiR2q15E6jhxaMbI1yvhL7Y5k+TT2AIVGlBYyPhsQF6ZvYyUqE2yzFS
 pQVuLXonx7Bap4vubPBzHvnBqQ3y8P3QwrR8MYPuNdSCVrIgIncPSuXwfqWbravKhaWOo08aHq
 5jcDmcWqgULJwt8ZU1RGtDuj5XNLb1gZZOF2ubOaHMq4Ic1DMMLY0mY2VMBAAA=
X-Change-ID: 20261027-rzn1-miic-resets-8308515aa2c0
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795709473; l=2199;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=uAZ/LQcoPq9WKYaqq6iLQDLjbO+Ggs9qbO4DuShx6Y4=;
 b=bUNe6jZfSPtcPCO8LOap1VfzJR4N1skwLClhu952fa640LF3L6JPdzSHSyoCDD/vAeG4Xj7mr
 uwr6EsRyvZjDZPaD2q1e38Zi6ILRP+VXopdKzV/1j/Bvi6hXeYkvggy
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com

On the rzn1, there are two resets for the mii converter in the system
controller. If they are not cleared by the bootloader then the kernel needs
to do it. 

To handle this, I've added a reset controller interface to the clock
driver so the miic driver can deassert them.

---
Changes in v4:
- Add 5us delay after asserting/deasserting reset
- Have CONFIG_CLK_R9A06G032 select CONFIG_RESET_CONTROLLER
- Link to v3: https://lore.kernel.org/r/20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com

Changes in v3:
- Move reset_controller_dev to end of priv structure
- Index resets from 0
- Link to v2: https://lore.kernel.org/r/20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com

Changes in v2:
- Drop patches for pcs-rzn1-miic to be submitted separately to netdev
- Add reset_controller_dev to r9a06g032_priv fix build error
- Use designated initializers for the reset bit definitions
- Change macro for getting priv data to static inline
- Drop unnecessary reset from controller ops
- Remove debugging argument from r9a06g032_reset_set
- Remove configuration of of_reset_n_cells 
- Add #reset-cells to required and example in schema
- Make r9a06g032_reset_status correctly return the active low status
- Move reset controller register earlier in probe to better handle failure
- Link to v1: https://lore.kernel.org/r/20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com

---
Kyle Hendry (3):
      dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
      clk: renesas: r9a06g032: Add reset controller
      ARM: dts: renesas: r9a06g032: Add #reset-cells to system controller node

 .../bindings/clock/renesas,r9a06g032-sysctrl.yaml  |  5 ++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  1 +
 drivers/clk/renesas/Kconfig                        |  1 +
 drivers/clk/renesas/r9a06g032-clocks.c             | 65 ++++++++++++++++++++++
 include/dt-bindings/clock/r9a06g032-sysctrl.h      |  3 +
 5 files changed, 75 insertions(+)
---
base-commit: 7d650c5db382c8226965b01a31e16fcf2df1d096
change-id: 20261027-rzn1-miic-resets-8308515aa2c0

Best regards,
-- 
Kyle Hendry <khendry@reliablecontrols.com>


