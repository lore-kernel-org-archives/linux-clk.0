Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795801;
	b=1atFyivTHKLJxwj3OwfvArsVnuCUyeX9owlLLWShburkPVLUpdTkpm1y5Nozo+Uf9Y58
	 Y+5dkSHua73JlHgT+cLiF6B5k/gVvWHuBHaYXzwnWK9VAW5bHXrxShbxXBFJPFRS+XUyG
	 607UbisLxjATFVMBDIFTyNaql333uO8kaHadvzE3YhgCJrB3YuxzCsgzMqz8EIDuVO3X6
	 4kPAQXhkBS8nd0VpoBk+8BbjcoTBre3CZo5xhRXhGJIy23pKCcy8I9Y5trFvksRXrBvS9
	 A8OjOz1lXgGvVZdDI/l+iKId3jYqe7uqk5P4FYXYih4j31NcBXuSz7ZxxRqjR0AnyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795801;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=8JcBYL0ACN5qHyRAiyIzHGO9VObCGy2zekL/2cPPhvM=;
	b=Ln3Shd/5FKumH8Tjezn98Xvze0dlKoQWHeY2VA1JzktzOD2buQQUoYQBC1sWB83HRBGO
	 +b+krBpAcLYgAiH1Gj7wXEWg6LAiAABDgu7Aw9pkMsytGoQQ5W8YA5g27uqvPDs7KY7q7
	 utpF1zyh28hNk7XWUqw+VS0dq0HKrtJu/fooJkIur2l8eqyu4texTla6AldsnLq34cztN
	 CJbFm6RSdNPuXnE7gu+BqGrfY9NmmheiPg09nKQHt8wSMYvDt62ojsP/Mrx9OidOBN0lV
	 DkcfI1YfBrA217A0lrisay/6u50yeusqrea/OeBTRYFmuL+6LmETQrOVz12hWZDgFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ycT8OTzT;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B944606A31C;
	Fri, 27 Nov 2026 16:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B944606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ycT8OTzT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E3C874E417C7;
	Fri, 27 Nov 2026 16:09:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0EC36049C;
	Fri, 27 Nov 2026 16:09:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3CEF11E90C96;
	Fri, 27 Nov 2026 17:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795795797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8JcBYL0ACN5qHyRAiyIzHGO9VObCGy2zekL/2cPPhvM=;
	b=ycT8OTzTDTLvZxTg7OVP+r/xLMFrSH6WwtL7B1U6MQeSu5GDMDMK69KoL6ERAm+c59Mqh4
	67t4c/HzE10NVzBLMxRljYMllroEYkVlUNHtepmdnykv+Tcrv5d9eQHLPv6wBknbcD5s4O
	1js2wCllrGYYSE+d0a6CwGjENJevEyuYap/cKXCPaEUUFSTJ9oAGjBWMITywm7gyInDOHB
	U7H4dklQYSBK0sVv6Tvtduy4ZZDojVcvqF+89y6/Ff5Ky+e6oDAldYc0zrAL2fNhvVaPnf
	4C9bSKoOWWLJE1NTLC4a4UzO+48eSLvk5Yqy17qFIsI8twVbM789SUCWoNLtjQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 0/4] Add EyeQ6H I2C support
Date: Fri, 27 Nov 2026 17:09:48 +0100
Message-Id: <20261127-b4-eyeq6h-i2c-v1-0-d3232984fe83@bootlin.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBG4as0s3aSDjaEeBXjotAfGRdVwRpNw
 91Ldfkt3lupICsKnbqVMt5a9D43yKGjkMb5CtapmUxvrIg49gPji6dNrCawifE4Wt87caDWPDK
 ifn6/8+XvsvgbwmufUK0b5mJM3XEAAAA=
X-Change-ID: 20261118-b4-eyeq6h-i2c-2ff3a6b0818e
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

This series adds I2C support for the EyeQ6H SoC.

While working on the series I did a little cleanup of the device tree
with the first patch.

The second patch adds the clock IDs needed by the I2C controllers, the
third adds the I2C serial and peripheral clocks to the clock driver,
and the last one adds the four I2C controller nodes and enables I2C3 on
the EPM6 board with its on-board TMP101 sensor.

Tests on the EPM6 board:
 - All four I2C controllers probe.
 - The TMP101 sensor reads temperature values at 100kHz and 400kHz.
 - Raw i2cget and i2ctransfer accesses work.

The series is based on v7.4-rc1.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Gregory CLEMENT (4):
      MIPS: mobileye: dts: eyeq6h: clean up to follow dt-check-style
      dt-bindings: clock: add Mobileye EyeQ6H I2C clock indexes
      clk: eyeq: add EyeQ6H I2C clocks
      MIPS: mobileye: dts: eyeq6h: add I2C controllers

 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts    |  14 +++-
 arch/mips/boot/dts/mobileye/eyeq6h.dtsi        | 107 ++++++++++++++++++++-----
 drivers/clk/clk-eyeq.c                         |   6 +-
 include/dt-bindings/clock/mobileye,eyeq5-clk.h |   5 ++
 4 files changed, 112 insertions(+), 20 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261118-b4-eyeq6h-i2c-2ff3a6b0818e

Best regards,
--  
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

