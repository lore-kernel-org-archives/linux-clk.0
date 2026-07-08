Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D88632B
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 00:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469233; cv=none; b=O8qe+Z+pp8z6Pu/uxCYrZYY9ldyEjgOfHZUsQfbjqylPn/uuHNO4JGS7cNRQU8DJIXgeby5EtwSHe6sO5qTelXsyh1Cf0PcPoYYvARW+RGi7aG3SWsLC2bjetguBvHKdipV59ofIxLFZ/ULcVvYqH7yFMLoeLIbe4Xfwh/LQYuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469233; c=relaxed/simple;
	bh=wsekDSqtc2irv3LbjSaet4U9i/PPbu5gsTQ1w3nEQro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTNWjd98lQYiy1HJO6WPCg6/cZsAjZMrHs6jUWMJ9x1NeTa+eOCKuwBhSyz5inq3bOGVJfrhu/ZYBg6Ne0O92g3NWMBoB83LjBRKP2+/HowW8EPJQ4IpAdb+nSdI5CeZLuYyH1k3nIZOCARhzC/2JZ3vV2qFLLGuf6ykXpRXsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ol/T55on; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ol/T55on"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so634105e9.2
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469229; x=1784074029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AoiAUK+QcuEkdSkDvLTFtpL6xxIYZx2oHXvQkPFwr9U=;
        b=Ol/T55onu02HBpfUK7rdz5mXi80MBW37T+ptUwjVcoIqs/Jne6LcVW0YNp6pdJ+yEI
         UhBuovF05fxrK3TJcVM/6eaayUYGlWBI5cE1vmvA0Jf995KzrPiEtG8vP/pwoOqclc/C
         PS2fdxxEDSaKpnhFYhoxDtmJnAqG1O+y3mgmzG33H3Syeq/2BlP3pFIwCdW9Z/wIT/O+
         2s7xnUqG/3wpiFWe5vo7msb1BlyXa8RgaEZctCq4NDB26P1b93H6Nkif/KjQBjaha85i
         OSxu6aA8QGnY1n/BvJoBXhN+BZB/lXrzAM1y4Fx3aUUSpwIbrzklwBCdXWWmKAmjAJnV
         jZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469229; x=1784074029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoiAUK+QcuEkdSkDvLTFtpL6xxIYZx2oHXvQkPFwr9U=;
        b=Ga3jPoxP5+tooMMe3N0svjkLEjUi0BYC8CoFrgEn9t7ExeNW6O7ukS2Nc3Tp1xGGt+
         yAkFa3RaTRfeGmDBkVqT0P7ky2pa12rz/U5ZoM8EFPA+3+a0Uga3M2FHemFbnRGtaUwW
         aVu7AEcwOlY3Y8ApKvYjiyYl+KZQs1UnxcsDXUo6gcpNnOHVCAjISqT9McQv7JQdjS/D
         pXuQHz8KNHnQvoa3/mFlLcAsSHWzy1o8y1fDlWOGHTeQPbv7yXG7t5UFLh/8hkySefbW
         1/w56dKRDmjY4a7qpA+mLh/qkL56kipeGmMyGDmVJNuT+ItKibvXQAm7jLxtRHZ0K5yR
         uxPg==
X-Forwarded-Encrypted: i=1; AHgh+RpPtqRLAAWw1ii8AsvHIjJo2T0eGba96hc34S30Tih4F4XuPmR1+zhrKaNpRizGruuZwSETNU4Ac3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlmwYpphhvlzw9UDJlaFqQvjEZL7CIwZVpumUT2r6fZZN4417s
	oR7YrKIm724aZ6rEnIYv5J9SDUszOO+EhbYn7ymoD47WDs37r6C32woIN3WmHb/95P4=
X-Gm-Gg: AfdE7cn9LUvy0T13O8vM81X7ZqmNC0x6eJ2Rs5KsHaUh96CYsqBKFxOPnLOj80I1OmY
	Cci9eo/usCel/VGJJ3FHOsfBZFgPiLRvDazhJUQ0+LomCrvGacTTtHfs2X4DQo35BWCo9AJ48eb
	hBV2q+bXOUNZymSg4mSZJ94A4IK+Ld51dPL8UOJxd5hLTJplJ5TjE5dQKpO7YOuV2wmwMtzPOW6
	60bJQnFzDbc3vAeRrRhGKc2XGAboYXryqt7lX/E4xO5Q96qEEfy0mRfGPYtQGyoOIFIwUZLF6e+
	Yu9AbPt7VQo3FMOPQ204no/cdgYFFkLc/geiww/FomI7b26MZmqFwXYEYULyddmItAZqRrbZTro
	v3EgoyPFKzXd6ke2LChE7rzNNXeDZOz+PB7/zmGThr/KXaadgCky3EuCwPjtRnQgWqY2oP8eWJN
	+m+0fUj8c7HxkQvQayDbgNOjw=
X-Received: by 2002:a05:600c:6094:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-493e68bef5dmr593455e9.11.1783469229518;
        Tue, 07 Jul 2026 17:07:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:56 +0100
Subject: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=wsekDSqtc2irv3LbjSaet4U9i/PPbu5gsTQ1w3nEQro=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSn3jyqM4YAJUbOEsf5SO79EIIR1f8XWFwcE
 gy8NFoifLiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 Oo/2D/0RNoa0BSf7i8yYyNmVniR4mS+IDbtbgOFuXoyHiZx41MK4tm01leIKX6hol8n+nda1ztl
 MXYXE96F/JlcmqfR2hupOiPCE3909E/oCOrGtcsEOReJXGdCYVRiJT/UrLC1nilVm+QmoCFdDDP
 do7zmfoW7ohFRzzBLwYlZpmiYBHHwT4alAoPn1dNu9HzrOwFCUc+26G3JxonElo2wJ6uudClChV
 neIn9iJlwo54gWfzVZPcOdhDCztTERADaoRfPwVQPEhkSBpX3AClqCc+p7asm1E24rCI4G2Uc2U
 JPZMkxofe88JCrFE9ZD76gVNs48Ijft+KLSP/6Z7XXG8sWeAg2pSH0WcB8WabRKVoHLUGzmzLif
 E7pDzWxKIvD85raVsyo4CIP8XfGltsLUGoFyMtlCtFuvEZgkDOtsS/XviqI/OMgd9iAw98sXXiZ
 FLvEEgC+xJzoppfp6Ak7vXsB4tfKy/869lffEIogEwtu1LksK4CG/zyYjVirgp/Y6TYFRFgrb5U
 Vroj9Bq6SMRjeQLe2hahJ89gc0TWvM0RY402ll63Do9HoZJhe4B95J/aC7hW30+1z4+ye57lgFU
 hfCFNJQhVuVkjyrtFJqOyWCqu9dDmrhdHsLS8UJj9rhb02wImCAaBEIcckxHIVbEoZRSXBsI0tO
 K2u2jY6SOUgWknA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index c17b9757b2c86..c4454355f07ea 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -112,7 +112,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -361,13 +376,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.54.0

