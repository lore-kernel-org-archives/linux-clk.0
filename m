Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588225;
	b=JUwu+ckn44Cfg1faYK5RVjIgNI44qenbGVZMvFdJwlN3cCrw7OuwMAgo3oEwAyxzCuTT
	 TIZvc5vc9VG4vdMeoX8A2ybcDs18+m4aDM02OiMXOMZgqYyMQk8IJrd86AkE030Z4fRQq
	 OYm0ycd37ovlU79IsFMTK0krko2FWsTmtJIOBEB1qZOi/SK1tMeETQxZPAzF+AeBMMC00
	 rNJjA4dfRA49CysfI+Gr6yiqvf2XV8pQ1f+AHmq3wqu9KpR2Qzf0lD+KEtkVJ/OHt/xHo
	 jGMOYY9Od7F1ecjTNPUhrejr2Qdq/sJSGLrt6me8/2Im7Gtu9EhhoaU3NyuKkNswhBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588225;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=4ST0S09FqoMhYeE6cyXYxn/H30wuNQQmvIaLab0ur0Q=;
	b=A6ShWxlPLLqNmdHtXfE5R6lJYXU/GWaqlHjxT9nY2d7gUxm47thrgsFDCjqyBzsOoPkE
	 13st9dyYliB7aLf58Gk02lw0p6krFFYDkbmfApzNOBjIXiaMzClYTdQzW9Q0NYySp17sS
	 jzoILKZV5VsGO4BKvm0Clv3X2cFguh7k3LtptkQoHtbLTccn8VGx4W/beoGSAUw++bQG0
	 OM4Ae8GenrlqECdmMvK/cf6L+Zmlbqb9w0n57tLhMeGMoou1j68VNMDzQenGLsCT0kVOA
	 7Htn6kVOA2Vdb82Nh/4XvSpZiaz2yYoBadMNvykX5e4H74WQrxdi/mxyIHSqXnoAGVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QVDszHTp;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B181606A329;
	Wed, 21 Oct 2026 13:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B181606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QVDszHTp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 651B44E41296;
	Wed, 21 Oct 2026 13:10:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31886606E3;
	Wed, 21 Oct 2026 13:10:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46490103289F5;
	Wed, 21 Oct 2026 15:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4ST0S09FqoMhYeE6cyXYxn/H30wuNQQmvIaLab0ur0Q=;
	b=QVDszHTpvMd0uArH8cax+y7uc7PR6lDDUG/ztuFY19H7Sm6xsZbZkqjfIALPe5dUq/UHo0
	GkoauflJLjv0jy5182Pp8dtZsnH60ZOGBKxxienme64ueeB0KHyebhiikeN6dHfekffbzS
	IWDMPkMz0MKNWKKM0u0JJzqyZMJp6DKxEyeaMDwAbdx+yMJW72Z3jA2RWH05AsrRDGpnDV
	E96iuOBE0nnG60ZPRTGYd+7ULhKzfyEi2aa914baO7L0vC6hSo/RxCNguUv4FBPijXmIcg
	U9LoHjJ299KCHt6zJFmOKf3W2oWBAetv6D2rFEtA0DPg6lEfeLq6y3GgHFZS6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
Date: Wed, 21 Oct 2026 15:09:56 +0200
Message-Id: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWOywqDMBREfyVk3ZQ8MIqU0v8oLm5uooYabRMrB
 fHfG3V5BubMrDS56F2iNVlpdItPfhoziAuh2MPYOeZtZiq51IJLwXKCw4sNGJjhthItAoAoaS6
 8o2v975A9m5Oj+3yzcz5DGlxKcDhrctuVXMny8CWEwY8dWyrGWaXRcjCgsGgf0dke5itO4b6PG
 Ej5wRSCn2uiBGolUUssDG227Q/gN0fWzwAAAA==
X-Change-ID: 20261021-ge-clk-lcm-b0d81fcaaa17
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Thanks to Brian's series, we can finally solve the problem of rate
calculation faced with the i.MX8MP LDB/PIX clocks. I've tested this
series using a v7.1 mainline kernel with a lot of unrelated DRM
patches. I then re-applied it on top of clk-next after fixing the few
conflicts when applying Brian's series, but that means I cannot (yet)
run a 7.2/7.3 kernel on the platform (and applying this series with b4
will fail due to Brian's series no longer applying on top of clk-next).

The DTS patch is there for reference, I don't mind if it's not picked
up.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (5):
      clk: composite: Initialize inner hw clocks during registration
      clk: Fix v2 rate negotiation with composite clocks
      clk: imx8mp: Allow adjusting the video PLL rates for the LDB clock
      clk: imx8mp: Set v2 rate negociation to LDB and pixel clocks
      arm64: dts: imx8mp: Drop VIDEO_PLL1 assigned rate

 arch/arm64/boot/dts/freescale/imx8mp.dtsi |  6 ++----
 drivers/clk/clk-composite.c               | 34 ++++++++++++++-----------------
 drivers/clk/clk.c                         |  2 +-
 drivers/clk/imx/clk-imx8mp.c              |  6 +++---
 4 files changed, 21 insertions(+), 27 deletions(-)
---
base-commit: 31c632c62c5b98fd965ef5cff3c3fc1ffff02913
change-id: 20261021-ge-clk-lcm-b0d81fcaaa17
prerequisite-message-id: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
prerequisite-patch-id: 8f4664c519b38f0c34e388104f9a75e0946c27f7
prerequisite-patch-id: 041b5fbc0014b25795f8eda6b89b6b61131d51ca
prerequisite-patch-id: 2b9d8038fb1733a94291248ce9042139275fb4d1
prerequisite-patch-id: dcf50f042320b672cabff74bcb861e5ddf26bf6b
prerequisite-patch-id: 3539877187131dae288e6bcfb204d047e5768f84
prerequisite-patch-id: e55a07d726e3caad4508b8f200a8a8c17327c8aa
prerequisite-patch-id: f09cbe9bc44cc58bf47aae239c3558b4e6f6233e
prerequisite-patch-id: 272e0710fba77dd768e6312aacef5a3e9addebc0

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

