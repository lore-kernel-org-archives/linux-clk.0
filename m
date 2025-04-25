Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3EA2472AA
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583192; cv=none; b=XgiO5OCEFvVbCza8bNwd4sek2IHQJxYncN3C1X5b6w+iWt2sDO8CoOZaA5YUlsWn+KivVSOO3PuF6aa1xXNRnEuqVS5hE1R0PE1LaOG0P0XEdN2axz6XSc+kz9TXx2XzDoMVnLh6rMIvgLT8gc0oFopYD+m82egHx/lDzl581Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583192; c=relaxed/simple;
	bh=2QSrxoYOverHHb40rXjSOych/UQsUvsE24KdWp1Z4Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agPXD/kfGEFrTqUfKhltyNzh1ZChXqK+Z49puLcE8BpnXo6aecNdL6wmtiRezEq249n6UOkaM/Xvp9NEcOtivbEvMsHs3hatOz7W8z7/gPYbvKEGjFk1ELbJV035kGKs73cOTW5u4CZzpcJJpCpOpno5E4CIP+8MiMoJ4TxeKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=su0qQoRc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="su0qQoRc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1298177f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583189; x=1746187989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9xIef2eRnQUDq/ep/HtJdR5E8HKtXe2Mvk3DRjArp4=;
        b=su0qQoRc3X+/uCIKC29xCx6WU0GSNR85BTJcrLjFP8OK20zw8n6yScXxwd4Ba8IfM7
         6jdABIdfXi1olrhrODYPsR2AHE2RvBINTMMz66pjioYY84qBp3TNLj2f7cLbS407PrBt
         73iAb9fUPfZbxCbK8f3MtV3oBeAgJzNkJatISBNmTfMhXnpf6YryVLJNPpqqwLAi1XWY
         r4M1Pjsj36xKghk2h139cNdRZKt48eUF6CDDZZJQkupqTMfoLJgzxOHYM9R6l4YKlK/S
         fzVcYwRVGEZftcn8KNPV2sQvnyRAlt33uoZlHamqS0uuQTwetoX1l7LFhAXBdW54A6jc
         Rgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583189; x=1746187989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9xIef2eRnQUDq/ep/HtJdR5E8HKtXe2Mvk3DRjArp4=;
        b=M2b8u1CB5hEvVQYhcZek3/tTjcs4U8TwKgXWd6TpgGyWTjB8kUV+pw0qXTGDT7OiYg
         79gnyuq0dGQnHNkY7LdT55Y4gBwLF1D1OOf6UDa2iLi0SwXwBnCpejhpopdzQb2g8HRX
         fLkFNvMYshHiWN67SXhMXbiMKaAMjQD3buZsEBRnyG2ojNPmGwV0esB1oHvfFgaCx6Bj
         TAplzyDNe9EVAOr6gLTaCJ3UsDlGdGnItrFRiI33Kwd6XgO4RFwAOhnrVZeRm/mAzt6T
         JNFXVV3lJJ0KZEeg1qdqrRMjF5+du2CkugIACVUCJ68+SYLaKw4dsfpl8A10m9H17O6I
         /bDA==
X-Forwarded-Encrypted: i=1; AJvYcCVMVnXQ3Yzoe6wjQqUFF5x/SuA528mY41QUrIYr8BhfLWYY/zg3NwFdnawXblPyM5j/KxdPNQ9YS0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8J2WE4cjD62hIVUDzB6NHdrBJMOuEBJV9jZgf0G8nlctpDRz
	2wx+49HOGunwHdDf59libzp1Fy3kH/Dj/3D32bHk4+Io4Jehw6ykznqGFHsJmOM=
X-Gm-Gg: ASbGncvUfLksGoZtuX6WOGsTmoHllfoSvSJjJRG8gsjcrEBoi9ow3R+/LJ6nJM4qnPl
	5ITHalVZ35xKarzIm5QaX65KR/MtwegD1ZoDOmhvmQsAb2pmhRAYinwXrdt2m7dOcEM9JClAuzC
	wTF7fmOLXNukaYfwwc2kstKS2B0A4ljFdt1CTYdL5PEKLi9kAWHg2MUfJ85oW3InTeOSu6qBIxV
	4+atEl4HU2A0R8L7CGe5LyojeslgwTmh8c1nqE8y4iFqZBgpSaCWB76eOXftlICvwhtgbzuzCW/
	HdHzLCUTEOX+w2z/wa3DdkzOOGq85BYm6p0228b5MGczlp3le4jqJ2jkAW58h2CcvPDPpYDmdd7
	gYmXbAzwQEfterOJpOTuVCg8M7/QNiEl6BK3sZd/HT+lsXqY9QE/RKjle
X-Google-Smtp-Source: AGHT+IFdoaaVUwJQ74dsJQIskGERtKPhSmCF+6P3bV+kBeyErkr4s+36pIisJfKFyyw0C5PFP6dUHQ==
X-Received: by 2002:a05:6000:178f:b0:39c:266c:423 with SMTP id ffacd0b85a97d-3a074d8e517mr1611648f8f.0.1745583188797;
        Fri, 25 Apr 2025 05:13:08 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 14:12:55 +0200
Subject: [PATCH 1/4] clk: qcom: camcc-sm6350: Add *_wait_val values for
 GDSCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sm6350-gdsc-val-v1-1-1f252d9c5e4e@fairphone.com>
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Compared to the msm-4.19 driver the mainline GDSC driver always sets the
bits for en_rest, en_few & clk_dis, and if those values are not set
per-GDSC in the respective driver then the default value from the GDSC
driver is used. The downstream driver only conditionally sets
clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.

Correct this situation by explicitly setting those values. For all GDSCs
the reset value of those bits are used.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-sm6350.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 1871970fb046d7ad6f5b6bfcce9f8ae10b3f2e93..8aac97d29ce3ff0d12e7d09fe65fd51a5cb43c87 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1695,6 +1695,9 @@ static struct clk_branch camcc_sys_tmr_clk = {
 
 static struct gdsc bps_gdsc = {
 	.gdscr = 0x6004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "bps_gdsc",
 	},
@@ -1704,6 +1707,9 @@ static struct gdsc bps_gdsc = {
 
 static struct gdsc ipe_0_gdsc = {
 	.gdscr = 0x7004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ipe_0_gdsc",
 	},
@@ -1713,6 +1719,9 @@ static struct gdsc ipe_0_gdsc = {
 
 static struct gdsc ife_0_gdsc = {
 	.gdscr = 0x9004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_0_gdsc",
 	},
@@ -1721,6 +1730,9 @@ static struct gdsc ife_0_gdsc = {
 
 static struct gdsc ife_1_gdsc = {
 	.gdscr = 0xa004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_1_gdsc",
 	},
@@ -1729,6 +1741,9 @@ static struct gdsc ife_1_gdsc = {
 
 static struct gdsc ife_2_gdsc = {
 	.gdscr = 0xb004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "ife_2_gdsc",
 	},
@@ -1737,6 +1752,9 @@ static struct gdsc ife_2_gdsc = {
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0x14004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},

-- 
2.49.0

