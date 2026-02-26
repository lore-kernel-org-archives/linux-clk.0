Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBF23D3D1F
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116133; cv=none; b=gvjJlsIMu0WZKo1Ny72wdGL0KblEBDRK/Bzl+bckeosnnpbd4s84QadlyqYd1kOragsE2DWJkj9UQGY0/2o6PKeSWIqFYRvUPElqQ5pw38BvaLlnHtPiRgWS9f8OiMt7dft26vvjLp/i65h2rz2lbEEw3o5cTm5J0og93YjQY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116133; c=relaxed/simple;
	bh=WJDLlVX2Xzk+wCJnEgTtDLZA4OHjsU9S+VdRID0jrM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccehRbTU9nTdj6HdZgxqv0yIEPKYod5FZsCMya+5RSW/8In/ZIK/lUjnz2M7N13PsTRMB8YdqLxJEd8W6mdzO9hxVnpUuDjOgAfY5RZ6XdySve2ILt4F/8YP4+W+BWS4G064qMulUjzmv9BD05q0Ew8pUf/u/Vs2UZNf3sbt604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9xm1AcH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9xm1AcH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43992e3f9b8so943461f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 06:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116128; x=1772720928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBils5t80gyOQ06en6vqctPVY+b40EmRNjQtdblnFBU=;
        b=e9xm1AcHlxMX1N43xyXA2PMfdPacnmLvorhVdKCLqdrvbuh+VevRENkseG4WLdVvj+
         Ynp5EsSLe/P1ZNtZyMlWzHYZoRAjnB9LSxWcd5POBelfzvCk8qDPyjbuvKPgqqYZ6wku
         kxDeaEZoq7jyPWpUkK7qu+8YuhbZzRwCCRZ+UWn7mpQUpc6URs9hXhCtoV4wpcPIdz1j
         yq+nwIwBvl4gDjeW5bscZTNLbMhNlebWPTm89cbwxnjNQWwScGzsNFDZHLFVYIJs6GI1
         m1Xx2Z2Orh0hQEuMoQ+wwRDsZWhFggpf6Us/nWFlMuRSr+93l7EPJXCstkb4NCM7Gdmw
         lQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116128; x=1772720928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBils5t80gyOQ06en6vqctPVY+b40EmRNjQtdblnFBU=;
        b=tdZspTImZ844DOeLoRV7mmJsbviis6mWZLaUWuYKOTyFtj/Di0A2K/H8/fbJU070jE
         WrOVh/eK10aJB7PPtFTf8v49jQEs3OcBU/vP6TF7MsbsmetlHbnC2XHsqx8wLBAYcuGG
         VrmEWXjNpOMtVFlQLVI2OuJKi5gP6B0IsRLFBMN8ewDsBvt9eDQSg2Lv91iiMUWfIt0t
         ++PMXxTfyQfRAv8/KfsXU1y2bfr4Szmf4Dt8EqEgvgyhjfifXFbCkgLbsZjG8a8Ug0UE
         h82CigvVaB8zBX/CIlxQcSYDyQb9fCZkQDX34bRaSwWuIy6xc+7hgYYIBa/3tKEDKhZT
         I5ow==
X-Forwarded-Encrypted: i=1; AJvYcCX93u+stfCvwLL6B5/kmVglVGtJVkMVi7jDEOigR4OjyTJc/J4xYHHdIyMV/HvbRAfVSivQktC1cLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNZWHvpdpNsU7IJNKkTy3nbkZN6JMrNL2HnyKcrvP5Tq5wljQt
	mxVeL0CMR1PatnbMGd5DzMSYO/Qb2fFxNEee7Ec01uCdwQf/MrI9umnSbdftRVXrWwI=
X-Gm-Gg: ATEYQzy5K3Y7XArPXM7NLtMOugOoQzxENBNYZPr6LWybYKvtxxfLxjgyy2dagJJH0bO
	jqCehUgxG+ESIa+zp9jAiy7th/rdFXjiCh540seYB6cozx6gIfOSuuScjW9FMkv/i4Zhu2NRyWH
	4VOxifO74YM8FPOw/3IBGYVYkvJeENx6JepFPY8JpWnikw/7vDVPEAvQw/LO+kvWjLM7+uI760D
	Cb+9Hjq+A4h+LqJKh0Vq/mH6EKqUlbT9Lol2EXm4aY1evVkJn4bd2vmneFaxm4xTy9zQsKEp0dq
	r8UZJRCdrBDfaI3cfbRDofd/qmcZKHhEZjYdBbBzP0mcCoNQban1S/Uxj58aVilbD9TwS5lcjGt
	N5hs0S5M9Kz2kwQCZvgY8aTekdN2+DaM6Yc7hkZ9g8ge/NIOW6Mo3zUGW6csA7A0v5NtfqXXghM
	AT/x5/if4bcxQZvTKrL8mdiOd7bqAaS+ULQLQSJnjOPZuPyBV93Z+OgJjfpwYpn9fv
X-Received: by 2002:a05:6000:4304:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-4399430088amr8840100f8f.58.1772116127466;
        Thu, 26 Feb 2026 06:28:47 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:44 +0000
Subject: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add iommus
 minItems: 5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=WJDLlVX2Xzk+wCJnEgTtDLZA4OHjsU9S+VdRID0jrM0=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGmgWJvI7Yftmj3tnq2NZsEYjkfrAv2WPd9BI/DTcJOV2ZZKo
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpoFibAAoJECJxO7Ohjcg6RjIQAKSu
 pnlNPCH3LuCekIzc68sDIxfaU30BrwuGyg3baSla8/vw0tDXfdKOEoyop+TR/SzFNdMl1w2e2qu
 onPnhs9nJp9NjN8i0NIZFT3VjcxbupEwaiuDz9Kb8hDT68JQiCAihwCLfQk8PYUHvUxhrum1WzA
 aCV3TR2srBdbWo/b3+bIHMhHw5g/WKct4iJUoXyAl4zU+1b5fQybNoSCp9vFUUa89pCmA3nCUGi
 a4DBeh9wwzqBGfz5uzEdMmvPFJo8TvfI65HpYK8674pYpPFWnwDfYFEnr4B/EAsT1jNbHGH+j34
 fFtGq7Zsk6kep89GkLjDx39YgAO/UHmdo4FURk4nvgjzphZf9S5aLoeIbZzhoirUasgw46CJD4v
 hgxRWX1u88wPg7U4xwM45uXkc6d7hgDcQSh+m89o27N4w8ZQxn4oW83qS4kdXrPcpT0iMuYCqGq
 uYz/IsdMlkHK8Xolpvt+QIDn2oGv4OzY73m1CSMTBV9tZVlIaF5Wq43zXKnzkyjry2GOnoGIRPL
 4GlPsIJci1jb96UwCLeNpSzTugzWde6fsvnEVyPlZ0LiOHgnuYB2ryJJEneJMHhd0eA0JI3i4nQ
 OYBeoO8nSPvljxipyiQB6WrntjGd4Cwf5FfziYZV0Yw34eM+4r5jwO4xcI5qNUh74zdfy82JHy5
 sSm++
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Specify a minimum number of iommus entries. Currently the schema
requires exactly eight. Add minItems to allow fewer entries while
retaining the existing maximum.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 8dbaab16b11d4..f406cf6f8f9c1 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,6 +104,7 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
+    minItems: 5
     maxItems: 8
 
   power-domains:
@@ -404,11 +405,8 @@ examples:
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
                      <&apps_smmu 0x1860 0x60>,
                      <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
                      <&apps_smmu 0x19a0 0x20>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,

-- 
2.52.0

