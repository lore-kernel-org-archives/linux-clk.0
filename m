Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274619;
	b=3s5IXUkJ5KESOPZ5f2ZthYwa5MTEV2o1WqKtwroCxmi92ZQQ/UcPdCNbdqvZtzjtq2IM
	 2i8yUtStwj52tlH+ibCljyLX0IAE6n58EX8l0jCRnSJ1OPruYsQulmENy96g3Qv7uOv08
	 SnJxQ+DpAySw2ycpkFfw1eFy8tijy7jYR/5A8LNQHDGsEK6uae4EyvzRqs0gw7veDmeO0
	 WFYkBWePwaIhxLcjcVQ+scTLZEfl/awqHxlGwYrYMViG91vZbkNImckc91LhkD/qEUYJo
	 wd3HvfCpwN0960ytceq5cddK8xTdBFt9vx1vACleLYNbxbVs7RJVbXwpXffzUwPLaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
	b=0X6QHkUkDY8giTMu6jYdMENFjRjWW1OQg0yXuAEwQXvMXZkgwvwcZEGXJaxE3fjoUTzN
	 DOSImuoj50FuiHj3+qsU8xTRHeQBe3+7HW8PjZaS58qaHY423kgI3C/g5fC6dgxifPeuk
	 Jkmi3bpsCva8z6kT4GeiHlj/7NeOyzT94hSsqkc31QqToKjmBPEvpKzZURXg3zh3TbDLd
	 LI7JoV7HhwSbQF8Z9t2sg4vCqs1JISyLRRkqsG+LEtO37Irl/VU+Tcep/NRG4puB8ziuE
	 sSgDhY4gEqTrH8NChBBKAU2aHz21fnPfpTRwyxQ2FTqugUEVHicPC41BQE8fWxPA7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/Rw16cP";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3160A2617
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED3160A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/Rw16cP
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so6244985ad.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 17:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274618; x=1794879418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=J/Rw16cPObp3yLW1VgpFIWKU4KeUmtm3z4y2VmDbBVazCBovIs2FM5JXnEVwLXyb2X
         9STnPdgpuFcYIdVM3DG8uWtyf4DXNvgRhjft5K91+pQhT7yhrFIrgtoXTAIJHEMp8BhT
         quYrdUTNAh8JM7KNW1t0MQ5OVtX9gvOFWrqA6oO8k4/zq/um962HANiY1NnnRKg/KrG9
         fOaVnSYKG8QsM2w6ProTIwSKcQr0Q655EEfVLg8h9CFjBGNo4xnQ6i8wD5wdGLBW7ZZg
         dH4UkYQ+JHj3usvF6fExn9sBCZq4T3AwLIH/QZsRXIBt+1CImw8EVTclYFU51Amf5gvS
         xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274618; x=1794879418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgiLeA+AUEhjknnf87xwKUw9Fc6CxmoE+hmCmn2ebwY=;
        b=OnBIEvOPC5T5NVZtu2fF0bfglq81P+rc3NWABlJH6Xa4ZXnjFaXBVS/fxFEoZd7+zR
         YqyVGb6PmNIgix3DPJ9qUnowsYQIJqbYQ042D89j68EY8UnrU7ysk4A8YhRgwAT4edkP
         bQ4DROpXXUYO8xOONxpSgwisPrzW5sKHwrlsV4Zuf0Md8lSFh7fxd78RVaUmwJ37N3N/
         uLxqsZA/XXQxNay9YrNNcufTvcd4EJT7RXrLHsWziZ08CE1rfBr28Smp/wqy+TEX16oh
         BQ27tpZcET0SpuBvuW5VrXC2cni7ZTaqIAEwMvBhgkxSNuaAG/TZeRHWknL0zsecCJkE
         1LNw==
X-Forwarded-Encrypted: i=1; AL+hErHPehj0uyF/kpjBR/PInDCBYihiSnysjFNMdeJQUfUL4fvqJIq1n3JWlpH5l/16XBiuU1ovbaQ4Cjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V9AGNhWArMinFmB/vxBCCTPPPma2Kg5Tv395zerkBI5A41VpQ
	MlN2Iy1PEmNs43Y/ZSpqozEbQdS02Ivkcej/WDNjc/n3oRa6y3Cxwm2V
X-Gm-Gg: AYBFou0fS3zs+RZp1KfFFghtCBGelsAXgehIYn7LkGKhkN5eu9iJLPpkmcTFvhizq37
	OonT14Uhgvx7Ax18PE6irArnPdLNAkSqMLn6GWHwqu0ghgpku7IkbFaKFTo94k9af48Qal8e1Ej
	amXNhPQ/CZdkIgnW+5JYs9/uZ5D9se7HPtuRSsfgQ6iAhI26xgiAFKnJs2SzYySlmnOziDgVg/M
	Wz6qFoy43Bm5mi19Z6unY8U4h1w1G9tWD67ieLorpG/qU4ya6w+GhxOlMlAxrKjOFTbzmMFL0bk
	gupEs2iynBtnL0l8MgFRjltnl2g3Vd8mtW75AhOXxHsO4xjLNXqpkbWM/MHSrRKmy7xZzjYdYiM
	C7F2+vsDGNkBGx6Hspy22WsSaGFZGROLge2devEVNp9mGRsNdOA950sXc92HJO0OG0Hj4OCey6v
	vSfTopNHZIEZsUVBik6jd1qpSZqqxYmQShmGF/2Rty8TDqPwe66uLlyHJJ+S2XLYVc4gsOZC2UE
	Os+LvGzH6hZFDc+S24HN6697xicgMg1VNVpOyvS9Xals5gQYPRg7GSaeUa/9Z6RXFb+3ktGuyJ1
	XxuwInxzJUv5NYkDrIH8ik4xZBIlGjxVSe/rKtkJadB1mbinxwU58xP4wDY7kz6JMiOdmqVVXXv
	lavJI0DqxjdEf/N+uTNhxXcbgcCPrhT8hNYUOH8L2BVE7OndM0BZiEwsSgNB6Iis0Y+GMaQDWkr
	D8ug==
X-Received: by 2002:a17:903:1252:b0:2e9:5c51:19d4 with SMTP id d9443c01a7336-2edb912cd82mr9735785ad.29.1794274618427;
        Mon, 09 Nov 2026 17:36:58 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d9efd6sm3399055ad.50.2026.11.09.17.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:36:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: clock: ath79: add the PCIe PLL clock
Date: Mon,  9 Nov 2026 17:36:44 -0800
Message-ID: <20261110013646.1582970-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110013646.1582970-1-rosenp@gmail.com>
References: <20261110013646.1582970-1-rosenp@gmail.com>
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

Add an ID for the PCIe PLL, which AR724x, AR934x, QCA953x, QCA955x and
QCA956x have, so the PCIe host controller nodes can reference it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/dt-bindings/clock/ath79-clk.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
index f8a98e4d206d..e4956afd151d 100644
--- a/include/dt-bindings/clock/ath79-clk.h
+++ b/include/dt-bindings/clock/ath79-clk.h
@@ -12,7 +12,8 @@
 #define ATH79_CLK_REF		3
 #define ATH79_CLK_MDIO		4
 #define ATH79_CLK_UART1		5
+#define ATH79_CLK_PCIE		6
 
-#define ATH79_CLK_END		6
+#define ATH79_CLK_END		7
 
 #endif /* __DT_BINDINGS_ATH79_CLK_H */
-- 
2.56.0

