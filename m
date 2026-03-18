Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB839B488
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832137; cv=none; b=fef7Z//xnucqOoVURKULPqBapL39R0NIpolhENA5aOn/8RNwsYuLHo8rSkuNsE834zd730YgxyMyVj3OcVRZDXLw5EXiBJeHs2FuJJOpWQxDyg9zmNxxrlqlYdlXN8MI+dqef1ORqkQicO945ZKhRxVhUXrhbeIiErLZN24BjF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832137; c=relaxed/simple;
	bh=rwJ0s/faRqzjl1Gjd8c7YLwvyl8TT+CqHt9K4WZTzss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZhZfvp1vTRZ77FldeO/6DGE/aegbzWV4C4Ts6qbr9Mn9xDOC1dZSgRZTrlrF4pkNEesNmV21EnuelO+pMXXDt7mjT1TCsjDETxvMT3DPPBqtcXzQ0yNWW0kjasePuWH3FgIsZz/Yokw4a+ZdTDPdgOu9EsnXPt2puN952gMVkTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPbHMay0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqrtL00u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPbHMay0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqrtL00u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I76eb32612717
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=; b=fPbHMay0Jir2ng62
	tdJZNm1JE8iGWPoNZl07UqAih8B9Q/6vNEOzw0JFfqoZJd2lFpVWHTN/1yJ+7iGf
	eiJWMCIvhKWf5wwT6CLNhEnifTHmDJLi2h0xcxkr0+zZ4BVufUPYo+p3pdPMnqYy
	BfomCmvFtt20ENF3AvtgPr49PuT+KgbS3EF5w/R9ahYrULKvaca2m0zcKTqAjFne
	1xCcmRXHafS/wGZADMYPJLSWDBxrW8ukXkB++e/5DtY64gfXnHEpLigyKOZL1Rvt
	6u/adY7Dh37SVAGGpRybB3Nz1thMgVlj712OI3zEIbuYnFs1e2xreHMmQmp9n2gO
	ue4khw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcds0ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509114d7418so17349031cf.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832134; x=1774436934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
        b=GqrtL00uSvhRZMS753aDKre8QOvKqFIUC7fN+7fFGw7BPMB2/iGKBJuoxQlifjYW3G
         sEWUKsKpsnM5j6NFNPAV1XaTKmnLi9gPEjiQ2Fta+e3gYJaRx22ujYcgMtJhK5FGz4iB
         dYCzQsHJAUxTodLj5gfejhvPEk7CS/Q4mFndDAqKn2+obw4FePwAwkmJxketTwxK9DYh
         o/fSZIfhTaY6rgY5Hp93sqq+ybzkcLt68Xwj7lhbRvYYGVRCGPrRGWk5cgawakwMZ28f
         NLSgp+u9Dqt6dorC6F6Cj1AARYg0TvSTyGYbr5qQggkxVOUzUGhPPTmAahqhbimtykWt
         ujYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832134; x=1774436934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brkBtSGLCz567cyJaMhUFUxm/AcccgNYRIMrR63I6Wo=;
        b=l6gsUIzI+eJ3lGoERHX9hMhz8knOCoMRUmOmK4q/qUI8yjSmmzKeAevjtvv3mHPp3s
         cojcQPVpr/tzqlF1V5JGvoXGnHuWMBYzn0w9khHfN5k+LXuebyJMc+g2RD7WPY9u61wf
         Dc7STJc6/1mmCNtUQ+LL7Jvutimu477rkdepSLcd2gghvHEShQWBWbwutd56nhNKWTh1
         uhtQN4cLu/NhrYye9iQv02OP51g0JefabC6MbxwH8M/ooISS2FExwdfD/dUOtV1a7xzq
         /lHTbqWWW1N7bF1KS80Z7zofHK2GajbWpAzp8KPCtjpYf7V2EWQoZa0RWVz3uGMvo4Lo
         GPTA==
X-Forwarded-Encrypted: i=1; AJvYcCVG++eOdAO4Q/n7Qdn7E8eqm0j3pkJDB2vwIBKcvp1p2I7jOsnUwBhIMwXUpqbMOF/Z53gd1glGv04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6UHu750z0CGFnIGYWXnA/iS1D8HyAqED06D9KPLNUzC9i18rV
	4MyYRoRpLsp6zSUZ1cEG+gdYvPk1eqTs2mfrDhGywjQ1ukFA5ZeKkFqRV5JGFIMAvJqUIxkeSes
	RiqeNjMla0KV05BqT38Dxw6NAuwdeMIgAP5xVWcXH2AGGkCK8YgXbzHzxlwHtxaw=
X-Gm-Gg: ATEYQzxSk1e6K2bF1eE8eAbJzuSS1m4z6MQCTYv8FppTjOtO5LXhLkXfWx79SjoItGe
	25aRvc9+R6vEAwjR7Pnq6coQPuMhqosOR7L3HSHcMbSg9SKAdCif4FIHttFtE0fmLDhXrR5vBHH
	tNXdggnKMLXUq/hfUX7QEzG7nE1blqVhf+jo4+PIeSiiE/12fHxORQYe1PYWIHBLptQcqZVnt8P
	xDesb7EF2/uzQ17BRzTO2D6XTFL9Kjudb4NFXGB/8lybvGRKdSksPkR9GvsmBcfsCxrAT3NZWee
	I2M5kb2zUCg1MDjgnUlY53/Bd+xViJs9zs0NJbj5JAsyl3Q7G3ojbQ/8mQuxsYunoLDQsDddpa0
	SnMGkyMq9x7C9GFQkqE9zhGcoPuwfELi3mZZLY1uc+Vbi
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id d75a77b69052e-50b148bd94fmr31893491cf.70.1773832133447;
        Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1b89:b0:509:882:9e7a with SMTP id d75a77b69052e-50b148bd94fmr31893221cf.70.1773832132970;
        Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:41 +0100
Subject: [PATCH 2/5] clk: qcom: glymur: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-2-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwJ0s/faRqzjl1Gjd8c7YLwvyl8TT+CqHt9K4WZTzss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe7tb3T1F//ePKnz2ZNSrG63JhuojRWfgyba
 or99fgohWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHuwAKCRDBN2bmhouD
 15UyD/49o6xfpTW6OMtLVORG4Cq9Xen7SuTGalwr3Vpq02B62ezBLlRAtyMq8BKdosAfA92c87P
 ta0VJcgivQwTCE1kxLCsneYl8QGsrKOCBi1TRKXmcPHa2uQBTIl9SNK+LXbMzyxNPsaU+3xUx1l
 SzJeqAWeFgDddRWFfWJIOwwRMCHENdv8YmCIl1BozuvmtnSYarpJqYcOTwoE44FOeZ8kMGs2WrC
 b7FjNgta6idYoOCD/oS0uro98YEdnlq67AGUgyIr/3MQzcYymZqnEzr8fUTMduiiO8vWCSRHsNN
 UO1mgHIoIQOg4tZBSz8sU3Fm8TqNxEEIfTIKwUCJ1vJXX/Am3isOhlub4pTIjAyjuE+UipXl/x1
 923raUkaN5hKPSOKdCkWN9gtYqCvNuiNeClQWI1KIhmZCP8IeqOGTGCnEJbCXF0zHJBe0XPPxie
 IWuOY1eNb2oNQXwQwjH4z16Ej2BxhVX3llfkxFAM9PDbrgVbRfG7jSG3jJINU70rqAMxhctfPsR
 Gey8JKvidAKoTwLbSCm1EppQ4DrAK0YfLaju8sBmT36Gqnj1OxulLUvzUU64efzk+4ZXWvS05NG
 Al2EFC21I9lopynMLUm0xFMC9WS7Pm+CctgxpJfSv4ZJMaMcg0qESs9Ds7NSuB9CHoDGy2iStjF
 518b+5RVX852DmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX+NaK4aGIaZJ1
 rOVVGjxftycnV88tzsnnsQSEcqI6XaRT6q60lA3cjPFbrN1PA3a3wjxPPYwCvwgxCpelacDgXwy
 rNXfW7SxJp3qXmCN4lG3MInjn29hut8vREeHN1p6U78iulGvsH8/ardu31m5Z2hvwl2UmcY79uJ
 siuIgTaqIdOdxsT58OIQmgZsviMsMOgNyz/avVv2P/kVraNGP+z3S5mgwd2DOQJ9/3Em4kB2+zJ
 ZhvuFH9Vig/4cvZPkIJGvCigrm/DRy3mtGPULEPWM/CFcselgHcmxKtxlOzxA7HdtvjClARMASX
 MEzEzu7ugNRo+KcAChLOIoVcwbBHEfT4DvxBl+/QJAzcm3PJpKjA2/m2LN1FaNsJD7Yj3D4tFk9
 LNN3DXIAN7WrkgxLXnanIbVjps/RP6O2cqZ+3l7S61AwB2DysMnObgpUjwFEKzLPQFbzMEZ7QPr
 DWEh2oSYInJK0GH9DXA==
X-Proofpoint-ORIG-GUID: 8a8KWAZk5iojhpsucgF9CZ81VLV51JAK
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69ba87c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=n9SAOWaOJGgEd7NqaGEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8a8KWAZk5iojhpsucgF9CZ81VLV51JAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c  | 2 --
 drivers/clk/qcom/gcc-glymur.c     | 1 -
 drivers/clk/qcom/gpucc-glymur.c   | 1 -
 drivers/clk/qcom/tcsrcc-glymur.c  | 1 -
 drivers/clk/qcom/videocc-glymur.c | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index a8c3cbf591d1..fd085cb90667 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 0f3981252a68..1a5d3d182705 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-glymur.c b/drivers/clk/qcom/gpucc-glymur.c
index 2617de0cb1c9..1a1d946347d0 100644
--- a/drivers/clk/qcom/gpucc-glymur.c
+++ b/drivers/clk/qcom/gpucc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9d9621a61072..9c0edebcdbb1 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index 5dea01f9e20d..bb3aae6b8396 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0

