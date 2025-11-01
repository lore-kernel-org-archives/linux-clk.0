Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850B28E0F
	for <linux-clk@vger.kernel.org>; Sat,  1 Nov 2025 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973251; cv=none; b=Dj6bpc6n7mzijoJMj6An90PYwjrbid1TZVTQlP/x0g/IPPlqNwJ5ORmnCXfA5GZqKAVQojz+qUO9iRvvNx+249kjpokH7nf6JgR3ESp348E+91RqAVg/vlrMWJmMFZkQyxSG6ZRkahiVHTPeGDBASYDGDxJqzvIrmAiDJAs3TDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973251; c=relaxed/simple;
	bh=gNkcBk5b3Jhb+g3nkspOg/6VmVpI3bAfh7XCxvUGOGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2cYOfXB+iVIM7Ji5w2YU2pq73ate2CXgyI9QlmX0UlahJTx0ewHDy2uo3wiqci5zHsVmLe6TAH2ffEL3vMKp0F/H2+G0p5DuQGu37+Zm456HkeXUFZgze/X2u5Hu9N1hLbq48TX/6THDZ/wTbZ5vdbLWLu46lr/DyO0RAOs1Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8t8Vvgw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8t8Vvgw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33292adb180so3214296a91.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973249; x=1762578049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLxEbqXFOSys1fkuyDgS6YVeyPEnVIaluiwVwN9wD4w=;
        b=j8t8Vvgw6IaSVm1vJjERIY544aasnMdvOLDj+tcO6IYArWXrWRY/ygSyuyUyMY6wma
         ciODLO2e+/spbqgo4EMKmnZMO9/f3J2Z4R9oh6qRgMOaN4FxLUThNf+2liBFSxjMMWm1
         w1nlJIsw4d41EKk/7BhDfOj0MZEdyvCVSKORqPnSmSIPWQKi9BV4OoJIjP81Y1RF/Ct+
         cYGkuh4e3wevxMUgXk1xNWj3Xm7B1voKPCjF0coUtbomOUhOR5BbOi22phGH1Wf0gHRl
         oTglC5GsDvo9xgvu9vWtPAEaW9ArMRoTwbHFLEaVpR3gJ0cmMGysQLFt2MLbMBppBtxl
         khGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973249; x=1762578049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLxEbqXFOSys1fkuyDgS6YVeyPEnVIaluiwVwN9wD4w=;
        b=K7DKNRP0L3NdtusyRPtuk8UmbrE4E+Cfe/UZr0RQ6UqJGbhJpQGVEiOk9fu1EtVaxL
         JQDXeYqvDg5tI2W6/JKV7MuRFbvXKtjU98QwJxFbrtVg3xtCh0S0woeSKV0abg9/09j9
         kVr6AGq3Rr7jZu/wbkmhnCKt/aZudH5xOnhy2jk9UDnqkwCdtd+0NzbZGxhAsaNqTE3z
         54FUYUhpuK2/8yxfx+Fx2z2Zd4xSJ69b5oaN6WBQtlt/0+RFMEUSi9ovPmaw3/M3ENxC
         HnuCjGC4X1hgopbcPa4itXZ6vmGFtLGfGiR7FU0j4djMxrXclprm4hQDavT+q/vfzNxU
         t5kA==
X-Gm-Message-State: AOJu0YxkYXajnaWUYtxVoqOOnF9Tx6zJgnXArqUWkWBHOklL2+TNO+YP
	npyJTrXEnln0prVnonpGRslCRd2CWm2E94+sXM+f0VkYDk4A86Fee8Iy
X-Gm-Gg: ASbGncutrX7/OfyXsX3Yn8I0pT5LCjAJRK73VF1TSOMBYcpCXYhUOmQH5tTo7+Z1QID
	DAJfwIl5W1IBYAd+X6CKR1/JTZNYuJ/GSGIh9a9vwSP6Ol7MPPS4IhKd2IC/xhuXdVW7I66ub8M
	G2WrdcBOc2KTqjd3RTq2t44R5ptQjHC77Xv4zatU1qKEla/kKiqqemJEqun6gxc3PaomhXcmpRc
	Vq/fLDNg4EN+7nwj4YVZCQB8OoMoWo0kH87qajc5psLEd4TxIDiMiR6uSA1Wd81D/jvCm6lCK8U
	Jf+R9ZZSXuuA4ci/ZEUlTXGaNGGRRbvQWm3WxJdHvhg1BwAcORiNaPpkfgMcfZODIboFfAyz739
	hUZ2eQ0KnW2d+H6CvinLV6yi041zN09baBiSkQX3OcILz5VCOz0ghUblJY0RCIvOKmpWN+TixLz
	XskSIZ7BDu/oXdOcPFm2p1FYmd01TG2XQ=
X-Google-Smtp-Source: AGHT+IFdN5hHVmgurX//nCd5fuS9Rr9NaSNkMhWsVrS8eB/7eP8n7yZw8P4C3wajjw9mV4bnV50BEw==
X-Received: by 2002:a17:90b:4d05:b0:33f:ee05:56e1 with SMTP id 98e67ed59e1d1-34082fc42d9mr7584949a91.2.1761973249547;
        Fri, 31 Oct 2025 22:00:49 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:00:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0 core clocks
Date: Sat,  1 Nov 2025 05:00:31 +0000
Message-ID: <20251101050034.738807-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add definitions for USB3.0 core clocks in the R9A09G057 CPG DT bindings
header file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
index 5346a898ab60..f91d7f72922a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -22,5 +22,9 @@
 #define R9A09G057_GBETH_0_CLK_PTP_REF_I		11
 #define R9A09G057_GBETH_1_CLK_PTP_REF_I		12
 #define R9A09G057_SPI_CLK_SPI			13
+#define R9A09G057_USB3_0_REF_ALT_CLK_P		14
+#define R9A09G057_USB3_0_CLKCORE		15
+#define R9A09G057_USB3_1_REF_ALT_CLK_P		16
+#define R9A09G057_USB3_1_CLKCORE		17
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.43.0

