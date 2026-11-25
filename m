Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795622062;
	b=J5KWHx+BIoaUWANG+g6pA32UpcedZwI34/ky+z1bb2RD++2+4rNuejnYoyJwQgi9sXGf
	 +zRm3OFBVISmzC1kF9Dkmo1i4qw9upPT+8ypmVbIJRMemU6M86fY+LRN7Tmkp+H4jrqHu
	 UteaUFkw+p0wBHOPAAMjp2tfBe+fwzv3qAtAsa43U+eo+qEGu3vU6ldA56csQEX79i+1k
	 8JVA7z2lzz0poGmqbDXyyQErVBVwFpsD72FWON9d9Z9zWRyyV2qzKj/rr8AmddfI9jOhG
	 ITmwLGqibEdMCu99nyHNwdrzos6ufABSsj727t9CFEqY0HqMVVCwMkT7N12gA4z2YCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622062;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6GnOjmsc4+xQIMPh5yFK2pvj96/NhYolYrqEgyA0n+w=;
	b=j8itdr97oXtHIXKcLzhnVHe1nhC0MoGtW+3rBf3423cticvya03yGKBidkIBXzUJBC+I
	 O03aomobDaAIusFDLiIXz1JFD8RFjtWFIE44DPIVKke/NmA+N/2s4ODBTRIuSN4rnogTE
	 w6aA4gpgKI14m/wkcRBl2uaAelKXYLhMUeA/b6fwxaoJPUJX0Tvh1pmAE4t3yah8icUEH
	 cwcjCI4xMdP+L/film6rfIyRZh8Er+seYLVAiMawYIOFbGAsvdm9wVz2QdkZU5+HWWKND
	 oGVonLecli0xy2SW9HMCCt2awDX0any6H5zPCz6GDgquz8NPo7lxmneEcHadrhTTRXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1Uwa7mM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9E606A32E;
	Wed, 25 Nov 2026 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1Uwa7mM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795622061;
	b=pKVcLikJ5AP+4s4i5d7yX8msf+7czWi4sgpnzXjoY4lwz/j5fwtTHzKaD70rFuG/NEfJ
	 dgFU4PkBCx9z2tcdNZvjiIGpNhKp9hozwBskBlUc1G3DdiLD/1CfVEE2frZBric8XNxBz
	 UvhaTGb6Xds8MJ9tPI2acdS5ucr2maiZ+1I5DlhMC96uu5S4555lm5mxSziFIXWBGVV5g
	 1fIov1Z87GupXeCv2hwSq/t2+ISEAy0My5rEBAYkOl7MPXmG5zBlUcnydfb17SK4xheN9
	 CWHevmh1gICnwD1U5iO6gX8CMCnC2ybjFKo9TIe0hOT+vdui0rIfeas1wz0z8YXe++g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795622061;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6GnOjmsc4+xQIMPh5yFK2pvj96/NhYolYrqEgyA0n+w=;
	b=cedtiCGIPR1WBYCWSVDTBOPYGCVT6eJUs6JsT5uUlUYPEvfNoPcv/tcISF+ilFUDsysh
	 VGdj7kEdQYNfmgGBFZ6+QrWDXG5bHGawEs8dHHYE+qGAO/NSt0qPkF/ceMx/mz9baZar3
	 UdVoDQrqdh2XHPUkREkzOgHCDP33lwDGAGSbj3/mpRpdsGu4xjgAGLymFdXHFonUPMEtx
	 31nC8wGJry6BfT04gNb1Jm6yBWB7Tb3ihf7c6V689OE9EagP+QAtspptEiZ7Shhy4enYg
	 mofnTQBLckYJYucWKxbYxYiL0reQ3i1sU94D1a06Bh7kOtl1i8Bi24XvmNBtET52kTA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C35E1F000D2;
	Wed, 25 Nov 2026 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795622061;
	bh=6GnOjmsc4+xQIMPh5yFK2pvj96/NhYolYrqEgyA0n+w=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=n1Uwa7mMvP5ece7SD3wS/XX62ALzNvFprRfKqjLJ2bWzDiArrUUG4gNAl0JfF3oH2
	 UAkYGHI17lVQ1l0CN6rakanljbqGONP8IE+fcO/CDolfsmHHfdzVVZXOuIBYpD/bqX
	 ddVyMxL2R22WEe+2XVWcS9LV+IzeQzVuPtpxHSqC91s/svk9VkKQ7gxQNBY81XWe+3
	 aHdjavx9HLz8G+y1ukNtTj8iYe4c2CZjFbfyfQ00Ymx9Mlfvw9uTJccf5BcPttH5Y9
	 pH4qQAUGr4sCqk87+GtIHhqhV3DhKmHX6GV1cUyDiCfxLt6CHR3la3iVU6aaVOEp+l
	 8pMPVWcmf33CQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6C55A4CF44;
	Wed, 25 Nov 2026 15:54:08 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Subject: [PATCH v3 0/3] clk: renesas: r9a06g032: Add reset controller to
 clear resets for mii converter
Date: Wed, 25 Nov 2026 07:53:42 -0800
Message-Id: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auQrq3pDPKjK+9hXLR1kEmAmpY0K
 uHuFtyYqMv3S+aZSQTyTEEcskl4ihzYDSnyTSZsq4crSb6kFqiwBIWV9M8BZM9spadAY5B1ruo
 CCq3RKpHObp4avq/k6Zy65TA6/1g/RFjWNwaw/8YiSCUbIkJjsDZmd/TUsTYdWTeM3nVha10vF
 jfih4Xqh4WLBbbRZVWXUJg/1jzPL0cR4O0HAQAA
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
 Kyle Hendry <khendry@reliablecontrols.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795622048; l=1905;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=qttgeoFz50m6xocphqe7rfGCN4ggYj2FjV0TRRZ7opM=;
 b=oEMenEM8aLeiWc1ZnKj1lpXCi6n9l26UZDFUGoSR/RsCpTBs7G3WUbzEKVlbTL44Q+GENko+N
 14R9dmzhtLHCwC+EnrbsNhnlozsGAk2ZD9B3W0bJ3WiyffLtQ27LA+H
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
 drivers/clk/renesas/r9a06g032-clocks.c             | 59 ++++++++++++++++++++++
 include/dt-bindings/clock/r9a06g032-sysctrl.h      |  3 ++
 4 files changed, 68 insertions(+)
---
base-commit: 7d650c5db382c8226965b01a31e16fcf2df1d096
change-id: 20261027-rzn1-miic-resets-8308515aa2c0

Best regards,
-- 
Kyle Hendry <khendry@reliablecontrols.com>


