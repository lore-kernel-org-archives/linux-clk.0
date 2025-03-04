Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3F263881
	for <linux-clk@vger.kernel.org>; Tue,  4 Mar 2025 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741098722; cv=none; b=biafgUNjuQXhoIzAJBjGqZ2Atm0u0vXZvSoRQ/20VwN2xSI/4EgeFOtq7hy07t0RlYGaXCvtJOuz0f6yMbR7Zc5quIY8ZAEmtbFdxUoY1U5SNpQmWvOyTAY4pRNxZjNym8AVslRTKhBHElq1OiRFz6yfk6iknkuqnAuFQXjSseA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741098722; c=relaxed/simple;
	bh=VL1eomr7TYKNMZFzlAbBFJ5Cl5ZiG3QKGLhOiDkJJFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FMlxxYfyoCQ7J/FnLLH3u3xYdw2HOJada8VXvndCrv9qElWMBtn7W69BC8sqZMFN+65dEQTvVXITA1lozrjNc5sUn5c+f4it9PoIF0xXLItxvXlNCEwFXIGzq7V0u5tjonHulXsnXq/Wt2h4t/4vndEiH4AVJDXTmsi9YqxCMHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a1+JpL1H; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a1+JpL1H"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5496bc767abso248029e87.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Mar 2025 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741098718; x=1741703518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQnSQpQb2bQVsADPOwC5vQPziAGbC3qGxhORonLAzC0=;
        b=a1+JpL1HTOxL5irqgn/SRJoUMD1jfWfrSSuQwewTaPQJNBe0+GPiTHS+Ls8LvmsLBd
         r3xM/1jCJXL2T7Q9aEk59C4s7YCXBUrCEYZ9LcjV6lvpHiOhycO3IoYqPTaLrjN/0nc7
         l2WO5FpzYrLpklz6oAPfro4wX50edtVv7gxN2hRGzv9/XpmKHEePTKroZadRDcrUg/aR
         05pSdNmCI9PGDbVFhTeu0Ee4fF2hzE1pLl0rWkVVKgWQ1hC6b158NaR7jL0ytcDPNR6m
         PClafMTpQkFiZ82Se6e56lttZiFqiQh0TNtmcVc34Co+SWr+U176KVQ/8qAMoBz2+hDU
         U14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741098718; x=1741703518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQnSQpQb2bQVsADPOwC5vQPziAGbC3qGxhORonLAzC0=;
        b=BRs+TX7zdFQcA9C7mM7ZOWflDbFFB6WYnpBWAVOmx6GjWbnB22631M/9r6SnnumUXF
         aOTx06fz4ASNrvr6OdKHyr4w4jty4rdKwbwx9KXVgjrrcNl8ZgvScBJemLW9KUuLATQR
         S5og0u1gdRjzOlXSj89T9KLzZJ44xXXqlv51bYd5JnU4WfMjhgX21YPWNLHTk3ltEeci
         XOAdyIWj1WTCB+E+sMxOqIY/vcmrgVHdHRZEtsxkIBCf3kQJLWQ99WM/v9OCXkJdcqw+
         HwkvhMwLyFfgHzuq8DWx7Ju5K/0BgsmI6yekXYsxmLmrZQ8p3xUwn+yhp6IWqzG2aMhc
         abHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf8xwQcWepLOOgmVmx0615D9ixvO5eLb0xQt10rp1jQUxIFSRnjGE+1rU9kn2nGr4DlZce3bhfFQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDHvImUi5ROF/fUNOIDqZYUmYEhbKH1iJQR2KbGVEMO9VmB1La
	+nszBjZNtsT1hhyaXN9NHJ3S8RcYOhjSSBg54oa6zs90Hmv/krq1iCRZG3zjcUg=
X-Gm-Gg: ASbGncvelHVwRAI6l94wgzFVWelA/xMY5DEn7Kg8mXiJzYMzlB43XEDo2w4I8GNZf9y
	ccS2eR0laueDVfY/0jI8/BxS93AZ79BNfVOyqdO53gcTi9xell2Rf+DST0w8iiG4H6gBUa6sh8K
	pJUd5J9g5/bNQEqTCQlbJphM06o7Hojbki8gQNqYppa4+tNCWn62agaQSUnUEQChFKfS58PkCW9
	mP732MKQgKRuWAO9GJd22P/yXTYtM6TqbXEbbXHqaKk/KwmFGRl5fL5oLBuzNaFcaJR3k5UXZwh
	C9ybc8Bbf5tKN7cHybQ7TcAM9ZbpB/rs2+TfXo5dK1+M7NgbDAwUwX5FmnHRv74jGzH7St1+FPK
	cRa4/CGLQJkD2EG+40JM8CuBG1yZKfYUrSw==
X-Google-Smtp-Source: AGHT+IFhc6yFO+VR/PFQ6SlkWPLfhadsyPa+Xiq2trlhv6hTkDGgE+oaR83aYaPKsRsQzXMcSNIbbQ==
X-Received: by 2002:a05:6512:3b10:b0:545:8a1:536d with SMTP id 2adb3069b0e04-549763adbb1mr409879e87.2.1741098718068;
        Tue, 04 Mar 2025 06:31:58 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5496862ee0fsm672202e87.189.2025.03.04.06.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 06:31:56 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps
Date: Tue,  4 Mar 2025 16:31:52 +0200
Message-ID: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The switch to multiple power domains implies that the required-opps
property shall be updated accordingly, a record in one property
corresponds to a record in another one.

Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,x1e80100-camcc.yaml   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index 5bbbaa15a260..938a2f1ff3fc 100644
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
2.45.2

