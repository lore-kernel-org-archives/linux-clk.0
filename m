Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C013B7B84;
	Fri, 24 Jul 2026 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879707; cv=none; b=N3z8jP81fTa4BN/LFMJ/jcMNB0+D5Qhgi3gqtDBiOgQXIH0w5VPjyMX6lizpUgG/TmkWsWAi1ZKjmjI10wqE2VIoQygT5ipMIAYW6aXAa55qxrs+LfjepoLH4XE8UreeVvSiKWbtwl6sAgXAxxB9if71hshCUA6eHQwiOTz73a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879707; c=relaxed/simple;
	bh=1za2swa0Ber8hNyYeQ7XM8JMxwuYRIjxUbDY0ahPTFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aSRruHk3Se8QDvUHdQZPz23gliftCzqoXL3L69xe9T6GLCiN/Eva4ITSjKaFv83rA+1efsflgs9mcSFQCRU4lGAm4B14QmE3ZcPY4c+VEp2k+HxfAWgPg5V8aJDGnwCn0iay1mI/jnrYBmIILpw8bI3A8EGGM2IfjAm8zvqAWE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0E/Qf/k7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0E/Qf/k7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 581081A11E0;
	Fri, 24 Jul 2026 07:55:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E3B460395;
	Fri, 24 Jul 2026 07:55:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4315B11C11AB8;
	Fri, 24 Jul 2026 09:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784879700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tTfE+xrK3FQyi2W9HmzHiL5ZguUIczg/4+KLdZcskGI=;
	b=0E/Qf/k7cvCC+X4p/zh4VRYpgdRhK8sD+LVtHBG0xb7du12NO+/oFOJ/P3/buRd1CATyZ0
	Htp4SU9B/yPNoLQ0BYPEvtrgtQsgA0Bq+2yqa+RkWCamSxUdcHy1y5E2HGDZwWq9ujhY5z
	f+mN76n9bjCqNTKPHdBJ4rkdqrkSA30rPkeVEtVVz7CPf/txg7E2ZARmulvKOPsJMyp7Td
	RW4Om5/WNFbdAwu9dRmiIdknO+ntN2La4MdtYY7N5EzwPa3kabBqLKRnWim6Yhh9APbA3W
	1udWhOuDMkYr+N5IT7IqjyEz2ckeg71LokP98tb7DA9WC2djaJmejtMDcMoZWQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: eyeq: Support for Mobileye EyeQ7H for v7.3
Date: Fri, 24 Jul 2026 09:54:57 +0200
Message-ID: <RcAweJqGSl27gSWWG_TpDg@bootlin.com>
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
SoC. This pull request is a clean rebase of the version that was posted
during the last release cycle[1] and it was also posted as a patch series[2=
].

Alongside the changes to the clk-eyeq driver, this pull request also
provides the dt-bindings reviewed by Krzysztof Kozlowski, a change to the
reset-eyeq driver acked by Philipp Zabel and a small rework of the
fixed-factor clocks reviewed by Brian Masney.

[1]: https://lore.kernel.org/linux-clk/h_BA0KRKTGSANQ5Y4eqo6A@bootlin.com
[2]: https://patch.msgid.link/20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.=
com


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/benoitmonin/linux tags/clk-eyeq7h-7.3

for you to fetch changes up to 44af1b974949c8f2f7cca469c0c7eee481750309:

  clk: eyeq: Add EyeQ7H compatibles (2026-07-17 10:09:56 +0200)

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



