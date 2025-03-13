Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508F1F4E30
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 21:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902201; cv=none; b=XUljJOQTbF4dvJcFrClLTZpJcuOWjXcppPmV7i06bxGupcNUzBD9VI7wBKXzkEZH8iEvTqmGQpT7osllQsthYqCSzt1G4+WHF3xTVDxhL24/pa4gWeeMJ6VLE7nxbZ8IsgRZE0P1fVwZAnP4AdrtSdhu7CJ2CRMnhD5QTKcYdzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902201; c=relaxed/simple;
	bh=NaZu91DC4T8heFZFo5XZ2syZfWhTaJWbyUNy8uixAT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWvRZyKkA/dG/P1zKwPvGBvKUmGIXy6JQbAE/AKCwLoowC9sUOuA4IvW0fxUJn8OvMUDdeB1Ubzt15Hx59+laZFRNtECiY/MPxsznXFxnFEdjmi2rJWs4p4408sTtkffopqJWaWq6l3akyUevIUjI+oaCeCX1Qq51y/EaZZjM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2OAtKlh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2OAtKlh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2b10bea16so291060966b.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 14:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902197; x=1742506997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Au6V+nm5YKxU288WKh4NUBJU2SyJevP5UMvrIA5i8=;
        b=b2OAtKlhBW9xtV+GU2vRGF+mKQ5FDsaluza2OobOIxUn8H7em+qDlQiFNjU+ownvG7
         ysrZUuJANLkUTWX8MWj8EWGM6y6LH4IT+q/OdVwhaiHv/gQWyABwymqLUwpCFx+RtjOd
         FpnlSiarc7d0JKBkvDSsOLk9dJZyXZPbs9hdC4p5YbptwgkdlNcYcEPwIw0zocNrw8LW
         1C2vghifvLfBPRz7a9QWbDjx1PUsQmCjtPlgozIAbuBLeAns3ciSobTK7ibQ7qOnmpFp
         IC8uG2JDyNZfRyYLBJ6XZwxs2Ut/Fil1ZlNrsTAz9ltuoTK1OlaJXGJllZ+PX2Xs1Th9
         RSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902197; x=1742506997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+Au6V+nm5YKxU288WKh4NUBJU2SyJevP5UMvrIA5i8=;
        b=cyuJBhzjCYZr7UqENRPu3fs/EBh+yyizE2lq38Xmfyb5oAt7dNnIBwmFpHOv7VJRVv
         PvBp7+yOxZ2z/yAYlRhhrIH3/8IR+A50jVwjB6Uop8Qx5J7ayMyr+tPxPDJQ1Ud/RoVW
         tjSXef3IkdZxOdnJQtC2pldwzsO2EEK5B76vsLRQ/QtrXD9tcY3FzyzX9xz87ru4gfmY
         4wLTJbKuKDJTQWrsSHlwECNrKXC8BDMTyFLMXL2vhkJLxadBzLAPNSf+Xx630OR6mvlQ
         ORMKSvz5Ow3I/Y9DYa1u4RCq4nt9D+cTGncgnhDr+NLi1Mg5wq736L4A55Aj5uZ0D6sG
         le6w==
X-Forwarded-Encrypted: i=1; AJvYcCWLOLpS3YHOzoYmuLc3e1plrXIFXoXeX0rkY59ImR/TBHXw2YQY+3EhIetI57CSkayxacTPTTv6mpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvcyTPYz8aqCEcZtdtkondND+vGO+l3sjv1meXNMg2ZAIX8xFr
	SOqQoloUyiXmLSG86GbdJmrLXse2MAncLtqXqx6O4hNCoJuJvdcZoDAqK93isnQ=
X-Gm-Gg: ASbGncvFhNLM5xrIM1/tq3yV0Nm4QDnl6Oa4UqXMzOs1G7hFY0T/2za0BF1a4fCWYUl
	4WU2MJKsdjVFevlOgSFlEImeV0hoFfDu0dhjQXTrJtisUnEQdq44pwzWUnvw0H0ADd/LPP4rOHu
	KCcXFU+CkPsWE4qZRrpUFigk5ynlyV9b+sa7qwY6op8ELa1oD3vmoOJLHz3tITDbDxnfgH+FY35
	zQ51dmzvQAnTRf1HTn6Z3vN244EPi7kW4yHbagXtTvfhmlLH/rsad72VmpXAE7XRakA4q7hInOB
	LB224PyW0JOuVgSd2+QEohhpqAejJc1JbbM78IPp4YApEYpt3pWF8AZ49On3DEmVM61JOsRqlFF
	jzWRymsuD9b3s413s5frZeBuWCnrOKzFN+dYIUUl1BH/n1h0sn/fzVZpFrXWS/QNKZwBldhH6Cu
	zAhyA=
X-Google-Smtp-Source: AGHT+IHvGRlUnca+L9ajzxTMQ3ZVV9sUWOvELGKMoU5iE6uqCQcPOCFhwS9U5tYCom0ODtsxVB3EIw==
X-Received: by 2002:a17:907:6ea9:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac330181a8amr10857666b.14.1741902196696;
        Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:13 +0000
Subject: [PATCH v5 1/5] dt-bindings: clock: qcom,x1e80100-camcc: Fix the
 list of required-opps
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-1-846c9a6493a8@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a26090186e4ee4397ecba2f3c2541672..938a2f1ff3fca899b5708101df7f8aa07e943336 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -40,9 +40,9 @@ properties:
       - description: A phandle to the MMCX power-domain
 
   required-opps:
-    maxItems: 1
-    description:
-      A phandle to an OPP node describing MMCX performance points.
+    items:
+      - description: A phandle to an OPP node describing MXC performance points
+      - description: A phandle to an OPP node describing MMCX performance points
 
 required:
   - compatible
@@ -66,7 +66,8 @@ examples:
                <&sleep_clk>;
       power-domains = <&rpmhpd RPMHPD_MXC>,
                       <&rpmhpd RPMHPD_MMCX>;
-      required-opps = <&rpmhpd_opp_low_svs>;
+      required-opps = <&rpmhpd_opp_low_svs>,
+                      <&rpmhpd_opp_low_svs>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1

