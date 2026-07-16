Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E441F358
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205289; cv=none; b=E5pkGkw2Q7Y+F0+p/+IVjfQKFJ/sClXakTk4mzs/M9G2Wys1yAavYsuqt6j1489c+OQDJL1THJNMGzL50PW1/SpSh6hoijMzfkw2Zlmi11VsKwODiZMPSt0n82WJNMiyNT65kPUoYh3lqZOc6Fy3kUxX25RYq3ygF9K09VXGuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205289; c=relaxed/simple;
	bh=Wa1AIz8mfbhk05oN15ZEbX3zyGwLprV0HUb4+AWMGuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkaWHoTJamH1nRJBN3u4EuefnksXZqsKP6r9wUzYTOFgxWb27KldDxWutT7V6gLJ065+Q7n8Q6RN3naVo1aOwYz/eiwV0bli0OKrYxfqc5Zh7EsIrKMqifA5Bg3dmFq5KDOdxnfLDyckLMOGsOUydkk1pnG5MEiwCLUPYf9g/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm4r0CS6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm4r0CS6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso4070808f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205284; x=1784810084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56txH24bSU5dTrYzqbX8viqwb9q+gnv6llw5mdYhsk4=;
        b=Lm4r0CS6MzLgoOLNEmfL6oyWrcyf6m4W/mqffuLZu4mwSxt5p98Yh43ergf1pK0ahZ
         3gnK75Vks6cWv/houGNAMSDrI9xOa7JcL83LnKigUATyFnaxsAXEoBdouKCK59PSoYce
         A6RChHxCZb5SgFrsWnNxkZXRz5HWut0f54xeR2rVt0adtworvI1wEJ+MyCzWUvukxLQd
         yGbX/MhRGu4mcANpmPL/tauDeoXoXeQp8UEHtrlxVS9mfe/yWz7iCZaviG6Fus4r78L+
         83imvlGxh5ly+Hw4rlAtbmOS9S4NLrX3D9ch4GDmNaS/DBaa0DRB2Wg/sPedteXd5v44
         ldJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205284; x=1784810084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=56txH24bSU5dTrYzqbX8viqwb9q+gnv6llw5mdYhsk4=;
        b=YqAbfsrIyz92/yX5wg7N5DHkPiYmAGNXLb4gMT/nqxwYwBXLcaWLV/VO1MhBjyhDIK
         d/dtnIiRgZ0jdAfxH9FFUstJ6kom39NZ9QPhnAQiyJCq2UCosvFe+L6n0XgfHHg8t3n2
         e5TmXtJIqdCRgMIxyr0D0fr4b3+cADyvVpyQjJXwRllDnicygOWsTWhDscGAez7l6ZEH
         XGqzSYgmQuh+YYxJkGpmB1SyMUMntUvu8d0EOfyJVzNO6LnBs7jIDvpg4grqOexzKK0V
         3awmiwG0U9iFiUbsbOcwCJBwKvXW3k/4MRU+6+mjU/ZUxi9G4BaIpAVKJ7cMR8Hfya4L
         KW5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpLWisEwboMPlL8PRGsLMZlugWa7WMRYXaUJNVV2m6eOpZOLWvuwW4OguUxms/AI6K+EAwTSL6zLfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJWlotFhxEt0bGzfdUbN/wZLLDCzc0owhpwbAnc/M8sVRQPc/
	Q3QTwZ/tGpR++zChXNHsbvTbQFV5QYt06vcPEvRxicaX2/tLdY8qkBbN
X-Gm-Gg: AfdE7cnFbJC8N97O1LxxT3J4XHVaAPrfzQwjV8K+4LqKGs9BJbhWMOUYIt5HUdq5G3O
	enos9rP8b3qQz1O6G9ScK9EZxSA+7tOFDrE+IS2Ek+GG+0kIz3nXJ6XBRUEzn6XIZTl2v91AYNv
	AjfShEdNrNrbbS31nhCY2/66lr25ECrEgblhODz1f+/OPgzH7tlt/ppBre1eMTzJjkM+ALcbkJB
	mSG0o/hACxRXs19igaAvXYnquee+9g8BdJYZ3PjOuo3BoQMLCWYC4poqGhu95js9cuMEWIZGuSw
	B+Jd27K7K5Z9QMceiCD35wJ3bseD8siSfIcMqTPJsvF+PjvrFg4QIGFhGk2yZVwVR9BW7gBr21d
	jKK2XlgNzSJS0zpUEmWDo8oP603MNIjrKlY9DIfAZNvJAYAgVEiufDNqRLfswylPlb1Q4XceNLG
	fdjt3M3QKRxGCrCJNFGG7lFIfcN+hH+6Ahw47+xDGK8bUqFrboo/j+tNO+v+7+w5sZIxIllhHv+
	vtA6QXaF6X3JXZd
X-Received: by 2002:a05:600c:354e:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-49538992ceamr112755955e9.3.1784205284363;
        Thu, 16 Jul 2026 05:34:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.43
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
Subject: [PATCH v3 3/8] arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
Date: Thu, 16 Jul 2026 13:34:29 +0100
Message-ID: <20260716123434.2576253-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index bc109035fbac..9c45266ea595 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1048,8 +1048,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.54.0

