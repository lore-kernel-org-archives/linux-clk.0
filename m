Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3CB3BF69E
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781688313; cv=none; b=SKnVKqCWeosBoRtzWpg6Ps8Pnzm1FQZnA/GMxR1dko8vUgZWhjloOkK0f1CuiAa89WrAXv7+3OugSGbo5dd4t22yUKLOiuq8IURfHfdaa3ixdDmNyan65XyrFwEPvwuzFTyDWG0AfuCFF9V2aORpFQVRovD9bPoetuUTw2JFngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781688313; c=relaxed/simple;
	bh=4VPWGdWK1Ubje9j24yeCBoi+ar1e2p0tOcCWflvUapg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XKJ41OvsdWLUYOrt1ibuIwAf8E3DTb0U0+1hTwfInzDD9RSYbOmt4x9+S5fLHDuZm4Q2N3zdgV6thnROWJMuOi1h2EB0nvCgRpTaxEPN8s1CTqWg0yMTAYVVBDU8kmjXWFajYrOMnZoFX+Vm1DUXmESQ9Y54jWEe0hN1uCVcUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cvrlvC4U; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cvrlvC4U"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 18BDAC2B9D8;
	Wed, 17 Jun 2026 09:25:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2AC5A601AA;
	Wed, 17 Jun 2026 09:25:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D02C9106C9F95;
	Wed, 17 Jun 2026 11:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781688306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=fPJL8t5KmadurxbL+PBQFvPQhYMdfsg4atrXcuL1K5I=;
	b=cvrlvC4Ui78omyD6BukrGqeHWajK7yJaR3xa27t6ihMZJFVh/vh9scfQFOxJ4j/rDtcaEL
	OKWuJAjCEdIQAXWvWuQ6TCtluQ+FEs6mAEs6cxg7de0HYmYgkbSxqp6b1aCrnfq4jVkjUx
	b1gQKmhTxUSdM+TVK1jiMU7NiimDjQhUi//XiiPesoFUeSG5J8Wz9kMDLFAGjAXIhMSYPP
	AcapjH/JG9WnH78xxMV74dKieys6KdV8hnKBj0o7NsqNNt9raioMTF9E46+edpCONJTG0S
	BPM0SPxdjRH8xRjn5XFgSd7aSjdQLPj1hG5cxUcuofI/d1xM7HPDjAJimgoN7w==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H
Date: Wed, 17 Jun 2026 11:25:03 +0200
Message-ID: <h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi Stephen,

Here is a pull for the clk-eyeq driver adding support for Mobileye EyeQ7H
SoC. It has been posted as a patch series previously, this pull request is
identical to the latest version posted[1].

Alongside the changes to the clk-eyeq driver, this pull request also
provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to the
reset-eyeq driver acked by Philipp Zabel and a small rework of the
fixed-factor clocks reviewed by Brian Masney.

[1]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.=
com


The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://github.com/benoitmonin/linux tags/clk-eyeq7h-7.2

for you to fetch changes up to fc58615596c5bd701d868813ac595489f3939d83:

  clk: eyeq: Add EyeQ7H compatibles (2026-06-15 17:42:32 +0200)

=2D---------------------------------------------------------------
clk-eyeq: Add support for Mobileye EyeQ7H

This patchset brings the support of the Other Logic Blocks (OLB)
found in the first Mobileye SoC based on the RISC-V architecture, the
EyeQ7H. Despite the change from MIPS to RISC-V, the Other Logic Blocks
provide similar clock and reset functions to the controllers of the
chip. This series introduces the device tree bindings of the SoC and
the necessary changes to the clock and reset eyeq drivers.

Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

=2D---------------------------------------------------------------
Beno=C3=AEt Monin (9):
      dt-bindings: soc: mobileye: Add EyeQ7H OLB
      reset: eyeq: Add EyeQ7H compatibles
      clk: fixed-factor: Rework initialization with parent clocks
      clk: fixed-factor: Export __clk_hw_register_fixed_factor()
      clk: eyeq: Prefix the PLL registers with the PLL type
      clk: eyeq: Introduce a generic clock type
      clk: eyeq: Convert clocks declaration to eqc_clock
      clk: eyeq: Drop PLL, dividers, and fixed factors structs
      clk: eyeq: Add EyeQ7H compatibles

 .../bindings/soc/mobileye/mobileye,eyeq7h-olb.yaml |  192 +++
 drivers/clk/clk-eyeq.c                             | 1268 +++++++++++++---=
=2D---
 drivers/clk/clk-fixed-factor.c                     |   78 +-
 drivers/reset/reset-eyeq.c                         |  271 ++++-
 include/dt-bindings/clock/mobileye,eyeq7h-clk.h    |  119 ++
 include/linux/clk-provider.h                       |   56 +-
 6 files changed, 1487 insertions(+), 497 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mobileye/mobileye=
,eyeq7h-olb.yaml
 create mode 100644 include/dt-bindings/clock/mobileye,eyeq7h-clk.h



