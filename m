Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC7417F514
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 13:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163587; cv=none; b=tLU3HZy4gBtHZcQipdiT5GVcmGfd1fc3fj+LTx07uW064hhB28ygR7YHiyH6LO8U984MtcRt61OCTcoTAO+/62y9ciIMIwqmdVsJxfzWPQ++xMw82xrxOlminIsSC3PJf0fXiNAbr3EEDfQjVgZp9jf4TIgN/GTGP/23c2tRRb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163587; c=relaxed/simple;
	bh=a3nkquIZAm40X7UDSijQ6XrUV8CJyLgnduP72STm2fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzm3Qb1k15R1hKJxiAVv2Ka7rEoUdOkfV324xRzTxepOwJ7aAAazItQl+z3mLHcdzseuBoYyWwgOfAdzbwN3Hvgcsi1Z5LOWb/hnhRNgqDFAZw4sbWXkFtqmbJGuIUWaF/qobRTnq4ciOuSe8syf141niREJsP83xsoRHdy8JU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TqREZSQd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TqREZSQd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42101a2ac2cso10502615e9.0
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 06:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163584; x=1717768384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bj22JrOnCdnGkODtMpzRDOSnPS87N7HbJkievoZB3w=;
        b=TqREZSQdrPYlqWpfspqg3zNuffU5Pq7IZDlcObH1ApT1WNFNxAEyF82FK6Q7eMZAmQ
         0VoaNscfz2OtK4MnpB06xZBSSLGOz/Lqi7tqrgP1A24Ikul43CWytmkhho/P3TJEuhWp
         thulBk8V9S1gcuoNiiGP0d5Kjj+mFAkuIK2xeYi/GATRrFFoLDs/5eYX+hzXHhrUgATp
         Gom1GJ1/yy4MlSYrt+LB7S1UtHOoetBqrrD0P5uPeXI9MCPgL5HhJgamihtnfSCadW1Y
         XpzH2VSBC1r0ctGOECI/nGJ4kGWuMBNXdzrXBggy4jB2Ig2GGNswr0O/PGqFmjkxOTg7
         /Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163584; x=1717768384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bj22JrOnCdnGkODtMpzRDOSnPS87N7HbJkievoZB3w=;
        b=tNjUr+nLdPy7kv4Zcksm/unnvLtJNHZahzWTuKTlJm7QGhLjTUHHySOUGnr0L30kax
         fuzrxDjd6n1BGT2gdYKYKDbG/+QjbB94lrTM/1fWx6Ue4krW3I52gVwJPgkIO7ssouoq
         lWhdjx+NYWCYdxuzZ5E2y8Ei4jlx2ubH1snsVWLj6n2bg62SavtB0ubFh4w/Q1P+DDfK
         eMHtOM/8+WAjLyoPz38ajpLSwcYd+kmQKyYKNr17gT7oSqmS7uvLAwOn2glzdzGd+4xL
         EZkdvTVW/dP34Qecuc93r5gwtNppzF+maWy1zZsCVxNcfd4m88oNxmSdkkuxUb8ijChT
         fp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoUNNrMgCflQviaYUoKrH9bGVIdaoOohonLyxEfSJGl25Ty074oZRat2nxmqSY82nCCCijdmFnUCJJD8nyX8eC9iq6o0OglkQb
X-Gm-Message-State: AOJu0YyUNGlKZAV6OQrGYxqp1MteHdv/NqpiIPvfKFsP34mnP+rllPA+
	1yw3OzXlchFcrkAoXmAODxbwxqtTPt04g6H+FOpkl04r8bc4p0+5sPfPguhdRTk=
X-Google-Smtp-Source: AGHT+IFkCT/EKJa/5F/9lJasokBUiOUQnSYtMv9keliTt8A5deI+h2o5cnpOEViqmf9aqVw4kU4CYw==
X-Received: by 2002:a05:600c:5254:b0:420:1db0:53c1 with SMTP id 5b1f17b1804b1-4212e0d3f13mr14180435e9.41.1717163584031;
        Fri, 31 May 2024 06:53:04 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:53:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:30 +0200
Subject: [PATCH 12/16] dt-bindings: clock: qcom,sdm845-dispcc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-12-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=a3nkquIZAm40X7UDSijQ6XrUV8CJyLgnduP72STm2fE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYhWRVPziUKMDji4XXqawmnVnzfA/zp9B12F
 u4FF6jTK0OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWIQAKCRDBN2bmhouD
 19HYD/9WP+/1E/zQ1lat3JD1ORhlMFyQtKDlAauw4JHHGXuBnG9COSb82lH6HhnO0/RsfSx8FJO
 6ixFEOGtFCtMkSOfil/dOTqA58qJc3xEFfvWkz/X2QDHaZj/2kygRyCxcFsE7N1RkBwgit/VIKb
 AY6sEZRV158fCHaz3H18n/5RrMErUNcHPRzsoyV4fOihvvsGvnJ21NuTwE3SO5VCZtjEHm+Oki8
 ZQrbUNsu4MQYvlYilOLbNenIuwwyryR13BPU6bw6Xf2REecEk0I3AlZN8MsDYyCDWStVkS+T7N2
 fGHRJi+V2f9tN5WoJbCLWjoo8GMo/jNLFd8omXJVR27y+kydKO1r0HvRAWDl5eSm5uwzAvt3/cx
 /Aaa7zAVg8DmlLt3KDIWKZsC9iCna0/jeN92E7K+2G82Elm2jOib/T8r3bAJDbBfbQCsZ/bFQhc
 5lA2WZbW/MdVZoFSq9JFJrjO6xqrjyvVT7EBA0RfpAdpXmZj6kKFjK49pXO+dMSCD4S7EYDVO1e
 r8p2I7oW5YApE1AnejIoOsU/AvA7dadOXb+al6auaw/DwE8aL/zduZa8FTrmHqwbxmPawYqU/bS
 xS7A/+ctohRpZgxF5lymWC7S4eMYhR/gsVXdRXp3qXzVDi7fWLoK6H+ou///O/18a+nxq2qbF6P
 4Sz7+fIopGcBoSw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SDM845 Display clock controller
is also some variant of standard Qualcomm GCC, so reference common
qcom,gcc.yaml schema to simplify the binding and unify it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sdm845-dispcc.yaml           | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
index 719844d7ea11..220f4004f7fd 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
@@ -46,28 +46,16 @@ properties:
       - const: dp_link_clk_divsel_ten
       - const: dp_vco_divided_clk_src_mux
 
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
   - clock-names
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

