Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585ED1FF5F6
	for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741958054; cv=none; b=lE6od9KLa+gxruFIitaSGjaNEH4zm8ZvVPepJ8YHvvvjheRoRlfy/vZQ1negjamAgR52eDBE/CxU3E+6zsPiEE3U/2YAN7Ox6x/+6ZM9tl0C/d/tGsc3JRMII3iADTWakz9x2jce8/igsizHGxWShZCPVe7pQIwcLymfAEmxMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741958054; c=relaxed/simple;
	bh=cE3ZDLHMVCtIotuS81Y5prDseawFiAkM5c5zR5rn+Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WwxU9vDh2zr3YG+L3JG4Tg5942AUswjYdsH/uRcaIfVUHu8XUGRlBbzzuYToI8Tr+PwQSFNxJqeqVoaqWMNVTVlsDiQTAUSryPczv82lqd5wySEgjN8SGEiZ/LBNJbpmspTE7+xHkRN1jB9oyEWn2ajOgWaSEMzfqlcoGtr6Bzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJ7erpiM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ7erpiM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso305991266b.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Mar 2025 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741958051; x=1742562851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOgk5pHedNikU/L/p9FY9VlPsm+Vrvspw3iFuqU2V3I=;
        b=VJ7erpiMMJvhlswqK+g4DJFRLxeLyd5ulWnhuKVsREflXBDAZzcqzHfvMWC1J6Kw/b
         XDsAfaygDdQ+mMNXHktVOE4DjH0R/0rUfoc/2RHaRvuBF/waV+WfxbK3wpdF+iQVEP+J
         orpGNiP58h8hRioFc1RDaEMOTrLGp6dIYG+4Hce8wjbe4xeZaoaaVfPED0DZTUMYp8gq
         EIruhZ8zKNtDqFsPC9Z4A958tIUsUAqPePPV/GOz4lw3ctGlp0MWXzUhTsx10ZdPtH4d
         FGPqLhDV/zZvTDxiO0yOoGdJPc5+302Txsa5yfXjizXTNsVlM7FrQAI5gYzIJzPgnYxa
         7Sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741958051; x=1742562851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOgk5pHedNikU/L/p9FY9VlPsm+Vrvspw3iFuqU2V3I=;
        b=pbe57m9eIAsJsCzzXj372ArIbQpl+xTaW/lw5OSErL/WQQca2qb8cbdcNi/3N+RKAz
         HT0xJ8rSvLWcY9denqYwUL7bc4101xnNxwfUkhCvsO/mS5c5JDxDE57WWKcmpPNJThGh
         gZipda66mTKg3OginQX6JqAtEDOdb3+cnu0W47q5qGO2hmdRvDHde0gD8dV0oOlppJ2O
         DtNA89opcJYALGwGSus+ZbFCa0JoyWI9yTlFRJLOZ7+Jaz8PLGfksV1jjMtXH9lcKVbz
         +8pLLP5gRdbr9Fox2Xq22yZBuTeA+1IVqVXiZr4oVrXf7QiZCx1r+rI5svbE3D8sMtBw
         y+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV4a5xq6btmP7MVkAgM1R6c9Azr6t5NZIfFB3/Ao2o93w1pvsM0a0GqHYik+3nda5Y4pohSZPWDJzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+hEDItPoQSSeOkAE7D5qTa03hg0v235Dp6aYbX+b2IvYMOWR
	4bi50JIrqrDxz74CnoywzD8DbyDSUAEKIwIxo9m1SWFUFlglnvkDmMSf19q5Y9M=
X-Gm-Gg: ASbGnctzCsufG762lDIn76XnOftaJdgVBVYXyiJAsN/futci91y1PP6Dg2dh05I5V5p
	2h6jy/Bo3Mk6VX52ar+sLVmOh8zdKwgBjnFF834XwPOxKe8UJVmW48AiGnwjgWnTKkw1tS5FVAR
	mUO0YDFLPWHt6+KKhQN1t0EZWF1WPqKCJApz0Y0HxTzBJPy1jdMwaN7+MHTUuJ4G2dsMW88m1OK
	zBLXe7Ar3KVnpBAnyragzG42IU8GjKrqvjSzdawGfV//hhfyry6bmuqXMTBy8Xbv/8RWbas7JlA
	bFpu4Gi/NF0olZoMGe4JesXeWGGmWiMf6b9Tq3uYCOpqda33Lot0xL3Zas/v59UfOert4kp1Bnp
	jOKmtjcXem880eQ10tAuIenjHpPbsFmaBhHzSE0Jzu+CFiZRacfV512E7/CNCKLAOwlUQ
X-Google-Smtp-Source: AGHT+IFICfx6s2ahDilrUKjMY2hoAKzdOXRDKZ+U8wu5DRcXfNxv0E0ZqY3VVzjA0AW/yZ6QM1OUuQ==
X-Received: by 2002:a17:906:4795:b0:ac1:ad15:4a8a with SMTP id a640c23a62f3a-ac3301e01b5mr325622866b.10.1741958050564;
        Fri, 14 Mar 2025 06:14:10 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm226008566b.137.2025.03.14.06.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 06:14:10 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 13:13:59 +0000
Subject: [PATCH v6 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-1-edcb2cfc3122@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

[bod] Adding the opp to the yaml is not an ABI break since we currently
have no upstream implementation of this yet.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a26090186e4ee4397ecba2f3c2541672..18136694d35977f51a332b9040fe61d0b18ac44d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -40,9 +40,9 @@ properties:
       - description: A phandle to the MMCX power-domain
 
   required-opps:
-    maxItems: 1
-    description:
-      A phandle to an OPP node describing MMCX performance points.
+    items:
+      - description: MXC performance points
+      - description: MMCX performance points
 
 required:
   - compatible
@@ -66,7 +66,8 @@ examples:
                <&sleep_clk>;
       power-domains = <&rpmhpd RPMHPD_MXC>,
                       <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1

