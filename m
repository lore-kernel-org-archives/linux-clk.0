Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5082BDC3B
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564379; cv=none; b=iUGsxSEsKTultublndoGXEQd3IXMICByVlf6ZvAAa7bw6KbjfnwC8RZXl3387V8XAaSw/LTMwd0ztxfQgbj7YWvFtK5i0hVWTK4t9F3I1xcyXqxdzA0/WJqZmNwEC4A3IVrnK1fULaV5Ph9Zll0z38ps3y4V6fKw72Z+j/qNjQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564379; c=relaxed/simple;
	bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+htmuHT3jkhCwpw7hFpWCTmOK5cNfmLFWhQ77Z4fanrdElwGuUiv3XBaZ0yusJrnDfo67qA+8dRLEwXRhV5x8ZkFA6mRC0QcZQgQ+I6HaSMtqFiZcYyHN9ty/ifGlQjqjw6ZualbVlXhmKJd/+k2AjKfOgvw6+H0b5mKhk0zWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bs9CdH2q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bs9CdH2q"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450d0526132so2555755e9.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564376; x=1750169176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
        b=bs9CdH2qJRYH/lyQAikmhYv/aBGJ8yl360ZW5njZ8vQoR6xrdkaN9UUd0CmlQSgxiQ
         2NZV1wt6/l+Be28vkkx59Wo2VgD0FUX0RYVbwas2Ti2/A+hUwNlLProeQbQibCjOfIN2
         ntxeDpjCcTS7ayCC2mTU8WIGHfcYLPCxi2Ce8bevwPMNGXjdd3ddVdifL+SzW4LLpbFF
         PofGLStPJlZhULaQWfwE4m9WEFGeTyzud3BRwjTxxDoboXLGK6o/9SWCFtKeNnD+sPGo
         XAc6wPuqUMU7zcXqXiCyktibc/E2h3PhWldInF1MypI2DgMWELE0YTjLG6tvFdLd7jdx
         WqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564376; x=1750169176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
        b=ck46NHXJqeptNgQyWEjBm2TmRNu1zoSmSEW8P1o20eVTLuuEl8ZZfG3hTlifHRuk/n
         4pFssZQAqReXZdQm9bPJFGdc1O2xHtsCjaCr+6J2plP7JINB1WhfwGeS276rb5dhijyB
         lQ3kY6NiQi+U3tt2jxGHi7NeNHal1rfdKKklN/Z5sid6T7/7tvTeqO/OWlv0kY7Ty3DI
         AiqNB1YcEMGAJtIFjm6J7Ml85ilnQPdUAOrBujeHg+KpO2HSa1sFDnPPYf4E/xV+x5fg
         kODp8xl4IY/n5mj3SYMbMSAOwCmNs9CKKNUcDP2i7QD6lz6P3diL6kBh98456TYJDUo3
         AWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGOMnaieytNFPxe4bWZtg4eGiMdQbEzqbc9KQO+M8cbsmD9UqV5cEXHnLKEwhBkWjzRNFmcDUkyDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFIO+VvwNlsrLbH94/aWhqScnwWmxMDf/Yhary17ZYhm+Eexk0
	jtvcCOBnmqhXXWwrHbnBkfCBVzbVh2j6tABkEvg7IqjghdaluiqWN9J9eA3lUJ7g8o4=
X-Gm-Gg: ASbGncuwLTB2Q3tu4skCcI37TNCcfRC5K6XU9XT9QFsJRLditnfsu5ahvr6ZXRMNoe5
	17HfJRnUzS4bWvum4XReV6UankwuNZywa6nXfsgt8GgTfXWfQOPWiVFPu6It8FedH1fUNrujbEQ
	hvfmwR1FbviAzt91dUgyjTcYXg4y6YTLO4aJwx7c5qPlmIOBdnjCf5BIvj05qAgG3dXSzb/W8nV
	TY5iFbN+2q/ftLwzIBXPgN7bjed7S9HQwros24B9Pc6p4b4w89yt/N3cdvhY3G2wctFTTqlX96H
	GQXU/s7UtU8IAEjgeHglurPUvHwkBFlhQzF7U4IGeQ84gh4A8pVLMQyotyWgdKshJrEkX4LiOdi
	s8nCsxg==
X-Google-Smtp-Source: AGHT+IFm9QPIPtKj88kCIYqZXKQx3x9C5G98AeBxEuV4QWyOUJnApYLXqRwTArllLYrUbNaqeStteA==
X-Received: by 2002:a05:600c:c83:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-452014b3cdamr58900325e9.5.1749564375620;
        Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:41 +0200
Subject: [PATCH v6 03/17] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-3-ee633e3ddbff@linaro.org>
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
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvBcBnYyTfiL8zs/evhNuS7T+Hr5JIuH05SG
 aYTeABkv3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wQAKCRDBN2bmhouD
 1z8YD/9Hu6oG7XIW0TSKmpY6kmKcXGI1YkCyklXDyNvXdkTDAgAHII8m4k/zWtNiKHPbPrPJu+x
 usF+MqYI8h1uJ86crkJCdDy1zM18kr23DKFG5+3yqZfWvSKjl47IEGTXI5/GgXc+kG2a6FdaY37
 aMRmAESSmgTUn2ZEKRbB45pSSKIi2qaeegOP/xNPIIp4ewm/YmRNGvj+x69xfRkFE0BDpFjfurm
 jdsvopb8XV55PqRtyGqWXf35CdZEB3a91avjTgY9UERXzpqMAGdmokzeKoCqIrDgtb5RobQ5T4H
 Nq7rc4co+/qkkYuoSSqedmGU3ed042KVcp8OHlnR7CEP97Sx3FS3SLljZ5OLlcbGIG/+j6m+Lpn
 EBimXHouJrsOev6ogYy8x62VhpUSVCoqan2YSM4pVcJC60AJJEpKZALYUIpIJOrYeC22QYdd1/Z
 V09reHRMtJ62QbYRIM0zDySRN00Ft+b2ouxVTP7M9FSyHsZXorl2lSeM8KR8q86IggLVu4yfwrV
 O5V5IK6/JMwY8yVMzAItlxEAjZ1QH/LEc4F/I2zAc56kin0i5Fzr+pYZRUPa+SrS2T7wE8hMj5A
 VnMP9+5n8V36v54XZg80EriuA8Yjvfa2sPLQofwxtlLLxKVbv7SQfj7gJsLOIpM9Y4R7L3gB38G
 9NhjA0CTiCHMoWw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea18bed32e3a442d0926a24498c960..9923b065323bbab99de5079b674a0317f3074373 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.45.2

