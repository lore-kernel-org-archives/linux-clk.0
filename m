Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4064EB866
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873540; cv=none; b=IOVSQyi0XdX2Cj9kmowrZWdIu6PPtqY2EipsHP4Ej5RKsrtIVTWE8l4y9rmUVmHdA52fnVI4Otrv+3v7FMbfdOZ8HJ8RzjQjO/oY8OUP3UzcgXIhi8+uFplEwnFWYLJpigAWP3/6kEiuOJE66PVvGU0og6xQoT0f+nZDpmsEsBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873540; c=relaxed/simple;
	bh=uVcGLMDH2AwPjF/HVDOvxlHAEX5/rPpj/bHGgZgWVNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYVifDx4Hx3Hr0PxKdLuHVc0Os9nNputHtgp0yFJBzUpNvABuf8+71rnTBt++rS6Lfy5RLMxbsrmRlbv8eVNQ2F0q7rGXkvRDJ4aDyusgrwuOuIXjzqaZwvo06Mt/YBDZNjVNqunqXhFktIJCljVscZKQH/vF1MtBWsqhQe48a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Azg/RB6c; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Azg/RB6c"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so37254925e9.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Oct 2026 09:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873532; x=1791478332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KlgcyMNqAZK4e7+PLpFwRaSb7sPrb5H2u572a28OOk=;
        b=Azg/RB6cGTpZBEOhO9oYwMk32uwx40dpZRzVXFfQ4dGSiD8/4ab0LH+Ij5fXpdfNPQ
         /195Y1xRMyTVQgExxl9qgMzhhE/h5JJoRM4gWKeUsRLB7HOzmDaRYhyoJD7mn9p+dqF7
         UP0CpyAvd+k+QslsWKb1Loe2X+E69308sW0gDP7WfSwfWny40SsUUwZfexPAA6Z3ZJOD
         dlKoFozHYpLX6BFcRfynsFyVS/3fYewaXpaUHmR+xUVmkKcKdKMG6f7zY8tVpN8j7kjr
         vwbKZAwa0eaQFxOgK6bSpVWfKWE/lbQ3A8Bv0pli+EltNn/kEBZDVZgl/7su/DmvV2Rb
         u+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873532; x=1791478332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1KlgcyMNqAZK4e7+PLpFwRaSb7sPrb5H2u572a28OOk=;
        b=smI5bYouQYZVtK0MTKEueIGkuQ4o3CRvndLqwqEjYoZq01DUQVojpozi7uW3N1QQv7
         xeQQYmNFkREX2OSeQN415pWBC/HlNJW0kwIa7fHlptQ+avfdN5yPZvfNxLiECehUal8j
         PI5x0skIiwxtYNs9EIh1IDqlQcAHHN1Lys6nxe3iBxFUGS9ND9LwzYK8C9O9YA6Rc9q6
         BP/ctgeFWSynOIc09mhFvtZWEggATl2TjvOcxLcOO3lkwFgKERfpFumw0CWqQ5jDcfQL
         6Sm1QUruDbD/Xofp15AJ/z2TpVb8UHQ9R5dJUmci+2CCWy9j5k5ghtt+ZjfKyaVKKz6K
         7z5g==
X-Forwarded-Encrypted: i=1; AKwUvBzdjGzRhtA5S0LX11IfAElhHNeT1yvBKRfUkvisUQGXnzgP5+H0iwm58dvanZYD5HktKh4BfHaBLaY=@vger.kernel.org
X-Gm-Message-State: AFuF++kCe1udrybtme2x3A3GwLPj5BFbmOaWGO+HqKyNG9Jb2jX4V90p
	BH+FESGZbbsfF1A4wF9eHzhkMIBMXyrvVyd0yfaJkOA2vNVmjG3zYrnh
X-Gm-Gg: AYBFou2wFVKXv7DcHe89q3yPVzQFCb51UPemBIQh9eBj9VZqCsAqwVt46xdVlm9M6H/
	zdInuTFkInDpDBmEwaU+s0dHTTNb/GIKLIVObcrm6SoLaD6YV/Bl8+ZLW02a11KCbLKUOUp19NC
	mD5AA0NRuTj2YZtVjAELvZHIX46PKseiFtKce6HhFNqf/BtvZatXAR0iS604xN8m7TdhVgZoqY3
	dbzjTcWbQI1b0DV8Pp8c/A6BAiMMYsfduYFlDWqk8Drqo3DFSse0m3NwQvcsNdYktqbTfLxxz3u
	nBOmMVkcNMhuv32T2kbJIy7pEI7JOiHSUD1ypPZuGPnalfWZZ4rs478Xe4k6xgfbeQTjLbTI2I7
	+cZUBsAvFn+cXnPV2wBQ5P3oXhz9KXSvcCN9auhR88spAXCojVUe6lwLaVp3ewocx8qDBIOQ7vp
	9qj9fw/yGI8AWOmfL4kJXpleYdBsB0WAk0lEqMC41o1Tub1c3/wcv9SZvmGoVyAQKIGUBcExOz9
	cF7DcjZqgK2JPoXMMeetiYf+EyT8Ket3mXGzo2/CzxZbwXPMhgq9qjcwYgaN1123DV36EjPrSjd
	t2D+cmmq
X-Received: by 2002:a05:600c:3b1d:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a0276b5d6bmr3767235e9.15.1790873531845;
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 6/7] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Thu,  1 Oct 2026 17:52:00 +0100
Message-ID: <20261001165201.763882-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 674e35e4f242..18d748661a60 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.55.0

