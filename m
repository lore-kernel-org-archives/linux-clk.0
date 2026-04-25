Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D11235A391
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141890; cv=none; b=FlPmHnlODZ/Qet4OocFFBVQ8MAffgraqy847ANY720NxlgcIn9pn3VQJQhxNhRFm2MIwP6rmYs1Wd84x9oMP3Y9ALzA+rQIRsbkgzjSUuS+2FR0BFTMlv2rbJorbdOucmF/GlxV5PDZroGs5U/1wQVX04wPBFtNmWn35xH6fZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141890; c=relaxed/simple;
	bh=vI5c2wup3N7m7wvOZ+EpIQTCCYUqkmceXR+DGRotI8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQ9EbM7As/7EnnSVH5Oel0qDw3QMgBsEnqZFXjauyaMKXRsxqq+QS0a8whyv9pnoYdfLy7oJdTkk9u8iVHGjNnJhkUKbXAcl7o6Lw8adcYNeJZiKUscgRmzLD0jyqpvaEZ3VEje4IG+w2nllcJ5SI8cUHKVT/vNxuArYT8vHHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNA77ZAB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNA77ZAB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so115083045e9.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141887; x=1777746687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=qNA77ZABmGYyRinjOc2E4dORhLQmY33aZnQOhmikiOiuDjqubnKYUfmAU7b/19OiIP
         S3glB21ABZKlXBMRBYnIY6UemA3/jE1+Fy9Ms7W5EyDT2pRenc0AhL7mq/5COej9L3cE
         JH0kPDAkTBcbd1hJf3vbbpAJBzHZ2PEvew4eJEndafZas+hDWrWw0r4eegfW4DBC+Lxp
         XhN5MmNxP2qdKaut6Yiw24ntcITRuCTpyVLUW5MmeYBQrvHDAoZkumnOIN/W/ZrZRmZU
         gh1NknLEmgzHq+okCHe/3t4nXa2KdF/CI230WbX/hgYK/yYIe+5Tkvx8LC5O2o+6rAhr
         DNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141887; x=1777746687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EammlrfJSIT4ldTBdJIISmN8l1LiV/D3VbIo0yD3tMs=;
        b=DQ+nQ822S5OQYvlVmTqEj2ByWamNCFHvLGisvKodGTlS+Qyzm+TwzJwQn45KPPCrxh
         YVcjBvnFqs2RqQNRLY/MhxcOWDnAKJ9mfQCBRLuI+pO01M9zlVHOBhBeicidTnWccvvr
         xyHKueZfiA9uhHWVPHRrC03//nvcx+7AuAVTZtBE6ksvm23xBs1vcoBu9fCyyhao+SFu
         wAEsTgbKz7nIagy/YyyBHMJelHjtJmsD44jtDlZHPCLjwYeQQ5uUlmYjUOIpAuPT2DOX
         0Lch3fXwYMCOtyZVhbcVC/AIhIbTDupM7j2MrsNytOvBfI8At+QgvPJvBI3dXCjxsldS
         GBNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IHOKafRx9c+IoioSoWAZBartn2dhjQzSmRnWiVmah1RZc2Q6IXvs5jdftTU/r3C2N0PANi4DTyPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/jm13WqH0DHCOSX6hTorYaBLdW7UN4uUQ7H8r+B5TgjMoD0W
	qviJPP2fYrWX4MCZYd4au7sEh8pi2DWqRes1Fs6k5TTaMB1lLuNt9gou
X-Gm-Gg: AeBDieuhUyJ5KGHHgZlrYbkNMZdQz9FJ7io0G5WJY0MEgYzJI36tSkHFV7wAhq7sTbK
	eaEfmResZOY2FBbrGiSs8HpSF3kqz6TBYJGE8SnSfOCwKptX6Z7q+QjRmqyLIgiyZdwkDoBZeKj
	I/Vf6VUdetTtIve4z7AHPz4dY+RfWPByvMoydMNpnqcL7AhvBITvj4WHi1jGkeaF+0MhVpdFKze
	wB9eVryNknkQ1j+sMWw4phdAZcJx6Szq0AcL9UIce3tmg4ov+ALqr6KYsTWvhJ6IcgysXvgb/HD
	K0Sl2kKrN26EDTOIOA0CbdRPKaFKQl5iXQw1l1iGX32WmQnACRoQyoXnkexC9HYVRaGHD/4yJMP
	IzIDAj+80AN875nk7s6A1kRWW7Lu3GiIK3l1sMyAKUqlhAQOmDP/WRhAKzu+/pLEhLiAcUujH2v
	eCYIp7S0Vb9LWxRBC8ImUsf59Vu9nVsp8FAnc=
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr401209905e9.18.1777141887310;
        Sat, 25 Apr 2026 11:31:27 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:27 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:06 +0300
Subject: [PATCH RFC v2 05/11] arm64: dts: qcom: msm8939-longcheer-l9100:
 Enable venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-5-f69e52b36207@gmail.com>
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

