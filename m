Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017E392814
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017580; cv=none; b=RLGrrdRLpFIiM8YQAr3DBUl+ilDsENFAKoII53dtJ1+8J+8rftZIYKdjb+N2mzRdQRrHLXGVf7GlQ1sQ2wB399qrbJWTFfnD7v2qS6yuRx0W1Ldm8+a1+4t+qnmZstaVeyq4fAWeJlt9BI8C5rrPMxgSOEM2bjnbknjkpId96Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017580; c=relaxed/simple;
	bh=VSLaSITH1xdATqlS484rLYMQm4ukxtGBmOVJ8SIHjDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKV5FzBgMklLUV+/8vy7Y/zPmgdA2XOH+z1/VQMSQ+iNAzWOWfa0JQRWScgr1SIvHpMXa2B6q7wg/FR2su2C2xpZPP0WFQ+Tntv+s9A6FEY43xi2anad5d5IOICnTpaRG2G5vFCPw+n3ggTnmK//D/F5+NNINa31GVCQm0ZdkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNOfQYUG; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNOfQYUG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a60975dc5so62521697b3.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 14:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017579; x=1778622379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=oNOfQYUGlkdShswceSkeqF7C0jATaSb/VNCd4PK1bFq5KhY5U1iEdnZMGRcmyTMpZO
         7badLoPgphqJccfEvdu9C6gAhznj37ZmkO9HM13q0MNYI88Hd2SKlsr8YsiC0SeSsRNS
         Yymz2d0fiTqCMaUUP/bY933ybZ5PXBOV9fAj6kLomlft+NfE2sy29enuDJbsG2Er9MUf
         X/JScuRIZVMk5FOzvkLSqdf4j8ln8WWiPBENYv0uPQNUc7+EI84St5nDGcfyIIfTzuqj
         P4xaXpvDNvdZCTPJrmuMTokK7maru5LdLgeE2smnvpnsuffYTujM15RnGkKY1x9N/v4z
         bUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017579; x=1778622379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MV/bujBx1VBvtoI0/pKFxzWl/PDaO04fBui3KZGqFvc=;
        b=oCtNDV7xEmvT99n40L/5HjIW2AsHRXPnYX2VH1nEvsQ04VgS5TL3sOy4JevdKflAsE
         ks5wT595BUP6NEa8cSOgR1PUR1/wH9gJWgzSl54YksjH2kyCQfWvm4WMSbUge76KzrdN
         ocHvIBeQgOH3rqTUeGufaUmfIi698dDH63Pv3NiIBHSwmLJyog9IxPGDYA3df47/PlKA
         KxFEvel1T2uvYxiyb3oCSKWk6w82+Zi1xgQgq2yHEE786nwXanDKaHClgiO54VwHZ1GM
         aE0pJsN1yZx3oAltblQ5d5eog69jhxWzLhAMuBq0ajdgy6fB2fqctGE8jpOfsPFRHqvB
         CVAw==
X-Forwarded-Encrypted: i=1; AFNElJ+g07RqNANgjxHgI8dkIzldG3ndnMCNU69BpPWgpXiORKXr+O1cd5PJMNRSf3cRDdlo+AJ+sqtEVrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQDa5771hxKQDfaIcgIaLGTBU9JCtAhdvf2KmkVssSe8fBavn3
	ALQvbetLjZngvWTYy/H9ogTT21XiurowZVXz0FIcpOeRq9p7Lc4tROwI
X-Gm-Gg: AeBDies4FmcrYdDsnDOfV76p2Sgt2ek/kt2GX02xPY1PFw6mUDPp9Yc1qk8iCGDSwIx
	WFEGYl8coBeh9WBbf1TXRPgZKby++Me2vmgXwLoEcib+mM7bjkDlrEabNPsZ/2AIHmEK+jvSH5A
	XhRg27mpQOx9ixkaHmOwe76rYWCnWzpYu6jgxcL/Hbbx6MJr68UcmaL11NOBF1wbIeKEsiCLQFE
	z8ff8Tfk62XSjo+QikZspRtRO3Nu1vXf1s4miXogGqJA4Blf009jWyAXHxr5Gk87ZhE99swvmrj
	bSjkLS2JHZZ/bjeANqLAsMZteYP/QzYKTqHrDPPyawBa8knY3jn+8RtKhgGLxrkV003HGRUJlEu
	ESYVY/P6ej8dpOEf0HABmr+b3foz5We5lUrcYBxIvQ50wAlcKIl6zQNLg/rzYqXOIfkWjvTmbYi
	qwMevce7UnemiCAPbp0cLorRNBt4s7loGNLJMJ
X-Received: by 2002:a05:690c:b9b:b0:7bd:a50c:454c with SMTP id 00721157ae682-7bdf5e032e2mr12769457b3.19.1778017578724;
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6656542bsm70158767b3.20.2026.05.05.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 06 May 2026 00:44:43 +0300
Subject: [PATCH v4 6/9] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-msm8939-venus-rfc-v4-6-994f5eb22acb@gmail.com>
References: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
In-Reply-To: <20260506-msm8939-venus-rfc-v4-0-994f5eb22acb@gmail.com>
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

