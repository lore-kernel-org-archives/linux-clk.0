Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4137646E
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142845; cv=none; b=DdrndBc4WcTyRWWA1/LEkzKtfvy7KaDXAvM1CQp7puRW9p7JSdzNIu4q34ttRetHrf7Sfmq9s1hM44Rtl3oGVCsjdzwMv6kwmaDsOebLg5TWr5+wUiIqVw8ehtzNdzSQckh10my2T2hd4RJpQHFughBVcxyL4bLRYA3WZUmqZQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142845; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBKGSHwIFlxleLJm3Z/hl2qmt0VdoHfOKLGX96TBxefn255uNoG7u9/PboPfXVgYkiRouhJ91uGFU6I4wVQ8wY7WqraOT0oaNKW5zmxX3AE4hq98ggLnUz8ZjKrSTe/ooIqgULTXEBnU2ttQMxwGHUaH3BAmo9y8sywJwRT5K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXxdaVS3; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXxdaVS3"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7bd4c61765dso5639187b3.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142840; x=1778747640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=rXxdaVS3fSOryhQ5hMlk62YVWFmUEjsKgxdO7xY7SlSfQGyTdffiFDhUUskYBq/TBa
         oioaFLbmGSxpjpOHqKssQmDLPGR5MCNCLYofYL4XSTwZoF4e235oZlTq+GZ+B/Z70xcD
         9YzutURvE18JSZ/hkwrWRM4gM2pcb3wsQHUlRfteAjepzLxjomBzsJXu+lvbCUsBC9g1
         cE3oMobPsxm9WcPcxl9avG5wxESsesnQbqaU7WqNiYuiEtYKIoyaepg6e99OyKc/36Au
         EE3+YDhOXGWljOfb/QdGpXdMwn2vpkHw8Kru+G23TyiqGueSxB8dYpnkOlMVu0Gn4VkL
         jRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142840; x=1778747640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=PgPHv5LR3WxdGhFqFoCJqg/R5TYB3vnq5EXpBQ5CSTET2nJFbRTLZcxQehwH2xYHth
         kKudq82WbFGrepJYHfeEAL5p/AI5JbBu7WZ5fR3l8qJv9NOOM9/8m4SOW8g7EK4DwlED
         z4trzYujyhlIkA0LR4wLhDa6LDJw5PNIbVS6EEmmN3X4DhFs5ru28LE5AR/Rdmn/JlRY
         IwMSOD5SbVS5kp6FLhkY0A0yPOXjmwqZyInR4+tbKQSV9Ngy4GvxPvLU6XtBXif5cW8J
         PggJ9I6IhJJCtFXckCWKbNvsHz5REn3+ZDlrvJjPin8E07u66Z6sEupUufkxgt7iBfDt
         W1VQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gRZzM9fr/hhTrt71yc4qk+aps3U01U1Ynwp3XipP1k/N/zd1pwc8H0W2SlZghvviWLdoX51jyW4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybsf2op5sXqfeboVaBN+vHlU3e1B26/ggOQ20xWUsb+uLL0xpU
	3HL8eHW8mEomvAMGgUqwNCRTxFMgLAzWjMneK3RkbhbTmRWoaiYefZwr
X-Gm-Gg: AeBDieu1avh+g+w2jLGhbmPGw0UjCSKUv6wh5jMUwiHYX6wVC8Lojch4ktWkBmd4jsO
	qTpIRK57nUUHhxxxOhcLKF8uhCzcwlym7LTA0pTeWxovC2G9ll8/vnqIDzj9j/Xi1WizaJJMwDQ
	LDM2jjVU0R7ArUHGfklq4O9P8GB4pD5CtEd/G5iBC/cZWr1zZTUr7e+NPGlgXa2kpYCT2IPFvAH
	XASacxJjz7wDm9P1mIa5aZPlTAbuqDhHV7nIeCgePdt+hrKM74cVs2lfHIlElakjwYpgOpDH8LH
	6zoah1bv32r0Ipavg8uS/wgwbBHr68xozD0zN0jCi12U0x5/BeIAKeQwsi+eBglRlIzP8sfosfS
	GUDUbfBYo9PumztUspdqNkDJNEKch9BzrwzcEINLIL+gsd8vrOvWPKcPi8A32CdefKTvLI4MhmQ
	kFmm4+83xENu8a736icV3p3+QCsFbwh5h1lSE06CRWj2hgE50=
X-Received: by 2002:a05:690c:102:b0:7bd:4b22:a05c with SMTP id 00721157ae682-7bdf5f02a65mr69836497b3.49.1778142839569;
        Thu, 07 May 2026 01:33:59 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:59 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:19 +0300
Subject: [PATCH v5 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-msm8939-venus-rfc-v5-4-d7b5ea2ce591@gmail.com>
References: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
In-Reply-To: <20260507-msm8939-venus-rfc-v5-0-d7b5ea2ce591@gmail.com>
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

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

