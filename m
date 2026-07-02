Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A92480DD0
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995502; cv=none; b=kxZrwvhDZ5nRa1hieM+ClBWWPUTt8Z5aR+Hr9l+/7X4sQ0BeP5I1p947eBMvh0v0mYXEWGkXnGCWjFHQ1giTCfeUgQl1/9ag4NnV4s/omAW693LlmU95pWIw3U6b/IGQPMwGxskB+TEr3HjXbJaeenD9/VkpI4zok5iNfn7jGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995502; c=relaxed/simple;
	bh=8SJCiMa3lPfv/rTE+pQQTxr30mOA3gxwQGR0gmNnTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PU+ZQvorHksTRltNlJbnhNoz7dhOU99tmKel3Gc7Z/94e599BYzF2DMGu1oCW1sMlHj0TcTyAZaea1DdxYNxCriKteSD5TkoMSpubeGjF582hVUm5nOVurg7DRGoITKZB921lK73I8HGcQlCoKnpvhUIAmWGIBpGByx9YOMAe5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFtZPpZc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFtZPpZc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so2014052f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 05:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995493; x=1783600293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eithLOELKkNE1v5JgvDJ80gc2YnZ90Sl+cwRSRw9Ky4=;
        b=fFtZPpZcwflwpwdK16YVWrNmW7n/qa44AsCSQI07AHAuFa37DKYx6L4K9SbAkjzNUF
         7IN4qTxFfj3OCbin1rZ6jD3wggKqO6v3urGiEjXI20ZJgf0wcr0ej2o1myZnGZVgGTPE
         71i6Ia5NjM/Pq/tfKudmICHcT4VxH50VwaAvbpofgJ/BFM4QwSnZuubNjeRkTWpKwAkB
         Wrh79oklEU/PJp3d24kjihwkT287j7EmXhxL2rB+MHJovEquSCTcrsTpQGcOjz9GLW2x
         xtxWWjgcbgaYlKT4J3y638Ki+oKjfRJlG5rpIVyYrWoj3FH3eRl1fFz8KmZV0xSf9J5D
         y+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995493; x=1783600293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eithLOELKkNE1v5JgvDJ80gc2YnZ90Sl+cwRSRw9Ky4=;
        b=bB6nB+VrJ1lxr32rcg8iIP/zaDL7xooXxy01m2RNumehXf0wBWgsTLXg6fpQUKtW8b
         sr5bbcoNO3S5Muz/UD7mdV7WljwHjagfoy7fyhp37jqm/I/Dto2Do3rGEcyyHTnpyzMT
         BmQUIqBHCSV1ZR+zGLJfM3/XtLNoTE0hB5uIGTZAarNJq7WaxK6LuU0n9g+tP+dkDQbE
         UPcvjAkyJdwr/dpN320cVWo/qRDZt3Rnh2GdYvEvWCsdtbSxKNk2FkYInWSFYkAmvQsB
         v1ES7u00xx1PXF8U6l9YK2sx20nfZgcP6fcbR2VMw4BJRlsGSdhc/L1HaG72vS9xIkKw
         JbaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vcyzTjA1s50lR6tlClTyrWGT/gAPUlUWU3jvYTP7NVejNB1MS0zaho6bjzvLQ88sTUxygaTZpWaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZrHjGKnya88K+VThdk6RZye6Z036oUfGuCj41x6z5pXGfo3C
	GXOYvj1+2hoatAlHHz+zvyEiZwrnaS4+s7KA9VIxgaalsNiOJeRiMLBz
X-Gm-Gg: AfdE7cnWYs+HOW7wPJyFJIGdsfK8rRQoqp3yN42sImM1/12ojhqIxeGR7505yZZHhia
	OhMPKwS1mSXVx8q+5X8ZLBpA9P6ZRcuE5SU9P54nseP5KpXbvUUJYQHoS2ZqLG8PJATDubRSntm
	viVruL6Ywa4GXUIy/DQY4iNaa2JWBmp+Yr/opruRkrD+lMPWliOtAjZHHkQFxvFciUJ9ixgeA/q
	JLk1EnEENhMCo2Xg5hDNRZfqrDE1U/94Sh/MoP80Ph5SRAdX+EOdkb1pope5LdbMAJdAgvvuVVx
	8BXdKhR7V9OqrHqqh2XT3081bsYeP5dHgd/8jDGcj3GxbYkmqfi60WxnDeLk7kGABmPbqrmuWHP
	2wZeFKcBK6R8ptdvCaFNipCNlx+cznhvCEEe7Jr3PBPqioPWEHHmLiSUfMG5J5D0zVOALCTOU9W
	Oj+cxzBOMucV5uef3R3CziPJAHBqC8ybK6qqlY5Mqlr2lGxhw32ycRFWY6LJUTsz5fOTWZgwCCC
	/muEfid5xX5y52Bb0/i+/cJ4kc=
X-Received: by 2002:a05:600c:34c8:b0:493:a5f9:d345 with SMTP id 5b1f17b1804b1-493c3cf0a35mr71155705e9.26.1782995492556;
        Thu, 02 Jul 2026 05:31:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:32 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 9/9] arm64: dts: renesas: r9a09g087: Use SYS syscon for WDTDCR access
Date: Thu,  2 Jul 2026 13:31:12 +0100
Message-ID: <20260702123112.161160-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second region of the
System Controller (SYSC) block at 0x81290000, which is now managed by
the dedicated SYSC driver and exposed via a unified syscon regmap
interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sys" phandle property pointing to the SYS syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 165c404dfd36..90a2fd02ae89 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g087-wdt", "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G087_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sys = <&sys1 5>;
 			status = "disabled";
 		};
 
-- 
2.54.0

