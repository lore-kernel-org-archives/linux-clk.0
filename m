Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3B194A45
	for <linux-clk@vger.kernel.org>; Wed,  5 Jun 2024 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575024; cv=none; b=Q2gwNX1yPx0zRqfrbYbNe4urdL1LTX/b1VXILn9hpSR5z1VO8R59dkPvdihBadu96EOc+WOblgPLg6US7opCfDgeDfI3zTmApXmbuXhKoJsS2JFMQBLNdCpmThi95nY0kwdPnCnUjaDqPPojsfmn+Qg5JUeo8mCHAuw3kkTjvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575024; c=relaxed/simple;
	bh=8LPNNAhZASQ4QIfd0VMEwttsn4FiJHQXSUFE8ol5dz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJofaPIKLYG0CPTUCPpgDnQybl4m8iPejlzl3jQf8NVIymht3zvc2VsX0/VsV2YRlD+eFk4zL6AHThFjjA0VeKLq6NcLRR79eboAwlaT/6De3QwmYleT62Kn0A3IHnq7Tdr3dvq8c9eH68GrZeqozqw7w0P9UgNWJQr+O1N4knw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeVNnI2Q; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeVNnI2Q"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaac465915so19568441fa.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2024 01:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575021; x=1718179821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1J1OouQbRI4hio4yzSRJvH607PbffaXVfBZE30FIZk=;
        b=AeVNnI2QnQd/UoyWKAJTVh6cZJnuc+SoAjiPc0Kfu+6NVYLqPH7lzOuISflo0pJwS7
         N7Hpwbur7ypbxP+kY2fRM61frt2bj5sdCIRXkv4+LPoGbBYIVFSGgUXlo3o28wXbs5bt
         oYCaFjb67MrJyxyj/h2ia+9jz2TOkS6j7+g3Hah0Q7Kw7VxbhRE8wSIjX8wrngD86poI
         Bu6fG8dlqac3T2YjUwDqaOfE2IxIs9R62cl1+8B53H+B4non6+8R933fhYl2vG8jtHTp
         yjIiy9qXnd5kS5qXrSeajnwNPaSRjnL2OW5588sghhwG1TsT9QQxzxkA1D9UHJrQrZ0k
         juig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575021; x=1718179821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1J1OouQbRI4hio4yzSRJvH607PbffaXVfBZE30FIZk=;
        b=qy0ycq1Roo51SLt61dlC2rNF0e+o6te55YBBvlyA8VCSqI2/BPucqm9jCa6rQyafc8
         ckgiK5WYcagrTYGLGl6/7ratU0pcRmyKqLpf7u0vS0td3vx0hMWfH+jl8KwLvx3Qnm0C
         oXh0ai+KOFgDbrqmEBwXvwFnQu9JkiWNzytlF80wfM9K0SlShm6LPIJOhZ/Lkp4Enf1N
         PsufssaLcTZj8CLmsYeOyptxRFWfdx7v/m0+/60FkITb1iHppyJnw29EmqOufuf0tnK6
         OwZ28vb/N5HvodoyvP2veUEzuo+p87oDoFUDxyw5PTNbnhzZTOwH2DFKOt4OiRWD12Cr
         +Y6A==
X-Forwarded-Encrypted: i=1; AJvYcCXGTpSnmOEAU2PUzHGN41Kw8qFhh06LJlk39VnMOzVg/dCYgPJbK4VXiKzQ2Y480v1RU9CHV8yTQhJ3KlTySasgHJoqu3/EOfMQ
X-Gm-Message-State: AOJu0YyaVsRcp67TNEQACE3zf8aZ3SDkemYoj+RN0gSrxnmWUfXz3llV
	QcH/iEcsnWguVS715ZBSfQZyV5gMvYnPSnsQPU/2Gc8qWXgjrReZSvdzIQ8x4ak=
X-Google-Smtp-Source: AGHT+IFv2LW5eKgHDia6hYdybMYpQhvs2hgQJGFLAEjfIGpuU3HU4na2p33DdInsAfZDmMZppLRX2g==
X-Received: by 2002:a2e:a173:0:b0:2e1:e33d:67f6 with SMTP id 38308e7fff4ca-2eac79e9d52mr8263971fa.28.1717575020839;
        Wed, 05 Jun 2024 01:10:20 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:40 +0200
Subject: [PATCH v2 13/16] dt-bindings: clock: qcom,sm6115-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-13-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8LPNNAhZASQ4QIfd0VMEwttsn4FiJHQXSUFE8ol5dz8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1TgeToKQCxIkYhgbEZjaxsjqJeNBqXZTPxC
 3MdRDhSrdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdUwAKCRDBN2bmhouD
 1wF7D/91mdFRpDbq1cMaqWXEge8WlWfMZxbItE45D4DWlAozCXPZ7plIn2fNc08fLSdBrPpUFiD
 xl0KcRksVurFuYd144Au6CO7S3Rct8rKT8oE6CRZ5RHUI/VGHU8LmbYxN5VwLUJf6KwCzXSMQxS
 V4Ul5N2e0WzhN6CLmJTJWo685MM+zMbctpQ4rTU+YCQVMcQZF6faZrFH/cit2/7kyrDitz+bH6g
 JcYGUta4MfhZrALh/T3meNhxsSvVmkMg3jAKI7GgRQgJeNz4GxwCl6dV7mOybhHuXOxrDHhIGm1
 pbzwwQA2fHj9afOzPJcEfaZbqQ6GCHqmR+bGNtpW3/5ZLD2eNxA+F4u7L+K2IPcgJ8BYjXNfP1V
 Wf1sPTxw/9rz8uRWDGrXKMUbRSf4JXhzrtC7pOTVKRCi4+ClVZOq1ItoW1b8oV1yBCeAQr24Wtm
 0U1C6v+6GlMsNGBxr7r3w7YUtb484i9pgCkzHcG6lnXC/R1mi8Ti1nLvuHibo+1VxdiQyteTMbw
 KXjtc/s/T85FsuNug+/7715fKzW9bJUU5VhMg+A1J09QVpgDvw2umuD2OaYNBWuO4wDpskoe7Iu
 tCs2B14ZzaFqGRWtABCCUE6+OwKOUV08XFxMuXfRDrxXUAf3iCSVqqpUWJaBoEraFiBr793RMaE
 biWRrybJVHaKJKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm6115-dispcc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm6115-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm6115-dispcc.yaml
index f802a2e7f818..00be36683eb5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm6115-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm6115-dispcc.yaml
@@ -28,27 +28,15 @@ properties:
       - description: Pixel clock from DSI PHY0
       - description: GPLL0 DISP DIV clock from GCC
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

