Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097871CD15
	for <linux-clk@vger.kernel.org>; Sun,  4 Aug 2024 05:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750031; cv=none; b=SGNe6/G9AUi5ZPly/TGexG+cbrTnxtaARcZGSNR36I7bwd9XXaB8XG73lSNB5vM2JMvGfYPbPYVp+7mPWd4uP38mI6Wx4z9oMeKe+GIzr/BQEPHXAmWjCuR53xbn9A/oziKJzi5/EsxGH8HitnwlabPPTGRb0Du9CXy8fyEKpM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750031; c=relaxed/simple;
	bh=6M151A/97deCg4Tzy6kbdcdNo2uWiEunw9WlWKXXE4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYiFVarAhk50f+gAC1DLCMBh3/K0K1S4D0PpMOLoWKY87vtoV6hw7QrzwUZ+Ggzvj5xwe+POV1zsW7vHkSzs/uVs4I16sdjXl6PnIBouziWXzsC1mGvSevLAL5MGBvpiArT4A+H6ZCnBL5aeX5FqYThGBxj9SxFHNU1rjlp2JP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EaaUbXZP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EaaUbXZP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso148031231fa.1
        for <linux-clk@vger.kernel.org>; Sat, 03 Aug 2024 22:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722750028; x=1723354828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/cm1jjd1/iMw8x+MPa4aHpCJxIMLcu4Yu6VZJrkd+4=;
        b=EaaUbXZPMZBJsut7Ji/ZgKF66ShKG1B01Hy1HPgZiaR9u454YJRQTlX9cUlGlxloOo
         0ZuU6Q5JgKvBtExl90n/YZii9YMLkzKvNLAdd44Ck4TRVNV+3Rm32EeyswUmu0/fOEPq
         edYCrXtFHgj/NdmYp+vWKvQlTwdsN8IS+htrxZs7nleA6MLPEh2cps3d0PxRUgoWtcKZ
         DojXAFsMzVnqYGgXCEuADUjE5qhDwjFmqkiyDpROxamitAMujcjPNFWgp4SY30F6k2Qh
         5q+17f6D/bzgWWBq15q2aNxtSosS5LlpTak6B8iwNSx+F9Aux6Eq+TXYnG9rsLqlxh19
         fHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750028; x=1723354828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/cm1jjd1/iMw8x+MPa4aHpCJxIMLcu4Yu6VZJrkd+4=;
        b=PvhHTN8trYDnz0ky5EWwGSU+ti2U/WqHUiboCuDLQ/Au7HrJNYQTngZojehyIN74P4
         DIoP4Zy62uKqXDca8SPB8dqm7t6kueL3jN8ozTNjyOpg12UdXGFfvHMvzpcc73vSJDGU
         sB294GNtZuZ5HRb/6jePwcVk2omUr95gEVwAjnVtYgUrk+5rOqCqQ+b6LTKhYA01Hwfb
         SPiXyNk4R21ouisCtJS/GZJjKgzx8AAi6zL435JEf8YA/nqv1lGd1wBZHQk9GNkP5f1n
         z0H9rhvASUtnYGZrzphbVQxSdBbzTsGWCwJ0tounp55Phore8eV89jc0pcNHM2D7WeHR
         lI1A==
X-Forwarded-Encrypted: i=1; AJvYcCU3BMi3aAanElZv3RRIMytuxm4Slq1CqZYXThXoHda0g79DatWWQbv0lHHyvW4Dvkbm52uIWdDmxSF74splkTpd2MPw/5iX5PXL
X-Gm-Message-State: AOJu0YwhsR1RW+BWEpYXM2sVd2eOXWfFf+LNljuzFVf9d0XSLe0/XpLZ
	5lnHFlOqO5Cr26itFDTmuRQPiLWzh45X1vQO/dcxPiV20JdYw7jNg3qQf2w4x5I=
X-Google-Smtp-Source: AGHT+IE6GCHKaYeu075bskYasZyEb1ipCnNJJfXpONn3eXOF68PSgyACnVQniJRme2MpKU/LdTcexg==
X-Received: by 2002:a05:6512:eaa:b0:52e:be1f:bf8b with SMTP id 2adb3069b0e04-530bb3d42b1mr5422436e87.47.1722750028079;
        Sat, 03 Aug 2024 22:40:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 22:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:10 +0300
Subject: [PATCH 06/11] dt-bindings: interconnect: qcom,sm8350: drop DISP
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-6-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6M151A/97deCg4Tzy6kbdcdNo2uWiEunw9WlWKXXE4A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/a5ai99IBr5oLB8ihNDDVEDnC6eztQD2HB
 FkuS5H6ISyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1ViwB/9juYoqen35TB+9r5HLnBBlnG536bV8RJOZZNMkwuu/waZjRhGhQ2VDNJczXk5zaGvPOvG
 drisN5/S9gg+LmPxTOxmaCZv1CQWFlrokspmyhOPC+aAksf2Qo2dmfMbTMsGQDYVBKrWtiCsame
 0gWlHLYx878V+EPtrF/d0XvSJznPWW74EKe90xRKbd5McrDXSsEwIhimLUZH/ZbhbZ+E+LmbGdB
 MagDA5tAYUGDxowGRVXnmmW87XayUf1XbWy6FJqt0XyWJJjHVm6R6ZISzAKPHVNF/95idOh10ON
 v68ACSaDApfvmxV2mBKHgVWLDfKCncRi2s4pDsve1YZjiwDV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Vendor msm-5.x kernels declared duplicate indices for some of display
nodes to be used by separate display RSC and BCM voters. As it is not
clear how this separate BCM should be modelled upstream and the device
trees do not use these indices, drop them for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/interconnect/qcom,sm8350.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/dt-bindings/interconnect/qcom,sm8350.h b/include/dt-bindings/interconnect/qcom,sm8350.h
index c7f7ed315aeb..2282f93607bc 100644
--- a/include/dt-bindings/interconnect/qcom,sm8350.h
+++ b/include/dt-bindings/interconnect/qcom,sm8350.h
@@ -119,9 +119,6 @@
 #define SLAVE_SERVICE_GEM_NOC_1		16
 #define SLAVE_SERVICE_GEM_NOC_2		17
 #define SLAVE_SERVICE_GEM_NOC		18
-#define MASTER_MNOC_HF_MEM_NOC_DISP	19
-#define MASTER_MNOC_SF_MEM_NOC_DISP	20
-#define SLAVE_LLCC_DISP			21
 
 #define MASTER_CNOC_LPASS_AG_NOC	0
 #define SLAVE_LPASS_CORE_CFG		1
@@ -133,8 +130,6 @@
 
 #define MASTER_LLCC			0
 #define SLAVE_EBI1			1
-#define MASTER_LLCC_DISP		2
-#define SLAVE_EBI1_DISP			3
 
 #define MASTER_CAMNOC_HF		0
 #define MASTER_CAMNOC_ICP		1
@@ -149,11 +144,6 @@
 #define SLAVE_MNOC_HF_MEM_NOC		10
 #define SLAVE_MNOC_SF_MEM_NOC		11
 #define SLAVE_SERVICE_MNOC		12
-#define MASTER_MDP0_DISP		13
-#define MASTER_MDP1_DISP		14
-#define MASTER_ROTATOR_DISP		15
-#define SLAVE_MNOC_HF_MEM_NOC_DISP	16
-#define SLAVE_MNOC_SF_MEM_NOC_DISP	17
 
 #define MASTER_CDSP_NOC_CFG		0
 #define MASTER_CDSP_PROC		1

-- 
2.39.2

