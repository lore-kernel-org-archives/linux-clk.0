Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AC647B40D
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254816; cv=none; b=OEIkCQlYcSWRAWWuIhgAKS4/abQia1HTaM90l12jiBW5FvzOsRsB6Gwe2g92TdnmAvwG/mQmlLk8me4kRSB07yBpI07XCDywMN5clHbvCftEwIsTDMaTrodTghhRtIgqaNqKmPR9ImGGWhhniRtUkUt2nlH0Xn55lj73AH17tZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254816; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQ7prXZ7/vSXY/Hn6v5SmM0ETVgHpgVfLfdHiDLRd4RNamE0xjVndNnIfC98U63eF7ppRORC4/ZVEJ2VGw9gLo4JeJJmCHMfGkeXERe5DakJHY82lA4oF2iJRCiCaSwY6FFqGKw9ybFNXFDes6HmX9JWFgBEqXGFMT/kDaBFmDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHygRcta; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHygRcta"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so4643919a91.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254813; x=1788859613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=ZHygRctaRJM9pKRw+nbcSMGefPFY3imiqe0JEWjuiKrrg8Icfp/wIe0Cjx4RDsbaBP
         p0FofFX9y9KNCdLSSo/mCX8FqD7yp99OWSDCqp6ZCZyltbIZC2UeJmSx98WRQntb/dGY
         EI//esvub1DXMlwgcanmgiWp93BpjQtx7hlDZ0N577eWOqRNqoquCNiyy23JDThiLUL6
         dPPXZUyz08/VfIr1CzJctokv34hl8zSE+qJWIfdA25qcxxPVEj9SUlACQMgE/z/DRrY7
         Xnpt3+d81ZJE/9Bi+cVuZLoSmoL1dw9dKIN5a4p/86k4S4CZiLa93g6ufBDxHsJVg6H9
         iUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254813; x=1788859613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=DNxFXmR+CBwlSq2hNmkFkGtZZZODiGTtIv3WEcBUTXLPgPvu42nZSCdNGhIuhTQ2sN
         2ipp61cEUhLYikmj42CX7ePwC7LLYjcFyi7Ij/fA6tiLY7NBH8leuCilP0o4SGZqg2Pr
         jiEevpRP3Y7MKtl4FaUgtUJNOuaxW+ZjrlDdAUXRbJLUOm4IsEnt68dI8ZnhPUq7Jd9b
         DOFUw+d7fJ/6GU2E06REPRBMRUa0eYOXJbVXmg9uScKgpUhgeSmvTXRuv+2yXQ2VTbIa
         eXBHCSIsBqu7O9MrJfy7P0SWE9p75rf//EsJLzjU0pnPoP2DcTHM3iqgD+H+gw3oPWq5
         R/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxktflf1L0+2ZRqvUV8Wzh19M7ls+6Rm1kQVmyi7PmF3MiCXji/GekE9n30P4zyfSH1Ohses2pAQtc=@vger.kernel.org
X-Gm-Message-State: AFuF++m/E+XiVHaeY4I7Aspf/j1KT5gJs687CI3WXEDnP8+g/gOHkOl2
	DIz1TFWa4LbdNal0MNagltZ/BkG8BwLYp1wIpXk07cTzWF+sJnZbkyJy
X-Gm-Gg: AYBFou1mZFv7KOzNLlbSS+d9+DIDYth3AWpRiZXRLgaKbjN8a7XnZrMGHsjCIG46Mq+
	SBCeF4sFBU5SZH79ZscbkNjnCLl1w8kiobXbdXV5UPxsFolETwacwSc022XwTIH+LpqZbjaMEWf
	woyUe//GgQkfm3w725Bw6sEUyhAK0Pf75b9Byo7oQC5PfaTkjRhbubjtXq4yQn2GYAi1mVu1QaG
	2y61SCTe5t/Jg+pxDJuGSf1OMNjKSrZu8yGv/o3mNGE4NMUeKtLARv01n2mrpxIw00sTjb64xjf
	4rBRoQHhVonFUGkyGpPmBEUMYcxZJ7syjkh16GFbtcrttWo04MZtBo8vRZ557v0T4/PLT0zLKtQ
	awjbWTksXvwi21cQdwUagsr6BOBrGPjUt7365Zdygud6NgqabXhgONiiCnSI8lfZcK7qSiwIKje
	ZxdA7Vtpnj6+HV6W+GNkoAgOVLsjd+XPb/MMSiHS2UQ1uShl+m3I9axOdAGw/YfXsjPqgPh2fMo
	Uca8a0ifC/4
X-Received: by 2002:a17:90b:4ac9:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39907aff7acmr8439695a91.2.1788254813186;
        Tue, 01 Sep 2026 02:26:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:52 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 10/12] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Tue,  1 Sep 2026 09:24:45 +0000
Message-ID: <20260901092447.3028-11-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

