Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E687407CE0
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203632; cv=none; b=MQInkAJlOQ1h2ODv1lHPk857n4LCl02Ei8sWPecamlisei6Z45FRhFYL1Qf+bkPHT0ZNij6nAHhgLnQ5U333errq4MNAQPRLcIkt/pMos0YJkQHEAQBHza5OVeYfs7NRiAhqyQbosk2hXaH2pneap1HjdVQMqYgKzlUok81n1Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203632; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tou0K5rttkXGM90XqnBo6QaWtEuL2tBoHBksMQuKzdw+2Thb39lzSRAYWd1ZzO1atrn35MjOWsdEeRQbRPVXjwDOyEAxzk8NM/ARuWA363H+b4kKJ+tB8UtAPwe4C1S5ZqvZlnXQfwLa2M4iYexGAuuGTQyHJ9um3fp20hTck1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfYX0kYW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfYX0kYW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bd124546379so667686866b.3
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203627; x=1779808427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=mfYX0kYWGAGHja1hXI5OLOgYj1OQk++tMmd0JiTSMXFa3ipin+LIVMe6e0gHdMMm3h
         fnP1qEat6X9Qo7I6dkypZ7M88rPZW12utguonExVUYK5MBfOj/aFSj+cO4gu9CD26JMy
         1TAmOEmKKROY0pd1uPweLNi1OgL2WixWPWH5EEj2fExxgWrdFv4uofyGRvUlJthnGldP
         z+ruEGdbw+TE6n0kV2kXZ1H35loTcxfhUSO70w0bfbI0UtktQxy/BCbgIiYXiNfU+JR/
         S6Zq9nPfznw9mMQNoaPCMyBC8glyaZ7ZPsvkvUs7gcSNT708imkR0X6yFTvQhaw9mZK7
         3Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203627; x=1779808427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=Ct9X4qeN/HQPSz92X5lAqgpvSUXXEgZ0cYlev0r8t3i+Lvsbh1VFBZBf7y4FjXw8w0
         dr/KHUCaKKhOP4ee2NHcE6qUHMYgUSAvSa7YEYTjp8UHsA5UbDNbgO4HRfuW5yVGHiwH
         uMOgy9OPQYc0Jt+eSx0drb+bNJy+pdb1RsGa+dozu7T7xR+zVdyJ+qfLr35aT/y1HKhJ
         SPG2NZtxBQXrVAFM9Pw6DoDA2UCQBdLtE4pJidIViACl4D/dTZ8r78xWDQSF6VUVirZK
         hzZuSowbkI0QBjmTkd79oUw0edKybTHlwO0ubxNNjgk+0NjElDu0qnGomGAJn5aM5mRC
         Km/g==
X-Forwarded-Encrypted: i=1; AFNElJ9l9G28vVTDg/+WClw7laY/0yZsFgyGRHs7dx5LemeLgN44ahOiVVCK5gdsi6d2AZueRyqDpLYKrPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzJe87y11uWqT7vLgMe63kAEfDAnAgV1231GNs0d2kNSDf7s6
	zvze9+9/jNfEB6BLFxHDDb9WrcCa/9jC5FqluVDg9RuLeFfKK+769YIA
X-Gm-Gg: Acq92OHm4n+P6ZYpst3LvDdTSk6JYWlF92u+eKPtVESZdyRjWkQg3/sQmjMtoyyumad
	8rqSbAmBbEEuyutQCdMLFLBX0Mbwo18NELQYOWfHCvuIUcmneTcA838x0g4ijyXiRmD058rjxCj
	VtCRXcIoePiFMV5Vdaay9HJmMzPOCc5ms2PNP7EAxjmGHMeOIhGdiQ8x641bqyQhakEJt9pSaBZ
	pPtpZabAF5LQCs3A+qIXmrsIVkaGcxCoF/kpmrpF13/vtIpJE1D134C54b4OELqsAztzMu87jXr
	H81Zps8tXCg7wQJ0aeyzQ3zi/1trvJXJZM+IvxnSqMO85DR+Ktu3LoNwXZkhX+hszDamxiZaNtm
	JRYDmkVN5izGSpwqsOH6UESxFWeUslYrMCSAPXMpciwvr2QjJWJe9g9mlf459jnUdnrz3jBKsFW
	nwQPuA9BODfSm82+QOc5c4F9yaxQ==
X-Received: by 2002:a17:907:8b8e:b0:bd5:7c2:7622 with SMTP id a640c23a62f3a-bd517aa9716mr1183183366b.49.1779203626813;
        Tue, 19 May 2026 08:13:46 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:44 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:52 +0300
Subject: [PATCH v8 7/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-7-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

