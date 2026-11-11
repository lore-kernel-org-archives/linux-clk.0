Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395243;
	b=Uw48f5yc4J/KUEN6u6XdZKDzdn+xUBSyev9RtFG55cKnuRDSWSY9ZP/8wQhx4eaHGr9i
	 5ReP2tTQi/nAxdhzOB2roy3msbvYoMT/wy+OQ0qVpSqwLdb0oQu+39aGaukqXIS+rLyXp
	 7hel3pzpVF+UGXVg6mvbGXtvZbLvy8bSQzEc/JgTATAqGc0URM6MzPtSF5Gs6IMfBWQWG
	 QXdTZp4bim2NseojTJdcwjxMmd4V8iwB4NA3pvYdFwxmLblPWxUcdE83vS9cPC4ZPSUth
	 6N7u3px7uvbe4Obn2K03GeGAoTkHHsogCiGSeNVrb3tKGMgRtqabGdSEHcQTFt1rO/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
	b=3maUWg+yydeji5YSDQLHmQDD+b5uHspV8CVdq2/hMUbzSTohIo3EzzXO31A6rrwXyEEC
	 DUvkt0QpqQTDy3TCe7vcetfPynyOaMY5sGgAYmZBPnSg+RncGN3iNN5/o8nrv8N9tmmM+
	 5s02w88zq46QMj3iclIcWDRb8ltw2BrTKWJ1zKAKz4JIeS2jXvBBCJyR+5JKmDDBMfimg
	 6Q1aQ9VKQwRNtUV9qcRgLmHK/5dUvZ/hFo2GFhoo0pW++ceHB4+c50IGK8vR2j9MIGBXi
	 50BKxh4LNS3q0kiNOYof+R60cjSwa72S8ydwgnmd/NSzFOp18TpAe6v9su/bsi41gKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="en/3dGrF";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886F606A326
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9886F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=en/3dGrF
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32625545e9.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395241; x=1795000041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=en/3dGrFdvJrBqQhikOW+PJ42oaQqIk3OzHx9RLAfQDkUDn1aTsV7YsOZ0bPdfl4bQ
         pGNdLFmbTpKjWEAow8OWp0470oYPNjsmPTKJO5OttZRd5Hgmpfs+N1lRF21K7PdlkRQe
         xjFDWY2cvDZIIadt6edcvzW42VU4opvLx2F6Lf75Zexq6WKtFVrdD8O2g5SWjQg5f7b7
         rMgTdL09UL8EWI4FsvF9Jg45Wy3hHi0vdp8QKobs4CXFQp0EUyIURJXlBSTMQuEcW2Re
         BiyOeIuI9QRrChoN+zNRxRIDgPX1CpvkfePHqsIxEaQU8W428VzcuqWOVtk61X7cWXH5
         v1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395241; x=1795000041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q2NFx7nPmxyH6HT1mTdHW9zn6FjnTMuVSCUO/8QAwg=;
        b=eisoEvx6DFcsGPvDZqMxuVOhFbGOMd8MiXNf9xeRMI7zgmKoSyGeJYEeDG/izGOaXa
         LIJOFAdRKofJZeFHhVB1npcFhJmzE1LPh1DuDWHAgemWmwwXFY2391MTZ1DWdSrB2Uhp
         GlxyBdgT7PrqSweqa2MOR8IzyONd0JWXsEqjV/b8fNj4e+DgZxIJ+GZfb1YO7GrDp/nE
         k4lEYNwTGxUfWczVFchG+jUjji9+Qw9HomCpl1UpP5uw/goT2ZWgRJJRW7mcfyyv5/bS
         +uejvzPqNz5+P/crqtP725wvsWdOHsXl1zqeQOQ7K+aVA4kYlOyHcxdgCZmtdCHy9sfO
         noyQ==
X-Forwarded-Encrypted: i=1; AL+hErE6iTji2ix8tUO47iM8F80h+b39gN0LFC6XmZ16+8yN0WneU6UQ/iOyW2pN33CvohDGr0As4MytK8Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z95lJYkS6WE1M3fOJbPp/kGKQh87K/t0t1+lJJtFNkqx9gPj6rl
	X/IoSi9vpYvuYDUPrUmvBm+PD/+mB+4YmGrGqSWTnUPwUrUZsz002aV2
X-Gm-Gg: AYBFou2mG9k1JAcsBIu54HsAggKzJNR7Be0F2Ijy/993a3UuYwYkaBBN1qA5TWJgveq
	W2MEBy3theC6b+8EGilpBcmWmgsPd6SVgdRZiXHtd9npBgh2Ojtx7arGm1DgdqNz1s9hkyLCVxk
	0b2QTHXmoXWRm2RE2IBjhm74157SLopxsspZ+NakIpPxUfBUcCTos/+lrR5bMFkd90CAYy+J1hR
	QrA4zwX5IXCiQZ6yAR3HYy/CnOE6rlMojQzdfL6OUcig5I3aaBHjJLXuo7qy3G3x08JP74gicle
	S172eTmsx3kSuh1M0NUqklHqdePRkbYAeAMlLcOjttwvqxPqKJ1yS0wvfKnM1a6Xwl38Ns2cMUK
	9TNpG6izQjAuwz3cOxXmfntYyA7DrSaHFA3Q5yZZ21fh6oIv7FJ/s3bmkUe66qZYE4r4Hvgx1/T
	nOh95275w0rngrwYagetODWEk+4eJZM2hkopk5kaip3aYE012JThnq2Wu0GHH1PKiZt5qb4X0Y1
	X1FZ3rXWi3mo/REthCEPYatfOs8RBJMwOrrXkwKRD0lMSLAMIB39GMBfXTduAq7Z8WD5GHWttN3
	PWWa4plyvDppS4IdHomkDNPm4IbM8q0HSEPlxsxaHxu/nON5XNVfdjeXV+ej2VHHjDohZodCs6/
	qnPA0NEE7yJnxCIT84kqI3egqSkG63VxZRzVh5jaYNlcx61FiVF1dbPz6QENmPzX7kZK/WFWrNF
	QOX3JKU3X+
X-Received: by 2002:a05:600c:5247:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ba0937f143mr36040755e9.21.1794395240926;
        Wed, 11 Nov 2026 03:07:20 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:19 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 0/4] watchdog: rzv2h_wdt: Access WDTDCR through CPG/MSSR syscon
Date: Wed, 11 Nov 2026 11:06:56 +0000
Message-ID: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

On RZ/T2H and RZ/N2H, the watchdog debug control registers (WDTDCR) are
located in the CPG/MSSR SYS block rather than the watchdog register space.
This series exposes those registers through the CPG/MSSR syscon and updates
the watchdog driver and device trees to use that interface.

Normal start and stop operations use the syscon regmap. Since the watchdog
restart handler runs in atomic context, the series also adds a lockless CPG
helper for restarting the counter. Existing device trees using the separate
WDTDCR register region remain supported.

The device trees for R9A09G077 and R9A09G087 are updated to identify each
watchdog's WDTDCR through a `renesas,sysc` phandle.

v8->v9:
- Rebased on -next due to devm_kzalloc_obj change
- Added RB tag from Guenter for patch #2
- Dropped WDT driver patches as they are now queued in WDT branch

v7->v8:
- Dropped patch "watchdog: rzv2h: Drop enabling clocks in the
  restart handler" addressing Sashiko's comments

v6->v7:
- Added a new patch to introduce rzt2h_cpg_wdtdcr_count_start() function
- Added new patch to drop pm_runtime_resume_and_get() &
  pm_runtime_put_sync() calls while accessing the WDTDCR register.
- Dropped propagating WDTDCR access errors.
- Dropped converting WDTDCR handling to regmap as this would require
  resource address comparison to get WDT index to call
  rzt2h_cpg_wdtdcr_count_start().
- Made use of rzt2h_cpg_wdtdcr_count_start() in restart handler
- Added if regmap is available, use it for WDTDCR access
- Updated commit message

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.
- rebased on top of next-20260922

v4->v5:
- patch #1 is new addressing Sashiko's comments to avoid potential deadlock
- patch #4 is new addressing Sashiko's comments
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.
- Added review-by tag.

[0] https://lore.kernel.org/all/20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20260814191415.2110732-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: r9a09g077: Add helper to start WDTDCR counter
  watchdog: rzv2h_wdt: Add syscon based WDTDCR access
  arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
  arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++----
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++----
 drivers/clk/renesas/r9a09g077-cpg.c        | 35 ++++++++--
 drivers/watchdog/rzv2h_wdt.c               | 77 ++++++++++++++++++++--
 include/linux/clk/renesas.h                |  6 ++
 5 files changed, 130 insertions(+), 36 deletions(-)

-- 
2.56.1

