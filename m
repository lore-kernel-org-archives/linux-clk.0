Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A03815FE
	for <linux-clk@vger.kernel.org>; Fri,  1 May 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627121; cv=none; b=gzmGf83PYoT4reiQRNxlfoUz/4QFOOl547F251BXCZOfoq4782Zo0PrWJXU3wSO+UXwsycF8uxDgveaIpBfZdRk5ZmaGP64DT0s8xrXc/LL2YoWJIxw0l7G6e4/crzZ5XDLv9MdJIJECvvHiw+g943zFW2wIX4kj2eN/JYZvFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627121; c=relaxed/simple;
	bh=YmwJZh9JOI6WzIBDXZoUlM82ToEJjTRJKA1/rBWV68o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uODpBr6SO4UZTULILE04W5bbrS3FIfiWRQHOEBAF+HDSJnyh/ca4v8QM/Ahhhq/osB7TrS48XUEu8Vmh094OTmRMnC+FO4Y1TzAuN0Eio6dUy+gGQRVhrTYQumeiXOe7FvxivD3dYkYNiJFSJIWdXEAjplOtFoRgriY57hswzNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Owb5HHBa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Owb5HHBa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso20070285e9.3
        for <linux-clk@vger.kernel.org>; Fri, 01 May 2026 02:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627118; x=1778231918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vg2B5QYgg71nEreyYDVlmpHAn8rPoh5lm0nWaDaj3E=;
        b=Owb5HHBaJ6Ent4NRFarh3IMFOcz7ExYc2HKLgWJAu6nts7VYl/xhyt1cAm15+tKHOR
         tkb5G6XmNDFYvp3qFzBPcsQhadAgv3Ka8RFxnJ9p+AXEg4PkBwTgD5loyft/8tGDAtCW
         wDmmFCezZCIIkZhj8Z34NboLXQpvhRWI18ZhYvsyVDFuE6+/bOdeqMZGaUTF5H/YCCfT
         9921MZQjU8mirMDauvOUHu23qzwWrJYQzSenoRaPIaTJYG7voR/EkKmxtFy68dFJdqZa
         Tm2hwnMnvDdDGqt9JkDYHt/XCHX+cRFBVaGiJtfHG8qc2SV47JN0dKKf5u2aNLNozjG4
         cwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627118; x=1778231918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3vg2B5QYgg71nEreyYDVlmpHAn8rPoh5lm0nWaDaj3E=;
        b=UcxJ/ZLPZpDo3zNqIvwhtZRvlGZSFWGzp74OKAZHMicPcHKbtkB+GaOFUWBSK8S0k+
         TPP3koj9OURSGFiiSlrhIS64Gnn+p0FCO8qDk0oRwRP2/WX07BIbAbdLfB40eaZ5Jb3F
         tJSKpjtX1Im5rlxhh/8A9xXmKpc6gw75/gjhgyE0eS47um+TqlNS+n5/5H+K0wMSFfM2
         OWXI38+6MxXKRvQhnd4wQReu2+DxXT7H4TBnC4XyuGQIsoy3L+Zv6V5DkJ9vi1SZ57NY
         PBxU/bE/UHy6SKB7habGVT6lCgqkruCLtXh5jykssQHoyZKJn5p47VdedxKtTs+fh096
         +JOQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fO0VOhGgIsvklfFXXxibMiDmXVeNTLFGx4jOX2bcqc5NXZYo85m1HDABYDS1DaYwZNPS0og1ie3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxImjYrtdlqxgM3b1l3ZmptF0v2Gg5uFgGkM6Wop7Wgr+THbfaK
	+dWcaXxe7QZgDGdhf+6CTPO9cE/bCh+db32nLH9yhn1e2VQwG+wTtpij1JzKwf6PNjs=
X-Gm-Gg: AeBDieucJe3uH5RSfO2C5B56J5d8IiAiivc+KADmVJLBHzU0yqTd0UdljqwE3VsjCCn
	mM9VxPPN2+Go382erPyrg4q+60mHCEVZHT5Gxt7Af3Xdjd0TvSK+foKQ6mH2WAxpfUFWGgSmuTz
	/6Sy3DHrKor3S/Wr6eSFOy7m4yR1jUJA09SKLaMYPHKCw2pyBUjfF8h90kyvYGMuvKq2v3xXsUp
	k/slob64CBeFKy/o6uAuCfphqLerevJzXyDHePdIboMVgaOBvR7jnCDvDIwQrMnB4lQxZ+81fTW
	xhReKtSMzSDmaCoK8LEouetrqiay/+jHsGACYJwN/AZeLg9215QE7CsiPUSqvU3dKqPL5AIcnsm
	73jvYNRoqkoNgzqYUpgx640YYaTw3whmrurCahHae4a3E5TkH3ZrFrNpPLa6qxC4KA2+/eRMGZ0
	JlEZH3R48EFTYr1KTr1iZsyK7+9v/JCT3RYtGlblRFL8oLQT0XznRPitWIv7pDMYKIS57ahD4DX
	aIcwfzK4vxC7R+zkmE=
X-Received: by 2002:a05:600c:4e0c:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48a8444a520mr106471165e9.9.1777627118033;
        Fri, 01 May 2026 02:18:38 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:30 +0200
Subject: [PATCH v2 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-2-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1631;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YmwJZh9JOI6WzIBDXZoUlM82ToEJjTRJKA1/rBWV68o=;
 b=g5Waz95YiXeLxPaliX00ixcxlQN9A2bYYjj5iIh3hpW01/05nrkK4yEIk0joIYOpy/N+7sWdY
 42tZiGQUEXLCi3azpu7zmtrWAclrnKX/jTmH3tbZOYbMDOWfVi3lQGE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document an interconnect path for camcc which needs to be enabled so
that the CAMSS_TOP_GDSC power domain can turn on successfully.

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
2.54.0

