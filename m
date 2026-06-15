Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C363F39F2
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534403; cv=none; b=Y1wVI7C7dQnYnpujcOX3FpG03IdKLbuWUcL9spt26w5J9ADVcpmjyEeNmy1N9dXr7K9Sx2cSjhlYn+UMBELRCsJD7dQpiwSo0b6nNJWq1hDQjqstBuaTWVE/J/KSzjHQ3Q2vRTjyVPhwjQT/zzqGTY8JtvRr5Uhsklk33TPASnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534403; c=relaxed/simple;
	bh=JXBb/DENU8GdVa8lZmTQYk1UttH8sfz6FuqA1SD1a0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bB2eM/O833huITTlZOPC66etblIX9NVal03OkFtGOBeYWe6+rGxYMQ/RzVo5JJEO2KkZ+GtYtfQYvzbkIuTwriyzGnS30UBxtrYbNZRlXEArkI7kbZKjZOwWr11joqkBqEEY001zuteJyuAHzGuSfXO9MxateJKF7euOaj/L1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJvUK64C; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJvUK64C"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490be03d47bso36347435e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534401; x=1782139201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgHUqEX4YwadNzzP4twhRjf8gxLZ7z91CpvZQHdgg4A=;
        b=DJvUK64Cl1g1OFjWsh9HOh5rN4q/FD73LFc5436a9jsEEg6Nrs+z7SOopKVFBS5JP2
         nszbIbKUPdUuFm0VMNhcbEiXmeyEoGEasdtGyVVeeScsI/pAQEBBH/wqYX8nf8XmzgV7
         riv+vyBs/OeTl+AP/1bj9sPbwAeJxvm6qt/jEy40/ssm/uyW/3L+LtfVz8mZg/YDyey4
         SbsORcu722XjbkzhXS3ZATFqeVTPstcDzEF66Z4On9Z+ymrjhiF4qr/rndzEPyhMKnVH
         z+Obfwsdve13hzKnl2E0kf4P93gK1k+soNEnmsyBNXG9s+Vme/MTWOP0fJfJR2yZB7O0
         almg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534401; x=1782139201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgHUqEX4YwadNzzP4twhRjf8gxLZ7z91CpvZQHdgg4A=;
        b=N68Z4oNUi6bygB9Bza03rQrBPkXV1T1EsQw2122qzurukkiRIinQThdaaoktc+3X/W
         xZKJ+A9PjPex4APxY5iym1zXZyhffLdzTZi2nwnfjVK7rHnRr9bDyfums65gWYRriJDi
         Zt8bObnMuum9Jqg86Uj5TTw+Vm8k+uxs+iHUKlLWAIyIUmklw3nioigLdZFmsBV+WDSC
         yWOEKtqwVqccMxbBVj9QTtPt7iX5ZwUlmzXCqBTm7K6VqOqZ1F/kLBCjAtNlzKxocg9T
         m105GfhHF4oMdPXRg7gTwwLZfuaaRT0dDs+ooJJGawtU2DSxaG7DnorNA+Vww+xKZ3jk
         VuWA==
X-Forwarded-Encrypted: i=1; AFNElJ8I3FNOnSdbflhbaa8TVw+usntkoIEZqOgsWv6zMPtqHPpkqvDyDzSO2IN58DxkX125r/4k+LK1Mz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtp6Wz9q8jplNmdCIhUKQb63/s9CV991qPZ6DHMWlck8DgAv8a
	JZNnhIb64s4ZQj1C3aAh1g4VMF9pjDX3Xq7HbayLObj7MKTnLC9nIgyg
X-Gm-Gg: Acq92OHs0N7imV96Z/rY0Z/fs7OwMon86g1UoFFZwjfVd38Kjxb61h27HbrjdDwImFs
	Nq91pdYVnkj5BVeVh/6PWtme072cyeaKMj0UwU2Olr1M6fo3/xsp7G2mUmhVHiKTSrOojBpGHMZ
	8JquqR7OqZhPpgecIliNC3ZDKTaAqVtPOQU1f8StuVbxPIlFZ5+tGduWPqBlqWUNAogRefkm+Ne
	7Po+xNAgt8n43LEfdjmvJLXG3RmeNiEeR/RdsrVuXseaKzglMObCKFiMjwpZXbWCVelJdAS6lGP
	eB04WXx/gamC4MXLI9otH7t+RhKe11KupvpLAXFMOFKiigucNccIT+gpmsxGpSan1/XY1h5uzS7
	/oFac68XZzE4E54SoBA4DpDA3UfZUddx+olmUbn//cJuNPkUIf7GXV0nipWPl9+ZZzf2XpSSPNU
	qEyFjw0bXO/MILs44atVpIUerzJJePHxQb0paFcpDEoNVGbcSRTAL6URl/Z6vI+WOdiXVSifTDA
	8l1kV35It1gd5U561isIoLVxLA4qPf7DZpu
X-Received: by 2002:a05:600c:214b:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490ec4d7879mr140056475e9.15.1781534400816;
        Mon, 15 Jun 2026 07:40:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:39:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add RTC clocks for R9A09G077/87
Date: Mon, 15 Jun 2026 15:39:41 +0100
Message-ID: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds RTC clocks for R9A09G077/87 SoCs. The first patch
adds the PCLKRTC clock ID to the device tree bindings, and the second
patch adds the RTC clocks to the Renesas R9A09G077 clock driver.

Note this patch series applies on top of the patch series "Add PLL3 and
LCDC_CLKD support for RZ/T2H and RZ/N2H" [0].

[0] https://lore.kernel.org/all/20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add PCLKRTC clock ID
  clk: renesas: r9a09g077: Add RTC clocks

 drivers/clk/renesas/r9a09g077-cpg.c                    | 4 +++-
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.54.0

