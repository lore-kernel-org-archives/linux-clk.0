Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217753;
	b=jWXJjPojAkdh2luz98tbQKjCWK7qF3V9pHdgTtm8VTbPDSn1KZQHa9BAagx6mjXBcZpW
	 CwCjQm2HtBwI31vIN2nIzSHA6G1N25RMqCQV6VK/u4EdOBDVJQoc4pbfBqQ21GrwtplCV
	 QPcYDt3djpvurlX35OHVm4BD3Rp/T65bzASupwjiTKutml90TbChvLuAafu3KV6jwmxh8
	 RtjdXRasGrhitsJPMSipAIQqiRJOpMIcb5bobx4rCDHCc0Rs7eqTgV2LFXE/WrZALNX2Z
	 jYt2vs42YXmQ7E0gaOCbiEi/Tb/Q6NMVihtg4p0TM7iK1BloYCtgZhqhWdyRkI0ap1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
	b=b4vkxfNi33e46H7s3sZ7GQQojdZTdOH5W1VVy52yfR5GKEcN3mck8ckSZGB4BlH3zgpZ
	 UEvVG00draZcgBIZHiI15G/L0s6tVmDDnJ+sRlz/c/eTbNPU2SPJxf9LGb9WhnrHLqBaF
	 eev5UJJp8Fg56TJ99pZsL62+b/8ShObOehnW5x1///c2HGSZRFttdgp6TvI0GzvjUTUlM
	 zCGzuypoy16rNARVWAVEqcBrDLxYRjzEtMbaF3svVlTWLz9FJP7qGImVlYlnUKJsvO8QW
	 NMh8++nUldtE+ZDE5IkzVGXsdclWiZk7UvD9JN5qGwo3wrkQno5PvHKZYtfdn8Dejeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4V5h3w;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA558606A6BD
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA558606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4V5h3w
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so13022645e9.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 15:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217746; x=1795822546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
        b=Vh4V5h3wrScbR+aUpgN095jL+1i0bDxiHInNwG95ZLFvVbqjhUWEDU3gRRPGSzQv5o
         6PXI7x7HuFCm8Eehc9nYYw3RThyjB4D6VlNxuqYxTusJJwXyisj28FaF68bA/2gAJoH2
         /muws63J4fbwGqDaC+IDrSO3wORW+HoWjbF5gqs787TbaYWt1bFCJ+1AU/fEdbTJ+Mc9
         nlw10mUzcdLoL1MSHoU1UVniVxDuAJDxeyS4c+4cibZwQInSW48TBUDWQ5Jk2xuWN309
         x1tuO/14QgJV6dEi428tNIFH9/Vp9UuSwCq576p1qOwBqG33CAzpQlf0Ao/JKuiZhfe6
         iOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217746; x=1795822546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvDVMb3mH/zw0rOtMKeGgSVlAHxzoMp4H3arwcllw/8=;
        b=LAdfdACLVLAvzCnyjs3OBqXg10PyCy71aXGFD643lLkJxq7uU/lA1HBBu6wK7U9pul
         CI1pXf1WaXwjWVMkf5jOliqVr/KOF2pcXUI0KpSqOcic46MW20sp5LFuJK/9GK4fcgn2
         2LRoDMLwlY6jemWxAv1Tyu4IwaJOK8mnr9fAhftFCd6LsibbGkYK2DszrzG2SyAt59l7
         iIIyQP7Ckzn1Q5azL4svWMDqinvPly+G9NQD3UFWKY85eaBTFF4YdXXpC0fzcBLZL3jz
         pJOVDRPvk6tFxwSS7MJraEdVhrIQNvlToDAG34StVyI+WKEsIbT8HOsX4YSGXLKvI7b+
         1/uA==
X-Forwarded-Encrypted: i=1; AL+hErGLKSN/mrbskrTA5i57uDEHkj8mou2lWswgCmuDtThQU5kfU7wwTZrCQXtFZgkeuPLOgq62iNIBSWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ckGO7t0dp/W1WbOFfNXooVX+2WNudFB8Yin7wUMQO12Or6DsY
	7jdznoonSAH5NaV/pLo6OUrtt1o+tAlKR3xpRsCDAD3bGnIIWgCHprOW
X-Gm-Gg: AYBFou2/NRhpOa9LF831BZYtR6+GojCDaTcTgL3Ocfxxk26mbLROi3y+ji1e/MnZYXJ
	y0fDtge/m/oFm4olRFb6LLDlTgJbUEfR6hezVk7Uu2EI8I+zz9JANFXZ94fzBF4sNkwEdc69e22
	QT7GVoJeYPQ2GZs0D9X85u6KgXoQHntiCy9dvFKcP4+XwPaWZDhcvY1gizDc1/sUxnRUvi1HoqP
	E7oBEXFKvBSW5ZT5XOKI5VJLtaX5U/LHcaaVmntWChajBCTk5SXWRgbztTXFhh7Oe0++I55DuxO
	zAPYGNeBiaV0y0LeqTFze7p41WMXnEz6LL0E2/z4xX0lJm0kZ4KICnTR0GYcPn7UWUgKDztQXta
	tdQfooON2JD/ns0sPxmoPcYrdj8lZBcjPqnD4ZDZ7Fa+kBFdFIge3Icp3Nepl7c7oS7osvZXug7
	FQ9rgTp+B3BX32oOmyDfwLBNxZptknuTsUBOt9ioNQif6Njdl5nT4jGDRHO6u8Yafxv1BNR0uu6
	N1S59txbzFKbI0yoyFpPRlHYCCha49hCBDzY5zMFI0n6ZuVZEnTBkwLW7k/z9iScrliko2QYO2O
	OlGeDXFUYdJYN+cUzb+ksCpLKGETpscJjRux59DpqFSoIo8LFUF34pjkrgJDekb2hNWrlETaJ9U
	wMNkUa3ShPi2nxrBbR2uqr/nbIC2wopsQPLOoAA/JV4/fBrw7kxzo
X-Received: by 2002:a05:600c:4f10:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4bb88807909mr108198535e9.5.1795217746082;
        Fri, 20 Nov 2026 15:35:46 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:45 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v14 0/5] clk: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 00:35:28 +0100
Message-ID: <20261120233535.164885-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This small series introduce some cleanup and support for
clock and reset of Airoha AN7583.

The implementation is similar to EN7581 but AN7583 introduce
new reset and more clock divisor support.

Changes v14:
- Fix wrong definition for chip-scu
- Use scoped guard and guard API in reset
- Rework for better num_clocks handling
- Address some forma impovement suggested by Brian

Changes v13:
- Use guard API
- Drop spinlock on read operation
- Use enabled/disabled now that they don't sleep anymore
- Rebase on top of linux-next

Changes v12:
- Fix dereference on pcie early unprepare

Changes v11:
- Move to global spinlock
- Move pci ops to sleepable prepare/unprepare

Changes v10:
- Fix whitespace in include patch
- Add reset and phy cell as required
- Add additional patch for devm variant
- Add additional patch for lock for clock and reset access

Changes v9:
- Fix compilation error for priv (again) (this time fixed)

Changes v8:
- Add ACK tag by Connor
- Fix missing priv->base assign

Changes v7:
- Add further info for DT patch
- Add serdes selection support
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20261009070725.13196-1-ansuelsmth@gmail.com/

Changes v6:
- Address bot suggestion for DT patch
- Add further information on chip-scu phandle
- Add dedicated PERSTOUT reset and PCIE_HB reset
  Link: https://lore.kernel.org/all/20260819221458.30040-1-ansuelsmth@gmail.com/

Changes v5:
- Rebase on top of linux-next
- Drop even more patch to reduce patch delta
- Make chip-scu specific to AN7583
  Link: https://lore.kernel.org/all/20260528190000.9164-1-ansuelsmth@gmail.com

Changes v4:
- Add review tag for DT patch
- Fix clock patch to use en7581-chip-scu compatible
- Drop PCIE SCU SSR write

Changes v3:
- Drop .set_rate patch (will be proposed later)
- Drop chip-scu binding and related patch
  Link: https://lore.kernel.org/all/20251106195935.1767696-1-ansuelsmth@gmail.com

Changes v2:
- Add .set_rate support
- Rework DT to EN7581 implementation (clock driver is parent)
- Add additional cleanup patch
- Merge binding with schema patch
- Add chip_scu phandle

Christian Marangi (5):
  dt-bindings: clock: airoha: Document support for AN7583 clock
  clk: en7523: use devm variant for clk_hw_register and fixed clock
  clk: en7523: protect concurrent access to reset and PCI register
  clk: en7523: generalize register clocks function
  clk: en7523: add support for Airoha AN7583 clock

 .../bindings/clock/airoha,en7523-scu.yaml     |  26 ++
 drivers/clk/clk-en7523.c                      | 390 ++++++++++++++++--
 include/dt-bindings/clock/en7523-clk.h        |   3 +
 .../dt-bindings/reset/airoha,an7583-reset.h   |  65 +++
 4 files changed, 448 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h

-- 
2.55.0

