Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863C336DA18
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142832; cv=none; b=T/S3zpExcfuPfBMVDaACrmJafCA/wVNnbw5afosNbXibbpn43kl1+3Vnu03EUB7T9aj3iscedufrUqphvisrPd6C8noCsbLiupzE/wawH4L2+yTc0KqqBqfH3+Wl1tjGlsswiimaOZwQejBhGjT9lgRRf+Sp/6n4NjZ7dKQ/rDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142832; c=relaxed/simple;
	bh=lEdP/gLqj9JlLEHbjI0fI3boaFBdOzlJrficJFhY4hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NSwc584mgwoczVOgVH+4fhL4scxVaiPX9BPQcrtbpO34075XzOJ6OTdKTo6WU3vwCLZK78SHZaToETjzusVdGmIHjwEc2xGJVpw2daTwKhjBqRuRdAUg6BR6xge5BvOsSq8cyeC1XgedFjLO4uiN+s2nnCqXpyanigMw26AQyOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBqjBGGO; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBqjBGGO"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7bd9f61458eso4153607b3.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142828; x=1778747628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=cBqjBGGO6W5rgXKaRMmJV26oGDFrVsbVIffDclAXGQKRzf/zQP+AZm1Xg6xbm6eb6N
         nGtDrhc3hlZSw3o8k3yspUaz8wLJ/RIEMmZo4JBgMVXyCqPZd0Jkk+twoCAej50EH/6G
         vLR8Ly262PRKAYJHgnVoy4La7kJ30XE9QnoVsuJw/Ihv+boEwfD51q+uNOrVw9Bcas2U
         qBG7F8ZIHStyTBECem7Qcqq4fv/RBj+7u2/NeMBIWBnNdpeOaRDzD4lfNN40ZGHu863u
         vgHpzHeeGncq+ZciTs8R3PoZVyLYreFyJrENZEPFUIRjP1zhusT1jzHGif7I+tQCxnCN
         vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142828; x=1778747628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zxu6jfb8KQTr4q0ip95qIz9W/TDOwx+LsiVMhFYa06k=;
        b=be2DE6tYX5grRbu3SJmk3l158r+MPvK94CmoAyKHnuaSA+sn/XMUkhVN26WASAFvNB
         uBfJIHCZGLc8Kshfj2RO/Sb++J5f/aHjbajTz4nAy/ABy4uQYUoIn61pyfVsozQBXuyZ
         /dG7gzYRZXsPwNko3IyqrtdGX9GKc/XVdsQgsGvGdpyjXIkcKn14Qt1MAcX76A80OiiE
         HpvRQgKnd0DQk5j/N1cw/OXjWbStUatAVrlLiKxqg/iYYYEgRJ5B7BqWe0X9jctjhkcI
         xDSSepfhgsOWemiegrY7rk7IPiVsjig2bLXDHrtDB1euPfsoN/HWXk1ZJu+hxJ5jEY/E
         hQLA==
X-Forwarded-Encrypted: i=1; AFNElJ/PiczW0tDCCC+N71Lo8xGahA7x4GYwTOq1SVB4z7ViTpZX+0CL5aeyaVGNr8K42MoS3eY5WC0JbJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXjxpVcSmx33HmcQHhDwVrbUtkRQvLDCCZSJ+HEWujnrOM5ap
	j0fotwgo8fjHq9D1pP/0PbyE/sL3cyYayzACLwBbzjiH1AYhtBSHlusi
X-Gm-Gg: AeBDieuyvznRlvNW74c4zJYg831WKCO/XQdhI9XP24xd6CtEaHkC7TSYgDjlHqQbWX8
	G3nTkBiP4qiQqG45hmr1lInYz+jvFaU8OcnaobSJRiq8VBVIX8B+GqmM+Xy1wO+j8W8aGZ5UyuD
	QcuSf5qHr6yYzc+Un/cQeVmVjm+EeKmEEWeY5khERNnZwq+Mjqp4GgL5k8ir++lFRE2npymeOLO
	HqWVOQCKMgwIIWfDMfNc3tPyns88FduLQIJsQdbjZjAnbvL4tpCsGjzpbCX72OTd5Q3mlq13HNU
	f/K2rsdMskiRS40W24EPzeTgXIwATSp7cQpLhB8ZpPTUVt1D7XHMvVTBjPvqde/jp5EqL9tJLUQ
	mwHRNL3eKPVrY2+LTXNaaLQrAxb/nF2faZ4TGTdP6fNuQXaSzuKV9cPhfXPMtlukGc1WA4gpeqq
	vfdvd8/krm2cowQ/q4JuHcvW3COGwJosHV73iSNV2X1yXs/7U=
X-Received: by 2002:a05:690c:5c0f:b0:7bd:9391:b5ca with SMTP id 00721157ae682-7bdf5e7c904mr68027307b3.30.1778142827969;
        Thu, 07 May 2026 01:33:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm91692297b3.27.2026.05.07.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:33:46 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 07 May 2026 11:32:17 +0300
Subject: [PATCH v5 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-msm8939-venus-rfc-v5-2-d7b5ea2ce591@gmail.com>
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

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
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

