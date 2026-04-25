Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0C37881B
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141896; cv=none; b=VikTfEVL79HugY9Ke4Jvk2bNcsq+Y02+Eoj+D/26VH8NU6tpwfY8C7St6O4VDjVQEa8MUpKMUi4B2nwp9p5D5erP7ZK4xzg7uRkBO2htw/z4axFAw+0d8RUu7Kjl5YcLhFGGeIPJPzFkkqEjEIulDbvfmqiDMKxtiI+AUdjDNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141896; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DLxeK8+o9TBttRskSP9KE0pkaVnhCibfheQbkOxT9Z2GtkTrWxDnM2tfwppNXZIzzjwApgy0X2JWwZsJknkr6hCBRxN3BPdza37P4mt7YXJMAuWOII71x//J0Ck/rKJGy+uBKLylgFNacjiQqaZMAmArBDcVVlQ7NUDWXYfoBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3bWBZMS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3bWBZMS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so74042395e9.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141889; x=1777746689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=Y3bWBZMS/mcFFkGD36D5wZookWEBsU/W7RzuCuJG1bTN/LngYLXZtRhJ6jEnioAfRd
         QPGWsOK8FPte1RMcqLeHyhHsfubHgWB8fe8PLfap5P162//Cvk+l4QqcSsU0AYqIgvxj
         hxOAM8sQEBtcxcZSDc9pBY/ARDoNELA74e/684bWDsFUwBJrQAA1TdbWsd/OeEQjYfLH
         MOQv1JBi6hK2xTwv2kl5H9Ko7mn1A8OStDJ6mEFuQdZWdOl5fGVOvM8vCKb0iRRK1vqL
         Bg3emTp1LE6TG4WUrJPfkgIZ6fJN0FHKLMgfGDYMpeM8UYV1r5c60+HVXB7hFEsLptIv
         18wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141889; x=1777746689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=psS2kp9EKpXuEwcGuzJYzzAMXkb35Fu09ApR/ADKh38ueVOfG8N2OMdbVmpbU9LFI5
         2XH/umTq6EQjvGHpAgaaMAWMBwZLO/YizuSYoHQfIJrPbN92Yvr0T1c8o8KzBPI9yJbO
         +cpXar9AR6VsAqttJQQ0KqsBKhJ5bz2HCA8IZOXSpvbHfKZGV9Pbg5LvtSZzsRCVML1A
         PDY0/necz3EGj1hshIHJBrJw+QrkVSp5TNO+zIJF9/BLFAboOIkj4Ln0zo0djDQhq9AV
         W6TohOoLOX8eb71S3iuaP/JVDVxEJCNCpmZYMeKnvgRNyVuhcuayfnAPy439tMBk0D2l
         3ZkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HkybLCaUzy/vvnI54YADCRxPQlVET/2K4qm++5aDI/HNALhqceQcb4jxqUMu/1UD4hYI8yE4VfC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp777HuA9zIIpld6eG5Pf/N/LGJRpRv4GQa/rJgWopiL/09Ge6
	H2GylyFExAkR7OFfFeFoUYI4+BJNbNNp6oSU6+ET1P5HpFl1w8j7l2Gs
X-Gm-Gg: AeBDievFs4JWzbMu/ATGyywlyAPeBZRuRcp0f9wxPkkjxH/Fei5UIMJYxLcKVcC2heK
	OZw6oenTnzXeFiHbTggkBta9/Sdyc9Wah74wDUZ0FnClRDvyJV8+y8p+zRHXs9jimU7OBoXNp81
	wNnvlWRzNYMG1MKLKgx4sObeZ8IUZQAXAX5C2dB/1FOAsCLCXbDDIjkpjESH4BkYtcDnVCX49Lx
	7G6u8vTgC97PHhp5impR3MZbVu383rLkKNKkwAvdq9AfE2axZ3ipWTT/4nxKB/o05vaIuv6YxA6
	4H8MzNJKjGRIhKtXQOOvmLAbeGF0TkQVro6PELWXA4cFT//BEWLWat5+qYVox/Ogx/lcQQbEocT
	BuV7Ia9oAJHW/6Cj3hV5EGx2eyX13yWjKNaM/+DUz7aF5NRz9LvOVyJyFYtdltwS5QoORnyD8CG
	ibBBF4srKXesPG1467CUKQ2wxzy1liDGQFDSs=
X-Received: by 2002:a05:600c:3483:b0:488:af7f:775f with SMTP id 5b1f17b1804b1-488fb77d343mr512182135e9.18.1777141889423;
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:29 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:07 +0300
Subject: [PATCH RFC v2 06/11] arm64: dts: qcom: msm8939-asus-z00t: add
 Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-6-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
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

