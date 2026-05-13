Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433253B8405
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707567; cv=none; b=NFKj5S83YzfSupNnzC3VHKvTcH0rU0ErriEeYa+s5OdeDaBZnravO4rnnTparcY0A8IACRkQ1TkO7Onhaq58tWyUObO9qwY7+I5kuJrpfje3qaj7xXkEfWK0cFJJaM8ATar6rNl6EhnlxM12WkpMLxIy9tL+S8paNLL5T38lHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707567; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N42zuk/C+aiSe1syESlTBfDiFZgh2+XRmnlMA8mLVLyqiMOEv+hbFH0qaH1xzYofPa+tuwwIx9g671cLj64jC1EkMxOdChhNUlSdpxaq0SrZR4+gZ2hgnMW0e8jzTvJzNxJL19/t/TF04wYRkW7JVq/BB2/yuJzMzooD6z4tWvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQuqohlK; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQuqohlK"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64d5a7926cfso7249968d50.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707564; x=1779312364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lQuqohlK7z4Fk55bjl0NZZAObXDohyNSxVbRdQA7mB0duAnikSTFQHacnFCdg4bxk9
         itK8l6YVA9zFdtJ43ohraSl13dD+9A/76AuGIOImg6lubQwi4mnOs0qPPUWBPvuzzkSl
         tRfJZbb+NGCpPkTXzfQgH5nB6+tDkTN3psPDTY6YP3iG0jNXVXTra12zwiMMAw4ayqa7
         ooHF5A5CibhpjWWVjGb1r6J4jpJltAim503s/D83te6Rd/S8ctr67v9M1JqrHcFZFjzY
         XPrUfAMgwV1f7zknfN8ZJ4K+GRI2nd50OINP5O09c9w2UTMCBC8wUXfUOhwcLmRQClFV
         q1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707564; x=1779312364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=f0wjikMYYcu1TTyZpqU+X0STTOizk6Vl84jX66ov9phfRVs1q6YfuF8OCZX1gRc1Nk
         9bcFCidrICM5QNrrqZvPcLdofGM7IxoZKa6p86ND+hhN8M1paz6DoCFcXRd4pWKZqpO+
         DXey9OUhRHWuqjrRrveh86Qfjr7Eljbae6EiKe5dX8+hzP3JXjUFwfJB3p7boJzSlji6
         ZrJJ+oGJxdkNNlMtOJNs3Dqq4RAgB8S/RIBbHGtcN2o5os3RKoYzI6z/OMLIAALZvOKx
         nrHLgNlhOXcSMmuvHJ+5vKMGBRGCSXbeB7EVwdFW1cQLWg7sSlCMNoubp4xnK5rffFiU
         l0MQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xgsL3o60eOUu8Ka0MTT3s84Z5IOYYVuH8ifmLNq4nGAB4ewOJm1ts2HmInULyHJIfPydFzD+3ios=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwoxqDfcWxvkWetJBTcw1ZMZoYGQXXvrIu0B0CY9SwhuQHRHt
	g1u45AVqBGyTGeHMz3DodP1yTiqNw+c+bhWXrCccTLJZPlo8f+bja4Ld
X-Gm-Gg: Acq92OHYjMd6qIOUK6M83t+ZjRGuKmpFK+5CdEwopzN7wW9g3h5PmTxEkalvKQPDwqj
	M0lI7Z1yCpmCDdccAYE0XY22i0H93qadYcthYxMAI9GTOPGn8ULYgs5gNwZOfG4upIlL425lRPe
	BUT1FVgkTvpFLPvIzeJKZxfCrWgEGY7joncfb2KzuKANRukQeInCaFa5EI2Px9mCmWX4w67zPeA
	9JRRLAQOBa50xV/blLDTqE2BPvJB/TyZUHw4aqdanLCXb64cUDPag92S7jWLqbpvib7CxEW2FOQ
	Cstr15bHuvaMj097nBoqkj8mRED4Kmo3RYQWQaAe0BN7DYcmjRA/v/lrc1uc1b3UqJRGEf0zw3r
	IYgpSHmrBBoY0kSSS4O0JAF7CR9WSCX/d5MIK6UxoxftpCz1kC1+F+/SJ4S1k9I+GCUgGZ0GuQt
	NaOsQsbBuNQYKF/9m0k6U4odyp1w==
X-Received: by 2002:a05:690c:4d44:b0:7bd:4792:66ef with SMTP id 00721157ae682-7c6dc7b21b1mr47195157b3.42.1778707564477;
        Wed, 13 May 2026 14:26:04 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:33 +0300
Subject: [PATCH v7 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-4-33c6c6fb9285@gmail.com>
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

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

