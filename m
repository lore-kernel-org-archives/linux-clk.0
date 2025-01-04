Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6A8152787;
	Sat,  4 Jan 2025 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976447; cv=none; b=QpzylGlHa2IX/4tPCwWZTrqEO3knOD/r2KlopKfrIBfEzstwNDTX37D/Gg8ASVKPFi/u1T3e0QwyMBJ77xzc4S2jSnAKcnn6UYdzrLrb80AebS7fmonFAmqM2OVKlZTolFdjOC0WQczpi0n7b8+LB+qXIGOQJq49+GeRy71PStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976447; c=relaxed/simple;
	bh=TbcHVKRkFJB98fhajLRM7Bw4MBvD1k0xqRdfdhNbxgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lv2sFUWGVjWqnHs4JW+X0jo+UCco/+MlOSaGUn24/BvvZzHGyA17Qktq8QZ+GLU7VBrp14czGOq+OUj7tMxljhpCYCiCT2Skh2r4hiwmVId243R+YosJPPFaI1S6Q0Esrk5GOZ4ZngZVVLwe+c0W/TMy4YMi4ZLgvWE2qAKDG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJvidv+9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJvidv+9"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21675fd60feso238879725ad.2;
        Fri, 03 Jan 2025 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976445; x=1736581245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=;
        b=JJvidv+97EO30+raYoo0BTcPOZd1dLMkJr5Dg8MVqgM6avHsqAlS8hHKdQT68pcsVA
         bCEy9wRo5SlZTmr/cqslFkHB2qZUXjY/yEUeqTXpKBo7B80m34tVC+Kw1b0Q6SzVNtZP
         E36sdXmnz0bMCX2Lj3beyKXRbRlfNrbKQrvLxzEVIQEeQVqp+CQdMKHYCnF3Js3IkYQy
         6PODgVr4bgPfraiW4Yyj92sNKqWZ1eFP17aNmOfdIHOT/R2GOFkq94ELvuJ17C9n2GHT
         MhRqGXLs5eHkah/SCKl9uRHAbmkd7di7D83TzqMT9pWIqgc2ACH3tkkL6/N2DgYCwS6D
         6a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976445; x=1736581245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gI4bkaQLizbo3HOuEzTTJL5LyowGuTN5RlRxoRNNOp8=;
        b=wk5sbYamaGD7Zws/aJJQXjt9mKqiuK6wAPOFZiiRdFh5KblCXy9hlpLUrQG5m+hXMw
         odFPw1Ms3y0ZBi1fOjNQ7kb26V5sdAvesw2aqnps5zVr9U1KUwbrLB2BlAGMUkW+uijt
         7v2/L+i82vVW6RvUd2rYaZ4YsQoN3TS8TvNR1WH+7T3v+Mi/aQRmgGwYiHjan/QajI9c
         D8w1rxwxxUDIif/K2fVekWf5paZgIuYesWY/5TPQQz2AUP5+7d2ruEVKz87t57y76bOs
         MIA5wJyD5ruF1qvRLdPG9+KiKxQ3kMbjBj9ee5bLPDKo65t6ie6ZwvDvDeM3CK4zMUcy
         3LJA==
X-Forwarded-Encrypted: i=1; AJvYcCUFbfNmYjcVeH4dpWaIZ5+vPVFsze7XSLsT9xjvzViNGykBvJHjLKf4uwXv4zJTUXFwizSzgTFfAZ1x@vger.kernel.org, AJvYcCVTT8V3cnYg5qEsIzV1aPIvdQVNc7xlUn6FOp3WfGbcZjhwFBBDN2M9eiHYmcsJu4BJg9nLtosDg3zr@vger.kernel.org, AJvYcCW+0o5iN17yn0FOxbtwucIdn5dYfhleGybpO18dOVYCeWEFDqej42ZYhZnmSm51QDxJU2YsAc/0oyWQhFte@vger.kernel.org
X-Gm-Message-State: AOJu0YzosbWp1NvzgxmdYzSCGihajlOfkVNg2zm3KIZRjo0VX/vpq/bM
	h8+cZVb6/n+KrFfjdkLuj5xYRH8K9J/5HXhsayZSUwugkpvCQZI5
X-Gm-Gg: ASbGncu/iQHGL5HAkNhty0RpYkKO5KhIVD3bauW+BQtiKw09yvCqhZ7Zv7gpoI2jpMc
	scq5nQ6DqD50uRv98eQUdpf+4NSNh50akhek9wUNDDizraLqvRqjw9RHMvX2gxN4ANoZIyPzChW
	owVAWl8cUHK616k6zzOrUt2HJmFlzldFICfC1fp4nscitvkdr00EeUkEjrwoJwTLEJRVrtRJ5Xh
	6Iuz0jT/ZM3rnET3+R7ClQouANlioqAziDQPtFSWpx8C7BFnw==
X-Google-Smtp-Source: AGHT+IG0CS21q53dEVGA2oPLK2te0e5w/JAMFEKzZxo/+YczSEWdTkdKuJD2Fisbi6FzS2oAnAex1Q==
X-Received: by 2002:a17:903:32d0:b0:216:6c77:7bbb with SMTP id d9443c01a7336-219e6e9fb45mr689469915ad.17.1735976444999;
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1ca9::398])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b34sm256562565ad.252.2025.01.03.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:40:44 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Roman Beranek <me@crly.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	Stuart Gathman <stuart@gathman.org>
Subject: [PATCH v2 2/4] clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
Date: Fri,  3 Jan 2025 23:36:58 -0800
Message-ID: <20250104074035.1611136-3-anarsoul@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104074035.1611136-1-anarsoul@gmail.com>
References: <20250104074035.1611136-1-anarsoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL.MIPI. These are now
defined in dt-bindings/clock/sun50i-a64-ccu.h

Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on pinephone
Tested-by: Stuart Gathman <stuart@gathman.org> # on OG pinebook
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index a8c11c0b4e06..dfba88a5ad0f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -21,7 +21,6 @@
 
 /* PLL_VIDEO0 exported for HDMI PHY */
 
-#define CLK_PLL_VIDEO0_2X		8
 #define CLK_PLL_VE			9
 #define CLK_PLL_DDR0			10
 
@@ -32,7 +31,6 @@
 #define CLK_PLL_PERIPH1_2X		14
 #define CLK_PLL_VIDEO1			15
 #define CLK_PLL_GPU			16
-#define CLK_PLL_MIPI			17
 #define CLK_PLL_HSIC			18
 #define CLK_PLL_DE			19
 #define CLK_PLL_DDR1			20
-- 
2.47.1

