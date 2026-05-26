Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94823FA5D2
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802315; cv=none; b=IDQsQylITxgRfnet6WUyXvyHWWdVGJGfRRWWp2S44+O5OIXSE8H83JEncGuc39Cg+FF/BMZ7EgmXF44/4TSrZ1iHtuKiokb3+d4gVSUqX597Zs/nDrtJhK/fKUc8F44LJ35ArEz4ZgxbMdhktBzpsNaxNT71vmKqMqS6WWykhew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802315; c=relaxed/simple;
	bh=16AoPtmHTYpJSipw80SylHAI5EPglqbbZ9EkozbD51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=derOuKmawAkG20K6pBRjZx+BsKpkzBVdX/Eh9vyS3qdVvRkwtMzZq3fy0VI2xeBMfxGp2Advp9CpMm88Rl24I8zGlIfXW02B/x6Q94VSXpdYxfsGpsGEbDeGrl8culwzji4aHXjlhisy0rBMJPBrIznE9S9EUAE0y3EebLrtVfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTsUz0n7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTsUz0n7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso29926435e9.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802306; x=1780407106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=eTsUz0n7yYcM2Nx55/K+Lme1gYXcoWxuIdcD4LTBanSDP7tAbZGEaQyQnkP+21/ll4
         fnjSIy9wisKrcVcX965J3qlylj5P8r/GpnqMELwKtmnYFO5pWVGt8C8yV23oBE52yJ+i
         bBIW0d6F7TEJcpiNtB0lQKVmsn4dKNCMNEPMhZ/RIPKN1ur3IMMuFBTz49pt619DIHEF
         FSrfcmpXLOaTNdZayxi33u1efq4/098YBdlk7uNy2EnF7cW4zWad7WHPdjvLoQXOycdJ
         E+wiwJmOTpHqsKgHGvu6MYLhxqefHmMiVNCTOjIEpmixKp7HJFP03inNgkdCZykjRy5r
         dTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802306; x=1780407106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MD8vAn9/wfDPga+z35YKtSQ1Eizg0RFa87mkXotuc18=;
        b=eeSAHytExr0KgffbcZeJikvk6BkEYu+QMR0Cr5kldWutlGezeiCaiHoS/Rj/pBKYlr
         +IupTyEs4AmMs4KJTymK+Jf5FNvyt9jUEIxxWVTnLPP+Cug1rXDFYeJsLyk/ABJDv7Jr
         te+PfAohu6nQrp7bdPuJzjDJEx/8RyK2CPl/2yXGu5hby+HGP0PweUW6C9vb3Z04izwP
         AJKamx3gmdCsxYXSqReYNgArfV0rvlaQfHFA7BbvA9xNtYPpb2RdUSoxH/bzNK8ARmv+
         eYjdvmXIcfG1Zl81tKR3M4bOCW9YkmA1+CQ+VKjVl2odg51zPt3SEcX6LY7bg8n0tIau
         A4SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/KKSVy7z4TFPYZgYyPy93QNC+evJsdaklIR8vTuix/NsmAha5HHUIuSIYdrkK0NExBKXfQ/pTFfy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1s3HxfLVF4Rr4Lty3BH3un5AgLxeaeBwzsjZS+D6j4OOjWQFb
	F50+ep25JIERM+bOwtmfD15I3DfLEXfVJpfGCymel7sdmOx7TbcurMb/
X-Gm-Gg: Acq92OFK7KZZDBbfAjCnLybVzA5Wsay5mBQFtk0CZgc6hJlwrhryZuzybkc/abxmEwL
	nBdp07qpxTQyCQnneJKOxk5+Ustwa7bWu6xPhMmgtj43pLL2ESHK4Bx3/SOXsqV4EpQaLcFeJD1
	SdXxw02xhdfipjn14X01GSh2yrQZYL+1Se1J9DMAKwv5wNpgKhpqg3ouEhR++1Wh20/gmYXU/ux
	x7EpLJvtALw6D6AeDP5TCf2kakp5NaKnTUHmx94juEqnQtNtLUVCai5nY5ehTqcL4LjH+rCMlIU
	+udSPew6s1ftUK9mqwGcgGD1jYJbe9kToGZcELw9p5JfHT2hslnzyWNLHFJXEJCRLhJqrwFOgfF
	Jy3CSMapOL6L99d+v9yo2TTEwIAk3faEueuM2TQV12M1CLiOcuwC25VzUVz0vL9QysPCmX9/GNw
	7Ahgtqgeud61vGQLjhSQXsjo/9kg==
X-Received: by 2002:a05:600c:3b12:b0:490:545c:7a8a with SMTP id 5b1f17b1804b1-490545c7c2emr215250765e9.20.1779802305717;
        Tue, 26 May 2026 06:31:45 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:45 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:30 +0300
Subject: [PATCH v9 7/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-7-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
index 13422a19c26a..48514c3df718 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-longcheer-l9100.dts
@@ -314,6 +314,14 @@ &usb_hs_phy {
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

