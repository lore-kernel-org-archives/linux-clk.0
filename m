Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795111099;
	b=ZDme1xigZc17hiQkyDVHnoy10VF/M5bJlVBwH2hDls+cd81Sorc7RO8/nzSS0jQGL7NN
	 nuFb5hcL0wU/90oxL6NRUEpaNEs7rjjVgnjdIU7B7Ay8ZbDR4DbjKolZOjWc9GdOZrApw
	 xepuN0lIyL9Xhi8MYz51SkdZ1Wxm+Q0XB5MtyAVMd8BgzA1LE6TpvzE2qbuH+i9Zwyzpq
	 yKCAR1VzGv99ERExlAQH+WtR7gQsXlD/P7ZfDEmEeXMz+adRisngZGEUrgOSgzQyB/cj8
	 OhiJU0kSBSxkBrY8LxXXQRq8zcktxf8481QYYkYe9/t7ppqQ823Ns0h42CAElRqPUeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111099;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Sd0ceinHkc8YIlIn9DPVmRpuswaJ+zJY+PnrLIlcQys=;
	b=pa2k5i5GeWdjE9IOMa27WbHt2rzlWM2HrNt9bV1lG/q2q4o/y1P+Ll6NSO8pEsrwn7PK
	 Kyp/BaZhvZVWJrpcFEtKxRSAgv6rFfHf8Lndu0/TLJkRvKVoTjmR22avZ4+svpQMxlhsH
	 JiO+Me9gCecpGxU14PO5FHu+VCtYiyMWv2FB1FxCy/0DrGNEcGqjhVbCNLKvcZb1fqi09
	 vyTY5hSWoI/se4Adridr62KrB+7UvbZkoXURGYzrphwHIQuvCjKV92To8DIS35sPl+jpz
	 zA6hGMrgIMg1iYzNBLswCCmKdBK7LjNTuQdGS0CrVMyun0wN7UqNHio3LIwTFGyB0iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxThk67s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5938606A32F;
	Thu, 19 Nov 2026 17:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PxThk67s
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795111099;
	b=Gf7xBmh3+daQAebIkGPlAiNxXB7PwmsIQXo8CCy2W4oR/NPte3fm0E3sKz/FK20rVjwG
	 ita5ed28BQukSCpGUbdSq5dKKIvsjGMW+X76tqTOedv1DL4CFDe84AdED+J8fhwW5XISa
	 SRenabutou5fZKkplAVe/c763t7zdHCezqz/bB3sSiVlptmzEw/XlqTnjgh4SteNUR11P
	 whDoHwd/Pu+3VFXUPcnCiavYjadi8VZdojzxmHMPFcOS/NSSOTcnvoKwUCKKC5l4VRTDS
	 zfCIhFQ7CkoIe+/805plza+o01HfgCz697uNynO38KzSAfWu1NCPS/Qo40lA/UpoO0g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795111099;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Sd0ceinHkc8YIlIn9DPVmRpuswaJ+zJY+PnrLIlcQys=;
	b=aO7ykSQ/z3Z6mhz3lMQsrBALfK/9TLig5JCNIf7eVxduZ/KOUazOuUqE0DU702b6bYXR
	 +zwrwZ82ZpLXhTq6GyRtWiu68UJIsoy+Ml7D2JKt53VjVYZsjgAEchN7A+cW+XATA5ZX3
	 5pHl709mm2Q5fkAZkGsJ0bkz++6QEbMZsggatNoEiQf7z4ins3CbIwrSa3GiiEsSgrLJt
	 fc6P0FQdgDyDhPnUEF3CVsd3NeLYtFvWlZgya1K2Oium0KKkTohZUcBfQDt34LEQRk6dF
	 sob64PI0SB4PLNM8dzQv7oHaNCzRcS35WM4O/E8NJ+eza57NcFnwPbG3FSPevFjdRtQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9CF5D1F000C4;
	Thu, 19 Nov 2026 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795111099;
	bh=Sd0ceinHkc8YIlIn9DPVmRpuswaJ+zJY+PnrLIlcQys=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PxThk67sMGMRGjnAD7rc3ZfLGlGakSS6s0oEnh+r7QZdKTxegsEqO3PKOd/+n6PIo
	 vvgUjZc5afJqRJF4xywswXN6broFnBky/OPyEpuSx44GTKhfmLfqLcUKh8hJLDRRs1
	 8FCJ3f6d12XbGUoICYD/a1NBISRmZYjxuDooNI+dmP9xO47UfrTek128VzqR8ZWMGZ
	 ThyGb6H0hIKvQ2PZiufQEj8xVeSy1qp+uF/pONi/ewg/0CotHqhm4HXgZ7SYWmoAOF
	 Wxv7xYUsngiaRAbp9OSygGz4ldw1MCLdslHDCuDaxbp/MzIQe58Rqlt4nATjejyAlV
	 hLbkp716b/OPg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1D644B3A2;
	Thu, 19 Nov 2026 17:58:17 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Subject: [PATCH 0/6] clk: renesas: r9a06g032: Add reset controller to clear
 resets for mii converter
Date: Thu, 19 Nov 2026 09:57:42 -0800
Message-Id: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MPQqAMAxA4atIZgNtxR+8ijiUGjWDVRIRUXp3i
 +M3vPeCkjAp9MULQhcr7zHDlgWE1ceFkKdscMY11rgW5YkWN+aAQkqnYleZrra19y4YyNkhNPP
 9L4cxpQ8J1pusYgAAAA==
X-Change-ID: 20261027-rzn1-miic-resets-8308515aa2c0
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111097; l=1387;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=VM7uW+z0dcnrH+6sPmftwId4Zj/tt42hzIKtv80ndFo=;
 b=GvGxRgU2SyYbnaJSMZVSGihx5MpcwtT4kKTRtaDimQphnNfLGkyHgS+5GojztchRAGRQ39I8e
 7tB0p5pLCPmAvajtZiL0DwjYQriMFSxEv2nIaf1tfdfSVhUgTsh6/TZ
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

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
Kyle Hendry (6):
      dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
      clk: renesas: r9a06g032: Add reset controller
      ARM: dts: renesas: r9a06g032: Add #reset-cells to system controller node
      dt-bindings: net: pcs: renesas,rzn1-miic: Document rzn1 resets
      net: pcs: rzn1-miic: Add resets to rzn1 info structure
      ARM: dts: renesas: r9a06g032: Add resets to mii converter

 .../bindings/clock/renesas,r9a06g032-sysctrl.yaml  |  3 +
 .../bindings/net/pcs/renesas,rzn1-miic.yaml        | 36 ++++++++----
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  4 ++
 drivers/clk/renesas/r9a06g032-clocks.c             | 64 ++++++++++++++++++++++
 drivers/net/pcs/pcs-rzn1-miic.c                    |  7 +++
 include/dt-bindings/clock/r9a06g032-sysctrl.h      |  3 +
 6 files changed, 106 insertions(+), 11 deletions(-)
---
base-commit: 662377fd1bb1d7cf4e97d312255fed868f56342d
change-id: 20261027-rzn1-miic-resets-8308515aa2c0

Best regards,
-- 
Kyle Hendry <khendry@reliablecontrols.com>


