Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581852;
	b=tAhECGKPHlpfJa1SQYPu0Pddg4K2TPeq6wTAJIv+gmLEUfcE+3IVSAj7BeKZNMHBaNBa
	 liNs1i/fvKd8o+sHEe1qlYxVXAhohZJjuIZkgRdhpaThRpBRwOaelmtQHZ1U96SCAaUwd
	 /UTXaCA7Y+0/OnCd/sxwQ9glQ9IqvTn02TLrqtefFTcz9kocDzz5Q3yNwzVc4UXCMq9gA
	 HWV/6lZ4NtnrxqOCTj2P6koILeXLZAxvc5Blh3boOxGaYoKWdk54dV5uxQPPAJ1uFxdaE
	 +qUmqJQe7SK5iPbOgOIorpHS3LbOUmfYP6qhmHj05dXRIfBRkeGn2Si/jJ6f8uDjh1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
	b=hHBWwFAyj3cECiG5ZqDjp1DwneIJ389MDrpGbK9lJ67bCGW786I4RpEQVi8otauGjRpC
	 YDiyPjo7a4gNOSSeragHa7naQ+fV6SI1AQ/wqYRM6WOSmiuXevkJPkfPoe3g1qQRJoKz6
	 l8mzJCraWUQJoS/pzJ3s2WO0w0isxNkViEhpd5SqBFLOqe73f5h0/bYik+yr3dfpyGFtr
	 2ygDAUUc4gU+zcnOgmM/4VGf6tpC3ox+8gKWflb9wbYIAaeV6jvUW3/nJdskqG61OpxfN
	 T3ZQvUNTkzs/VI1xSVfE85eZyRC4J65/LMbwbMM4LiNUgztzGD5C8mmpZ5p6eH1v+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSb2TeeO;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3895606A32E
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 14:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3895606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSb2TeeO
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2124735a12.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 06:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581850; x=1795186650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
        b=qSb2TeeOfqYxdl6INNgy9h3ub88SEOE+2AMeoT0Z55svj9LU059duuYDeDe/UJCXSv
         AFZgdxzysj61CAKRHItHwf+pGcSkwW68urD27vAfJgJZxQYaEWT0x5hE6VFZKuUzkjeE
         0AArkzF/A7J59tylHD2hVeJOQmmQQps2GdevNPBJylx2fQQlriEwbTam0MNTyZcZz+EF
         XEJ6CIlcm6NlB8CzxG9PksLd3PCERp16PL79CuBZ1rQD6261GUYJ6upd2nBt1at3XZsY
         OI56TTWG4+V/zEnpup1Ku2pmPCaSKGDBD4vSPqUZdqVGNpQ6j6iLzfSlC/eilQLhEA3V
         U6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581850; x=1795186650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0s7+TUXsxqSJMF8+AOhfn4oxVCHYdPYvQ+XI0fV0j0=;
        b=ebo7AH49+a4YUf8JG8gd0fPtdF77/3WKsKxtuexJdUd8T48kcfNWmxwZnLrgmF+hwv
         y+GVy2AZZF1HQLkMhqi0kdJRkodEDOKPPWLot1TWxkvAHE+FSeAPafH+9/tywDWQnlLj
         qfk+X+1mnRi4UvCkbPhrFZVgoq+giv64eyOcH+iUoV8gvqN9x0/IxPFV9NuSIC6pkWra
         fT6+IbNzil5OUHrPvzbDE/7WEjxwcOPv3YMLt1o9B9JHXy+Qfx/tbicJbfL6gP9GpE8E
         y0jqJ/MGaMFkK++XZlo4PWakyzfq6uRr8zpC1492l0n5ZnpmOJeoChdu30J7plEXGxEs
         mpaQ==
X-Gm-Message-State: APuU4Z/zlY3YJswRn9ZZhKNXdrOcXPZWdvaBg92Z+U5JPSLuetKmKE2X
	3ZEdSBPo0O5ykpoK1+PvXdGgIA4LYzP4F1lcL/J6LXX0MLM0i0C1GT8v
X-Gm-Gg: AYBFou2YaBk35uwQqeOMJvR/jqTN6m4j5PdPnDtSPz6Ri5aJBJPjRl/lU1B7B7J//YL
	v8WHvUVtuxjFw4zan6+++omc3fLkoHwkEr4/ejWUj1OVKCQRoyp8qv24leDZPuZBak/oHr1oP9S
	X3uYMFkR8kJnGm7743wKoaMgaIQy6slOEST2LzE6j0CNfBu3NZgzt7mKBx7WxKRkyzX4oq/tno3
	U0kfP6bR2l+Ey0gcX68X8pf7USMmW5bDlLvI3kkfGMdNYHzn7tQpS0JUmgAn0H9dS6TtToOJzRO
	WIrK+9ak2y8DZhXGYTdnv9DdkU1ZrqV30x5KNBwVi3djAUGi4VgfuTJzNjv4l/A2XSlg/I0gUCp
	NLhCxONPRUE1Fh2mbZ9h3+OibdoqUP3kxWofyL5Y9pdZy64PcyygrqaWL51tWQq9xJWVcdH1fu+
	Rf7ThBPnvNZgKLIjIqPiZZ5Qs2Rg1t5M+ldMy/XEN9Q6O4aLzdGWkbyi1zOwAzmCBLT8clOU9DC
	v8Nj/8Kir/g4Q9TSHEF1KeqhD/3c9kydKqH1JKju8VLaB81TpCvL5Xz0utZ3t/7VLAMA3i1ES7d
	Dt96vzAKY58/K49iP0rVPdC3C+MD1h4LEp59CwRB1nhdDrESXPsvjNcGyeBhQgiG4HLcF2t9TYF
	A1Bv1Ynf3yw==
X-Received: by 2002:a17:906:9fc7:b0:c50:521f:13de with SMTP id a640c23a62f3a-c5096543e9amr251235466b.35.1794581849950;
        Fri, 13 Nov 2026 06:57:29 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Fri, 13 Nov 2026 16:57:07 +0200
Message-ID: <20261113145708.261530-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
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

Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
clk-tegra114 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c         | 1 +
 include/dt-bindings/clock/tegra114-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 97f5500b13b5f..80b7f64125d92 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -47,6 +47,7 @@
 #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
 
 #define TEGRA114_CLK_PERIPH_BANKS	5
+#define TEGRA114_CLK_CLK_MAX		314
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC2 0x88
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008acc..b53f5942f4bae 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -341,6 +341,7 @@
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
-#define TEGRA114_CLK_CLK_MAX 312
+#define TEGRA114_CLK_CSIA_PAD 312
+#define TEGRA114_CLK_CSIB_PAD 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
-- 
2.53.0

