Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6303BFE36
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116135; cv=none; b=SYefkIl4jyhLUvlkQfzlnfisVKZRQxzU7sg/e2XWYqiuiPOrgwF2iTjQ2ttlFAQVCzCkuV2IvXlnVkdQKJJkOho89yAhf9q/VXz7HWysbzExraQB83o3C4IqheWpq0SwvuYqq7TT3c0UrYBLiATkbMXLwGR6+rys+tvv10lB13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116135; c=relaxed/simple;
	bh=Yg+9K+uVNQCpVtms8a3DDntKPMJx4dik8Qk+0Gh1t2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUBN6UJowptm+OA152BTAsK4uFN2jSJg0duXBZVPIVZxOTvKn60lFCI6i/HMu1Ta3X9I/cSOi9HP+4tcJRJuQrrMahqmzbrA9tTmihaif1WuanR8A1GEbuOubro1G7+rg/yKjnSs6OPY0sMarLJUtWgpolJPO4R5smG/pb8NUWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KtEhktnl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KtEhktnl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43767807cf3so650637f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 06:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116129; x=1772720929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT5yqG8vXBWHfXrGzM4Tk0LOrnIaCETkWh1v4QtireA=;
        b=KtEhktnlxy2gnLDeqk1Zag5nR4HWWhSDoJ2gsAIhtgpsJoHfXQZWwqnkWZOiqwWwMD
         wda1dK7GaTA3zvk+gS6DGlpPqduXG4QZGJARioarJzus7DRB/xSDOtagqWr1tjvaLvrg
         5AwfqrD8ArQy9X/D1CdBA3HPTsobDDP0hXB7F5sTYWNNhcJWqUXEWqnNLyEo6jmBUy9G
         yXxGFZN0kZoDQ9dpk/uKm9sIc2w2gtspWx4rw4uo84Umel1ScnTPffpUc8EzaWLeIJzW
         Nb8AsCVf+SxQ+/25/NuTaw8x2bVXchRnFITdgyqBkRj+0jA9+TJLvAEYDtZYhgUK4jcG
         xqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116129; x=1772720929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PT5yqG8vXBWHfXrGzM4Tk0LOrnIaCETkWh1v4QtireA=;
        b=sfdGykcEs1ZIG8fD0QbRf2oAiX0c5lMvK/Bnf6s+6aLHWW4Fyi1mr1AgKLfhVsxFxq
         W9ikyWYQBx4WVjJiHSslj0smfrhOO9Z+4PTza7azTmKZYAsXbJOVGTTQTj7L8vFTb0d+
         WWnx1Y8oNFQWnJHIqawvJj/2alpd5Jtn+5ZM478lCRSKf0VoUNQBSkvGHqYDOGxmsYPY
         0NVoIVYxkeoI/Go+jd52e4//P7ojJI30FclRcgQ1e5L0lgZ77l6hXdUi/T9XlwNYO6Ej
         otJxoI5LZFaBDuq3vSVTP0o+fhkedEDPyTOaHk5l1KgTRseYJtQzMd9DYNSSQ4pcc/dw
         FOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEn+R9mmPQzdOUcTrhm4q1TwyuWaWsg4tPRfiuYvBmj2L06zPkcizcfsw3Zaq3+C1Snk07w/Podqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWcDPBEwD/em3dvBjIfCHq+hiCeIecFKH8uLsEH3b0/PnE75Mp
	xi7woyZce6cNwzD4hmfZcgumaEA5b/EOGkoFPwjzOvmr3zzzpI9mYVN6sB2hmJKw+b8=
X-Gm-Gg: ATEYQzxZdGsvCVq/+yezdPvqk32RZ47tOozHZU1PZWu66SOH7Id3RXbkFNmgWajZ94k
	ax+o8MsGWpmHrfLMemyPjh0MJ2RWcu013YTlZSXjC89QadsbyS9+mLBPmInbTO49b6iADKfcAEV
	MhpGWYTg33GPLBcn66zvzc9tQG06Q601SsfaJodO/HCoqojYxdh9i3+vKFDKVaDaCoDW5z1/Ygg
	MQqtuibRxdcP6yTMgaf3rmVGfkAbbMJrxyiojsSIquyeyiZNMa1qr4VfahUElXvQRTFoigUcDE2
	EDChKSBvtKPF+D6Eeh8tbsQslI5LeB5Dzey0woZr7zpLua9O/cxJBqav1HFENctdVU1fm5xzZ8y
	LG+wMLwiJ3/xqTLSUfvVJDnTbSG0J7j1jTFMK6IgdGTeXKbjoVtQQ2Ta4Q2LWm2oVHlcSN9aHIz
	44l1MCQCNFL7CxGua0tqvS5RWImeTc7n9DjR6ka9/DWPeQ0OdE1BvaW+xg7sO+U9+/
X-Received: by 2002:a5d:64e5:0:b0:439:8bb9:dad4 with SMTP id ffacd0b85a97d-439942109cfmr7687747f8f.0.1772116128933;
        Thu, 26 Feb 2026 06:28:48 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:48 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:45 +0000
Subject: [PATCH v9 4/7] dt-bindings: media: qcom,x1e80100-camss: Allow
 CSIPHY supplies to be optional
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-4-a59c3f037d0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=883;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Yg+9K+uVNQCpVtms8a3DDntKPMJx4dik8Qk+0Gh1t2k=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFicaaNl6Y9jq8MrqGgi2he0VK9T64CSNGLhf
 cbmHvGG24uJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 Oj0RD/46klVUKSPMzgVpgsIKjnYbgrlgJ1CEBkKktdHeKVVEjmrG7PJtL2wJ29FdUEMOyMsCqmr
 ulv1I2zPQr0C7jWtmvGOCLoKAy/dcdp+cvMZ6X1GzUrXUaPbglgYK7OfOndk++htn+qP2HfZeGY
 JpFjfKAwiWA7k7uaIWGId7A7/dZYvEpCrhNpQVuSqve7cikf3Fc7B/EiRVQ/uWuo4pBuXtRzRSD
 ivFpQlt6HDa00UBMfLsvfMw78NXwc/sHXxdaYXBHUlUNOsLDVDa2kqhHmyGtevDhJAQvniIcx4c
 5ZIp6pvBdV6qMczcDE3ag3mQN87FYNzVOkMHw8rav4E3zeb0v80e1rqAIBn3JLJmoRaIeMXSJeh
 h86MZ5F6gkN8nvqYPiBuh8VZlhvTeme1iWZXQ46DOSuLn/eakaQQq1/RFVfZhToMAliANStfURg
 QorED1hdJZDjbOhi2MoJp3PMXKwH3HA1fOp46T2135kc1lXfsZaOTddS1OZ9bbSRRbXW+KVnSXv
 +7ioCPviSzs5qNnCoFoJmtrwUp+vsws59FKvgp5NccbgErVaaWDzIp3RsaTZarGDg00MsvSTLco
 QIpk7ljNISsy33jJ2gdHd7lFKsaXsF1jmxgq+WRuny0wXhO9DE6jFecM/Z4vEQhk8RNrzMPz8fd
 VfDuWUvLNdk7Vpg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

When CSIPHY devices are modelled as standalone PHY nodes the voltage
rails are defined per-PHY. Allow the CAMSS-level supply properties
to be omitted in this case.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index f406cf6f8f9c1..3a5f179c15910 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -243,8 +243,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.52.0

