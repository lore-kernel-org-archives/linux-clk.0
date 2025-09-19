Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B62F49EB
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275963; cv=none; b=EHSsbmCXmRtOnjg8kn18F1l2WkaPYwoDjV0KHO+cK2IYYxaVRnOQozcydJrvndfVeT/ooxaAGwYRTyN97RsZSHXqjvTcmvDixGdUqKx4lpj3UhTtYHzokGzYuHVspBLm3DDEGD5/FatXsUtzfP/PhjmDjt49qOVQSL3mECcJGms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275963; c=relaxed/simple;
	bh=DzHjTfe+PvsMShionbNF9cKGgZXDYYuDcp3aGm7pFps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KSxMQAYZmyo7kqJWebZ83iF4GayDQ62efRen7hOoG4reiK/gKbuwSRIDUE3c5vuyKGhUoTlvjWWlY1QJUMPtPsWNLIcJnoWOtKvKc791HUpDBjmdDRTvo2URyh9PIIRK9J8Pisg6QNAaWBqhk1GV6/mpZVMRJdKJa93JQGPaD9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=vEoqylhK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="vEoqylhK"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so3264133a12.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 02:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275959; x=1758880759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skAcju7YKAn8s/A/GRR4ZrH/gmSwELGHRwczNOae0t8=;
        b=vEoqylhK3QJazf5NhrcZZt3WNxESyRdy3QXc0hxN6SGRoaxH3SNzqSmBa1JyVyq0DP
         mko20UlB9PDTJ2eosrlbF3FymXdOxdz7pgZO0I4QmttIYO5EtDBK+gqXI78gEeHR4PVL
         +qqtU/jZ1m6y/wfLsfe6/I6PQc1bFKh0iym8MpzEcIal8PjyBuxTvBEz2qfNqxmtgMZw
         Te/QECiym/Nd1OGb2iqcgZGFuI2BYeZ3ptR1lfnzXWZ55qHsOddu9hBci4kh2nFy4cBn
         739fSdi4roOOUYk5NNtQvuyA9VhRtgBI+G3uXFldoiDbYH9++6a/EBPLs2L+klDpgvA5
         ZOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275959; x=1758880759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skAcju7YKAn8s/A/GRR4ZrH/gmSwELGHRwczNOae0t8=;
        b=aChVvoEJ+JFbcuHqMIvrJ6uoKys0mjyBCBx2xjBxcAHm6Xjf15pTbrfs6GYBm+4P9+
         O1tMTdXaT3PHZLe+MFt2ZkD+C3HhU3dakitgnW4u/GgWOOkFu1YFIRN7LUGafzJjfpE/
         SMqKdkJGeA2PLApRIs/3A7BVFoLiVjEuVzA1hdkDuzGDCbIUugd87SWYPeQYVQGtJ5SZ
         d3berMCJcAx5wmTF+dpTx9php+vU/dSFfO0Wos6FkD4jV0hdsWa2DlG85Eemnr+eiyst
         gqg5fbuTRDadpdPzCvLjL3wLc5W1gDcmD56DNLkD+puCQjHKi1kgQrz8axrWJR0vgKpr
         2xpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpLauPWElo9S2LN3tnFCLscK9XafNoVNHBu8SVElD/8TVbfO0bsJy9KoMB1OWc6iQsoZZ/S0BnkeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNvKlC37wsWWzlMnHSXmdm8gvS88pgXEc+Us2XSD617K13fEl
	Sir7A7Z+8kTorFfFq2wyk9BKnj2M2v4pU1gEKo+XR5i0hmLaHA9C4rjUpsAFsbNDBtw=
X-Gm-Gg: ASbGncsF6VP8bAT6lIV7LYyPQkpVg2+6A9AHfTT4N5D1bno8meLOruRkR8kHe65y3F8
	jVCJ9Io0xNX8tB6kNB/hNHaUuW1jerW40I3/BS27RqPVa9bAYhXA2IF5tRfbXbcpg6pojQoMjGH
	cclOXvHCdZmV/InyWzF+WpRNjpPX0DI5kaWNj2K/uJmVs2r4BvC1XYbS9oDDfI4emxBMckyQmNz
	HaLiX7hJ+T3X9+g1DQieiO1qlz1tZUTslJLCEPFEmI+UbdkizyYZxarL1/JUKX6eGp2DxdROz15
	qMHVqdgJJErYiZlziP3ulw03Mbezca+2AjQqF8AVlyg4cAm00sMhPZuduUaTGev0cUngdKpv8kN
	I/33tOS1bYVqGxvWuK0HgLeKnZBzpOI0H/CudXWOGWbe6COGP6k8qoE0JFcBbs/C+Cq/dfg==
X-Google-Smtp-Source: AGHT+IGcg73bZYLri35zpeSxGcbf84lNjzcJ9lVXYFxYS+H77YE64UdSEUtkMOObdzMncpDcwGV+LA==
X-Received: by 2002:a05:6402:4590:b0:62f:af:60a0 with SMTP id 4fb4d7f45d1cf-62fc0ae770fmr2120994a12.28.1758275959086;
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:23 +0200
Subject: [PATCH 1/3] dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE &
 MDSS_RSCC resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=769;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DzHjTfe+PvsMShionbNF9cKGgZXDYYuDcp3aGm7pFps=;
 b=9VFYR0Pqu1iH5ar5ZlAGzd8yitkjjLnajYHWb6JRqnUWIorerIbWE+NyUoFK9xsMG83xD7v2s
 JFGROYBycauB8OiG9vpOylV18dL8CshQCYTm9MAqYN8hlrRs+EK1Eh+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the indexes for two resets inside the dispcc on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sm6350.h b/include/dt-bindings/clock/qcom,dispcc-sm6350.h
index cb54aae2723e8f20ff3eebde3e15e862be750712..61426a80e620ac795b6f0ccda173654d7e47e59d 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm6350.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm6350.h
@@ -42,6 +42,10 @@
 #define DISP_CC_SLEEP_CLK			31
 #define DISP_CC_XO_CLK				32
 
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
 /* GDSCs */
 #define MDSS_GDSC				0
 

-- 
2.51.0

