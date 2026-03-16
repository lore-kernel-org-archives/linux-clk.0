Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E7263C7F
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 01:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622931; cv=none; b=mFcmZuyki0O2HSDpSsu+H8XqOKyTWWL5I8+Xvkc85BjEVGPWVBdnTbxniLwWY21kTuNvNh8y3uwZxUM+GUqSzlp2T5N5tFGMfZ79ECKQOaZlUOrFq+jgQa6Hr3ZSqEvyJDRx3nrf5zcDgiFeYZIC0pRIx1fNz/q25s1154qWJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622931; c=relaxed/simple;
	bh=FC2WtnD/edrrO3dvh2jkDAJh4YtyCCg10TeND1JFtJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAbxOcEqycj7BuXsqq4On4+TEBrQ/OQYOuQI12YOImNRYfENK/lwY2C8vc7fqJ5G+9LplmTlKKlb/DDwtA/73E2X3jaWnvkONFkSPLnOMUL97vCV/dkllJ31aC8KPv8O3E44NGR3V/QUpeH75IeELTUbxXhMb7/+vJgBhD9SaO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NfQmxLYG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NfQmxLYG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4710231f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 18:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622927; x=1774227727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAo229F1McxQvEyDk0hFi46mMGpyqb1mbBmM/21egy4=;
        b=NfQmxLYG11UTF3quj8+GGKmTCVINbKzCjzLZYxXSNtqYKoXrzgji7ss7nyArimQGsU
         ch/zacNjrLDi8F+twkyzQkNcpp69I4NKWmGp3FYV4R8WbwbWcCAaEqMe3Fbe5fIlgNaE
         jy150tf/7f2tbJWqr/RVXZXsLwUKLkyIdZWlv6YFnw7CH0TSjAz7G/F+0jZJyA6JH/C9
         znj6/7kIhG+00YjOY5v7sAr6vdBpN8G9kKpFZeWlRVepM4OU6adDSgGImsvVUHSpX+fe
         nTeQUGY/wwNaK2f6UBT4CR7Qka6ilHBUboRxyVQWjRl12lrIAgsbSlLO5ig+qiudtqhc
         rqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622927; x=1774227727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAo229F1McxQvEyDk0hFi46mMGpyqb1mbBmM/21egy4=;
        b=ZSp+Da5YhcQuGfmnOZya4OvOfQMDQ0GqdRqOM7jJXHqA4UfnJ0018nnx0xUG4j2q0X
         +Vz/TbShaB3xhbFOujbE8RU6GiXdIeEv3UkYbPaKbjVlx93gNiLnrI+hUxX2r8uSqTSj
         jlJP4cmQl5qLZgEv2r8e6y36NIxLTe0zqvZG1IrcSg76rWYMQeNwDokRvapPwlBazbqi
         zP4lPywon5o9FRayWxYS8RxJ2WRwpdwLtwf0Jn2y1csVSgxSvJSKU7ELiwXDZaaOvpDb
         QWqnd1lUAb7fBvwzo+VeKMcvUDybr8UeQQelsMteShwh3I0AtqsQSbGVlgvyqqRZ2WyO
         b6NA==
X-Forwarded-Encrypted: i=1; AJvYcCV6YvQX+Saz3uyPt8gdY+KkjvHSBHAoHiGdJbyyyFSw7R0+HlU/4fS4KXMkzY1RKLku7qiJlG5KuWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vFsvBbij2N7yG6Ut+BYARefsz4+Oria60AjhpUbtvP/ISj31
	waagyebci5oi+UOkzz6HJLDcczd+uYTx941qwpv9mpXl0FJFAj/cWx/V2V+V5nOCFUk=
X-Gm-Gg: ATEYQzwF3rBzG9QJe5fvPXLdbP1S9j0DLmc+YTFE03VUl6ek7UdFMNI1sQL3L/oICqj
	Ieip+EqnDf5ytc2k2C4EvLeox3mn3oGKDOnF0fvCLunkEvxeksSH+SBTdu/MWEPo6zS18gxcBlB
	1Y4S56P7HoTbpmPScwEHeB2CcHYmvQnWnmOptqWvNxsVuBER2snCmglMeWCUM9dFGDu/B+aNSTH
	Z7YKIIxV9EKd8Q1wrTtPcJ+eKQdrS5ycnBMdEwn8iMy2e7P3DwDgu3jfFLbZdm0/gbX6fz6BAPI
	65XXwnDQN4Nr8/IeoHST2ZLtWqnd8+b973i8MfjxTVZlR7xkTiAGEn+Dhw1rWT7AcpGKkbp7pHw
	vOGmVy5C/u++wzxGf+BLyh0qeUMnI7DpdTKpUgNCLSM0d+Ll8ucmmImltWjXSL0j0JW4/Xugzee
	FJDw8/hYNWrvungTeIk2aG3Fji9yf68XkTdws=
X-Received: by 2002:a05:6000:2dc5:b0:43b:446e:dfa9 with SMTP id ffacd0b85a97d-43b446ee04cmr2149892f8f.31.1773622927092;
        Sun, 15 Mar 2026 18:02:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:04 +0000
Subject: [PATCH v10 4/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-4-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=FC2WtnD/edrrO3dvh2jkDAJh4YtyCCg10TeND1JFtJ8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aMzJ83rYlyOJ1kxjRv1WgXzSpbIkFQKgLw8
 F3m/nXWEV6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjAAKCRAicTuzoY3I
 OoCxD/9mLTNXYyGtwAmDBDdtoEYmY9lu+YbQhHBVUtS8n55a3L/QgHuFaELhpBfP9Qvt2ndzVvP
 sMUYa2uaxMZKvWo4jae3sIudbJpRwYLCEqbag1G6sCWTb65ueA4dcewp7jTES+EudGCcr8cTd9/
 s60+KKlHb1R9I1Z/HECpbTIOGolfY0GSq9mDjapcDamBLRJhc2Z0VWmAsfWZuIbi2wf3eQkNjSX
 eC9/z9Li7OwE2siqaY+eyvY8wlbCwpt4ydAWYz/o4V6kDRVTqUI9PlRb6a9rCXYW9JKL6Fj+FvJ
 rvVmsJZNmobYlIS9ov2xOraAYEtMuTL/DwcipCHoOUGFg1Zx2lOAdlt22E0Y9B/3PIlynBiLe1g
 M00UCg2g/UZenZw53rl7NfGuAvsOG6Ilrqa1p01uhOgiTlgOf8evi/cFoDAtXAWqYcBTsqox442
 hCN2I/4Gupf2GLxOYkPiXyRqGVNfFYMRS+httONrEkcAHui7CX9OMx+GhG8/07SUo0S+Ks5aEdv
 ncIn1eqNgTVjEcvwUFZDtXh7CMuDerOq8eN2B0CCDW0iPaeUCry1MXBa5psHwtFwciX1qKFLFRW
 v4EBexrx0ZFf4KQFtVOtcCMoBtk1wYr8E1bysV08CFLFC5CH4KqMGN+tiEeoKaMge8wUpLfd3Oc
 gNVWIML4bZqt0Zg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 94a29f439ccf4..3e91bbfb808b3 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -116,7 +116,22 @@ properties:
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
@@ -426,13 +441,10 @@ examples:
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
2.52.0

