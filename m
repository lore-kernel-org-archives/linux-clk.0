Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185728;
	b=L5/z8C0b9jX/PfSHEO2ZXX3s7mzxRu9Ht7w+YH0PrNurKSNOrF8MGo+F5vcM5CZECRVY
	 QhdMsISshgtYcdmKl9Z04VzF88/7ZUlfDiGFIA5oAbYnXLtEt09QlnaXSsGwgfDRbUgov
	 QgPzhq6tk1XhJYGTfbnIKAQMRPKe4E1/q1XCkvywdJ7kE3pe0+1DYy61zB49JRDqJqtF1
	 RORpwa0taMfK2o+M2o8DMsbLIA+SEdrAnWDOS9cS0Li4rfe4bFIbaDFdMGtPOWdYmBdr+
	 sBNkBRoFhWGynIC2z2LP5O6zfyIM4LbrchPDEfvgA1aKZQf7tj3RbHDhBW/617H6dpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
	b=egi7mrJtZRPGabXxNZf5vPAsvTIg2hbbxmAlMQUY5r8oWBnLnLicfBCug9VVrqSIECMl
	 KMkFgyUXif21D17OiGfR/SjZdiJEpxRYUClPTEp9WgyWmbUlZdH/TSbyWnQSBA4Nh0cFU
	 NqrMhGBLSd8Cue3VcpakGbt4XGJpsG8hFAsJZk5oczgnnimSaL9Ku5ySzDQ+wYYX8CHLY
	 ZC24tABYEQSM/x57SaD+dpTu9GpWsGfXYfVbHGtW5N1FoCdYWKONzW8frNiQCitEKxUEF
	 UJUVCOkqmhe4IVFQ/83pU2EVVQUBny5s/k6i9u9zD0UiM8yJlc0rnWcPyO5jAuxP8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m6cWhX/h";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ABD606A330
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 14:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92ABD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6cWhX/h
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0213202fdso5273055ad.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795185727; x=1795790527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=m6cWhX/h+b4vXn0BU65hYZ1zM6hIfx5Tbnm5Bv4U+zXZBnmCehNRvh8U2QNaXaJb2Q
         d0SAx0/VgeAnBdoq9aEBjAtKdSnOBiojRWOuacpCsyfzGqZdJX62SewIO6wagtcGd0dv
         X9MoGqeP5bKHbNozjErqxadLUf7+Ofe6EuwDLa9smiVJ4GeF+Uu8A3alGBCYD/OqrpZl
         JAyQHeRCXYOaFZwN8sBeQaAEeAQeokl4WreSuGNsd+OsMSnQXyBWruAWOunomuXNFD4H
         RGVy6leVWqPX1tRaQV6vHwT1NIoaZC3UsaaXEoEZP/tf1UWWiveMaCxRChwgp2Bdcec1
         i/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795185727; x=1795790527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTmGpAk5ApLPXB7Y5muckWXrGowRihIuOzQJLQl8RgA=;
        b=rRVY3KthjIo087AS5X+QTvFLeRYWYZOx/ixsknLVgGEbIbb0R547lydPcyoxSzial8
         aM9mpQOczYEwIq8b1c/X+BWbdsKNoya8I+omvgVWnt1nQZxHzZQAx2Q4gg4YdIs+gnTa
         6HdvE5nIak3YiFTof6E3TF92oSx1v6WtSqJD48s9Mn/yDUz248mL9sePl4h99fTxhCIg
         1A8X25piR2gBTta9jxOPkdEp5r4r+OJLe7kLT2rFgdgR8PWynnvS/LUY/cTMJ1XMPLpI
         Cil0UmmalPMnFnHxGNTnnG+HJU0Mgb4MfpD0OAyefrYrGY6ZwDB/PRpkYwxLil4ccO1+
         vieA==
X-Gm-Message-State: APuU4Z9L/uftcMRGIFj3OIxYnQ0v6FJweucSXWhKVj1RJcMOkVtPswCG
	ud+ZK67KrEyjRPBSI2IpdrCfCUbdabmSsUU9cvxBZgdyVBFrPNWES3WQ
X-Gm-Gg: AZFdTZc/lEhHYa34Suyo7e2LZVXboxKG4o3yZSHWA7xdBTMF2OUCmhiyp+aHYS1mumS
	SO5uruZDU1hph6OAVb28K/FtDEE8nZruQHRTmzFIFBU/9gybINK7jGG5zHJcw/40oLDSDyIGDvL
	u/319EeVPc/nEObexjH7PXGS11ehik2yC0BlOJpKmYoKA6Ff5Ghbk5YAVAB8FGEpGwZOPLOpjTd
	BtdHvTwzMV7n6qkdoDw136So5nBicbFt9pNY0mofER1mBpqj3Le5FHjl9tYyUzkDvcppJR6nns3
	iySs2H7JT/6ayaVAk6fSQLEyWDvXNzm+9QDzWdAitPtiPmK8Z257QB8T6ZpXl6S2PRfi2WbTDHo
	W1rR9s97TeMXqHwJWk+uv20oJVWk8SFsIjZMj7GOHc50BTwbFIlMFuhUv+DkAmcLfbnI5WHmYFi
	veLyB4GgZCue+YY814F4TENjAlb97XKq8BJUqz8YsuUDL2aWNUEHjLZHAhhVz1+a/nIlj3sHsiC
	J/0I6/6KM2gZKZsJ3Gls/DGAExhTaeR4rIrz4F7w9eNe/y2XELcruf5SiXP56MKswcmKoKMniSI
	cI7Ubz19yKJngfxzcztApci68tVCLMZdQxW6jA==
X-Received: by 2002:a17:902:eccf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2f03f17c766mr37267005ad.19.1795185726811;
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
Received: from [10.98.15.223] ([2a09:bac1:6500::19b:170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm15346435ad.10.2026.11.20.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:42:06 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 20 Nov 2026 22:41:44 +0800
Subject: [PATCH v2 1/3] clk: mediatek: mt7629: move clock counts out of DT
 bindings
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-b4-mt7629-rtc-v2-1-cd877cd496ae@gmail.com>
References: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
In-Reply-To: <20261120-b4-mt7629-rtc-v2-0-cd877cd496ae@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The clock counts used by clk-mt7629.c size the clock provider arrays.
They are driver implementation details rather than clock IDs used by
device tree consumers.

Move CLK_TOP_NR_CLK, CLK_INFRA_NR_CLK, CLK_PERI_NR_CLK and
CLK_APMIXED_NR_CLK into the driver. Keep their values and all clock IDs
unchanged.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/clk/mediatek/clk-mt7629.c      | 5 +++++
 include/dt-bindings/clock/mt7629-clk.h | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index e154771b1b8b..517c43b19f18 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -17,6 +17,11 @@
 
 #include <dt-bindings/clock/mt7629-clk.h>
 
+#define CLK_TOP_NR_CLK		108
+#define CLK_INFRA_NR_CLK		6
+#define CLK_PERI_NR_CLK		22
+#define CLK_APMIXED_NR_CLK		7
+
 #define MT7629_PLL_FMAX		(2500UL * MHZ)
 #define CON0_MT7629_RST_BAR	BIT(24)
 
diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..cff9a02e8302 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,6 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0
@@ -124,7 +123,6 @@
 #define CLK_INFRA_DEVAPC_PD		3
 #define CLK_INFRA_APXGPT_PD		4
 #define CLK_INFRA_SEJ_PD		5
-#define CLK_INFRA_NR_CLK		6
 
 /* PERICFG */
 #define CLK_PERIBUS_SEL			0
@@ -149,7 +147,6 @@
 #define CLK_PERI_NFI_PD			19
 #define CLK_PERI_NFIECC_PD		20
 #define CLK_PERI_FLASH_PD		21
-#define CLK_PERI_NR_CLK			22
 
 /* APMIXEDSYS */
 #define CLK_APMIXED_ARMPLL		0
@@ -159,7 +156,6 @@
 #define CLK_APMIXED_ETH2PLL		4
 #define CLK_APMIXED_SGMIPLL		5
 #define CLK_APMIXED_MAIN_CORE_EN	6
-#define CLK_APMIXED_NR_CLK		7
 
 /* SSUSBSYS */
 #define CLK_SSUSB_U2_PHY_1P_EN		0

-- 
2.56.1

