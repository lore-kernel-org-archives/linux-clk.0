Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325C6406837
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542632; cv=none; b=p46S7l/pgeYkn5PVRFiV7BAwq1K1bN2gAeZBA1NBpzYZlWI3ozCyZ0fS0Vcezh04EpzwMTpONupyf8jereGlXg19+hsQazf3+NMi08mpq94QtFgYKS5Suc7FJ70kNasi65LTGB6gyTqcM90qqdvs4yT0SpENQoGYXp7zEwGAT5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542632; c=relaxed/simple;
	bh=/IalT+RAD8IwUnlye1Qn03niWUX6gu/ygo9mcIH9+WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X3UO3bQFRU1mbW6Qg0csGsWJ0LG95+3JCRkcV5F2HQl2UsMLVo3cchqyc7uTyDzBXcYlhAX4nkBUQJ96CmOysKlTHeWut6JRiyLYE/zZhpQpCftzcDfJGwwqNIJExb9uylU6O99Cibt7GmaxMKoQn42OpatiV/3TrVICU9leoio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YT9VpdJ1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YT9VpdJ1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-46019b190b6so3038929f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542630; x=1782147430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCnYK+C4df+MJXLG8Poc3ZwFI2FZ18KRB0mt09ykkis=;
        b=YT9VpdJ1jRNFkpdyGw8duyTMzd3V2Pq/ohA/nWk0rxOPCcuhTBmx3DsungjxjpPc0S
         6nmXcRb91FLRLCajzvg1oR3WAhDAuc6M548azjj+f61MBF+sqzM9qbG4qXBvAdwiqJmE
         2etVt1voxXQNgFTRfymNST9JYo/93soNYB5q2iCqsuX6guNzQgGGc+yhGmtSni0Lhj46
         cnMXC1zu/yOXqTwkaJy68V/eGVMBp2HQ5uHcFU2oFQYwqoiDqR2U7Yt0mshZswu1beBA
         9JPErGxV8Lkd8ThBsbk3cn0vLhOfvZOhxW5o0E8M8IzHX3Lno5YS+f6Yk+x7nKolfq3m
         6dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542630; x=1782147430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCnYK+C4df+MJXLG8Poc3ZwFI2FZ18KRB0mt09ykkis=;
        b=YxgJI6TzwZci8461oA4ptkYwWOnm+ifCzRJshMe7p7FR47YBwEUho/kbqY041mZluj
         q5u8rT29z4XWu3FUNaXomJ/totKm10+Zof6qX+gQFmS022DTFtZBCwtLlsAiqaPR26iV
         JaaUmonVSADUbKJmWt43z6t3ZHxAKTnbGhdaYaU0EDl6ajYxY9RDZPvNmKhbgGCqoq7A
         W7ekIV7oN53KB/L3mGrSePyRGSDTEoYbprCsWzC1qnAxi5ntJ1XYMEkv0zcYi+yOZ4VB
         bZNy/IMm/IqOm4sXz1P9cx+40HMP10vGmUCV5bBULyQ+dQNt1OEOfIVj9tUI+RN25fZs
         gJzA==
X-Forwarded-Encrypted: i=1; AFNElJ+mYPjUFlg4/tME4rd78um7xncl73LPAayyXdhHCr4Zv5HPuTQfys14BGe9nxLzy1wLiCDvDs4JOIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2aOkNAeJ0sflvV2iUWBLLG4u1XQghnjFEP5btG3Rym1glA42
	+t4JysQs32GgggeczRgMUMgbxDRaXd5ep6dNeY3DZGIovK6sWs7EDiwm6CIxNozLdpg=
X-Gm-Gg: Acq92OGzNf573nydofS0HKNl5W7hloDZnOcFGFcwOx6UwGIq8XMoVAlIpaaIM3Cq/G0
	gcMBlFng5MftOo/efNGf8lp37416+YOhjOy/lGru/fF3Lon71OsDlQnXMYAZZZXIJEDSC4nv+gE
	40rAuQwF0zvylE329Np++jUFoIibbre4p3C6sC+m7Md09GqAhIIxX/vc8Po9MJfs2d6TeBgBu8p
	Qxi78veNnV3JBWHbNAtpXGi2p6xNyGhp51r24eD+BdJf79MqNZ2DM0zhJ9XDLiVbLRHJagI5B+/
	HcPvTjnJ/rJfyuSGYwMvp75BRiV4Finm7jDdyl6D1s8adVlOcgp1sylPIb5fWLUMjT447AxxJfo
	Xcj8sy/bxwFgCDP2djzw9s0ElRXiARX/77x3/fQH6bKCDGOCtiqWmOY4tYN/XaHVTA4Yx2s/zdI
	t7UYSLCCN58UUCsxvVy9y5Ol4AHfZxsQVKjdV+k21FaHDWXv0CdcA0xAQ=
X-Received: by 2002:a05:6000:1868:b0:460:3210:4349 with SMTP id ffacd0b85a97d-4607ec0bfccmr17052371f8f.42.1781542629552;
        Mon, 15 Jun 2026 09:57:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm37202471f8f.22.2026.06.15.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:57:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 15 Jun 2026 18:57:02 +0200
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom: gcc-sm8450: Add missing
 power-domains property
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-1-6b5752dd4747@linaro.org>
References: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
In-Reply-To: <20260615-topic-sm8x50-tie-gcc-to-cx-v2-0-6b5752dd4747@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1392;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/IalT+RAD8IwUnlye1Qn03niWUX6gu/ygo9mcIH9+WA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC7gnV+PHo6vTzD3PBWGsRNJ5wJoYUdFlViraYOK
 U5cdFdqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAu4AAKCRB33NvayMhJ0Vm6D/
 9HnEJiwfVsKWxPviPlBnliQk8Gk5nhkQycUcH+z5j+lqdgj5agTKzRb0WgOnllMhy9nEcApX7OpzUk
 Ahks1Com7xYKZUvjj0b7InuspJL2yHBgzfDzWoPSTVT6UQDYx3UQ6ICFWAUuKsqILiZKRAWULF0QOn
 pwn8RuD/H47rNNnvfHCWLRFahz1OMhhKv8vouc5s7N55eSVEh8OkfobypZ/hlx1tcUFCsFmnhSkCU1
 Hh4kY6TUuP1Ffr073GntNNS7Q+X6o3U2vjMMkEQ0svplVpuYr7PBOZ6IT7TD9QxObdtn8WtuLSFu1m
 NYcG6owTnjJG4RnY52F18vWzfGa8eSlbkD2SjYULTxRk/9sk4UCzVNiCK4Yi6hCRw7aBctRY8CLVRG
 euPlwtS+6UfU7M4zDNuhMECMMSGGnMWcDfpvQodQAqr2kifYCbuGy5M0waKNCtC70GTzUoXsefo2m6
 b1qDupNms8SnI652iGZh9BUkf84C0oFnMQme7B6/FCcvg9cdQ5Ag/BHmgLVgUvwH2zorNM8BiA3gpP
 BKRZIk/GnAowpBEI2uTWguPw3UAhOpuv6BLP+YtQyuE/layg/VQo1A60cakj7RqIedkL0r3F5RALPw
 t1xd3Gp5cKvW5luSda0MMEQ8NpTgo/j9UDWss5OXDfSxcDRNmDlYC/A8gFpw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order for the GCC votes on the GDSCs it provides to be propagated
to CX, CX needs to be declared as power domain of the GCC.

Document the missing power-domains property to that purpose.

Fixes: 72a0ca203ca7 ("dt-bindings: clock: Add SM8450 GCC clock bindings")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..7e3713cfd498 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -66,6 +71,7 @@ examples:
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.34.1

