Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9491D5ADE
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957637; cv=none; b=i8D+mOYNteiIrdFi2MRxGf10yVN6NNADfSHedr/QpnPKc2TYqTK2zLOFO2WyE35sYtyumOEGOm18QX7bKJmzSzTjCz96cPDrEe3vLhfOetlgPxPPq9aE0eq6amFwGrkIIYor/1/dma7Ylo93fJtwjZFXI3vUF8qqz+HYuRn0v0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957637; c=relaxed/simple;
	bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJ0w98AAgC2qiTVhOQhXkABEaXeTOQLdskf2m0pBdXMD+/oIlzeLrYBwM5nmUFVCfatv4E6IgxFDkBNyRUPIClvAbK+s1M3Gr84beFVX9c5GJLxmsBC6YPLOXCHCh2/WD8m0YZbacxOB0Y3Zos6g74V2yEXRN5PvKnjQ42oSiUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AuOLzs60; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AuOLzs60"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so25966911fa.2
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 08:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957633; x=1730562433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=AuOLzs60EHC0XeFsuL0O6CVgX14Lq3aswegxNzAsB2kwnXOR5/xz7oe37Rn9WmXoNk
         9XB+4XVcuSwULNJMFeZlFyVG4vQacdC0gRSr5MAk8VqpfAEfP0vy1IHIYToPdvlZPkYS
         UGbEUR8OAEEAE5Plp41rvVvecx6ny2/DrkpqGLk8XPZA0mv/FFsK4OVu5ujsqP64V4Ye
         K4jbKPYKdh1655m6DYIvVH91HrKyS002XozPMrvYaHtMa8PlwwOA0SRyxnGaEjwmXBy5
         5yyYPle6fvko/0UFqpnH5OdicF+UCWvGwz0y3GVVYYD0hNjqHaLGGqvzbLSQyGl73YHe
         Vjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957633; x=1730562433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQiTcshw9Ox4It49mqmwWy0sWX4h7q2ja8AFVlIbjLQ=;
        b=c49phXaVBJYt9K9/4ColtYN8rZCXXXfokZe3bYDJ80lF3yS81v9W9oTD3APr3AFFbf
         m4ieAc65oiMt/nieV+Lsih6ZtHb6sLkR18Ht3vXjpSj+tQpSSekqe3XtiNP7eJyO9hlj
         LOa/ptiFC1dMtvUuc4Ak1uGADZ2CF2GedexznP8bEFugiBk7aYP2JwfZ70UeLjR3+ZMl
         MnlM3xADLdNAmvEovb++JRvTbfuPVuB3I3MevWjgioGJ+yYcS/iGeRna7zouP6R+t+rD
         Ik8NhfesLlKTtPQrJJiL6cjTI8ltU0bqN9tRVA3XTd76U5ypPJ/5+ThAPWNJTx2iXniC
         s//g==
X-Forwarded-Encrypted: i=1; AJvYcCX5IU4iwPTV9d4wTxmj9rwg7A1U8Cfvv0qlq4bYCzZz48++Se03/X2khU7ENCtOCqOSGFZrFyM+Dew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGh8hL2q66cYi0XEOYGErBoVgu/B5lsfnFkY4VHrJ18wLDALtx
	1biVeQYKdt6QZbjl8nQwyaaBZY0yGJoJ/bZzRwJbFgzkvnvsUR9Y9FvoNkrPQCQ=
X-Google-Smtp-Source: AGHT+IFM9o0y1CBVkiF5YjA2WA9nxw8S+6/mMEOtW2WbUFfcrAzGlP04lnVmJhLodAPMHBl4ebHu3A==
X-Received: by 2002:a05:6512:39c4:b0:539:ebb6:7b36 with SMTP id 2adb3069b0e04-53b348d893fmr954679e87.25.1729957633490;
        Sat, 26 Oct 2024 08:47:13 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7cf4sm532188e87.184.2024.10.26.08.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:47:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 18:47:02 +0300
Subject: [PATCH v4 04/11] dt-bindings: clock: qcom,sm8550-dispcc: Add
 SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-sar2130p-clocks-v4-4-37100d40fadc@linaro.org>
References: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
In-Reply-To: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1S0e8INDTJp4RQZO2xifYyW0FBrz3v2kT78lT89hhEk=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ72ToQpDJBXu4jZeiQUts+xrvJeVcM6Vwxpr
 +5GQzSbHm+JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0O9gAKCRAU23LtvoBl
 uHyGEACigZfBTkSpyzvogAr3GEUjpHulYnkQ2oXwYQ5XzAEuOFDtaeIILyllT7cC46/plKGzL8Y
 n/o8nxlfU3BLnccTWjRoR2doQMTN60g6mSxcELvvHQ2bM7j+0kn+y+9jLS3zS40mG5xCB++gT9q
 4Mh01P2lYXc5Z4JZTWD5amIsVLJZh/63iESX+ak/0++il815BWuAy4M47+KXOSv8GQsu4zkVxyH
 Foqi9IqmtO+CD8tmsJ1Qm2qtNTi5K8twanR5wfWPDjVDJWDAx1BDY2mDn8baLHfRAHb7ge42DHE
 l7DaeQdqgdWl6wcjWjp6fCa72FQHxA4wB3x7HZw2XP+C/dC4Mpuck8DcMeJVEu+4vPq+GcE2AKh
 DzFibhS1l4cTnV/1LMV7lD+r6HOZcOl/4Rxa5Uh5GxJR1Nk4PCN5tTRV/EeknsgLP2bKQcJqM4M
 dc/J5wqisoLcI+TN1x2TO/rqCYCyuYhig15duUfCeqVAsnudvRgN44psjGe7UCUxzDyo3tv3swu
 OZ7s5lQm0iU9G6Mm5aTsBxvGk+b/PjVZq0KYEp6Vx+ASBoU7mjN8emtDo7GhtXSeLx2+sy4pJ9D
 APGH3CyL87fG/mjp1dClgW5N/SdBAe/XQBz7RIqt13H2QVNQuRd/y9vV96Hq22H47R3Qq654qQb
 hDIlBljWLJTJmTQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Display Clock Controller on SAR2130P
platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c17035a180dbf3dde715a281bc54165122739618..c57d55a9293c214c4c101902cdd9603074e2243d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -22,6 +22,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
       - qcom,x1e80100-dispcc

-- 
2.39.5

