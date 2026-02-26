Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6740FD9A
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120390; cv=pass; b=UR239xAl4aEM6y3D4WgcXYUqOTayNUPrZRIApomhk+XhKOllOXuscg8CokbMjFbO4mqDDakXZrbychiVHJA6aRLjCopAo5QnD4Eq/pxAeVqCvCzQkD/xELq86meGc4lgwvGl745tq8MQUCOCNxIKd+Yqfu1nMdC1Z4pVTjNMfIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120390; c=relaxed/simple;
	bh=7p3KnwhCjiXCAFckjTZO4s4z0gC/fOAvonkWNNLLb1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A50rLOoG0BVFVAm2EqiBIHqlOyDPuFwx1+wh/LKfnOcYOlxVk5gu/tjDJKL5fMz7xxXXFpM0HkVtg1vbk4p9lBXj3D6Kp/IntokkufO+rDpE21bFkEltjDBG7JKDI5dDTHCMawVv97tOVhLUSt04QxlevqPjKqBos2QJ9DkYHE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=aTnN/yJB; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="aTnN/yJB"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120360;
 b=s7tnkkSfIyGmNi3nv+ZCTiDoo0fv5yVbOM9djN7Yy188VrZO7Hd13U4nhclpCz3niqoLPWx+
 cvggc0BIKQot7QQagDufg5UdNAy7jWKgMnUdiX1BwrlCLXlbe6g2ZUXug3pCXMadGYvjsl5WUtw
 fVut4eTxLotui/QbGA5X4p2ZptEsLzW8aoTHyfW07PxO5F9Gv23HN4GCogzBGQNOUYFnjg7kbM8
 eKapYIWhUK14Aac8v71idLaZkoMWCESXh9jWEnoajxrDuoJq6OMFgY2Jv3bvAqDpVdF13GIZfN/
 m35vrkGEf949F66EnlTZ/ker9sAhfFGp0o2NpCdpqMf4A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120360;
 b=cWJ4HACAIQ3wO1pe6VWgQ3xxmliMVAFB8YR8hW3K7YF6CJi9bRS3Tuu2TPZFCtcHhtQAhY7s
 mddwfbh2IedVWUyTiJWUMkrv+vXRzJkPxheZFPoZzYrSd06O9wQfbngLpr5GY5DybJCCT4ozeHx
 p9kyCyf83cN+QCBKyavrqH1ZS1F0FPDvxu9pGYIe/L5dFFo1slAy4ONL8IwgWWpbArU1MKBAJFi
 MJaFYkHTht9abWQ6uuP95iHhslsm+gfvlnt55d0iK+remYNbcQf20nx3A0xs0mFirx/B+k+kCwc
 Miht0rJwQI7WPswoZIDrn5t2yC9a0NcSJd7Fao6lIHAbQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 26 Feb 2026 16:39:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id EFE42A407F2;
	Thu, 26 Feb 2026 16:39:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 0/5] Support TQMa8QM
Date: Thu, 26 Feb 2026 16:38:49 +0100
Message-ID: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fMFxL2sBsz4F898
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e6eeaebf4cf021a93157c2a1ac4b54d4
X-cloud-security:scantime:1.938
DKIM-Signature: a=rsa-sha256;
 bh=IzqbFvCBgdaUFwS1qXmfy9dqVHi/nCebaI0DN6ZkaEE=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120359; v=1;
 b=aTnN/yJBEunLRPDcqQzghCNFVXa8CeR6O2Gyp44DZja5syEiWgVRFBj2wI4pvaGrncjEp15u
 PjJPNNRH9JvyKaCParJEcwJ3nL1AJas7ViXb40mWm5oSvHWaaJV6sv5ZiU5fNxYvxMewC9/SMup
 OvlCGhFI/QHnyMaNZVL0U2tj9Kzx0xH311/UwcJxxNvzVNs27xR9DNlr2udJUT87hnHggHOaqBq
 I7vUY4EJG85yPkx0RGYBgX4zuiCI6PfGUIGRluOKo9KszdCmy8rVJgidpq43eOrbsg9zvIrHnIn
 Q+UM/e7YvmhG5PKkbU7mmiSRzI0R3qRKgnPa74nIcFdQw==

Hi,

this series adds support for TQ's TQMa8QM. The first 2 patches are prepatory:
1. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

2. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

3 & 4. Device bindings and platform DT

5. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Changes in v3:
* Small cleanups in patch 1 & 4

Changes in v2:
The need for clock-output-names properties for renesas,9fgv0441 has
been removed by reworkging the PCIe clocking

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (5):
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: freescale: add initial device tree for TQMa8x
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 867 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 325 +++++++
 6 files changed, 1207 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0

