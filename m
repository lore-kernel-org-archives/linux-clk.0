Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98A430CD5
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787300010; cv=none; b=Hk+RbqCIijqlh6/NXuIxypy9gAdy/SOOrRVMamaWG3Wl3BcjiLnon+/JkBILC5OGtBAZcexyihgTlCkECLsYgIf136q6dcLcoLZBTOQhTNIJO0I4eCfYqYwVM49xyu1QpyrZ6cXN6b+a/3fxRRrq+/dPJm3D0PPtQ8FV3BnbKxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787300010; c=relaxed/simple;
	bh=Unl00eAfFi9To3aFPzg9GlTfdXTVfm9Q5VowGJ6jvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRThpehZ99j0LaGbYFyZZJ3ebcUD+kb+Yc+x5y+Pw0VRpc0JydFbT4LppQL53Dw8QYNSirXQ0LI/iu/dYV68jK4CN4Qf+WSwBwMxCDCOVYkVihKWaSm3maT1fRmMPBKBHlQbIDazIMcm2IUkuKIpPGjUAX4aaGJCT14qgBdk8LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQOqBzp2; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQOqBzp2"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso499774a12.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787300008; x=1787904808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=BQOqBzp21Tqbs8JhsY/vedKWOJ7Ry2oNulIN0DAA02Xl0ehEzfRIHoFtUagc00uW0E
         uvAPHNDdsfgtNXKFZFHq0FhzW7qCaFQo5i7P1fooDI41/eu1js9XFOVA55RAhd9d9VyM
         WZyYb6cnmifY+hFAMERwU2Z0qDZY7i36UL0FH6okc4/7burdC6Bdli0ezPsn9jO/8z9Q
         GPlk+i1YW1P5iya7oWp//iGyZ4dJmPu6LsDBpCUlsuqo992RFxiONE/0DP1bOLDblJyj
         gqf80xw1iyHP/gj8twXq/pHhat6BkZNtobx6yflRCACgChpWxzLz0rEtV+sJXLHqdJ24
         ai9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787300008; x=1787904808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iR99/HU1Sv6a6aJcZCVFplbKZQ+GSq64X/oQnCgwbZk=;
        b=QjsBGcUlnpXx9lty4ueWPFR2ja3M7JQ5qf9Bp4uPXFQc3miIjgVGQnH3zLe+kQaGm8
         uFpE8Hv07sPV6wahWZEFcLmV2f2SWCjwhsw3iYDhCU0VLlNILgDGllR4kOU1faXYUapM
         Y4SZWMGZehgb6RPS7Oz5WCcUZ4UZC6oQGS7LHzeXSO8G05Y2AEWyXh2gimG5cV+2dslK
         axAh1YpxdhmfwF1Swx9ERev9qnE+idbl88P0eIhDW3f2hcUmk/uZb+FVQqa8A/AWOBmf
         s1mnPLPzd2lvXgXlzH2DIoydVzNb3YCYQdPvAJoBrJ1ziyXOKl94hJjkx+KlGIkphrDC
         ZTag==
X-Forwarded-Encrypted: i=1; AHgh+Rq1zRJyMPW2AXGA9qi3u+q/pIU1ofKiTWtXZb4kHn4BaXACkLGotl/+hq6o6XzBkI0+UNAIlfPG25k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9ZjrBGdWRsSKsNE55gMNrcijeCfS0YTMeFZ16NkfCHTLFzsq
	TUOity98BTAXwCRHnXfPdWVE8IPRWw+YAq2aEFKbbzhs+CYQOFSlWU9V
X-Gm-Gg: AR+sD11KWnU7gaEOkWcfXg1C1sb6KtYVc0YoC8lmE1MGWsDWX+iqTszESW7YeJlgtnb
	jXxzUsWOvBLr/JwTCk9KZXFlxgcaVit2vlPisGgscKHRTddCcJj+aL91eg8C2DvcOr1NSsCRAOH
	ZgRBzpdlJZLBxBrgVL0uDwOI0ubhlsDTAqA1FeCHRQPWJVP5usg0XKtOrzUs5LDcIrA1RPg7ETX
	d2H8yc7P6gxEP4r01pb11wkCUrX+XCJ3aX6mu/NM0s0so1oMEawN6LK93deQMHRSXjM08eBpyhO
	Ne4xyk/uyGCXWRpkYYTDdCX2D7UFM4p+rpVG2+ZMLwDZ1tVihn0p5M+ynKLOazvhdMuV+q6y4bn
	cqnW4Qhf8QAxPF6ircL6ew8JKPK9Kju3S30jn4xmplZb5iID2OWOm9p0X1a6yN0UY3thzSd1RPN
	xoGo0DLP9rZqM0PJ3/C2+/lE/5/l3kK3GErRs2nt2PrChfO+2JauepLcy4AlQ2LeubDGmgBPOZJ
	GFtVpehi7Erl9IpXg==
X-Received: by 2002:a05:6a20:e212:b0:3c4:2cf9:28ad with SMTP id adf61e73a8af0-3cd3000a175mr7931614637.12.1787300008489;
        Fri, 21 Aug 2026 01:13:28 -0700 (PDT)
Received: from localhost.localdomain ([152.58.217.163])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae48761sm22040786c88.12.2026.08.21.01.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:13:27 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: bmasney@redhat.com,
	radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	lpieralisi@kernel.org,
	quic_tdas@quicinc.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>
Subject: [PATCH v3 09/13] dt-bindings: arm: cpus: Document Kryo 475 CPUs
Date: Fri, 21 Aug 2026 08:11:21 +0000
Message-ID: <20260821081125.4522-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821081125.4522-1-sreeshankar0910@gmail.com>
References: <20260821081125.4522-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Kryo 475 CPUs found in Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584..2a90af67c 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -212,6 +212,7 @@ properties:
           - qcom,kryo465
           - qcom,kryo468
           - qcom,kryo470
+          - qcom,kryo475
           - qcom,kryo485
           - qcom,kryo560
           - qcom,kryo570
-- 
2.43.0

