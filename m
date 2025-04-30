Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61525D909
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018077; cv=none; b=iR/CY7GLG+mZ1VcYicrM2I4WNWuSpMLH1ZBz0T5BvEThl0rFUgjyHK69IAShwPJTAGHDVLXhXIPBjQG+Ebm6lRz8kdSRuCxnYB/YH1uimxu3ECw/m6cXEdk1Bc851T7hmxM17OLN0nRmm+Sa7CFpSvEmEMNadGYOgilYM7O94qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018077; c=relaxed/simple;
	bh=h2E0Qu9mtfOPc6WOXOdr8B2EUlTMKmMwT95e+uaYoFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lD9FqG8gVJejuYa9T944SZYkefkMWGwTmHB4hsik4am/5zYNplSDt+oTfmgl4JUIy9yjRgwpYpeY8RQDOZuGzzl8BesV1FPAaD1eeaLtJ8GsBBpUP9ZIasoi2xc8shdNZ9BKsu22MCj3Qnp+Dug2cLSCAGN0VJVSnLWXHGhZPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=doIk1h+H; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="doIk1h+H"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ab85402c9so244383f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746018074; x=1746622874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DqxNn+UoD7iamnGtY9TgLsPSi/cCuXwa0uWwu1jgxA=;
        b=doIk1h+HfgZITBdhH+pPBHA+lh9Snn4XINUQIneoDuoObAP5YT0VJ8myFsE0CoDYgm
         OwhHtIXzVkuvbpqtSsP3NAYfNIfDNlgEljXUqkHERcWAtQPvuTdTw96kYBOx4zWYGOfT
         /XcaF6fTPwFOGnZAH4ol1sp6kAuwxEvaCQKijkwo/+lsxiwEKr/OvRr4NHpJgmNeGhFo
         JAwQDjiJIVC5zB3ES4Y3JW5rP+CzMrJ3xrWgiIO9JwXWcLobdV8/LjZl0SjO7BSPsLEr
         iKZA35MujOBHtNMNR+Ku3vA/MCwT2HxdgjxQsQWYH504Q2vAG4KpkHmN0ekfVj3VQYu1
         vG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018074; x=1746622874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DqxNn+UoD7iamnGtY9TgLsPSi/cCuXwa0uWwu1jgxA=;
        b=vkrUmuzMuI17HroIvHaRyZoTDDjAytj77FqwCDS5IdAyU2mOBH0YTZvt1VZMC3CDLQ
         Y34J9bVWP8Y9O7B39lp0JO7oH+KJnpRJdkQNQmJGRh1yvf/hsIlUnoMIMI00DvsX3ABg
         j2jxkszYSKpxD2Sb06HO9EvghXQCPSECN4p0UQARq5z5XvnMNC5yxYdySjSmZujhcUIM
         TLmHgYWuEW/3IAK1ln7dyYFjwWbTMwhHv9oR6EJ4nZKGR/m5fS9lcjIYLXc/PT+AfwfJ
         7RptJ1MdFR8SWWXJfSVwIKma6j32dm/VcmFxhKwUwCyqPu5+LxYtkOld9+FKc+Z3HEAM
         2wYg==
X-Forwarded-Encrypted: i=1; AJvYcCU+i11AIu5DnnoIMhhEixZwPgbmnZJ4mKDk2Ob+Gi+VFAPr6Bp95qo9Fo6YVU9hRgctfNAnCRp6jBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh5fxxZdRxi2KZEGXW6lRe50MqPwn656Bidb5l69/pgDBdvhve
	LOq+RYsAaS9dJoIp2//M/8b05xdSxFUEx4+ERsH0CjzNoG4Nb76KtkDVKqKqJFk=
X-Gm-Gg: ASbGncsdpaFLfd1L1B4NOk3bI9T8e2weHX/W6/wopuZirJlhDDvMsZX5cQ3XmYO4g+W
	XnDH6MWiZDnMlcZNbnSLqNuHb1WUVaRvWByYYF1vRwiGTZMSVUbpk4wwiOUVi6hecS8yKF5Z30o
	WtabHLipzzqUmEoOVGbo1/0lNf39vZ3apZlZ3w8tkrlp47l/tTmmiGMQ9swtoomPeCpXRoBZdMy
	2vHkWUoTdhO04C9EXqKaJxCK/7FpMm7uUSd6Ddg/kfmWkX1j4MsSQYnEalUpPzphDnZjtZZvyZ8
	kDMSjsGNIJrPSbhgSZ4YsvL0CjHuNYnYm6O0ODJ+p+UWlXYUGfmwScdyRBU=
X-Google-Smtp-Source: AGHT+IGBVWwBGr97Pgn5thROq7Wn5mBmawppBRb/WcGWKf6ABPhBLHfvBEY9IGyyMBgaUaKDfEDYwA==
X-Received: by 2002:a05:6000:2dc3:b0:3a0:7a00:61e9 with SMTP id ffacd0b85a97d-3a08ff35f51mr815792f8f.0.1746018073615;
        Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:01:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:33 +0200
Subject: [PATCH v5 03/24] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-3-8cab30c3e4df@linaro.org>
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
 Srinivas Kandagatla <srini@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h2E0Qu9mtfOPc6WOXOdr8B2EUlTMKmMwT95e+uaYoFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh71UGHnWgpuzZGk5SCnNpPWKK18fJgvG/kuR
 yjfgU0YoJOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe9QAKCRDBN2bmhouD
 16DxD/0dpiL0ZWMmbsC/O716FLuR4a7LbUfU79DS35TsXf0SX7b9G3TTgdzKCecKJ4nRqO/0Bik
 RfAoWMIRHt8Caw+lic14c4j1wGuqjiRmDWqG9Hyb/78A9TRDe4Rx790uR7PYGxlDODd6KxiQTfd
 Hku6UORjGcYyGG+G5u8JRzJ6JcBoE35ad8apIFNoTMRtJywIVTfCvdLVLIGlbv6e7zT+mBwyvHE
 GK6kxlSdPbXmQDDwPSVJKN3WGWY2yMzrM0m+CLY8rmJyV2RmVwwU2kE/fzRm47viq8JMJCbyNQm
 4xyWv9TTi/9UGwj2R8DZ4qhOSNvHixbHrFg5TYYGa9d8OUdbC6+ga6tRmGeoA6N7wQ2hKaPYe8L
 oSi84mvp1SS0calcSD060NU8XZ8hsayuGYwhpdWpNsIrkRtAe43tJvPJ5WsgN2HHTUoFxstoXm7
 MAJAQIW2q5lyVYgXUrshcEV0d/HscPN7fdj3GQ1+6qJLHMQ1tdmtUXu/KGO7tMTqHtJ9MKYhZh5
 7tq4g8ONujqhPtRm6NCaqK31+29YTkgMG9t0a73stfi+UjeDGWTT87sa+GvFRCq8GV0hiDE8cJ2
 JY7azY426J7ZK33JtY9fWmYbOlLTFJTyItNwQo96Flu3hI26LkG71tgzMCkZsk4agSpYjkAHI3j
 XuGfiW7Jr4275og==
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
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
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

