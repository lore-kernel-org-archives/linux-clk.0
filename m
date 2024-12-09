Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E641F2C38
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 17:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766559; cv=none; b=q+i1Uhdnjs62MYZbjE1u1I2JNYHKKvmhlzLf9zEvrtZQKfUjNnHGRhawyaFfr5serb3c29MokZpeJxTzAwO4q9jRXOSLUSKV5xTE5c3K2lmJ24Y+2sdvZdK/Nf1wSUKWZxqYpcHb/h6WcNfAv6PD+ZdLUWTjpnJcuEImLUOTqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766559; c=relaxed/simple;
	bh=/ngJ31invQX5gKPkdlu21QxuRo0Yy8l2N/s4QwYdOLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gtL1x4B0nzQwdW1dkCpzHh9FVtpqb32AtcES3qH82D+T5UE/ujxj+gJaJH6j/QEolRpJDB7FApbenwi/ASBm7wKSFI6hwJgMpnvuY4qDRkpA5l2WqfHlKNl9vchtq7a+GdXc8z2qryVdU4Owc80fgRQ2Y6vXYRYATEskQpekXs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTBrH4p8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTBrH4p8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21661be2c2dso7179255ad.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733766557; x=1734371357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf8gzCK3nfrU3b7Uuxbc0dGE1qzZ9/xYXm+PyMypy4k=;
        b=aTBrH4p8uwN3mK5wZi7cIQnJaMEtTpmWg2zzu3gWwTrzKQZcehNf69M1+xI3+/zviP
         7YvIby+h1KzcGHf/gV5vooIIBH+ygB1bpX5t/jEpfv/1VdAoGCeSvC36MMfwFbkrGL37
         EQ57TwZMDr/MnMd41wbDRqqDfVxrmBIJ4XW2sCMuxWjYW1qMwZTMNlOGxLzKfUifk9UP
         fnwKdkjb8/2VWAcBYFFWklndtVmLFQKiKEdt05aTPYm9Eovxvm11rsaNQ4cnwUUBn5jz
         j0C2umfOdkzBXguJxw7Tp/qbcPoQWczg6EHm3KjeI5db8D9SesBn1rO84prc+cHQN3Dj
         Tzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766557; x=1734371357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zf8gzCK3nfrU3b7Uuxbc0dGE1qzZ9/xYXm+PyMypy4k=;
        b=a5bYB0ftQaVYw0c8Uy07Y0W2oIU/NgQbByNaec9rCOHxmFkNrGcx4M1H3SBKGikULm
         3ji5TOyuJ1Ts98KtRCzfIg4/PdVOjEdevoEjmEr0z3K28IIgqPeIQKoQxo6HtMQCQpzT
         MXKrC9iy4eiAOodBqnX18kBES/YZILh5lmopgE9m7GHXgXPAfwLn7nzvIwoWolRDOhmT
         rl0VZUn+2jPjYi3Mgd0nDgbnetahpdaRTaKBkbLI9vygf/Vmi00qSzM7m1VyT4h2G6lf
         chtbtpkZYzrzU/P+41CcqzVuLWGUyL6zr+Go0h7t03gSBRCM5A/vuLhpgtPRbOdLnwt1
         Fhkg==
X-Forwarded-Encrypted: i=1; AJvYcCUCZQjBvSME635yXODA3OK2tcuSe83ZIMoXHaeT9R6ave/ahF99E72i3uoVz227ewAuGz/Xn+i8Igo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrkimTxH+PqruJmgJIK2X9D3sYiz+KMl0d/ecdA2RgPoUvIor
	S3joLtaZqc1WD+zEUejKkIVma91Ie3Pomum17LQsQQrlth8cuU3GmXPqBxxgZOY=
X-Gm-Gg: ASbGncv0uFWFS2Tr/lsHUbTN9Gj/0nIyFjO3fwTM9d0e0yr2wD3Q8v/UsVmwIpmxkly
	km7BvMBvWa8MsJnBz9+xdV9uI631Rs+cNDH8zTli1whBSJ4r/e0cudRzVIEOAfpHzCwbFcH070N
	e4wW9ZeVR3yBJ1YghUhb0Gn5g8xLeMDARe1FSF1Hy7Hu62RblF82kNQsRMbOVZYlaY9k+GT5adf
	N5X9q5mfrIbEk5DZLcOJ6St9JTc7EiYYCgInqqp8KGlj38RDg==
X-Google-Smtp-Source: AGHT+IFY3WJ1ALik4fCfvOaI+IBshnfFj9VVWrccJaSzIqDQLA6VvD98zEwQj/L1R/jPX93PhyCxlw==
X-Received: by 2002:a17:903:2303:b0:216:2a36:5b2e with SMTP id d9443c01a7336-2166a024b1fmr19667555ad.32.1733766557531;
        Mon, 09 Dec 2024 09:49:17 -0800 (PST)
Received: from x-wing.. ([2406:7400:94:42cf:4dea:f154:880:3adc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2164d103993sm21837865ad.193.2024.12.09.09.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:49:17 -0800 (PST)
From: Amit Pundir <amit.pundir@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND] clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
Date: Mon,  9 Dec 2024 23:19:12 +0530
Message-ID: <20241209174912.2526928-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the earlier fixes meant for sm8x50 and x1e platforms,
we have to stop using the shared clk ops for sdm845 QUPs as well.

As Stephen Boyd pointed out in earlier fixes, there wasn't a problem
to mark QUP clks shared until we started parking shared RCGs at clk
registration time in commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs
upon registration"). Parking at init is actually harmful to the UART
when earlycon is used. If the device is pumping out data while the
frequency changes and we see garbage on the serial console until the
driver can probe and actually set a proper frequency.

This patch reverts the QUP clk sharing ops part of commit 06391eddb60a
("clk: qcom: Add Global Clock controller (GCC) driver for SDM845"), so
that the QUPs on sdm845 don't get parked during clk registration and
break UART operations.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index dc3aa7014c3e..c6692808a822 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -454,7 +454,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
@@ -470,7 +470,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
@@ -486,7 +486,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
@@ -502,7 +502,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
@@ -518,7 +518,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
@@ -534,7 +534,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
@@ -550,7 +550,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
@@ -566,7 +566,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
@@ -582,7 +582,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -598,7 +598,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -614,7 +614,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
@@ -630,7 +630,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -646,7 +646,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -662,7 +662,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -678,7 +678,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -694,7 +694,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
-- 
2.43.0

