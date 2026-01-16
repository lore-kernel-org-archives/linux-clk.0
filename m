Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D30250BEC
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569451; cv=none; b=Qi1l50EK2MZMujWJysDamJ2ZS44c/N9MoE5/CXt26uGCxn+FkI7mofjTdmzYrUg7wPjeNjKCrLq8iCliu+MesGCYZIy0Cw8f/psq6kkhW2WQmtG3qjUnnwKEzhNvBxhR7+9Peprjsk+whuJ34cWlG0nnfIEi0EVPkNjMB1cnNUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569451; c=relaxed/simple;
	bh=RFosUcjwMh27o+Q0KFX/mCWwbK9ioGqTrDSRkowE9Gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7ct6Jy7UWxbNCZxnOYsRaoMMlwhsB4oIXS2z4dFWcjNOdp50Jmyy21XTW0xVmj/O16uAMvZd/SUJPOD39Rb/JXepumGawzy1CK4zT84bzk3Pop53bSJDnPex6aIF035wG/na4FqfEQCfIa1ap8uMB8wmQPlGo5Olz+E6sJKYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T+o61sVb; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T+o61sVb"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so3397438a12.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569446; x=1769174246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcR1dmGQ0EElYWldmNS71m4JZ3C7rndmOwBL8aoBqb8=;
        b=T+o61sVbhnn6bIlhuZLu1xPXtQuo7Zgxn5V4NGuWt+DLSSWVRdwFdR310OwQ1ow2PM
         XANcXOm3h+RcOCLupWMZZsqijD5HCN77RoC1k3j0THCKzBaWuUEvdtrkgNMdyP+OjL77
         JLmwD/qtKTFyMmjDwjbPLCjsve4XV0kUgPKvXwqBgPsmgmkphct6BzNzZin2tRvD2fo6
         sYmwY3tjwujcfZ/LpypN5qFJ8ib46Clqa/pdj31jcb6LJO0dfU9VSusbL3mBehZG6F7j
         3VZne8gDet1U1TXj7+X3vruzKOgY4CETPTedN3wBD/8b4nPSaU+EWLxZAEsLCek82DE3
         Hi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569446; x=1769174246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wcR1dmGQ0EElYWldmNS71m4JZ3C7rndmOwBL8aoBqb8=;
        b=vnP1x4BoGZuxWSkj9PpeHgh25HpR/B7g839BnO4I1gnGGzlhGND6qOm77pwubrzOr0
         QsPS52L9z5BFyfb7b8qkFyIlK4NkcL0LvX8IF2P0Wy+FdaEzgbHOULPvgIlnMqlPkal6
         LvgCN70uaijAJY69KahjY9Z73u/PiKeV7LgO/gR9g2su+h9G7iqG2IsKteqr65SKK/DZ
         LCWZboHXl2dXXBKgjCR37A6zD3YI7iQY+JftH43ubUAm5CKNH30ZNvbLNdh5WUO7E6C1
         8cZ/zBGiuL8UqNhn2yHj24lMNxp5VCZOCEuE+OVo8w+ckHHqxXfYzLxwO+/C+KcJHWnC
         jTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRQS941T90gYVURXFzzuQ3XJ/FwcSWBo5wQnHRVq/lXaCkVTv1Re2QAARZpef7S9wxaWbCNxF0/z0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tmVND+A/61odQEaXkR6iVzGvmhtEJwTu5aYLMxyZTT6gXU+Y
	wBulB5xXr+3VRsjNU+gS19FKhthVPIOKDQMIWQ7wdII8evgv05yyqzwPW5FCcT7gU78=
X-Gm-Gg: AY/fxX6m6ivvk5hdjWvib0ScBrnTFnxV3UFmOVjsmI3agDPJBJaZ+6wEK2Szazp5DU5
	wipLCw7OKuzCR82MPS2faY8xrvimoCsR7GGrdytbaBDvgUT2Xy2gkoTHrjk9LnBjh5SxKvkVasX
	+GsTgrnqz+HxaTJhNpy9RoHB0jsN4MjMe9IQLmCIE4Xdch9breHgd04oRZCVd+LIT2X9ApYaYtv
	ToYbJhyPsDkgeEG4bwxjRBc5GzLF1RrP53dJmKdcbMxWrLeb4Jn4QvHFn4LIVh+pxHU0ZMLb/YY
	LdHbgoRptGW0pShPM5dj9V1BM0kCtafYq0wRIglnWHSPYJ16VrBP0sabn8mm58kOebbFhUDtuWZ
	mg2/omm5adKPWiHBARqUtKvTYWSnYMfxoG/8D+i6b3kXvnW6tBTAadEy1XFidFQKKuUJ2UwLuwm
	/hRVzWq7yjPWlJZXnNwBD9kVDfAs/11pr6awkVRjl293SEiyvirsTTGcWAtKJSdsAf
X-Received: by 2002:a17:907:6ea3:b0:b7c:fe7c:e383 with SMTP id a640c23a62f3a-b87968e56f3mr211104066b.22.1768569445696;
        Fri, 16 Jan 2026 05:17:25 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:21 +0100
Subject: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=1598;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=RFosUcjwMh27o+Q0KFX/mCWwbK9ioGqTrDSRkowE9Gc=;
 b=F3TPfwyBjFhqKF+HInQg1A97Mf+OjLhk6olL+d0GTCGtvDhv0vHvyzaFIZ0sGqrZJTnArQl1p
 Qj4XSnuvOF/Ast/91GKxv4KyvwPnFE8nsTermX1yRcoTl4vnkMG8kVf
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document an interconnect path for camcc that's required to enable
the CAMSS_TOP_GDSC power domain.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index f63149ecf3e1..707b25d2c11e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,6 +25,10 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
+  interconnects:
+    items:
+      - description: Interconnect path to enable the MultiMedia NoC
+
 required:
   - compatible
   - clocks
@@ -37,12 +41,16 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
+        interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                         &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.52.0

