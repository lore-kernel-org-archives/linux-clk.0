Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48A41F36F
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205290; cv=none; b=emtqRtV7nOTqKQV5NjGoUCHZzIJDvK5ZxlqkgTts2eM3zPcgLeiX1NAnCxPDM4ZwdTJf0f39w+YVxB47/4N/KOw3TPopblCXh+uWksctaaFDkbaMWDOYtodpy005zGVCpg715N7ZyWseCdqXzLr8C72qKlEojlohj7UMS8N5Df4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205290; c=relaxed/simple;
	bh=/0p5Q0W3edFmMR0JKwMJPCO5SfDsNlcFcXuWBH5t3OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QonB/OfohCUUPktUCkX89JTlLXWKKWINdusuTKAbkk1U7Ua+EoeFc6Mm+8X4wWeK4XrCc+oFvJQzEKpX3E+a59jJuWEY5MJl7Ays4LTxGOEFyyifeR4DVPr289Su733XLkF8XbN6rWZRae0GS7WGqgfFXKVEa4NE1NO9hhcj3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3/rc1Vg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3/rc1Vg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49546e16075so360545e9.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205285; x=1784810085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioMyijQQOZNtEM+SPBByFUPmrnpXCyySvgec/gk8ZJY=;
        b=j3/rc1Vg+PKv/i/+kT9ydO37rv38Xd0xcVT8cswXKnNapgL/cyl1oJix/ITnMxJqSM
         Ss4vzfpinKoUE3KmpdYORorG7+LALKydRAU7DgFVwGcGyhtuApJPTPynjDniDbXTtj7o
         Zmq4Yp6m2zAE1LngZVbZtUagD+luOdWqtAaTNSRw8OGaHU493xM5bti7v8nfGx38nNZu
         VINDaV6SNbc0MSFZgohdSZQnngoXrZZcrgcdMl8rGGoscFKAw2xXfh+d5zEIR1/AOofI
         2MKJZ84m7E3LAW/HMxtGNK3So9kDhNjC7ai0UwQkhZCK8yuaPuAMPhQlyAqVz+mFPr1I
         pt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205285; x=1784810085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioMyijQQOZNtEM+SPBByFUPmrnpXCyySvgec/gk8ZJY=;
        b=LRhTVvqS/M/LmMLwuw9y9nlMTVpzLv4Cg7mmCTskezhSn5SeFEZYAGTdVcSSVn2D7B
         R74TkwWGcbIyxTy12dsitasEOpp6W481lsvbToOF3y6xjfJAVLK1Pv1kISlbvpsugi9V
         BlPtxnLgyAPy9R0WABxIfbKkz9b8NqKkw+LhTd9iw7swkt3LOKhC2kxf9xUZhESpT2cO
         +/rumiYZaH5m3Fd4ZyNSbCdVG2/Dm/fYueUH8qWL4ck54GSVX8oMTQLmIAeNGpmVvSvA
         tTlqwvp54PApVDvXK+weB+TtgSbdFCK5mun4/2lyN808xnDF8HFfB4wCbo0Xa1WRr9t5
         Wd2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqTfsGxCrEXCHRUdS60Z6PbhWj4rkmSp6bjBHmDmx27G4ONTQRqwoHQVwLfkr1gVjYBakE4kK61IXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXf/uiZX2jrH9mBMFY80RDVhM7TqJ0t2YePPNNR78ZXDAzW+w
	Dl7IzgnNV2k7ufljMTJdmPVCBAbwUHfyM84kDbZAUW2X6rH/RN5RKeXz
X-Gm-Gg: AfdE7cnwk7ajDXSMQ7sq6BFXQM12Lfn8qEm/aIieO0KsxjncID1FbmFZtCeIv1QUe90
	T4RgxckHDkdMju392gfwRzTqxJA/2BI/3XB67HNX6YSj9dW8Z8OVRQRRkCNUTZBhuvcmQ1iodEu
	M5awwIG7Eyp/KroDsb3eN2liDbZY3wRXI4HEXD560CUZ45CvDwT7+yIYgrnHcdr9ThabyuEkaUR
	gSTd93+9Do16AXeRjFzkX2bTK2Q1eV4LngTB+rlenGm8YDZOq/RuE06FwnEYHlHLJm49xkHceaH
	xr6HW83/EHT4r1OmCAWzn7AyZmVWlt444TF6F4zz5pq+UWBjiZebxjd04/S/jMenutd5pT2dpAb
	pb/dbHU6cDRw+63wardi5fpwKhV0xdp7IeSbSwEk9R28FvQdKqZtt/9PZQ/372R1q+4gcVXnnMP
	T1x3XIRt4mG0lXQkJCDKyXB4KENv2h3ZbAz4C0VLwF64E06bys8x4lqdD8nJIUf7MrfzJv3cLsC
	hW0lZb0118eTyvp0n26rCajwME=
X-Received: by 2002:a05:600c:1d16:b0:495:3b2f:df04 with SMTP id 5b1f17b1804b1-4953b2fe00emr83467695e9.34.1784205285272;
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/8] arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
Date: Thu, 16 Jul 2026 13:34:30 +0100
Message-ID: <20260716123434.2576253-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the size of both CPG register regions from 64 KiB to 128 KiB.

On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 1f995d636dc3..718e6c06b9ba 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1051,8 +1051,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.54.0

