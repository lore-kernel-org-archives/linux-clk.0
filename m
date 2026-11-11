Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395246;
	b=OTZ9M1bzJqRmnpgaUK9t9kL3UINSKFpy+6RaXpHKjkJc1RxmQfaVqv+CKFvCP4EwNKC7
	 WK99CKn1dz81vP0I8FKrL5zCtY6YeGh0pi3UtV2mntO6gA1Ba0y5r8p3fIlsFPQNngX4H
	 IizltFwAoVFSy0CVBpk4/r7FjBe15jP+RsCK1RmbCOAGIM9j/wm3LFIL9bxQZshVMpIrp
	 bePNr4lp+tHXVRrctTb34COEeb+BMsltfMOtubwgQNS2S1UcM+CX6dV14J9y2Sy+maNoI
	 f/5vkjvb5mT2NDb968nNUPPV8Iv6Gmz/SEG9UU6I0SGOeX6uH4272meLjLoGlIYB7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
	b=c7Xoi1oJWkOVWkm44BsuEHMeHK5qhnv4lMLPlprZNczybDsGbbJYBWWh8Y74ceQG6dv+
	 uIPWd0tW5C3zMTF0ZmMhz3cgLUnierCSk1BP/AVxvQfHsdZfJ/E6ygRp932qe5TMc7OPD
	 2dcrAEkHpBW5IDKlLiNgYvYOCrfPa9mk1t/NmTvem0f2JkTdDxKiurK3IN3QJHSYZg4Os
	 97yVssOgzmmL+H0ybu9XU0eyB4nSdWGORt8KhOBqNp9Oz9Rq3cW5kdZ7bbkcXJps7LToh
	 u4d0hj9eVnWhf/aCwch843SAxcRHiHMxRjUpcCMHtlFpgp4HbA7Jk7JZyLIJCjAZuBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C62606A8A8
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C62606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KV5BJQEa
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so17980235e9.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 03:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395245; x=1795000045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=KV5BJQEaU4htQDaRkbnxr7DuDzj4kgGeEfhToTDv1CrTxoIOjCIvWU3RBgL9h7DIgL
         O6wMLLwkNiBHGmNNJu7Tyy8SwnIl62SQ+7IKS6P6JBf6PoR9tWJptCpon2bwWsWqshKD
         y7JxqYFHyvdoC85pKBsbHEIVXnvHa7S8iQVQ4G6ofsFRtRgVYmQ1jLkhd7XmzWlgVq18
         LFznO4HsikwwUcUedN+JvAlG1eU++1ioINed2uxEzcVV1uQcsWLBDemePUSTN3ecXts2
         cIQfkjI28RD63/5CulQjxKYwgHxd6gcIoULHhGSq7T/TOvB5okJernHgXYLtXyfl9yHd
         YCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395245; x=1795000045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n7jE022UMmN+ZLB+al6dQVRyXDSvEj4PVxUiWuWub7w=;
        b=KLZtGzUAHNRAhpcwhOP6ToE6U0MVca03WGWopk4i0p6kFZnqx4F9ThiNRBejUHmp/c
         6dYPJiLOYoEVVn12iSHbi/pBz59DrirLFXYHJrzsbpcP4RrkFeCbZQgqtRGLdZSSAHDV
         URWCNNCwBaQ3NXSNMOJYDnmwQLuVamJ9if7+U1NJz5cAXkUPYtjKIOJO52An88ZzQZSi
         b/g9dcoRJMfz4qVxXXs5bdpaVfhACO/rPtcUlxwW5isNco4A+no79HZnb98h028+2NiN
         3A85qhxxa0Fh7EZx1o4u5gSB18gt5qp6+Vu3GxCwEmERXJESXJpMeTMAQHI/wmwr6AzG
         Abuw==
X-Forwarded-Encrypted: i=1; AL+hErExJiU+twcXEP8wlx80r6h184wAfXhPlugBK4ZdP9M54/HLMfBjTQ2R0k+/KPq+5LIaPUKzJhdXEKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ua+bQGRnpYzNUBi+1lw0PQCdYuJFPJVBZxUWsxqlGvgSmr9lP
	iGG9QgIRhXz0JTwouEzlEmCtqKPs0D7/sjsQx7xkkHsMVHOBCuApdEec
X-Gm-Gg: AYBFou2UbLhXOICXO0/r9GPIcnn43tpfzzAt2UIQ5iETfP6d6uix3t+9ZbRtMj5wras
	k+9hU2GM59/+rM9OcCDFJBo95SD0cbXy+TM0Tkh5G49pvgis7LSqnNUXmPtu7C84tVNWtbBHbcw
	N7iwNWMz0iPc88gOeToufWU0DNKC1XovZsKY3thssO/I/baI9/xU4nQamk/hPNxyuiqzdq1HYOK
	GxXQIlQAAHY/W+oUIKN6KSM0DLdZ88MiQ69vzzlUo2aceT2VJIK8Ki5gYO48rQ7EUZz1qazsKG0
	nfzzCXDPEgS6qzERPHQTUCD/HKNqi8KUJDmgW9GtC+u6QeUXYbGtEVWR5TYJB/V2Tjse0UsxLou
	v8eboMQPmQK7Fmq8bS0N+LdWALI9fYb2skKk3CuzVVr5OTZ9pNWFyE8/lDrHxESrvAHxQ2LlORC
	Hb6ZOJRakTruJUr8C2qIgVKMUMeNxtVcIOS0GK3f0SNVglpPO/bpSRmKJdBhvF1IPNV5839xjq7
	AMVcHdkVeuJlTXqILe52FRh/eO3BUGbK4OCxc+0YUkt2l8tAtlUVBwN9IGYTOHfFlW69O5DstZT
	wAu5/u1M51VRZndbqm4ubuV0N0Fk7m4mZCZJ+lj87HhD8MoykRe0JkxvzsYP6Mos9EwFJ+RYCSi
	c1mWlA7zVrTWgqVyCfkgFctsX0UNftsjfrG5V7ZyMGBAk58hZYCqruoIx/gDqeZRbIIU5d81hWy
	kOhlEdtdkE
X-Received: by 2002:a05:600c:4f10:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4ba093c53e1mr41140325e9.28.1794395244647;
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:24 -0800 (PST)
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
Subject: [PATCH v9 4/4] arm64: dts: renesas: r9a09g087: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:07:00 +0000
Message-ID: <20261111110700.3331225-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9:
- No change

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
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 243b851cc0f1..9056df917a2e 100644
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
+			renesas,sysc = <&cpg 0>;
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
+			renesas,sysc = <&cpg 1>;
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
+			renesas,sysc = <&cpg 2>;
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
+			renesas,sysc = <&cpg 3>;
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
+			renesas,sysc = <&cpg 4>;
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
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.56.1

