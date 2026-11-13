Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595123;
	b=GJvbKiBv5vZLcXmLEDwVsYBzbYwBimUR6kJ1XEu+z+8JPvHLduBBr62wky4N5g6N5FLe
	 sxv8LcJnR86vzNw6RO5zN80wIcWjMu7TW4Mq57kAdGdhPSp5RC2gViijh0uS7ja2P9npN
	 +b3cNMahLE9v2ZQnqHlmp4PUTpZqcQovIhv872nZp7QQZTG/UhIzr9RMdsLohUOEXOwD4
	 +shBvnpWgXyhGFzF3m/414VUwPqPCrmnyWkGu1SdH0sFKLMbE52iZXaFN1VfoVM6D+KpN
	 wF/K35u3S9LqcLACeu320F+zYV/Zq4vrdCPHCmwQ3Mw/sCO3lnb3OrfGw6T2N3oEKMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
	b=HU4oMHMZ4OYi14wQR70SIww3Ld6vX9hs6qDYpUZlp+7kr6PKoYl+XYHxCFe7pVI+PwZ4
	 Po8UJz7YpUmkcNMFOu4GlgmnTYKNAGpWlng0jZdOT6xpHIUl7ezCxAzlboTC6zfwI6mZq
	 zKVjCU7G15TN+BQEoMEec1jRrALNQP6qNjRx63JYsyM5VKfthblUpjdZdNPiwIhmUZUO4
	 +luZsWITg+TlCIA46eA59gJtp6WQc9qXnoMgcRpC+qYVUjptQMuuNZF7ZcQO1hdi7IVrW
	 ZDleP6ImsqzddVZGs+NAQcNfs0wUj0PbuNJPtMHZ88GFqeDjMq5hW88qI8GR/WH8kKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NqugjOV5;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E1606CC86
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9E1606CC86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NqugjOV5
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49a92144733so523333f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595122; x=1795199922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=NqugjOV5apCuwH7+W7n376qoKig6XTMvL7dse1g2P2brXeQnuoXGexEB4gwIL1d/lD
         JfAUn1/azWtO6W+fOFbg4clW3omiGIc/PBTmPCseTxkDaPjjJIN+JuPSZ1jGW3yVn9ZR
         32p4Dizo4JvTtzOvwaP9YoI1dhIPh4PN171R/4iMc7/8c1zcZQAGU0vYwnWKOQoimEPK
         FO/LufPEmzg2pA1e8y4bA/wMyJylsdrgHNj60PHwTFeEuRmSxNb5gtahG+WdKbqmSzDo
         erK7X1rOKkBMNOrTF5ndlOwZmElOn8U+mssr2eVp+nKWgBlTvUKDN8KhQ308nmtojs5o
         l8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595122; x=1795199922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQPrSDUxid3hTnblfq2igQmpuDYP0lgjM0zpbR4xQUg=;
        b=T15j+QDmaByPzQjKj78n3NRTxjk02SNuMVnMuGdUxSp8bJQzRk5WHF5C0O1LOWls7C
         lFiOZc8akZ93RWTr8A+a5zHP82jyx4d3tgwFx1nV76JGjCjkiutiN8leh0INCXDJCCp6
         DXCIMo7tIvcrj5UExbRzLujFHPElKULO+cGMpChTXBvbqHa1kpVB3L2stpG42GLVHapJ
         9iWTU7r/97Wjtl70rgCvm8rdT/XzC1stECcq05sw5EL872EObnJ2dwEo/ifLS2MHt+9o
         N3qBYN5VZm7ZGQW7XITXQPQDMqNPrjQ90kmmKcqHozKx/PpVB4m/8pdM1D9bRImsTVHv
         AtYA==
X-Forwarded-Encrypted: i=1; AL+hErGrB2zxNoMHTHBkMzkxXpcRl7VnKB3lrFiKMQ0I9TGHLw7vBOcf8DnHZRcRBYqRe4hYNFFrvkcQukc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uLQsUwaYeJlCmuquL/RWrMjHdf1AWRBDxFe2hzl5M42methJ6
	b2ZekywaxiugA8fvkRDYGJ2NECnC+s80E6yzRnCpbo4e6NfU45JloEo2zgkDEEAsSRw=
X-Gm-Gg: AYBFou0p5Dl2SxSP/axpSKwhU6GQq5vUHl/1VoW3xGXirNyyd/u/cxxSw/T8aKIonC3
	L85HMlhr+FIT4tTQOgOWJYN29XD07v8eGfz5nG+vpBnYfdYSyd3nlXB48pFpKK4NxhpBAy0MwLL
	TZt9GnRz4q4mGjOIAN4I31sjjT+GOoZ+AjWZ3JNdnoYnePVjuQGiLVoFCm5LAs1t/5xZafvn0Lh
	M3FLYVxrr0Bdd5Fv6WnvIoFqVkzxnykvGK8QVBzfrn6pQGQ1YHkPk2zh5o2HPSo+Xyk6kS8CUik
	o2cSWhf3n//BMIt8fo7yDWbUHUoyTGsGc2DkA79hauxYOWkMF42qIAxp6zGXsJP3QKebiw5MXuO
	yCWtyJRSwfz7CMORoDo1fRZkTOtqRNh7sxMfFyopIu7HWis5XykzsDMn5bjiDMF+Oj7CdYQhTS7
	nHMZ6lqD1470uZcEntArA3eoPRcBuFRTx0EIpP0eIFiMQJYdJkg/YRhdEVgob5PCGzwTuW3fzEU
	YFtRILqIfpG6Vq5vbENMprbKbCnupk33CBkwf57QoGIWWY9oxj/Rt0//gSs2N/zO1Czi9axleeE
	c9FdefLTGh0TlJdZt6iaUmAK/owAUp2J74QhRvrqzX4=
X-Received: by 2002:a05:6000:29cf:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-49c712ac8edmr4249814f8f.18.1794595121078;
        Fri, 13 Nov 2026 10:38:41 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:40 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:19 +0100
Subject: [PATCH RFC 05/23] ASoC: dt-bindings: qcom,lpass: add WSA RX and TX
 channels ids
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
Message-Id: <20261113-topic-sm8650-el2-v1-5-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7B0HLPkz/JmSein0hlLzb+UyX+3YoDiyYBasK2j51sI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kfPhvTXeMs73QmE5NQsahYZG9H830cDEBY6m9o
 UEhCBleJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHwAKCRB33NvayMhJ0VCjD/
 9N0CE7ZXY2semuBrhYN0RyvNDEYoK7WutoyBIX5xdZDi43Z4J3tQePDZTIgp8ZFCYT9aiv6iW+vjmB
 Lf9Yo9oJ66bHsV1hoAeXLrXicmkYA2NGEckDOE6g2tdkKXaIAJ8lFri+9GnGPOmeu+V21fWgKg10MX
 TgUf4zSTk0mtjwhOgAX5H2EfWQmg0eubO5w4aEmLPfn4vJBx9y6eqbo3H5sFIvStYXxniE6jargFkS
 fImd31BCwFKxStoRZJrbfUZDK1DlqyaSJfOV719LYbkYewTqbE8yh1sJHOYS8KwxBiNqUXPOtl6UH5
 F2nPJNyuL7PGUKadHNl4hJ7v32XmAfQ43twMGR/vDOdmCy700unX5t9Y57nQL7tHjTCiesr7RPxzzE
 gaDLBZ0IHe50oUdmjMoWImbsr3iZjLkrXPUwtg45m0i3uAJsyLY3D8JzgbewybuCv9nVcld/PV73EF
 VfklXWvriz7PNi3AjEN+z9X7+3SjIOmCewotFOQQMgKDWiLx5cju3UfzuuGl6V15fVxORUnV+JdhCG
 AAiSPsKru+jO0WEzQ8x5Rb+2ywsk+vdXIqAP+tODE2TUNe5gklfawC/OPSzdvCDhrWPm5um/xMIpFf
 liQuTT+BHUy6GBVORrke3b9xJAz9GqO5UKYjwiCt4RKagd+C+Z5bzmIR5Bzw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the bindings to connect to the Qualcomm WSA interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/sound/qcom,lpass.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
index 22f5e1fcc8a6..5d8db5195dad 100644
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -44,6 +44,27 @@
 #define MI2S_SENARY	34
 #define MI2S_SEPTENARY	35
 
+#define LPASS_CDC_DMA_WSA_RX0 36
+#define LPASS_CDC_DMA_WSA_RX1 37
+#define LPASS_CDC_DMA_WSA_RX2 38
+#define LPASS_CDC_DMA_WSA_RX3 39
+#define LPASS_CDC_DMA_WSA_RX4 40
+#define LPASS_CDC_DMA_WSA_RX5 41
+#define LPASS_CDC_DMA_WSA_RX6 42
+#define LPASS_CDC_DMA_WSA_RX7 43
+#define LPASS_CDC_DMA_WSA_RX8 44
+#define LPASS_CDC_DMA_WSA_RX9 45
+
+#define LPASS_CDC_DMA_WSA_TX0 46
+#define LPASS_CDC_DMA_WSA_TX1 47
+#define LPASS_CDC_DMA_WSA_TX2 48
+#define LPASS_CDC_DMA_WSA_TX3 49
+#define LPASS_CDC_DMA_WSA_TX4 50
+#define LPASS_CDC_DMA_WSA_TX5 51
+#define LPASS_CDC_DMA_WSA_TX6 52
+#define LPASS_CDC_DMA_WSA_TX7 53
+#define LPASS_CDC_DMA_WSA_TX8 54
+
 #define LPASS_MCLK0	0
 
 #endif /* __DT_QCOM_LPASS_H */

-- 
2.34.1

