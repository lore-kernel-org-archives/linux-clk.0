Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61E265631
	for <linux-clk@vger.kernel.org>; Wed,  2 Jul 2025 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456245; cv=none; b=XNhiY4Ga0fNwEIjHR2yKgULLJXazbAR4oXs5y6Hjj8Hknq8SOgzvfiPHnxhRz9FJ43C5RyhIBRYNvCxeJKVE8PgkZw386EJ22PwRg279xzWiIoff985JC7Wmd9Aq/AsoOIjgK9sbaECCoybHdAs1Z1lB1h3R8JokSeCoKWFFXpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456245; c=relaxed/simple;
	bh=uhCWHyd3B3M9UnF4Ahzw/jZFjxrbH8IJ9YEb9lQ3JC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP5XdV18Jze8uXBN7KdmnzXnp0PSIxRO+9AMaYxrIzmSwNiBx4D3gIz2odLa7YwX3GriHBwdgnpMN/m+zWcW1lOE1JabnT1nMYjDjyxUjfBZXytVnfD7uVrlw8UF0AE8GPHixC6PE2VtkwozyNcwDWrPA88ViX+DtCjY+xpkljI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=tQ5D6Cvr; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="tQ5D6Cvr"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fafdd322d3so48221096d6.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456242; x=1752061042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MoP1pXdfqtHiiOeYolqOqMKK+HZ6JiOVPla39TeeGl8=;
        b=tQ5D6CvrnzyBoaeHXpYMNjsa6Z7Tf9bgvUsFTgyWW0LOWaXnGQrjWtgJm3RgrnPLFO
         pFWI97LQoweFtgqLUzF1ujPCgLTQuBoU46e7q7cP2ME61ZPDP65o0VlB3V+6QQivIiJk
         C1YZCOE6MFDptQHQ3Ijz6RCwDvCaMxGbeGRzsOfdWDvDxp9leEMRwFPXVrdG966aR4B5
         /0rIECiMvTmlv0gKfVZIgPb0DfHcpzopYmev693eNHU4CzGXRd6kfsI+1fS/I0S+H6Ut
         LkohNPMPEiB5R51EBIR67N5o5NgHoFm95IJFuOhx7wai9+uqJMaMx5pJ9rlBhnC13GhO
         gQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456242; x=1752061042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoP1pXdfqtHiiOeYolqOqMKK+HZ6JiOVPla39TeeGl8=;
        b=sR1YAoIqvK03qh42zOYfja2BB/WULvapb4OhjlgE2I3MjGH01OjJkoGK5rTHAes74p
         ZNjoIiv1GB0jZjm36uRjwUVB7bOrikToNwl367m2A7/abU5g3qyNwCdV2camUbzDU2ie
         rsTFIyBNuVBnxXpuUB31y13W/PEjmVFXMyC66uV5oOmSiNdeqCQ58v/etq20ddRj+urQ
         R3iaUzCLgxtPQxR2xCvwZo5NhJwry47v3EK/fIhH+GGPQ7az+934KAHyNXh19z209vho
         ZIhcw12195ClPJnvG/qby4C/Vhn3q5jqdDuDmOWOuY6J8PlvkTE1GFd9FRljj6PJP7xz
         esgw==
X-Forwarded-Encrypted: i=1; AJvYcCUZmoZIzrYfy/UPGTGt1r/AckyZ/3Lzikbs8UJ/qrlsB1XRL9+CH7FmZau5WH74DeRN2abDSqaNDec=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGIls/TS3y0KPoBm97/Jbl6lo5xDLhhFdZsG/O76/qsrao/vLe
	vh9uzrdZEWXuqh6gK04SoolacivLqqI4N3xk7N4dW/xUalLMz+yu3StqIM4p3AqweGc=
X-Gm-Gg: ASbGncubjohN439EFhkUvCiEp8CLysNun2LvYQyRjH+z3FzObP2I5bwyRbJhjmB4dUG
	NFi/yAtuGjyALv2THYCOZpWICrFmk911D1MlxmHzBPN8xXZr91+x9E5Ys6hTL/Hn8DuLylPmssK
	zdlC+A473v6MzAH8YKAjJegQiXYTKmOHfFaVfKkxsXXcR+RrttOyoZl1tUXtKBN+1q+9hlQNMhs
	gtyE8qhRdvL0ZZQL3Ne7AiSabi568t24Opyp7t0M3/bBWB3xD+lNywosNdR35d7ElZM2gp05Its
	9CNqjtnvXlTFp/4/FrmtboX0qfuPmRKLHvB39A4nNRJfLxhmfnAMBMT7jCT1Wb/uIAg2nbhpoeV
	RX66EzZP2KZ9JtXcgqlJq4gU7V8Lj+GqG28FiEntW+tnKQw==
X-Google-Smtp-Source: AGHT+IGVzvYqyb92eSOlmx/sXh5kUAYoEUgvaX7Z5vlbrOx+1z7amBVysl7FNglINMkR5+bJnESH7g==
X-Received: by 2002:a05:6214:3006:b0:6fb:6040:5d4d with SMTP id 6a1803df08f44-702b1bad9e2mr41519016d6.28.1751456242594;
        Wed, 02 Jul 2025 04:37:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Wed,  2 Jul 2025 06:37:08 -0500
Message-ID: <20250702113709.291748-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..4bc69bebfebfa 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -562,6 +574,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

