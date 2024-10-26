Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165D6433D0
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957631; cv=none; b=iGRwh1a7KTEQjaxRXR8oMpqW3MvERMyDnagZxJG9+cxbYLpHpw5sP7MHvvYge9UEKrDOjNBe8yp93WbAR3oJ/g+iYjKcOnbNCddgVijsv1rcAInIeSYGmBNKx1aOvJzWQc4LOuS/MkRxW0Fva8vTvwpYe9QTrlRjTsBc93RzpbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957631; c=relaxed/simple;
	bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TXWMwZtuw6/br60+5md7fjfY0BVFZVV6WjoRMFJSFOSuUeS+REQVnAKu53tlLgqF5l9zOji6Wh4jn+BUHvC3prHY4qYcdsOHkITlG/V+87SoQOb7wUEdnagcgn7+BEP1Ci9Q9XxabjuTT4tzZdEDbv2TgrolMMdo8PwnXPjoIDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pxHnW291; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pxHnW291"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so36047151fa.0
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957627; x=1730562427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=pxHnW291NMaYFHCjVpVQT2XlKPJf1xrwGYz4JoFfNpQNcQrfLCIYCz9AL+F7LZYyqm
         58zJBaAy0NdvloF5dWsx1Z7gTCglmNm29eIIW8gHO4Qx/YkcxlQ+IExCjjG8CS0tzEeA
         P7wu46QrS+QxQ30cWVJEaHTDjfuzXnwjajaQzuVenNq9xdyqNhUiVpGYKNPGg2HF41y9
         A6MD5zrcmDPc450WA3frgu6OjR75lbnzLHomm1c3Vt3TLEXH7rIfUkdLRmlLlo74S1kr
         WLXz7ngmqVn76R3YU2gCxqJUItUsGqVBRoIJGHB03TrprRLRyd0jDmuvkClAA/IhUiUP
         x1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957627; x=1730562427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBMgQWjciUW4UHYAr1mygReqy4wqLPHJvE0xLDCFl18=;
        b=FcAa02vXbP0CZyitgVv5WfdmUrvHqFGITLVxFtUp28ajyE9fNbW/6WWROUEHOtsNr2
         dC2G52Gt3qY819V8Cymt0HwaFRP7bOjIgWp4kcGQLUXC/Vd5UbOQlyXTbtqsxXg9ky41
         xzjL7wAWIOSMdYhWKXlAFHPGhZpaxQPdy9oKBT/xv0CvdpritiYQeQFcEdRhiabL9bck
         n9tyPmYig1G5HetHgDvZdE2SGcXvtPtRBkyp6PTWvGuryH56tkQXkOqJ9AsCD6sm/7Yr
         Fl2A0jye2hT4RYY52/B7jyf8fY+snwRluzAbPpQBZ5MbkCQdTRulJkEDRSn324dEb+/u
         UUPw==
X-Forwarded-Encrypted: i=1; AJvYcCXEkJ7aEn15FBBP8a+2ZoNF5+sS2g3oaLufI/Dlk7PQse6dUZPdgGH1Ipz6PE64qaXebLW/JRQMhAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMOA04m8gA87bxmzoJ5XG6o8XURZJ4DsmNVZnSaT278Wet61CE
	U6GZzVDwP8XZxT3683xi4S5ifNpdv7qVDx/IT6O2kc1aicKeCGkKvAm3ujIjKYk=
X-Google-Smtp-Source: AGHT+IHpT3h9n7uqQ+gePw3I4gZTaI47lVKDT7OLIdLxn0j9g1hP5XKBtvJA/wv3zX+OBUzGKatrNQ==
X-Received: by 2002:a05:6512:12c4:b0:539:fa32:6c84 with SMTP id 2adb3069b0e04-53b2373720amr2864126e87.18.1729957627170;
        Sat, 26 Oct 2024 08:47:07 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7cf4sm532188e87.184.2024.10.26.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:47:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 18:46:59 +0300
Subject: [PATCH v4 01/11] dt-bindings: clock: qcom,rpmhcc: Add SAR2130P
 compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-sar2130p-clocks-v4-1-37100d40fadc@linaro.org>
References: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
In-Reply-To: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=xfoORnG7BJgpYsszuYcVMwpN0RRab8ojk9gSAD6d/zQ=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ71nrgYXUawxikezEwRxyBJbtl+4kCw815nr
 cSsWl1Or6CJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0O9QAKCRAU23LtvoBl
 uIKTD/0XnYmIVEhEkpRe+Fq23uvzsz3cto9phX6sJSp9o+SG5fnb5eJQfx5ajiQMPp+sCl5BmxK
 fCiTnpfvvyBUpyVqCU2RQBU+wuIFNcBUaEeOiBpjm+DnTemnBf2l97fvTjP7LXatKUHfSQ7lE0K
 kaqIXkcksW9oryM5y0PntAR6NPWeoxLU3yqv5OeAyxy7lun/5Jtraa1wC/4KleT5hU/kEC8cDMS
 sRMWrtnyW1J/oMcAa/m2WpgGcVDo3K+gu+OI2iz3NOmTKyhhAMAxHOmlvUmYB5epfcMsklwRFVl
 a76MKpdNLPm8upkp7/Q+60KstMV5UaA8fkgkmv4r6ZCeXXmLlFwZICMw6CN3WKFEMwKq0vSVp5w
 oO9xsYT2hpHivgq3PZ7W3ZqMrpZkajukvFr1onXsS0x2wE0bGOWdHNdVyh1u2cTMj14z6gmaEue
 kO66lfKiID7HA8l7Xi4iVCQBH940OK+khSVjaSKAM6d0d+elJ27cno6o4lJul3HGgDUhSS+YJJk
 YApLaPz3lGjslVXG6VkWyN4B7uyz1YLk+ZfUXAJQZrjSa03qZX9w/BG8yP7mpTr5Ksb1zh5ZRHd
 okbbyS5Py81Hrdshs4b55QCwHsniP877Y77AMoFmTTTPhG2eeV5HVgGVCESyHpOVaqt9OZKiDaj
 qAfg6D3uULiKUnA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for RPMh clock controller on SAR2130P platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index ca857942ed6c08cd4b906f18f6a48631da59ce9a..a561a306b947a6933e33033f913328e7c74114bf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,qdu1000-rpmh-clk
       - qcom,sa8775p-rpmh-clk
+      - qcom,sar2130p-rpmh-clk
       - qcom,sc7180-rpmh-clk
       - qcom,sc7280-rpmh-clk
       - qcom,sc8180x-rpmh-clk

-- 
2.39.5

