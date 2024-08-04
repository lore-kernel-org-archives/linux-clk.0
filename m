Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054125624
	for <linux-clk@vger.kernel.org>; Sun,  4 Aug 2024 05:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750033; cv=none; b=Cny+DnGlV4Rk6/4/yEuv7MUI88Z8cpzBmmXWrL14F3HcCZVG/OdoTE/sWmzsZGk6DBlBsCZqiLnGzhm1brTrpBdedhOsIobabCMx76DjfKxGktLf6vx3QpOwkgmmEwmrRq9o698xfa9QetuVYXqal4aXDjtDzL8RuoH3NG3P4CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750033; c=relaxed/simple;
	bh=HqA05YSLsUf+ulIvMnFT+oPDyD4eqTz55YVfBO0RMbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abO5DOX8AtiPjuocsNDS5IUxab9goJQrhQjie7EDSPUpX3Id811CYorFFAldpFzl78fGPt3tyxc1XX7XBh8LurZm5z+VytUBVy/phqPS5ge7iLjzpzXgxMzGRNUL5+sXT/5gF8Sp10zT2K3Fvw2cXeIGhG9AmOvWcPBaZ3Dxtkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oLaVfb7R; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oLaVfb7R"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ef95ec938so11119491e87.3
        for <linux-clk@vger.kernel.org>; Sat, 03 Aug 2024 22:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722750030; x=1723354830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh5Pprq/CtcmFsRRpKtCskri/dUUv13iwNLegjB0jwk=;
        b=oLaVfb7RUWf6YQDPmxL6eUc+dnE1hZoZpmxqia8YkcdYS83ukL0wVflKo7uk3XyGIX
         jkDggZeVQ6YQ8Rq/7i2pvwdDlkLjZae+qP14hTxJqU0UhNx6giLEHJm87+bI0kukaHD9
         l3k2jnBF8mUubFeAUmZikjYWzV25F7XJ1SABOV2MhizX3fMb2mbY0Bldpp2hle8XKTgw
         NQ+kj5A8Tzr7M2DYe1oE/69T7kc69LQjmAlMlGWFjK+2ckHcDL5dDQnw7vlqyPWxr9RS
         tE/JGl6swQVPAOkxwhKEqol1MyVye1vumteq6+prwuMwK/5oqycUilFb/hsSoFcLu4rK
         Cfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750030; x=1723354830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kh5Pprq/CtcmFsRRpKtCskri/dUUv13iwNLegjB0jwk=;
        b=MbSyIzPfYIZGKf1ynGLoHkzqnRH7OaYVgp+VLFB/SOKTA5TsZlfNYfuxrF9BK2OwrT
         ap1zwCmv4qn9F5GW1URJbMih4nXiABVmKJ0m7x6N3tLHd1qzIOurLer3/L0aw32YMVpX
         Wyj/fisZFCdcrcIOzkZCMWb71h9lcDy7qKrmg0QMhX/nj2JJdzoAv9Kv/jDt4DF9JLtH
         /IVhl8DN/t/nkmHQOEuD0vB4Yi1XoXA/klPeTGUov3f70KkTnPga8+XRoPlbLwhF5uaJ
         k0pcYLbbPsd35eJ8PcV1E9H7fslfNYgmeQYS6Pa1TIXZfrgQsyk0e1oF2xoGT+0Cd1vg
         Umxw==
X-Forwarded-Encrypted: i=1; AJvYcCUxOdrl45pQUwnKjmB0xocOeDoLoJXng3ffuvXjrCbCWYq1YYKKi2xXT3/LXD3CURCDJBcQ2XbjY+8GC+SSByINnZ4Nb6Pdja6l
X-Gm-Message-State: AOJu0YwG/6TVSNjOyCpdUGGdIomzeAz5yZotnmOqIxFmxOTN3UQt8vRu
	UisYlYdqzcBozTcY34PoPrIWCTGczY1d3VT83bpSFVixwI1qWh+r2BHRlauqacI=
X-Google-Smtp-Source: AGHT+IF/r6ICPMs1cY1y1zDA4LrgDq2W/xE+84RLh2kTzHBB0v+PBdUhnePF0ZgzMXwDr3Q0aeg8mw==
X-Received: by 2002:a05:6512:3baa:b0:52c:ebd0:609 with SMTP id 2adb3069b0e04-530bb3929bcmr5449531e87.7.1722750029774;
        Sat, 03 Aug 2024 22:40:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 22:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:11 +0300
Subject: [PATCH 07/11] dt-bindings: interconnect: qcom,sm8450: drop DISP
 nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-7-1149dd8399fe@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HqA05YSLsUf+ulIvMnFT+oPDyD4eqTz55YVfBO0RMbk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrxQ/HTA5NQJ6LsRevJYj0C2Pr6D9xtPQQ+WCy
 eo51Z+HCpmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq8UPwAKCRCLPIo+Aiko
 1bLBB/48GQBxTDQT00TIgC7oHJTS/6Kx4lfz8o0zy4if5ZYZmMsCSpNneZE72T5mtXQXX6inZsq
 mV/awunxEK11ZNIGAHAPCaiVDR830NutY8xITX682fXqYHykCguNmUebqk0KR7h17TtOg/Y/g8H
 H+Sgmi9L7zerOshGe+/1TSEv1ANciFemqiE1ofIQ4BLHPnHOibBUnlwG5lVSgs7s0w5nhWImrg+
 JnPGJS9BBNDM2XZQJFlLJdPXYddO/qK6pZ8PG7qidYZTsEUgzRb/8dW6JnNkDaknIVDuKl1FYaY
 ub7CXnRYvPdnNBSrCBuL+/XQrahkCOFnPz7poUvL1Sq5NyL4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Vendor msm-5.x kernels declared duplicate indices for some of display
nodes to be used by separate display RSC and BCM voters. As it is not
clear how this separate BCM should be modelled upstream and the device
trees do not use these indices, drop them for now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/interconnect/qcom,sm8450.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/dt-bindings/interconnect/qcom,sm8450.h b/include/dt-bindings/interconnect/qcom,sm8450.h
index 8f3c5e1fb4c4..1fe7839d9f13 100644
--- a/include/dt-bindings/interconnect/qcom,sm8450.h
+++ b/include/dt-bindings/interconnect/qcom,sm8450.h
@@ -107,10 +107,6 @@
 #define SLAVE_GEM_NOC_CNOC			11
 #define SLAVE_LLCC				12
 #define SLAVE_MEM_NOC_PCIE_SNOC			13
-#define MASTER_MNOC_HF_MEM_NOC_DISP		14
-#define MASTER_MNOC_SF_MEM_NOC_DISP		15
-#define MASTER_ANOC_PCIE_GEM_NOC_DISP		16
-#define SLAVE_LLCC_DISP				17
 
 #define MASTER_CNOC_LPASS_AG_NOC		0
 #define MASTER_LPASS_PROC			1
@@ -124,8 +120,6 @@
 
 #define MASTER_LLCC				0
 #define SLAVE_EBI1				1
-#define MASTER_LLCC_DISP			2
-#define SLAVE_EBI1_DISP				3
 
 #define MASTER_CAMNOC_HF			0
 #define MASTER_CAMNOC_ICP			1
@@ -141,10 +135,6 @@
 #define SLAVE_MNOC_HF_MEM_NOC			11
 #define SLAVE_MNOC_SF_MEM_NOC			12
 #define SLAVE_SERVICE_MNOC			13
-#define MASTER_MDP_DISP				14
-#define MASTER_ROTATOR_DISP			15
-#define SLAVE_MNOC_HF_MEM_NOC_DISP		16
-#define SLAVE_MNOC_SF_MEM_NOC_DISP		17
 
 #define MASTER_CDSP_NOC_CFG			0
 #define MASTER_CDSP_PROC			1

-- 
2.39.2

