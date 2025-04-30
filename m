Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE43925B1E2
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018073; cv=none; b=kSY2xxhYIeBml2kVrmC9j/PPfhhYnVljdmHs+jhRgGilSbHSQd0PMnkXrzR3XhKT7IpbtIx+doZMxOn3P9WNBJwkhaY0hVb6zWX4zfuBQ7T+/XxIdZ3EGj1/ZzGU/7PHPxjrL1g0qxbhclxa4LUIYlioxKUei51RxXtGCd/3kN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018073; c=relaxed/simple;
	bh=h4KR3WnX0MpzZeRbCF4d1eyLafzyThDf4gmxGutr8Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkPRyABOLHHo4395ix8t8WJsoJ387yu3oG6MmNTjyjZB1dCe9dKhsOqF7eFBtme8Ng50+tlO2BtdYlgDcvEST8fVKoFe3Ba+fcFdO7gbhNHMT4a0Jc1AwJoYtS2abAMK492IzthQrHYRIfI2WOkCHuwGorjJmnvk1jeUv+YPLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WsxZh5oY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsxZh5oY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso483572f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018070; x=1746622870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
        b=WsxZh5oYQhq1dhBdIC0Becji6anhwT73REU1JZ6G0aWEBHZjZJDL1YtWs7XeOBsrbD
         tdVj9eW/ldxTBBkjzBpFMICGoTI6soeP/VMaWmzX5O1pfcsWS4Fu8cRU7oQ3p96hVbj+
         cLPc/SxUVGUlIMU950zi8LOMWDdY5f950h0sZFI11tSfLIh/MaIa08c6C4LF9t/QUPb2
         mLaNZy/Qk1M2EBRkPfk6mlgr9PR9StFVFl3LEfp0YSjPmgNKaW6frqDlIoz6wmAVWkjA
         lA69GPZnY+AmmLebJkbL5Rdc2KI7fei0+8TibK0zxxPRma3DsvAsrToLQtUH8ol5ptcX
         YSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018070; x=1746622870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6gCmCTf9fhJeLeRlyqxE/da/koMwMWDALPPwEDJzQU=;
        b=iDOivmaCcHWNBkaxjWCZWeIXbLPbphqrkbO7ZzMZvvroRPlzxpRJVmN2n849j4WjvJ
         E9irE2XenuU4Kx9ld0V4cdM4Yplw9NU+gA0w0q2CfbxSVsx+Lao6j8wThvF6nIg/w/M2
         SqayXSC1dLgsb2oPZaJX3ECQ6C+CG93wiCRLpEgmNfetqjHITBY6017CZn34zcgCgl5z
         S1zHroS9Gq1x1MxdJS/tLqL2iXJGCUAT1T7gwYbOGg1QD8E8jg7JBhvB/5mXHwP79F3d
         kUZQoKMAj3xWSiuY9AMhljCqX1eiZlcvckYvlN1pZzdpA4dvaVqtAY7a3/xWh/7TqKdb
         pQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCUgzeQNgmDr0uoc8FdxLnfThq97ON+DO8E1ji2USwIEezCIikVu11zAmeOmDBTucrNxpSTNpEBwKfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjdt+AvjmAHWPUO9GZ1mhad5eccG4GgYc1ndkznyh1oAhoRUzZ
	NpRSxSP2nM3saBtXIz857PAPC1eRj8coOeBIDlkgqvlPLlIx1hFDkeaecGFwAYU=
X-Gm-Gg: ASbGncviyzzq8Izx0Hv3UNC2HR7mRC1PUfXbeM4nkInt96iPgkNJXoi5mZErliVAeJg
	RdGJlizvSfP/EDGYeu0dDDiNPb6oDzZeZKOXSto2dOyzdf4tqyL5FUB318YLMdQKt+dQebliFhs
	2ouk76aacUoJ/HivFmWiBb+SQk8iAbEDPKwWdaCV4ubGKSmaZd4nLW34X2JS5iYnXPp+8U7AUwv
	5Y6MmrPsY1hiEUbgKBj2sPdYouj9yaLg/6ggImeW4zV32klcygLdwZ27xBJCu5d2njdPRpXUdXF
	kwaF+x0s853bZ+F6sSjtUxTbh2hP3i7Nn5aTdEM/AgCusGnyV/ekbD1q0rY=
X-Google-Smtp-Source: AGHT+IEVgUlmrLBnvxqbwa/LUtoMOM3hDEY1L7MbBEMnMdxIfLiTgCeXpDac1Fk21Uc5r+CcXiaKsg==
X-Received: by 2002:a5d:64a3:0:b0:3a0:7d47:8d7e with SMTP id ffacd0b85a97d-3a08ff7216dmr710931f8f.8.1746018069194;
        Wed, 30 Apr 2025 06:01:09 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:31 +0200
Subject: [PATCH v5 01/24] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-1-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h4KR3WnX0MpzZeRbCF4d1eyLafzyThDf4gmxGutr8Tw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7zKshEp4Q5qZHFef+w5ypkEzUmWV7dVpRJZ
 ewDM8XJrw+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe8wAKCRDBN2bmhouD
 1z71EACbQ2OraW+4hnjm9Npk2+TB5ZWYJCsNSLyybCHA5phKCLlCGfHFgtY62sFOaFj/RU4ew5n
 xyP3rTZO73eGfUICcmPUFTtlQD9C58INJxLSrYwXXE6MXx/HCE/pkjwC5n6jO4iZrv2UshJbiK1
 i7rznCiMAUPiH35rDDhWG/PCaGfQjsGB2pkgL05axN5RUDqvs7owv9o7aJPGkm9vF2jkWu6xpCn
 //2jfRn6N3RJI8xCsH262B+7hpU1gqkTv8tvRVARpIph+fnqtRIl/UgAwJD16TfWUO/ESa97t5U
 Fq0AJChbIEtWGIv0CSheWLDVkGlGeYt/dFpBfM1Dc1YPXcPq1TiFybcCGHWsPEbnZUpCF0l2Uk5
 bmAb+vlIOlJFzQOPQbl8en+XxBz2tNIWLy07aINr0SyxGXY+9iGXj668LBCUxA6b/sa2v/F/WsT
 el9tAU+N8Kcr/lLTri1EN5A8bnvyKvW8971lbI3JxrN4pJChWeIPlgAw94VFYDmK6+qqpMe9GTv
 /sJcc35uAQDfbnJZM3t3UAxRDQGBQU8DOcwMa2pthlck9xds3XNBAPlo3ep5BciZayeoKNpQKJ4
 GoH73cOa+Md7U2TxqEls0p9VxxgUMgnGX2seqfJPcOb3ximzCf8eTr2CjgeJilIumv+WBA/phIM
 jcwslAE4AOUFjnw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..4ac262d3feb1293c65633f3b804b4f34c518400c 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -23,6 +23,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2

