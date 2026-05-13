Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE1C3AE196
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707572; cv=none; b=lqLmE1aji1InUH/I7P8TtdgAWEFIeKJLM7ywvUOkM6oQ1NxvxYiq1OlctbnYXRO0BVKAvMIK4wFXDUlDaxK1CBsxAkFG0clm/qcs9Rsf8GTkHTm1gbro6xfYtxqoB+PXA/4n8JRZdLEWWSkXnP0etreiGf2Dg+EEXmugLsfeVMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707572; c=relaxed/simple;
	bh=Mhm1RAoItZvNB+ZiZLFkYTogX/daRG9UI9iX9MangPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=blkH+huS1Qa06Qc8sW6VzKufei713CT3sG85qaDAFwi2rc5kNf5B2qgG96rn/pljB+fzs96TXpjtZ2qrxdqAuCXbptPwm4dmsrVKUg3AXWDls+TTyZj/q5q2D3yLJ6k0IMi7km4R2bGgg5eYwpRoawhE7GSUwDbE+R23enUwjD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kElhJVkM; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kElhJVkM"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-65c09c1d000so6503103d50.1
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707570; x=1779312370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3zIlpRkXdoUaljOPQNDJKn8ro+VqSBQT0tgPG4kc/c=;
        b=kElhJVkMLRmYobh5B474uxE3wgOKXhmo5Grw3Pu2p54Fw40VjYDEj5DMsgmCRkimHJ
         jP76ssUJH1XWh9kO/SvNVgnapldb6TxArGb/NK1Pkh32SOh/8XHAuaZwRW2lbtBaDN4F
         YG0TI87UMq64sEzBsRQ8JO7lCrXJ5sls5gJicohxLay+qRqd9NLyHvXcSWGYlE5mqG8u
         cQBw+AftvOrP4fFwD1P9441E2uRYD8D0aSbLRJ/Iiknuwe6aovIg//QEifx/lkIIKK9E
         Eog3YuQa/MZ7Iud8TkBDtAkc0BC6tnEue5RDH5fIgLgY5K3iEAWgVKLhYFT4yHGW5U15
         kc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707570; x=1779312370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3zIlpRkXdoUaljOPQNDJKn8ro+VqSBQT0tgPG4kc/c=;
        b=ed6IGhDTFckPO0PEso9XyEu6q+m/q6r5qKvoRn7rETEmOfI7kia8cYrPiUdXpB3OSd
         Yd6E9obv5tcM/88s4U/YsAm9kNUsjLT1iAo9bFMj78i5qboXowfJEerLzIeTNhW5dNi8
         XrJwECTCM8cJq07N4DraVYsxAx8cN+XJlrgKv2EZ4Cf4VV/IcTBg+wdgErb8qXEM78/Q
         5MQxzhUDlZrqGJUAFBV85t2KgstRHa/mz5apLEpOzGmHiSPlF1cGKqoVEEm7JNaJzTiM
         37mjvf6RjnNcfODPUU3aAWUgvNlIMtwdPQ6foXLkFJtG79BhwDbv+1LrvZFT1MNFZ5uI
         lSwA==
X-Forwarded-Encrypted: i=1; AFNElJ/MfMkaMZ5UCCzs9Ns4IrN2g6D1ScUXRzb50+eO+cscLMGt4OJcgE2+2SaIDDBZIleh05e8IoCu3RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMqiBdN9DP8vgg8xsA7yM73Jr3vvGB7rrcu+sq6zwQ1Ltf4LK
	tm3G8Hmbt+cm//GusVFAz+0cDkXehs/9M3nHjnk1xa8+JbFSIzzsVA7R
X-Gm-Gg: Acq92OE3fcmZqqBgVKMlCKvl8Tdx4cCpBnWaFHCrJkkp7KW4ycXtiQiobkKalHI4uMB
	vDiX+9+u4CABFo0QwHenCnYZmscJbY+IDC5Gse7Hg2zHcuh8OG8i7zHaHtr48ayBimwFU0uV3dd
	6fdZZN6zvsMB+3/tFUEN1MCH1BiZiEIRlrHnvtR5RxzqOyzVDSdWmnV6wgVFwfIpp1Msg+rGMNN
	Ugpb8XfUf5ds1Li/qT4GtfGizYEW+UdAWHTpWS+6LTOjmTLsSmWc+CVlHJrau+0FKpolAnRMgdD
	XCeT5oV1Yn0+OS7Fj4+me/NQN+SEVrKlmmAi5N0m2/BD8C1zkiNWD5UNme+3hev/PJ3S0aVb7p+
	IDxUJ66uuwRKm0U4epIaKUhut9dXcyRa7TAK2oP4ivpx+ZCVNDpVbAWMu7owRCllkq0flqMxiFp
	+/ueOL8W2LNF/QF8boFuKZfEWyQQ==
X-Received: by 2002:a05:690c:c15:b0:7c6:e377:1dc6 with SMTP id 00721157ae682-7c7e3134169mr12889267b3.0.1778707569565;
        Wed, 13 May 2026 14:26:09 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:34 +0300
Subject: [PATCH v7 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-5-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
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
device tree property "qcom,supports-hw-trigger", add a HW_CTRL_TRIGGER
flag to these GDSCs to indicate that their control can be passed to
hardware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..243d31a32e92 100644
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
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0

