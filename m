Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B9F223DD6
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 01:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622924; cv=none; b=Of8vfj/Jkolcz8nnIBlOv/BC8QxB9QUCDyJk6vq9VI+pUSZ5ACjisOtqZQxplvZtOP5VQTznsVPG9VqcNnG/ivcYc9IwDzeVkzIgfm/7P48ILSTovUPoRRZrBQbPQK65FBy008eRLzdr+O+T0t2dLjcSIlGqyGw6ejL3jxnSdAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622924; c=relaxed/simple;
	bh=oAZeYp7NfN4Ch40Jvo2x/a/56aus/5DjsiPO86eV1KA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FnIfWQD0Wt5LxowWbiEodzZuiQN9OTG2lTNEXilh8j7m0o3J0Dbh08Q2foIOyDQYDjfDqRT/adr5wAxEjsfufrV+PMBym+2jRmxHnKkNkKWS+fiOwAfseoKOpHL1WjnuuXeMVoe7+7QV9BuPeCp18fDjwEbz4WfbpDjkSYqcTY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMDspcoJ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMDspcoJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4710187f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 18:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622921; x=1774227721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4EnNcwv+9HLoV1oCcE9hg7Uth97xpmXg0NPNWImA9A=;
        b=kMDspcoJmTnoSXy/ekmFJb1wCA5uawOKEIDIb2j27H7XIZ/ZyxBx9Y7AJV+FHN13hg
         bH6R9YW7GQtKhS78yga0LBtbtiXZdFFpc1/04JFcM5lbP8tdnbJlwHFQeuSuHvNzhuNO
         EoFmc1i15XZ59rDMd71ayHZQG6RZMgcExQm26lGG3SXxYMnGjRr7X44ja16RLmrtHhsw
         /l4X8ar+V/q3xYkb0xOsACjGb3+WOU8eUMNi3rlUXLPb0dDNdnhCDBwRCPuPmG6hxDjA
         dOZATfap6sakpCbHmv/MMM5WEztG3znqt61qS/sl4Hu/WcmPn4EBYH4av3AH2GJ3fHLO
         cvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622921; x=1774227721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4EnNcwv+9HLoV1oCcE9hg7Uth97xpmXg0NPNWImA9A=;
        b=jqRHluc8tmvbQ2kwMVXtdqPX8lEdJm592eh+g9BjoOtQWe50gLKeQyn4IVznfqDVDz
         oYcCWoAWtzICaA6ENxpUkY7zmJ0pm6px5KvsvuUqjDvenE/2LFlFdK/4+AOtzxGAKRNl
         M2XW3k8n/oJatAClEVUAJHPMDxMnCdIk69PAo7mXkaVwoAm9qrlEyREPvYR/fIfiqxY2
         tdXTzZ/khTaI6b6eAbBKkZYPX2LkIWMg/8+Jnab8drA1lGPAVLPozUPZ0Rgl4acihef2
         lVYysdXAlSAdFA0vaz5oNtezXgksxV4aYF7Ky6NAPQ8EJyMv7eYWSBanj69mUj71xL//
         nAhA==
X-Forwarded-Encrypted: i=1; AJvYcCUiPbI5p9XxWm5ptuGrQJQC7tG8fmmZXdT+zHflPM8YdznJCs5nS6IS+dwolu3QdhfJaL32NAiQPGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YymC7bC3xm73aSIcqJBqwP5zEU1l6TnmZk/gvarehGytDVZHO9S
	xnybfSq53BrFO6EkNWyoC+fEI1z7WtO2Cg2D/J5YgD6/Zc60MJ+6jIkmYX1vsTqmAa4=
X-Gm-Gg: ATEYQzy9UZkk/nTPhY3RMGcRUOaNcgSHN7usRuNFfnsD4oypimZ+qjrsQIGDDayEncN
	UFC8HfsxILaiEpISFw5odZTi/9fErvSM3vSsY3pkfdtL0p77Jlh5xASXQzJIqg3JsBdokCGANBt
	1f/UKGN8Pglma5oceSH4PNiT7Mm34ranabL+6UbBd0cD58cMmNGBDejJhGajawVP+MJwIBImflk
	ch0va6wyUaO2i1vvwGF40pGn6F5TbCzFmROnc5ArkX4l143aJKsWTjn172BPgd8I4jpiA8qWjcm
	jzIKz/IeGlMlMY1yNgGm6CeRJRXQRPDIblDY3XFW3qKVDsanTOyh7fuJeKykyMq+Sx58+LSZ5UE
	GOICLVMJGz9ELE7eOk9WZQpTeLz+27Stq0Ts+cmN1FPxomShSStVPVJ2kymhGgQY7MX4EofzzEp
	A4h9mJtF/ki+NjafxrDcZkuCxquXtHdtTg2yk=
X-Received: by 2002:a05:6000:4014:b0:439:5c75:dc08 with SMTP id ffacd0b85a97d-43a04d83f48mr19743351f8f.10.1773622920856;
        Sun, 15 Mar 2026 18:02:00 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:01 +0000
Subject: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1254;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=oAZeYp7NfN4Ch40Jvo2x/a/56aus/5DjsiPO86eV1KA=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGm3VoyiZNseu9UYoYC6eu33PYlElYW9JtR6Z9+S+cofJeDRy
 IkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpt1aMAAoJECJxO7Ohjcg6qWsP/RgS
 BHzfWTj1wcBuU+6PV3S0jVOIvoI86H6pdK+pjyAky1grBTPY26KE3LPamd3au9EZGClSU7SCuAI
 VcSaNrxpPGBbO2vZPWUZHgAsTd/DyHvkjUAKajPx4/SBy5gtbAzOapGesptckgbfdv5hLv/nFir
 CNIQlbH3UJnxbZUjVyRC08fn1HNlL+5Aqtbh0wYJTqo+mX85OgIyZL/qSSWqYej5P1fQvMtZNIU
 BR1gycYTalGd7hZp3toIe+UEsNexPfdF5h7RfC6MthoONUIDKbribA25cJFrFsieJAmlARWfiGh
 fAqsDlvgoM7Jdrkgt30UfP244qrOvON5N9VfBMoc2xi0EGkzKlBCJzaUHAhsN7OxLyf/zjLLimy
 ukbYdDQv0TQyC32y195OjR9pO5s7oIIuw0df2vKVSkrs+zS/5AxkG74hxRAvw6X+S2boht11wbT
 YNSFibbBS0IiMS0li/8tdwN0nngNmbnODico41Ls/GN5VpsD0Ad0j3GbqXrzp7gibQsEhEJnheK
 bxkSZxEioXkdEdCrvBfaLkAun4KhEMHP47SWOFqHGy1AjB93OHhBv7dHOUaMwIWA6mcbOqJnytp
 FXQ/csnLAM7c5JamgRhkWAEvJsOQUXN7tGZXiV6PY/3dbntLJiT6NmLjzKjUUozIH3xHy83f2a+
 KjRQP
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add "simple-mfd" as a second compatible string to allow child nodes
within the CAMSS block to probe as individual platform devices.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..b5654ef71bd89 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-camss
+    oneOf:
+      - const: qcom,x1e80100-camss
+      - items:
+          - const: qcom,x1e80100-camss
+          - const: simple-mfd
 
   reg:
     maxItems: 17
@@ -191,7 +195,7 @@ examples:
         #size-cells = <2>;
 
         camss: isp@acb7000 {
-            compatible = "qcom,x1e80100-camss";
+            compatible = "qcom,x1e80100-camss", "simple-mfd";
 
             reg = <0 0x0acb7000 0 0x2000>,
                   <0 0x0acb9000 0 0x2000>,

-- 
2.52.0

