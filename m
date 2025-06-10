Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1152BEC30
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564381; cv=none; b=NgIBzVPAbtU0RWKa1aCdb8ptv42lY7yYmSFWlF1x/17jQBTdVp3ornu3bHacY5zq0Q7bNguTqJfR9qOP3tPVBnmBv/c5OPUXbeSrqlXV+R6uZsgqfP8p3pj6rhezzcw56YQkALvaj0qk2X/R8aphXVQTVj4PrlucIywBhwauF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564381; c=relaxed/simple;
	bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbomNIEbfxrImC4o5CwEOp7F/rRyPQXV3fMot60czmx00Qb49dGk/eQIS8dchE1fJ+hchvzAQAuegSDWg4ZELt+L2Kzd/jh/sUT0X/FGlT4isLd4bw69XIzludKFKUi5Va03fOHjABG2pCXxN1vruMfmPALMJLEYd/0MCsKKuFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hj/szyH0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hj/szyH0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso560618f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564378; x=1750169178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
        b=Hj/szyH08Mko4l2Y1CXmH+64L1Yv7JvPx1OrOzV3GWsZM64jS+I08uyiQleZdYLmCE
         QAbzt1+vsBrrAbr9arVSQppl4FQ+wwNSz4meNEn8iUJ/aYr8eGIzFkeo0/U/454j/RMW
         MxgHqraVrxwLQeEQWvZCh17NWI7d2atjnvEngEBgKKbaGpW3l+4dtGY0iCv5K8uGdZNk
         DvrPIu2xN747nw1EHJiJYmEvMPwnemgaFDkAILczrpBz5YT8kaC4DQ0+mRXW4sbW/aMw
         dsSf9vhTgRMrmSsnmMWV1LEVua/AJRTWBTbIBkXlKjc853FFwkx4ua6hWItNYyls8fDu
         dQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564378; x=1750169178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
        b=CulIpYnqR9h/5Cy+L4qQSg46Mv88jECKBUxjaFZjQcl9Ftt7tnYlMDB1VnlTepglf6
         eC0rQxkkBX9KYarZjEyKKra3jP9cWDFUy8bAJzxjODN5ilRGqdWvYapO2RT/Cbm233Od
         0Jy8zJD0wAOThyDqSVBNnFJsKX/GuLRpMFl1asiN/F1bsCyjt0fkT6zWZcYoHG5Un7Io
         33sy1RoqN+VTNdiCuFn2sKBXR8RiLcY3kYI+4yMK5SqlOxd9v56DM1hJAdzPoyOAafHc
         uitK+lAwKhz1DIAJv0NCMjhJPJw9DPylLeRdcUgAAEUteub+PHQXG8/HTKuYsuFrgsax
         5GTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUWR7BoLjQqVIpY9fW5sGpH2b7NSHf12rxWN5U9gszb4qAZ58F871+tCTATfiP5XhYaBWOjQm6dh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7s8IjNjbfJDaGj3gkjysO6hW6WbrU0LczfcyveDOFNzgP7ccx
	1wfjctZQFVVF2yyRvvDzpL3kMdGS5gbEeZeNxiaPgIII1IGPHErv3AeViV1NDVVSi6M=
X-Gm-Gg: ASbGnctn+Gju7JVo35QMcRIO8k7fypbU77Z5yfog0u+eetArpeCtArq3G9JwfRgYLpx
	KvQXB6luK8dxMXrQq+E6BwTR4966JNQQqJT8f/LaWGRJQNdLSenlzRUOhdaj0GK+SDkI3rr2aUJ
	URUf0QGdOOqFv/0ZLN7zYkQ2Qspo8PTElSth7Lf1sZpWo7ypsvNbbkBSEnDsic0O7nQodDejMDo
	j9nAb2JoP6wqlS36XU9Z0GZZ89jW0OP+whYyLTvNfV/NsLt6IQ0ez+UtBjCCzK9v9obk+A7+xY1
	EPKQj1CLy6WNuhrRata1LUw7kv3OXH9tl6g1cbggljq3bBybKng2Iq3MrlGwz8oG1rloxwH61Wt
	YkSGzeA==
X-Google-Smtp-Source: AGHT+IH25gKgo8d1gYAXhu9lWH0BmA+6Au/NMRgukcCSeLR32XCsUqrr/CCJpz5l/lsXeticymgVQw==
X-Received: by 2002:a05:6000:144a:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3a533143e5dmr4792126f8f.5.1749564377666;
        Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:42 +0200
Subject: [PATCH v6 04/17] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-4-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvC2lB3lIxtbsNFzyWORfZgsGtzg3s+vk35z
 /dPmTfPLbuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wgAKCRDBN2bmhouD
 134XD/0d1lSSjv1+CB5AgL0VUzorFocmxjRuPcFE2sJHZWxqDzRNRynQD6x9VAr0Shl9tFORtxC
 8DkQQ2uR4ZjnjhvnhSAa/ki40J03d/MdQWr6HeJwlAaCVKGO3B6dqzJRtaIMHwO2JtVVfqbN1BM
 wXb1lZhR/6McXk51ULNzCqwhSU9tl6gERabgsEPNT7LI9SkhRQ+/a+MutB3gNFY3GuS3qFccz2Z
 DvPmibAcl1AO4QRoEsNdKLW23BFqfHhpRsGiRnNC0JHbrp4tOZo7MmAkxXyNilN+kDNRwjyHurD
 K216/cd9UAvqhzDo6FK/0rq1EjL3IvPNsVhCrrLSX7QbS2IC8gqTdkVlnfFY0KL6giNbJ3/qL1V
 VY0UMPgEDQ+uVNdz+cUtP2YYJbmL3DeaXKvxXB3Pjwd8krdc6dTmyfoOEcErTIwSBaCPwqeI/Ob
 Y69EuoyarJ1KY8eRVyRpIcgceGRW63D/Dg8eEtyrWgEH3K2hgQYPaP4Arcr7PniTIiFvEc/A9jE
 9Jj0bugI1whaH/BsqGp6Kia8VdabiQ/Is2hkHxmzpsAczNAvrXE+Bu07GQ1A/SWUTUDrwaEWp6W
 8NaUYft0uDbjzb6ISM8zwKArfCc82KutxoiV8Xf2Vgvq9L0bVcxR9w68Hc8YbkO80ZIwwnThDPN
 6iDFXdGLfdUJKkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2

