Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669142;
	b=0JK18LW3UbNYZExe26vC08Mtkqv5K8OpNiOSNm82qmj2ibyv8ybfdu1CHN7Hd8NafogV
	 WPYZsDdhrYQwrSr17Ey3OtPm7s7Mw2GY8GOseiarOmFEGW9GWPuPD5NccOn0nwCde1Wj+
	 Vp6f+Eca38bKoLzM/i3CngjcnvdqPi6uieNWcFRpXRYBIjiwpu1CgN3CDFN5FM0w1WyN9
	 mtr0OEPwRpgeSzKjWMnBT3sEf4gkwyzBSwJThz1ErgVcVILy1Uu5siv8SGV+HIKUx9MiA
	 sXwdKDLKlT9ON65TR7yM/73fkRjBk+GcLCEfJd13C0sECP1K68nAgsLzXFgq9UgV+/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
	b=dzBmy3d3UWJCBNEUeIOcwGB+zhEqFGpXmlmDDuCXVWI++uSWIwae9qv+aXMJ+36zMpyp
	 iZlJg72MXDn65y4PGTzK1f20LaAX+kDER6LMC6vAudDZ6WMTin3intmQSEz1eRjz3heye
	 xiyl1y/uQCilp8VGqX8RiqbtWM44TNF0DRmMjMybMqWslq4oq7Oqic30Cw79LFB7G7i2W
	 nnESi/7vPcSSpgA7/66dWseSMRvWvXYEJvDidsMrOXBzQNB26AaAIk0LlkZTnlM66C8ue
	 bPeCkDmEl6gLLhqGfRlF257L2XquazaWsUrSCYs7jQpEWwxy+rQMMX1g0vI0Qknws3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD9606A323
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kSCCzsYD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380c28f9e35so7640094eec.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669141; x=1796273941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=kSCCzsYD7TTe4A2sL6/ycJJjMHyhno0Gm7v4rEASckt7CADBOTSYdgZolwxbk5ly8G
         ysTH5v0qRaf81Vg/CLag5o9PIut2u/GrMvkWnKTP6/Pwm5gX0B1XOgvF9Kk1F0NPMw/A
         gNdqG3H9A56JnEPxB/tym8sSNQ0xdU3BW7VyEwNal/q9VseZZHzJRy4Hn+HzVqHdVpwd
         9Br4aEBGYslbcoSL8Hl1hFXNBFMqN6N7lLK9hsyUVcRR8xaSvrr1nSAMTM4vJ3kRNapb
         X/dkNWOYyYezCQuNUgyh6p7lfHzVVhmLBUcQkl9dZhBG91WDyReJ581nLKjT8E49GXHm
         rX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669141; x=1796273941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZbalvr0RZKV2CHqgY8md5UEm/BcGTfETxormN4SzfQ=;
        b=tRDWZI90gtxWT2m1lciCKq1ceWei3WeIhObScYfsVBblkw07qrzdifGL9lZ1JJxFPf
         4kEjPuoh50Ufz+7NUAdo/y+DYAmcIfsWyO531Q2i9NXpE+wtpacye7QEYADNyfHHylkr
         T3SBmDkv/E3deWTgRCrwjEgJTyLwmvhAPwVJJq+qncqxgQkTOiuOx5Mz55S+1jLdwdOA
         SDWNQNPyl6UbhunOsFsALu0F5EfIouxkqrKYMgASPKQRMXBW1HioHGFu3aDaiFZg+K8E
         swsYIC/KPTuiq5wwkLJN/Bd1vAyTtvTnoQc1S1xIEPrDrYFXKZsL4XLZLKrswzAk3Csp
         9AQA==
X-Forwarded-Encrypted: i=1; AL+hErFPssX8G5l1PIUT9Q+OuHGObzJJJpJtWdi7BYtxRhYwZVi8knf1lC31j6VUZEg6eAGt3u9UbilFHMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FSgMafRySsRp3AYOd1fKrrxGcaXce2HQXaAZlVpol2cKRu0gS
	am2w2PZW6U37h3tdEaqTvGb3nvNVwdxtyoY05CaQrg3MVDqmzdXx+/2P
X-Gm-Gg: AZFdTZcLKPbnspeEnSuhoi8nzkn+tteXi1UBsYz5wOb+tvC1/pmXOchc0Px5vK0+OAU
	Gn/NTcIUEcV+TIkFkxLemqmV2bDSPvuDdQ7t4r3FammjNQdsh8yrnhrqaT5uO71/tzL2yaXmZ6B
	IZw/efOoqIFX9tZVUxuI6mMzI+cOVuZWuBga6uAzzRwt2KYn3seJlT64x+CRzqJkUxcaoywxhth
	NfQsFeoEZ2SXPIfpmn0hV0rJZivwqPmp0/pu2no0VK1IplsxmsX4l3Lc9lIh2A6/qqT/01FPB8o
	/LLl4c3OZ5SNPXd62fmIS9iHlKwFouI0q0NGS+v3oLgc4Y47iBmDOlb6HNoHByo5S1n+qcCA8lP
	aR2k+ICjdgWpKBOIaksTIHB+5rOoxNhx2lM7nN99lZNY2SZLhQ7WP7W5X9cIrxPiFOBmv70a08U
	Q9jT93wN72jVGYlcPIM+T+mlu4CX3vZ/RAaoRhrWlq2Azji5jIK4wB8jypl9YMyTTB+2Qddgqak
	JvEvJj+XU95Xah3gdrmudDJDS0owChabUrzbcL48TsWE9YQwQomp9u1e0sE0bFAiHUOqj/Rv5Dy
	S1QSC0JeWrbPqEVxMRxsEiYpHvgodQDGmKnLPaGl3tw/HE/2Ptsy5LzJdwKircTnbY3R/pXZ0jo
	uEkl0a0E=
X-Received: by 2002:a05:7300:cd86:b0:36c:a3ae:936e with SMTP id 5a478bee46e88-384b398741bmr30143044eec.5.1795669141005;
        Wed, 25 Nov 2026 20:59:01 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:59:00 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:09 +0000
Subject: [PATCH RESEND v15 4/8] dt-bindings: thermal: lmh: Document SM7250
 LMh
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-sm7250-v15-4-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=791;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VBYR2sSJ7gPSfZ1zDIlxykyMXb9GohC2X09rRKZ3wIw=;
 b=buX/Uir1r9Tf6tM9hX+yZml9fjYOnCxBqpLAg9mgfqPDutjiJqzrSC7fD/1Lls9r89OUWSfqY
 4QvPYYL9spzAIblrGWW8QtgGHnWwsrntmH5gOADX0P6V/5pn1RhOJOm
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the LMh compatible for Qualcomm SM7250 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index ce72347e2..e1d5cb871 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - qcom,sc8180x-lmh
           - qcom,sdm845-lmh
+          - qcom,sm7250-lmh
           - qcom,sm8150-lmh
       - items:
           - const: qcom,sdm670-lmh

-- 
2.43.0

