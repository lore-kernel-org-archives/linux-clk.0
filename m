Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595120;
	b=A/mJ91rPQyaC9kXRx8QZZtoSH5RWZYjCjD0ffYfJynYObG8n6sNhz5g/JmTRZwaB+pZl
	 PXLmyxb0uDuPLuYm4ikeC/4lkJa6nq1DCEGej+ujf0GB5h+bLVQWq6D5xCNuY2E8HOqiO
	 BBW6hS3Rah/UE7bOsikCE0TyW1Z7wgWxugqfqjxM31nKoPt+GRFOSIc4ySjJRGFsdxKn5
	 lL6rxYHP0cElkIHsfh8MvrgyRKbpWTnVKA6R/Mh+K/kt69JG+mP4TqBeTVns3ulnXbf/k
	 qTQfcG5akEfqCnwjTDFsnCyG7EDXlzGbY7aAAAWGSHhfnT3Uvovt5DDC6dIZu8FK5Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
	b=B4R0suLZNrgUksQ3o5Oxag0LizltJiZD8sz8pfo7vF1JO868hFLk3cneG9oqIH4pGW/d
	 j4kVQMJZwMqzUntreNLKT+8Sd43pxhmukhTN3agljTkcFHHpYD+m9TVfuRDaH/1ixbF6l
	 9sEznfr+sbGFryufuE2jLP0XkVOfnE4K4CcjSeB6/xWJPfqLLP2Fi0l7o44HWYs6WHv0O
	 c+pPQUnwefv542gn8q6twaJEI1f0//utRwq9yt/Gj6hXrfyRe4vhShragA+UViQhyFJoK
	 wpt2hB69qwoZ9W6ECsY2OyBctfBiaSEyjsk+sEi0BBocK7J4OwsQtbD3T9AMp0GkJ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KLJM8TPg;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51776606B33B
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 18:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51776606B33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KLJM8TPg
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49318428d98so536043f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595119; x=1795199919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
        b=KLJM8TPgZL5z47JsZHk78jrLrCIcYspZEstNhGvRsclZ7pYYQM1DRGXUCM8pMkylkg
         L26SeRrRErzk8r6t7xyaAQOehhQEgMDgUKTqpmot0YuXZhGQE8MX7Mbf9L5hlezH5FDU
         LxetkSDrfNL7+9yawDSPXlwKswl+EYxCbziDLjTYqHaQN6fYbNmKj0qO9m9+eQq5btOy
         FqQYpnKibQ5Uj7qnkDfcmltCHgk9fi0IG8samb2jfxZWXpDvvHJdh2iXic3JaqK8rIf0
         M8dnt1SAfSRKI6c61AzUZUQtWxivcV/kiYFzeoOHs+YgOduKwYvTPKFL2i4Wg76CZvXA
         /a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595119; x=1795199919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoBNpM/r1nyqe9L0ZxAELscFmoLxO1wccNG+nA8IZiY=;
        b=SrhL+uxuYm7rgR8ZSLsLWtb5fNPdZE4WhNrtkjrLDrzxS0gKiD7YvYggE4mQ49eWW1
         86lr5cY/mqKui8X4pilUbeHEcM7BuEaiz+7qT2R253lFDKaSAmQYfajfoNttet0ofRVr
         iu8bc5NuumxCjIH+AOn0O2sAgpC3pk84spQH6+fTnA5x0qbh8xMUVsRr8GXi9T+aOorf
         i+tGUe/IX3NR6Ih+2+gw7QRVZR4F1kXqyBS3KFE9Wa93dL8dt1dyTS7rOmB6nHgRscxq
         18mM/bN/bqcW4GZu5mf0HQgt5Om4TMvpGnXjoFurOjtRE8vgBdHpWlenZzj8WKIcvbA+
         jNZg==
X-Forwarded-Encrypted: i=1; AL+hErG5Pzf69KzVXg98OSA0S6H9vi/VY7KctaLu9vdE1RNefu2EE4h2+ub7yYphDNEDKVQiA3Sn7ehqNKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SZpNIj60LG4gNwc6ae0onIHRF3Br9ABuwl1UlUhxuZWuqq4yZ
	AoWiCl1O9p747WUl3KnUruD7E7hbwjfy6dLv36q52ucG/ftbuMItjEoI0rg5OUeCy0E=
X-Gm-Gg: AYBFou1Cri8clTSfFFN6FfU+zRyS0VTHdmxtm4IcTjhoef3Mpa8804E33UNKLlymAGY
	M411qKVK1dssMZ8g4fUb9umbtGIgIL5Joi7YJtoEDeutQkvJdsPvdWTsbZtPJB2aXyF3AT43/72
	9BzwwefSMP/5gCAkiRfq+zfbn3RKw41sqClZR9fh7zqIkoPdllprk3/kAzV71F+ET3kXcazkrIr
	wdjOV7bIzmNZN6MJ2r2jMrSqd1nP1JWFDr8ThW30zPg/+S/ntgayXfVzkWLaz28uyp0B9UhtiM/
	+m0Qw4tpsR8cuX2xjTSU7a4rVtFwI68T2WhJKmmFcaqoxtp71m+c+eSFlC0aEHmMU10G47o4ddA
	/ntm35jTdpz702pFV6zGlOa1nSJxT767NAxB/BgeEvf2RL5VmKjpQsySv+puxKoLx7cmpJw5hzp
	dhbio48RKzTfurr8XCv/UrsW0acajOoG2vyUdeU1UKrwCUukidkRBomv++HoavvRVzcQuPluULP
	bNqzpiQ5dNZiyGAmAsQT/eAmO6dfn9IU+eORsBYISGTywfUTfgUyTdagqrMZME8VHlT8oB4zjXT
	H2tXbaYBINrivKAnu9CWddnXCjnOR07q7MyhyASWnU4cjlhuXzgeYLxuYAlG+D5+
X-Received: by 2002:a05:600c:c84:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb55a68429mr75652835e9.26.1794595118599;
        Fri, 13 Nov 2026 10:38:38 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:17 +0100
Subject: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when
 ADSP is not used
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
Message-Id: <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IYZzKllyENGnlE8jlO51eH0Je07L7Rrz0zPT4BMmGvc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91keb6kA1VBPnnlaUARHEhCdJgsbPCQ1ljeiie5s
 R+jFRjqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHgAKCRB33NvayMhJ0UlNEA
 DIDs+OuP5YF0RoJBlUL5/B5Wlya5YkksFWt/RKxLIu4fFxvQtEHbQjSN+ANdWJWWFIkNmDgTu4/z6a
 Aic/L2475k24voVJK7a3a6SCUlJd0Y1DMXJZVcT3pavimXIQr77dtxTShIMI4K0q+vc40XS7z7WhkX
 PLjGGDbmfdJo/2RYfkZi6+yDEVPzYpqVxF/TwCGCGrHg1w1m247Moj6umOYseWTF3R10dCM8162Fcq
 m9Rc1e7K/V9FcRXBwXaiyCWaKTd4+MloE8HdNcFPfmK3WEuFgXe3ADjIBvxJ1dlIvGMvp07uQ2IGaH
 SS5LhyFhX5wjNJQpviRheXLspz9cKDPoKqq1/SpNvSQha7/fZWEun9O7YBHaFJvULgJtnTQOmp/aX1
 NiAbHZWVK7Ve948pl5641G1P1556n00BGKX820XlkW8XJEvsnfZTv51hcLuT1clwmbu7qBUBvd5Umx
 hYyKj3XTXLrlG4pHyuq+lt1SChrgf9hLXr7Z1W0NTo6gLm89hNLJ6Wu0xGiQMgRstniZ9OemXEC1MA
 JRMdN2DkXDohMhEZ9o68RZkxRTkyy/pFW9ncp4Z1LIwLeYEiZQ8ypOnqHFPiYDhPPglSxIrNrEF5g3
 V3f8xuKwiEtb6aUFAMBfVfNiWT3F164EYcWURan4J2MWsMDnCm1xFfgyNsmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On platforms where the ADSP is not used and the LPASS TLMM
is entirely handled by the OS, the LPASS TLMM block requires
a different set of clocks and power-domains to replace the
clocks exposed by the ADSP firmware interface.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml       | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index 1bf08860a4ba..4c54f873199c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -29,11 +29,25 @@ properties:
       - description: LPASS LPI TLMM Control and Status registers
 
   clocks:
-    items:
-      - description: LPASS Core voting clock
-      - description: LPASS Audio voting clock
+    oneOf:
+      - items:   # for ADSP based platforms
+          - description: LPASS Core voting clock
+          - description: LPASS Audio voting clock
+      - items:   # for ADSP bypass based platforms
+          - description: LPASS Core voting clock
 
   clock-names:
+    oneOf:
+      - items:   # for ADSP based platforms
+          - const: core
+          - const: audio
+      - items:   # for ADSP bypass based platforms
+          - const: core
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
     items:
       - const: core
       - const: audio

-- 
2.34.1

