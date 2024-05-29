Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04ED15AAD3
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994027; cv=none; b=ldZ1gW5ZDacX/r7WyOCX3XhiVbexHLAQ6ln2f2uxbkAuihjErPNgx3cxcwGkQE1hYVS9rbcZt7eV0OzL3bjizJAfV7RbNNDn20yJ6GkyFguLxfVObgwmGW9S9VVpU/XetrJPXkCjBE1lS3+AV1xq5JhSG/Ro1k7Ny807ykj7OKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994027; c=relaxed/simple;
	bh=XJAR3RhvR6FBsC5FKjrD7WCfWMohl/ns3r5JO/+tsoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwWX5lPqNN6+nx9G4gRTdb084usySo5VRaoJ2hCjGih3wnbbsYzxS6m9gc4p8a/xQkuiWjOSwvV39pqmUleTtHSrC4OQI6R4ncYEA6LMXGBhNB9LUov1FyIoMZZYdbsEs0onUJSMyaE2q+3srJd3/m0LyBnvmIhXu7Yg//q3Q8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BkGnpRsz; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BkGnpRsz"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ea80a18094so590341fa.0
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994024; x=1717598824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49pWMHhYwMB+iC4CjWOPr/9ggjWLiI5cpTwzEc3Odls=;
        b=BkGnpRsz9WTtlnrPn1r8ce1Rj5YLx57JM+oyFad3mSa0mCkFz1JBvpssU1XiX2mQXj
         uI/To0mhmtKOaXHM4isj4wMneCeS2KI05BSqkLyNKroV/cdWzXuSkAKr28dJGtCXW+zL
         CbmAPrxF3TWd+sPeUNfkhk/V325qixFbYEcjgXrmO4cuVKUdfKOplZ2XgZd3PetqX7QP
         hSCtFgr8wGV+8FEdx6wf4LJt47ia3vGUmkwgy8ghtpAffN6p4opS0EdWVj6z3HrQ2RQb
         r+sI7Lr8iK1ZJR0hw+Iat4eQsvLfNvayImx+FasigqNNr5qZWdmo3hBtvTMGcJ2S3bwk
         bOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994024; x=1717598824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49pWMHhYwMB+iC4CjWOPr/9ggjWLiI5cpTwzEc3Odls=;
        b=X5lr+hEodS9YIBAGuZSiFE2RLuxVEVF8PiLjUz68EVITU6gDR0dcUHqSBMQbXG7MPJ
         vESMnq6aamSM0EJV79skucWtZdaxwTG0I+CKWVQnEB/cbpvZwjNzUHZ+yc/BH8/WF5HV
         nIq1pzSaD2knlyIVAUQttTdqq3fVjVJYU8EhWleU9KdILxfK0VpaJ1bFAB70Z+ddTXGo
         azBF/65eW4a8n1s2URclicstrMJ/OWEIKEPi2v6R5qlq7RpusnogzFegp8QITC9TM96o
         iW2la4gPhfVgrO1txyoEM1dKa8K/IWIHUMWEsPGaJC87M/TYiD8vPM7ue+khnXi1F6GZ
         eitg==
X-Forwarded-Encrypted: i=1; AJvYcCXCdiCYbUaqpcopdRuwUUhBDDaa3ZtpOWaAGRFD3L3Jw8pKKjYE9e8UZfNi1g7x6toFIeEtjdn9Yuc8ToabnlQGNdRD1y+gz+K6
X-Gm-Message-State: AOJu0Yx+0txm598QGSIh4TWjglg0GgXjUthA8SqXucEy8F0Xo7EgeXfE
	ZoTLw7hLYn+CjXHU+sh4eb0Pvn4lmbnsRG5tl1jv8/L8MM2n2t02Awkeu8gEeT4=
X-Google-Smtp-Source: AGHT+IF5SnXtXtXt1O5TqHCktvP8TguUoxRFp3Ni6lxYEl+ZuzpUW0el3VzT6go9yPQFrs2YHD+DSQ==
X-Received: by 2002:a2e:8854:0:b0:2e9:5342:628f with SMTP id 38308e7fff4ca-2ea4c87396emr7659471fa.16.1716994023965;
        Wed, 29 May 2024 07:47:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:46:59 +0300
Subject: [PATCH v2 01/14] dt-bindings: clock: qcom,gcc-other: rename to
 qcom,mdm-mdm9607
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-1-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XJAR3RhvR6FBsC5FKjrD7WCfWMohl/ns3r5JO/+tsoQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/kn/rVhKP/nSfnxh7HbhW6UrixRpuSxntJE
 vrqc8YRV/OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5AAKCRCLPIo+Aiko
 1cl2B/9JiJiHKmCt/kp2lc1Bs2Aj198PlJeFrJFQRKGYVfiuJGiXG3SRFp5GScaGofluy5AYMuh
 TL2t/QwGkPjENIJ3VgpMmQuxKe94gTcrMS8JmBDdyfadRp1WzfMgjJPyf94SzDqjhYryv7FvvGi
 OK4huUdszexdL/AX+AjsWpz4PRLKoXz8DwdQt/1gj6MNBYTd8BRqFLWsfLENFTERDfGIZc/ugTh
 LaLwcKoGaCzrh/5kwCfkcGdEfLY+WnPamlodKiidwhBLNg9rfZsFvaAc3PIC8aYyR7CDs8kZ894
 ppjyoyPVeqQ6dVQ+ooG6EqMbtUCVty6X9Fwx0G8urberEgb3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The only platform remaining in qcom,gcc-other.yaml is MDM9607. Drop the
stale mentioning of gcc-msm8953.h include and rename the schema file
accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/{qcom,gcc-other.yaml => qcom,gcc-mdm9607.yaml}      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
similarity index 87%
rename from Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
rename to Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
index 7d05f0f63cef..1264f3d55761 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9607.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,gcc-other.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9607.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Global Clock & Reset Controller
@@ -15,7 +15,6 @@ description: |
   domains.
 
   See also::
-    include/dt-bindings/clock/qcom,gcc-msm8953.h
     include/dt-bindings/clock/qcom,gcc-mdm9607.h
 
 allOf:

-- 
2.39.2

