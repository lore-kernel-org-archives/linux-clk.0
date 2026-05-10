Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623B37CD20
	for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406489; cv=none; b=uDKN3z7N0PPQ0vcMynX01EM+F6hTlfstV6pDDpMdAqZIaiTtQ0Gy4METrhuVConr/5yCnVYFIQAsz8p4xyAYc/nfSQIrA9U8MUygk0ks5iuILxgWBqkpihcyRDWSl585IT4BrO+YHQ9bi+EEPIrvMAOcrEzKOY5jv3h1A0feAck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406489; c=relaxed/simple;
	bh=LVWWWUYdv9PCfUhr1DTi4tk8Hze1kjyRj4+I8oegEow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sv78IEutFd+nGFrahHcyyr4xLMD9c7l6TL2kFG3nMYt7XZUiD78F4TmxQjH4aZbQF9EXDETg1Pq7JvDtz+kxQRXDEtwzuPqRUQf68uJpDRbH+/a3IWm7dGGaYuQdJip8gdf1DZD2WdR7cgD7vDWkLwoOcXg1+HRJXTpIXlnfWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKvODCBM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKvODCBM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so21658625e9.1
        for <linux-clk@vger.kernel.org>; Sun, 10 May 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406485; x=1779011285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=RKvODCBMXGHFhmD+8r3Nqe0oYd2nUXpE3d7VKaUzaj9Bla3JjpSb90JCwiz9ASi50Q
         Smhy3PQ9U6t3WSsF3BtGjAMHkmkAl1ZmCAW5U9T/qhigXX0qym9bsOLR1X5mMCL5p00+
         6OVrDcHWOgw6L2Hr8eCa624MwnriX8hH2T3e7zeRsfkHANW3Y8maceDumTCd1kiYk6Ht
         ig90YfLXoT/qTRt7/1aw9AoQvD5V35xxnOWDfuLD/k6sv/skdG+ArFpNfQEh5t+lx2Wh
         +/WB6/MxKSvzCz4680wdVnZeT+jVJkLfYKWOLu92HULup4Z0tlmoha+umPFXK4xTCZln
         V/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406485; x=1779011285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=N+1sLd1vs0b9nqI2IdDptqlB5advH8vTmIMoXyUAD3qVIENvhCf09B2KPrSC0B+Mg5
         9jFoULsGJpMSUXdDxFERhvWSWskIAlKmfHGSOyNoQQobg1m6n6oZRggaBexXthBlfmsX
         4Xku03q6GzOez7TVNFQn/E2ddV/HeH5KwuY0DKNh9lWDRQSkui31phkoMdNPlOfpm7vb
         Kpr0b7ocTBpHtxldKNawxJNtVnW4c5RvlE++on7MKZDTZ96t85hMEKhp2kZtj9WALFuY
         QSdIUfKTnhpBWyiqHuHp3vUpKYwk3wp84iP0tn22TIkOejFPn3aS8ItxJ9X+3vIGRkNo
         Ws7g==
X-Forwarded-Encrypted: i=1; AFNElJ8D7stdEOPglmQOhRkNrZmsVeqjlHKZNnCOZuLPedKKTBraEFW3cQvL3hvw8sKGaq/hZjGjih8cT3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA4+tw+aITLE3SlNckFSCVrOb7sKdFfeFEClI6eaBBj+mLEODk
	Zu22ot1gfkcAp8D99dc9jzNSc6bG+sXrB1PJ/tyTCrd4j/1MnqoPIoj9
X-Gm-Gg: Acq92OEuLG5ksQsHLNqZ9HQA4SKP1N54JYUPf35GC1ryik7Mp+w1vK7olJBP5aL9RRY
	BCouaNi+B4qU9TwEZukhyKHAXpWh5/2ejPOedpthMW7zI8sy8HNdSsIpWf7ttU1fe3BekDqXe7U
	oTRWy8kQTNMQK4TOkKIff49xnm7UoodXPJGyzIgB0dAH6H+VDW/j9ktjk4cTeYN3eIxfMTYkKAO
	POiEMLWhvagUw36/SDTlvKVjeX+K6vFDttipfOK8XiNA8uAAiYVQ4YK7zzPScWYo7skQe2Mkb5E
	F3XtSnKm02syw5l1v20rdfAZLoMK8lCfDv04C80JztZrveNPAXvQQBtpuX4Z6V/sZMEcagGX/dw
	s14uKddJa8jmZUkL3+FFeXV0RRKKmPjSDotrIiLFEnXps6EtavfG/BqF1xJjgFxp8+MWWlIMzbp
	WxbFDsvSBcobDgkMIg5QRMYoGJLTMr
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr174341785e9.7.1778406485414;
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:43 +0300
Subject: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to pass their control to hardware.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are set to be hardware controlled, they can be switched
off at any moment. Vote for the Venus core clock to enable it later when
GDSCs get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

