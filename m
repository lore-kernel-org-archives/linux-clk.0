Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=85.215.255.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792955951;
	b=L5OTd4CZal/7NlACQySF8pxsHrLsHKT7WgW8ubrQ8ydUdgPPak9nNd4CrzP8bU9J6SZl
	 tXVnRk6GisHVC0Kjxn8etk/jq1hX5VGaBrkxIt44Iy1seOTeh8XxMRn9h8uCu11gr3HzD
	 R+up5i1XDflxklnpPl0+G7lvDLfviW4vX1ro9mxPKV352C13JrJlXg/1l0egkpC7BiFpg
	 SIwmnaZZs/E1m7jCQd5+Gf8zbPeRGqd9US/p7v3y0JYhCx9aHGuVJgXALy/HPte1uxtJq
	 OrjL0yB2Qm4u3kPt4GL3tWsvXI9jcKhPJlWgxe1VcoYcuBFnidWaHsIyDwuULsnBreQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955951;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=MgLdXFF/Sj4ih5qNSgMyDA1vEeVT9nxto8YHeXZw9Mw=;
	b=2RTFS5s/FnLiMLfuf6cQQCQo2Oy0vWr0u6mBx9yFeEU8qcXgQ8n046cx0WSbX8P2fsFf
	 3nFZC0Gt8xqKiYjijPeUrxWq6SDupLBPKRIbbZ4AD3E5ICI0YkVv0aqGwwguFtTBhgIc2
	 OsrAOQjbbj5VC5sLiqP+IRVnklKKO2voVplUL8FTiKJqqTJDshR6SedK4CWP5oTQQD4Lg
	 P8aEVEoofyd73BtSAFJll3+hrn+y2TW7/M4DTagHMg2I6DiMUUmxCaNgk/sDR4B3Nt1Oo
	 blcJR2ArKZSqJ7e6bHQvoLtbHtWsggqFTcX/AcyYsVYgBlOQnlQ7wssPo5+71CyJrBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZgzdlgHE;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HxmJzMSm;
	arc=fail smtp.remote-ip=85.215.255.50
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4C606A323;
	Sun, 25 Oct 2026 19:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A4C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZgzdlgHE;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HxmJzMSm
ARC-Seal: i=1; a=rsa-sha256; t=1792955914; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bEevh96a5idVHtcfogobPQzJIvBQuKHaGi0Sz7RmcAz+zk7+QWTTw27Q9O9JeOG9HF
    FH2vioqVrD/+ZcR+BcJtt1WCpnLi0xaNyDaEZud1LasR/0/RBkGuDDnAeBRwS6LIrLoD
    wvkOs/+DGzDGpREkfithsHmB7Z4HTPU8pvE46J7DJGCS1Q896AQaEx2u1ttJ2wGyQ/gk
    T5doZs+D268+ryUHWXjU/yGO2BvqEwrTaBSprNHB0YHyW5YB7aeawDRM8FfNa/4qYyYn
    ePeTUD2cgs6+iuAKYk4kbkFOQKgcjxoC4JTE0A4veBkce+vC4nNHG5uoePSDvPfKnEOS
    +RDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=MgLdXFF/Sj4ih5qNSgMyDA1vEeVT9nxto8YHeXZw9Mw=;
    b=I/Zo0TdFcyNSAm05LYG3BCrJ86fFCVn411k2fVgCBVGwjss0eTA7Q9+DtlemZDWCl8
    Mwq5PYJraKsDQk5ZmAewAO3nMkLe1hsQrlJWZ5GRw/e6qbBTDMWo/x8a1w7eMk/KhilM
    G9zHjwsaUSRKlLC1LizaIpzGTWPb6iJF5h2LCP1so+JKeMuQec+Sa9Rcj2OJ/FZphNkr
    cXj2rrZm3dDWoeb037xgbZY77uD5oVNP9VbXm+P2K1GIHaR7Eall7/3J0RkEeBv6D22l
    SdtCdwn9GVHHVy201wqlsVrxuA/sXNLzfOb4zPuJBOU9I+I/AKdnWuhfsq+YMdceYnJw
    vwFw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=MgLdXFF/Sj4ih5qNSgMyDA1vEeVT9nxto8YHeXZw9Mw=;
    b=ZgzdlgHEyi5YYZxrwhfPYx4YYKDVyjAls5PBA/MECNAhwDbROtuyBSxg7pax2D4nNq
    VvIvqSH1mqFubVhdjUbZ6hUo4d176fmX2d3IaBqFTZLeeNXu39h1/1bTM/NlhXvMiTr6
    nKWJbAz5GmJnox9fBL+JzBLDQYMezUYPmdljwLHcpawTS2n491zVGbpdOGZ0iw2UrdP/
    KRlT5Z5UuWFQG+bgv+4TZAAKylAyiuqRmMa0mGD6J24lzNO56GtmZ/Ys6bkA0kiBOGY8
    2Wrc6nNap31AU9g9pDJMnHK2VUsufq5zuMaEa7n0VXWsgeEXHlFYv/hwBfBi+AQpmA2o
    zx6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792955914;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=MgLdXFF/Sj4ih5qNSgMyDA1vEeVT9nxto8YHeXZw9Mw=;
    b=HxmJzMSmxiHGMaGynzwjo4a1FnxEKnd2YI/LpCt1uYxUEYa1KAjlNaN5D58SGih9sH
    55BJsRbKVjfWc+tu/4AQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrS2poNy8iNoc+LWkugLIF0fnfvFgpgbBBt2w=="
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a229PJIXzQn
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sun, 25 Oct 2026 20:18:33 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/4] clk / clocksource: Add Ingenic X1600 SoC support
Date: Sun, 25 Oct 2026 20:18:23 +0100
Message-ID: <cover.1792955907.git.hns@goldelico.com>
X-Mailer: git-send-email 2.56.0
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
Content-Type: text/plain; charset="us-ascii"

PATCH V1 2026-10-25 20:18:26:
This patch series introduces hardware support for the Clock Generation Unit
(CGU) and the Timer Clock Unit (TCU) found in the Ingenic X1600 SoC.
To achieve this cleanly, the common Ingenic clock and timer infrastructure
is modernized and parameterized.

As a side effect of making the core structures flexible enough to handle
the architectural layout of the X1600, it became straightforward to fully
integrate support for the legacy JZ4730 SoC later.

The series is structured as follows:

Patch 1: Adds the device tree bindings and clock definitions for the X1600,
         incorporating the specific I2S handling, routing, and RX/TX gates.
         
Patch 2: Implements the Ingenic X1600 CGU clock driver. It updates the common
         CGU core framework to support secondary post-VCO dividers (OD1),
         and bypasses the lack of compound divider support via explicit
         mdiv/nddiv handling for the I2S clocks.

Patch 3&4: Adapt the existing JZ4760 and X1000 CGU drivers to match the expanded
         signature of the calc_m_n_od() callback from Patch 2, preventing
         compilation breakages.

The changes have been successfully tested on CI20 (JZ4780), LX16 (X1600).
And on LX20 (X2000), LX26 (X2600) boards (with additional, specific patches).


H. Nikolaus Schaller (3):
  dt-bindings: clock: Add Ingenic X1600 CGU bindings
  clk: ingenic: jz4760-cgu: Adapt calc_m_n_od() to core framework
    changes
  clk: ingenic: x1000-cgu: Adapt calc_m_n_od() to core framework changes

Paul Boddie (1):
  clk: ingenic: Add Ingenic X1600 CGU clock driver support

 .../bindings/clock/ingenic,cgu.yaml           |   2 +
 drivers/clk/ingenic/Kconfig                   |  10 +
 drivers/clk/ingenic/Makefile                  |   1 +
 drivers/clk/ingenic/cgu.c                     | 150 ++++--
 drivers/clk/ingenic/cgu.h                     |  42 +-
 drivers/clk/ingenic/jz4760-cgu.c              |   3 +-
 drivers/clk/ingenic/x1000-cgu.c               |   3 +-
 drivers/clk/ingenic/x1600-cgu.c               | 476 ++++++++++++++++++
 include/dt-bindings/clock/ingenic,x1600-cgu.h |  64 +++
 9 files changed, 716 insertions(+), 35 deletions(-)
 create mode 100644 drivers/clk/ingenic/x1600-cgu.c
 create mode 100644 include/dt-bindings/clock/ingenic,x1600-cgu.h

-- 
2.56.0

