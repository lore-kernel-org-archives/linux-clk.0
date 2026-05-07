Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAA437267F
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142839; cv=none; b=HQO7K63s90KPm1aVmNGJ0F/jZuLzH3IQVDgqGBE7l09fG/6Dvi0CgP6FNunlfbVwbD2oX6+abBruLJemiN13kWj2wdYdLGI8rEqh6gn6290XDkiJa3p5Q2BYNZgKA1ddT+vzSR7Dx6MxAu1jIARF/gSoQQXXwxH+h3exzQqQIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142839; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lbw1OE4Cv/djvHvnCiI2xmg6xTRL/046UP5HOGzxoz50UMsXkWfm5+sOzka4O+2DoSYvYtC9LMGXDcz2o21j026JmbgkSWq0O/JaTAVKxf0pHKoGpVYhRdVZ960YqxaWPfUgl35j6bQWESLiVozrm88voP+DrATmIR0/wRHI5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwoG1hsS; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwoG1hsS"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7982c3b7da9so4641917b3.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142834; x=1778747634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=RwoG1hsSRhinX+dYNPOsRm0FVWfUthen9uk6CI8nlMdec/tM2wUmIlUYiOqt736F02
         ZHn/GNr//7AsdT5G2Z2VqLzJzHzrR1qVkt4ygynyLcPglQpJnfzLaAhnkmIoM8INBDFk
         ce8HFNj09XXGJelNbFyCVK2H4tbiVQGU742DTmd3oTo8uyBiWGU8lzR9uBY7w1MDyHlA
         Hl7gAKKaD+pKlNkkYZDL2IqQhKTbQ95AsbjDZJIE3Yk0IcRaYF3ne9xHMMfI/vna4BiU
         4aZHT+VzbviX4tm6PXlgwuV6+NdRxYF17Zt5tYYxvlv4Jl+qCTAHCOOjUNTPzPyezb/O
         IZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142834; x=1778747634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=G7XkfpGDA3Qnuf/3BfDNmibVJupbMj/dFuMcVEa6OqDjoCc/cj+A0os6raWouSrrv+
         KZMnOBdQz4j4NrICsF0hC6VPjvI52Hc8npCmE60m64KUHOf7dCuOurT29gBL720M3m16
         1KNduca96PXhXcYNF5Shr0MQ0hp5DZOaiTa1YZIABYQRDC9U2PkIRa2KGerOZgEa/sY1
         PruqLiMObh6KZu7v6RaH3rTvBS3pJAPUajzkbMGex/XfqjNb8enoqNkfvnAAEnXF4JmC
         Cke/kUJhgSPEMYlUwzt49TrpEdc1gVwK+9RinCVrk09n5kcrCZ8J/ZOBWdS6ezj+ykfv
         aCyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+h07RY58UwogMncDYGvedYCIsbXYZBhwOC0/sk/v6FcCkIxMIkB4JWcPehcUAUL1Rn7WPX86BfxTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVNwLiUw5ZTHnpbVFVUjIIbxd/K7kEHQmVJM+jx4rNdssJnTUd
	bA5Xq4DJ+LgDr77Z6/e/yAn5ok3TBErRROB00eDoKAfjgEj+MHdrNo3U
X-Gm-Gg: AeBDiestEDVe36gpnQWAkOjt7+xSjc/ez/8VoMke0mxYNDCf95O2l9HNyYNOlCucud5
	XR+BsmRaOfKx50InvKh6SSXFMaD2CN+CFqAqJ1blettwom2XIl58KCJ/b/i8kBUBMBgZbQ/7ZcZ
	i7WfvFRdVsZxyEs4vw8OkuSjEaDbQJa17NY9w/eYbYujTc8HI6+8iJ/fVX4v2D/ZuE1XX10SzMW
	H45kEkP1r2OeBd8YwaemPZh7e+uiyhBkzeBAZZgj9lcUAk5BoDAZf35vYcJ5Imfj8bOEVpnsSwQ
	fBXwruSdK9uNZ2WGgJfIyw+fPRVQduTPCRX0qW/3jQa+BGPypVjJtfxukm6mVyjSYYnYZ6XfE7t
	ucUxSvTRM7vMOFP96UHZx+PKSbxCBrA9w2hkw3rOtcwEOcj4tNQ8BnntTSTqG7caR17q5qsZRde
	2pDl17lxjgCKHPs0cEVduogWusfkkNlGCeBXRc
X-Received: by 2002:a05:690c:ed5:b0:7b8:5f91:65b8 with SMTP id 00721157ae682-7bdf5d99133mr75100527b3.9.1778142834200;
        Thu, 07 May 2026 01:33:54 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:18 +0300
Subject: [PATCH v5 3/8] arm64: dts: qcom: msm8939-longcheer-l9100: Enable
 venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-3-d7b5ea2ce591@gmail.com>
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

From: André Apitzsch <git@apitzsch.eu>

Enable the venus node so that the video encoder/decoder will start
working.

Default paths for firmware work on BQ Aquaris M5, which means
firmware-name property can be left out.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
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

