Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037630C150
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779027243; cv=none; b=AxOh1k8U0PGwUt1QX/CF8IL1VdwGZlS6y6DNiXtTuy4Y6BnQDU7ydT8m5LptdedOj8vgtMk5qsWpq7kOutiVGPDFkrFimvXiRMkR8fhK5XF/MhXWzTFl3nybHSDo18nIWlJP0bfF49UNfCTLVD309hirgSHk4xljTUJH6ZVB+u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779027243; c=relaxed/simple;
	bh=JzYV15mXR7ZOGE6vAiOWahnTo78b0H7QpXMPWklQKyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6sLeEjWLLJcJa2Z3lGxGT8F15Q+/d7k9DGeU6/xUduxwEaKCS+8aHIf4sRdEyCB1m5z9QUHut5ySVdWS3Qu0npc9aAjCpjZVt+6UJ321EEJt89I1tbwlENkW0eglOhTa8Mj/aj+jxRKKDR3bHkkkuW680xk9EHmHUbv5x6zGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4urrvgE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4urrvgE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8379e010b01so490713b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779027242; x=1779632042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KxQKu0qPaPWJEtwO0UUAfVj3SWZjw97pz5Uss4p8Sr8=;
        b=j4urrvgEvqZ4NtrUmMZSL6MLeAAqK1dkc9Pz9Vy5MF4O6nAwKbeVu98aVNcGV4fEBv
         KuzuG+7Dy908g39oB8+d9cS1oQ7OmtrNWn1U/cyddO1+GxFfppuKAbuJnZa+7i268zhK
         H2Cv1ARr3/+WjxV5PR1j3ccDOSbGfYUAt+qnhDJHFrXuqQHjesdld90J/a0W01gbRP6I
         mPMl9GXf+/LoeTc3TIQKAi9Dh/jpCGvdRBCGlboZsh8EL29kJoSFftWPvpKIOf+hoZp+
         Z334Y/m6A2m9A3DAbyZkLoEgqxCB8ictO8mS4hZMlHqV+5ysqpRJwpNYegTwwWGI0q6D
         Hs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779027242; x=1779632042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxQKu0qPaPWJEtwO0UUAfVj3SWZjw97pz5Uss4p8Sr8=;
        b=LRzKCcEZDDpK+bgiCKm1vAiguhnOOYDK/jTOCRxOT+edYT7DoLjIBCUy1MkvzHfyJq
         8qJnqT9xoKIHpiTPr4zUZXdaRhq7kyryXDtGJ0IYHK2Abp13KgNdcGIyxdxFD8ksHkoo
         /1oMpz9mNvqA78yEPUCsJeubUC6lnSXlx8a4YsVPMyaFMZd1m2Hq9yDf+cqbrShI7VQB
         nDWptIpaEFFJmUhACxD2BbloHj96r50fx2AFI+EBAlePCHIRgXcJcDnbuqyXINQQ8hJr
         v49DSJpf5dvwMMnQsN+U8iFaFK5i/qJTPB2891iiUSpT2UbsbEqP8NPeAWGKhJV8zjYM
         u0Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9OxBIczZNv4E/3SCWxLuaXbsrRpzmngvFXANvi/yx9beEMd2AaKbE10rvNk7bSGZhvsqTlW8vWM48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxmV37HBZKukvZ+qS4NNxSzDf08RDpshG2NVtZhQ92uP4eFBk4
	yrCoMTepF7MPZYllGk0Uhfd6vI8XA0jxC9XEaTudiRCHtF853dFsL3Qg
X-Gm-Gg: Acq92OGIJRYoEsr+HyCDCHM0A24DlsbGbTCEcN10Tu6yCozR/i/yfqo489cQ8WKMnW7
	7KtrtORGNxOi1p92nVCndc2WxmtsHL4avkqbvyqTGfPd+SB0H6UhMbfkx4maXL49YcWKCKH+qix
	XKY7DE+pQJep4+4vzs6NRU6NzeJTrbjh7c08MMBTaRT5Mc0lT5uPOWeZ0yTSbMPmGdojwOir+ye
	pZqa/86U9QdnE2rZOlGoPTGNGzoO1OxIcVHfZSMepif3t1DQ8mmeCXOeKMyfZCvgVxyfRZ6Curn
	hXPE9EZR8jFKF7sBkv7qs3UKdwN6rBJhykulVCacO32sjvnk7gsXqSg4tMTgzjX37aRs3QgpYwU
	z88IKGBDri9uKunMtewgwlprSl5dxpCuDtb9LCmbLk7UJUdIihhkm/sjr0n+XluHoa2rUAhyD8f
	nvbiK0rVikBqbFvxJhsnG/7xhv95tK
X-Received: by 2002:a05:6a00:4fc8:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-83f33c961c7mr11808884b3a.11.1779027241731;
        Sun, 17 May 2026 07:14:01 -0700 (PDT)
Received: from guoguo-lecoo.lan ([104.28.163.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa5489sm10252528b3a.60.2026.05.17.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:14:01 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sun, 17 May 2026 22:12:56 +0800
Subject: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
In-Reply-To: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Add the device tree binding header for Siflower SF21A6826/SF21H8898
toplevel clock and reset module. The header covers both clock and
reset IDs provided by the block.
CLK_ETH_REF_P is a clock name that exists in the vendor datasheet.
This clock connects directly to CLK_PCIEPLL_FOUT2 and there's no
clock gate/mux in between. An alias is created for this clock
to make available clock names align with the datasheet.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/siflower,sf21-topcrm.h | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/dt-bindings/clock/siflower,sf21-topcrm.h b/include/dt-bindings/clock/siflower,sf21-topcrm.h
new file mode 100644
index 000000000000..3690b3452501
--- /dev/null
+++ b/include/dt-bindings/clock/siflower,sf21-topcrm.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+#define _DT_BINDINGS_CLK_SIFLOWER_SF21_TOPCRM_H
+
+#define SF21_CLK_CMNPLL_VCO		0
+#define SF21_CLK_CMNPLL_POSTDIV		1
+
+#define SF21_CLK_DDRPLL_POSTDIV		2
+
+#define SF21_CLK_PCIEPLL_VCO		3
+#define SF21_CLK_PCIEPLL_FOUT0		4
+#define SF21_CLK_PCIEPLL_FOUT1		5
+#define SF21_CLK_PCIEPLL_FOUT2		6
+#define SF21_CLK_ETH_REF_P		SF21_CLK_PCIEPLL_FOUT2
+#define SF21_CLK_PCIEPLL_FOUT3		7
+
+#define SF21_CLK_CPU			8
+#define SF21_CLK_PIC			9
+#define SF21_CLK_AXI			10
+#define SF21_CLK_AHB			11
+#define SF21_CLK_APB			12
+#define SF21_CLK_UART			13
+#define SF21_CLK_IRAM			14
+#define SF21_CLK_NPU			15
+#define SF21_CLK_DDRPHY_REF		16
+#define SF21_CLK_DDR_BYPASS		17
+#define SF21_CLK_ETHTSU			18
+#define SF21_CLK_GMAC_BYP_REF		19
+#define SF21_CLK_USB			20
+#define SF21_CLK_USBPHY			21
+#define SF21_CLK_SERDES_CSR		22
+#define SF21_CLK_CRYPT_CSR		23
+#define SF21_CLK_CRYPT_APP		24
+#define SF21_CLK_IROM			25
+#define SF21_CLK_BOOT			26
+#define SF21_CLK_PVT			27
+#define SF21_CLK_PLL_TEST		28
+#define SF21_CLK_PCIE_REFN		29
+#define SF21_CLK_PCIE_REFP		30
+#define SF21_CLK_MAX			31
+
+#define SF21_RESET_GIC			0
+#define SF21_RESET_AXI			1
+#define SF21_RESET_AHB			2
+#define SF21_RESET_APB			3
+#define SF21_RESET_IRAM			4
+#define SF21_RESET_NPU			5
+#define SF21_RESET_DDR_CTL		6
+#define SF21_RESET_DDR_PHY		7
+#define SF21_RESET_DDR_PWR_OK_IN	8
+#define SF21_RESET_DDR_CTL_APB		9
+#define SF21_RESET_DDR_PHY_APB		10
+#define SF21_RESET_USB			11
+#define SF21_RESET_PVT			12
+#define SF21_RESET_SERDES_CSR		13
+#define SF21_RESET_CRYPT_CSR		14
+#define SF21_RESET_CRYPT_APP		15
+#define SF21_RESET_NPU2DDR_ASYNCBRIDGE	16
+#define SF21_RESET_IROM			17
+#define SF21_RESET_MAX			18
+
+#endif

-- 
2.54.0

