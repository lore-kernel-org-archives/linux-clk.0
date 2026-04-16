Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7743CF691
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347081; cv=none; b=Zto7X7zjNwb1EJB4flFCdXQ6Ak6dDVGdLmC/+o+1U/k2DNKCj4jVZ72n0NsM97t5BRLzO7fcDh6U3Hwu+pK5rDpsbo7xrkF98nFiH9hSrRzowry+TLLhCrxOtlhiI1IXNWvPauqRb/4+AzkFkG47VTuMdtBlZ0YwT8ibf2zSd40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347081; c=relaxed/simple;
	bh=aI25nEi9VQ+DRbhHhvdWFYIwKb2dX/WGA5UFAotTP7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IHscEv9xr4bXw4DpD4Ve/Eb3KZl2STHC/4d5ag37gr1329suOi65KwXNS7Sih8C06EeyQN59nMU8ADcFUuDp3pY9H6dfRTqGbmXYMmSXg6MAssUifBepwFXaeZ9jGRCJ89eUIAWo/2dSuXTLBTTxkY6a0MZzwp7TA2iVGYyzg3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ortdAvMO; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ortdAvMO"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so30534107b3.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347076; x=1776951876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5R17ZLDIA+FBJrsZkOSCOpWtAhdlsU3PoFA3MU5Wuo=;
        b=ortdAvMOHjNZzuwXYaOF+MpBmGjA4PYIp+AcueYVu02wYaZndZD8Ac0yiBExervz/e
         r1hbnbLDc18OL9YMEugpCk+bnSWkb8ZKQ2fPOEl6TdDEK35H/4xLWhLExxLKxhxBwR0L
         McY7HLTS2vAAZbtANuL24hb01lXRpWCfagaYvOFTwyiJZLDJX/fVep+fJFWPyWubNIah
         3nv0DeukozxPVWHexBTvDNRGBn4XsM7bN2sU6gvttsoZ9Xn22Z037LyF03qizAESH+Ri
         qHWEORYcpKM3oNHrSUCa0U6XTX5dAdNWfXRROcRwPMlOGOrz/LNfhwgK4i+EO80M9/sv
         ZUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347076; x=1776951876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T5R17ZLDIA+FBJrsZkOSCOpWtAhdlsU3PoFA3MU5Wuo=;
        b=eDSxhOEf6OVsnDH3jHDc7AG39rnLUR2j8VoqwLsaPxDvH1UzLzo1hcQVH6GdxtJj+Z
         w1G9NdIVlgZRTX9VNaQ3PFU9vCLBcBH6yKNF2USGddJPZEiDBANY8O/IaV7E8IfQBpuc
         ursHENTqg5KRt4QeU12RNBJoKoFxg4slOxkp7/aDnGFVMIEh/IZiM+YL8/iJlO2c1jKk
         9Edxb8JfItxy3NBZTOqSCGhjFRHASoRzIAuKCkdgCYVnv2a7edy3SafAi7roGb3kYTx3
         Fksc9gsakBFkTetLkSfwFMvX30dECQXg0cHEQBry0RmryvtreX4hy61UR/gFM86r3Qgi
         mdsg==
X-Forwarded-Encrypted: i=1; AFNElJ+VPxuMZB4nY9bcPMbzQ73dCocD/l4u6tk2+/B9cr+bHf+mW2K7OLjCIvhC6eQQd7GBH052loYBSus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyqAmMAN1ob3qXEXXxFxx2Nr/A4lDFxxZydaTU8oQDIYwLSgA
	+NIKjubZNzuTvok01Ci0Eb+lmZCBu7deQP64kPJEfUqXSxd4Kxsr5uMQ
X-Gm-Gg: AeBDietEIqW7mP8czuHxs+2bGfEtDL1yd0+nIQ04MCTCR9Rp+uQq83dBXfWClefE4kA
	9q8KOKRB6CCyTSXEJksBZRvRFWaMLdoqoTUftrNmv42vaL1mwhZ/CqTcyKDaS9fCXcIn2j3AWYu
	RO7byxm6RhHgRMVoSXgAQoeOUY4fK416bxebiuvSAB+obtDJ7fvqG5gws4aYq6kJaH/+d+TIKp1
	2MUfrdsCPw7cfN59QcM4C3IDnYwwGdeuo/X7WmzGEL+pJYFV32PsNbGztJiw0AMNbDrQSpgvFfG
	hv0m2U185bqpMB+x7wqykvYLI7MiFxjgGLBKzLmK1rt6vhPvgRTnBG83gbh2T7OajPGuczFtRdo
	aHL208oBaz4Z0wUhukFlNKGA7lTGkz0JmCIncRrt62R3Uq1jrkQn2lUdmpCRumVbp8pQ0iJtACA
	+kh2skWfJp+QZSu07s4e5+QyOMnfzaf8rpiWjg
X-Received: by 2002:a05:690c:3481:b0:7b2:6177:2acc with SMTP id 00721157ae682-7b261773862mr189577217b3.46.1776347075855;
        Thu, 16 Apr 2026 06:44:35 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:34 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:53 +0300
Subject: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
2.53.0

