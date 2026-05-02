Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D48A29ACF7;
	Sat,  2 May 2026 18:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748173; cv=none; b=NgfhfWvDTsEXJiikwf+W5P4dE1KdYVkkCUZETniMxBQaXgrTU6buVaZSqRPiezekgGfYMZeKAx25zxc76Ukd5B+Cksaj/6hCPZZTlqoe41Ej4l+236ciwr3GruW9iBkUDppHlZDBexhd9tOVwzlM3T4Dygh5USXFRX7TMiXyNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748173; c=relaxed/simple;
	bh=B40ZGPoV4IQ9iEYnGgPlp56X3Z+9TTYm+IVw0em6NGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7sP1g8aiBw+z2+UIDR/LK6jB8/3Zrx3DIBd8tpiVLyzRX9B4D10o1s+1BPKPEFJ5zIr2/STldg3WPMme+wM3OoAbJT274v4MlEIcx69GqdK6XI1UrEFopCYXF3F3mkrYEiHyL68CRvwCs+2YFpKWJZnZeWiyF3EhbGOaCPriQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cSC+M0ef; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qbdQClBr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cSC+M0ef";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qbdQClBr"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g7HDl6qFDz9tQR;
	Sat,  2 May 2026 20:56:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HRwBh39GqXNmqTCDkY03IEcf+DDmQW9MTqCgBPdfc/8=;
	b=cSC+M0efPcqaKGZVy3Tvk7Demw0T5g6vW0WZD6NV/4PwQWcd4eC99Ej59w3Ri6XRqwLj2t
	sGOdVxuoCnceTVe0PnlXKtUt8GMtF5ZrfNwbP5HxDbSPvXEQvmD7XTQQdu06SSZc33+fvI
	Gtm9N/emaGEWOhRVch3Good6Y5DUxFUkd/3DKmsyG1pL7J9m6Ii30ILuko/UMaxZ0gmTBt
	NI1LLxheCUGGnrDNsSUNId1714nS6dMgxMZ8lEpwbOV5pbZUvMSlSBe65gNzH0jI5syaDG
	0Fpxysi1x0uf1Fw2UfQ/KfqXNrgBbQs9PGX1Tt06UHERsg73sJZUMX4iFjiTZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qbdQClBr;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HRwBh39GqXNmqTCDkY03IEcf+DDmQW9MTqCgBPdfc/8=;
	b=qbdQClBrdTqSZlF/7wCdIxX3+ASoi0f8mRQqxQ65I+yAvPgp9C4KJ5VsAc3bsxiGYbGNW7
	DoUXyUISsFGdVV4/bZIhqvbg1h+zlhbbRgJi64XWP/wC8VTRTXt4mAu6A2OOW6JHabLQZZ
	7Oe1s450H586CTUq7RvZehHs473yH0wlrPRzzrfl8F3/umoK3BEP9zE5SsrVyXXhRfZO/y
	NfPFQlt09YW/d8iHWvYI19fzP3NR0DEF3bXZrNRP5C+9F3lL9wyNcF9bg5jMXsww9x/5/H
	2shoHXhbZeOigMxP0ycGnvWKrlvf0++pjOOEjgOVijpE+Rf8+RpqlSy3BZT/PA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] Describe coresight on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:41 +0200
Message-ID: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 29f8f6d9ad634f69e44
X-MBO-RS-META: 86oor7uzk4fqymh5d3ijsxszf1ta3s1q
X-Rspamd-Queue-Id: 4g7HDl6qFDz9tQR

Implement support for ZT trace bus and ZTR trace clock on R-Mobile APE6.
Describe coresight topology on R-Mobile APE6. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Please note that this is written according to R-Mobile APE6 User's Manual
Rev. 0.7, Revision Date: 22-Jan-2013. I currently do not have access to
this hardware.

Marek Vasut (4):
  dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on
    R-Mobile APE6
  clk: renesas: r8a73a4: Implement ZT/ZTR trace clock on R-Mobile APE6
  ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6

 .../bindings/clock/renesas,cpg-clocks.yaml    |   2 +
 arch/arm/boot/dts/renesas/r8a73a4.dtsi        | 114 +++++++++++++++++-
 drivers/clk/renesas/clk-r8a73a4.c             |   2 +
 include/dt-bindings/clock/r8a73a4-clock.h     |   2 +
 4 files changed, 117 insertions(+), 3 deletions(-)

---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0

