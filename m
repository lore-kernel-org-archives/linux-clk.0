Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CE156864
	for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433144; cv=none; b=OA8RRA1ONm7m6rWITmVvkwcmOc5mI+PoCWwEOPbOPaLLaxKi9qq+8a6lpPYiETQW0zFvu2JPVD6onNl00JaqpV8afOQehov6RgjbyQaVyIfjAUiqYYG2vpG31MYPKRgVRhrA4Inn+l4kSxnRRaGRbPTX2eiz9hK1IBvSr2pRdvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433144; c=relaxed/simple;
	bh=0A1LQywnK3IEs/dJCQF/pjVGz9ROfKsL66sFCOAtKr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NozjPS2qQtDzJLUPtlUvQYT41V/UHevOqHrRhB71MkrEv9fMFDqDQBdOK3yc+JPBWhy2EFxM/kyHJG5RbcHmmoFrFTLTxqx1tILmaBHoDTpxiA8uanyxjsNuqYZ30jZrQNa23qMtYw4lXoqLdb8/zbAeVZL/72s9pG8xBf4rMZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hvmdSrbV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvmdSrbV"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356a0a56f4so304900e87.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433140; x=1728037940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3x4RQzAfiGs4G4EtS1NlPhVbjDckiadnHMOCI+hhBk=;
        b=hvmdSrbVavR/D5Uwn05ChnzyKCDsJJt1rxFYy8LSJ39KJtPq17IMFU2O3FTnO81+Kz
         7lhVOFKaghfp5uHRX4soDoZ4W3jX2ttlyiHJ19oxaVbnIugefegC85vXF0vw9kcdlv6c
         hNI33AKZTpGmuj1cJ5R0bm0UeC/MXoAvuHKlafhWTjlTQ8CqxS//AcDgeVRDXOt+bIpu
         wyFJaamSP1HSviCd4Vzl70rnFjQXVACOP1l5lPOFQ8nfVwvoCEtBLCW7MV19HgCjI4OJ
         zng1cfAGED1I/D5RfC2rU2FN5dhmQe+5sxxaIkbwoxZswFARcdnDGDxfIEToOhhRl1yy
         WBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433140; x=1728037940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3x4RQzAfiGs4G4EtS1NlPhVbjDckiadnHMOCI+hhBk=;
        b=sqn4eBavDaTi1bgRWdYvPfr2uQ3PvuLAG+itLcuzxTckwf2LQdgwkkyl23mA5W6gQ1
         XoaQ1FcH+5QURkN2Lrj9NUa4Js1UUEYVJpqq7rhZxAGjKajo9BobMra3uZvZprcIOptp
         q0ZlmZckbRQlblhwUQHFbiGr5/39797HXYOnzTVfaJaWHyqWPNZYtCjBRemE49cc3MWI
         x9g+Nk9Qlk0esECcrwzpzqtq1YPFamlUnvSp7VFdFsxmCfojdFbN5phSYeIHOnA66sfk
         mhUy/Gz7F7O9gpzU3KfMPi+8hdot96bVSIPqyPGEzSbGao9ESlQPywNQIi6cEYpeM67e
         fkwg==
X-Forwarded-Encrypted: i=1; AJvYcCX2BPRQiDvMa3I8PMisQiKIoQY4BcMs9m28IlFTwsgTcPAvLN7bvKxTfFSjmJpqniYB+CC9m0al7yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YztwVSKb7BIqzGrFLuNENP4KGY3RF14kEnFClrLr9ItDL5p2Vuy
	CqZ6jR0SzqusW3feRmvoFKbjECWb1vAd8rELI/FJnRP/zOXJPxdXpfGFOEa54lRAaIv8AJXvNZe
	GGz8=
X-Google-Smtp-Source: AGHT+IEv9j6EshoAauBGgGokdQ8POVQu/cEHbHUPQhJmCoBBGkI2ZoztPJMY+IG05HKEcAcaQgtUVg==
X-Received: by 2002:a05:651c:516:b0:2ef:27fa:1fc4 with SMTP id 38308e7fff4ca-2f9d3e37874mr5383221fa.1.1727433140345;
        Fri, 27 Sep 2024 03:32:20 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e333sm259724e87.76.2024.09.27.03.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:32:18 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: clock: qcom,sm8450-camcc: generalize title and description
Date: Fri, 27 Sep 2024 13:32:12 +0300
Message-ID: <20240927103212.4154273-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
References: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the qcom,sm8450-camcc.yaml IP documentation serves as
a description of camera clock controllers of Qualcomm SC8280xp, SM8450,
SM8550, SM8650 and X1E80100 SoCs, and there is a room for more
controllers to be supported by this device tree bindings documentation
in future.

Generalize the title and description in the documentation file similarly
to a number of other Qualcomm clock controller documentation files.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 9ef967523987..11febb5937f3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Camera Clock & Reset Controller on SM8450
+title: Qualcomm Camera Clock & Reset Controller
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -12,7 +12,7 @@ maintainers:
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
-  domains on SM8450.
+  domains on Qualcomm SoCs.
 
   See also:
     include/dt-bindings/clock/qcom,sc8280xp-camcc.h
-- 
2.45.2

