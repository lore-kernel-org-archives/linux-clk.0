Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D202F37AA6F
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832138; cv=none; b=lT4A3HHeU3M3OMLg8Zhg8OuD4qTWJeFBQYSDFPXSkJe2Ys92oN0mTVyUKk3pdAEKs8Ds3oiMECTWSmZyJYh7l+0Ljf3H2oIzjoGdp/3lAndc8flT8ot3y/hFOaAUP5D4+lUTKdvsTzeSco0enBrsjHIqHRqa75UfTu2VENAE0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832138; c=relaxed/simple;
	bh=rwd+fdD+sjWN3bjprGZY/SteXlcdMNP4NDxbH5slEHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptA6ObCuBrp2Pi53/mDf5bdhSon98zYiB5s0Xs0PuSQiEQ4AWBZdkDhq3DuB2XK81OTjvcZ3olgN3cghcb3XNwDmi7T2BHD128ZIiHkMadSmGLn1lF03pliHF3rqEVnAth97Q5leK4R01bB8E0mGocSGqnkmsfMNx3ylzWl6yKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBpsbjZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+beUtLl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBpsbjZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+beUtLl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9Dblx402517
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=; b=TBpsbjZSx59FY0/u
	9lwU+bB1Dk9HqfJFUnlqQ8QoJNQIDRpoRyLfk++jBL15f5sSx/MJGC36P7ibfPSU
	duV3tKdpOqTZ7NfZzhapjK2qJb6fwIt8KgGorPT0j0LOwWxcSiT6v48Rn6/ueD1O
	tgywJttb4rSfYWqi3HZwZ80+YDnu3DGo2L0oHNRRctcrFYphkiamAN15LZAiMlMe
	nE8uQNdVnk1sH2w/6oKhOZqvHQGcwnU4scC3UZPV1ubp+NA9p0sEOz6zEYtUDd/a
	VRYEBtkbkyGL10v98zFQxxNmZyjBbtkh1fR4DfkSbA7iFBv+SL+3algykmIHVnpL
	GCtOxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duetg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso984497861cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832135; x=1774436935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
        b=c+beUtLlY2Kxk6Cx7oW7tdlDQo84g92lJyiTDlVzGj/JL4vjVliK6Foka7o5RqRtoN
         +EXPudwjgWQk0JbwPYbzanZ5xGkzYm46OPZsdzBQ5z4osbM1TYwSF2DRr4q273bq2SLp
         qJQQIjKpfz6CMMKu36vFLYZiEmC9InxzGjKfzKZeXz69ZWk17BOlWb+U4usOCkoqTEs6
         69GzCC6dIOXKtm8x1MPpH/YFJGGXevVYbEIStyB25SkaXnfPQYgKrEjAWod9ZK8vxoG9
         0loRDcJoeAbQKSy6TRufMKtpSGdccJUWSc/QBWG5mY6RTvzxt5dhEX5RD/Hzxb6iftWb
         V3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832135; x=1774436935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxuF0A8lhlStGRLI4TU+YRZI01nCSaQ/oekeKcjZoXU=;
        b=QA5O5k09ooNORDlbIzgtBEVSaEEeAuCNKScoSV1OT7u2b/6wzf1awxV6c/qL0fvr2O
         hmLXXYRfWngjzcBYS1kkr6vVcZPkm79rdkNFxqJIPSaYEeh5H5NKCoDgJV7xtwP4LLPS
         BNYYAg1txaiKwTUxB+onz4AdOR8NKalyNzjrLjhQj7+8JsUd7ULiJ0qZGNZzwkcZeoXC
         ewIR2/SABVq9aynWGVywSeKDpmQNx3fyiWOYfulNWtMGEKWL4wkBmoU/iJTVbhUS1jzY
         7UOQ3kEURuwJpUPOVjpfK6dmXZBa55uPhb904fpLMAUm2XV8c3aYhaz0GHLRXF1GWKwj
         sDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0i1iAZEH/jd5KAAsAcR6TrhfrFa0oVggpIHzix+SSj6lCJ8PzbQ8y5CC9C6IiCS76X5Vq8cLgeeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6HQ6+VYgCtna0kVMZDKps4w+hvcO0coZ5DS9oWP8JUZWAfjU5
	blpJ0caZfIVQ0e88idv/0pLO7uGa8wacLuqvesPyB1OjaZV+0cGUOk36sIlglplrKjYkUjI/PlF
	UGjmv8XoZuOWzmWC0y4E4PZJxdF3TsjoFsK0m5JONWMuMsSxC6QuyGMJvXo/xsng=
X-Gm-Gg: ATEYQzwZq9jgdyiYAj3/EWdm1HPki6+TpEXy9qtLI4EiNdipu1lRaWX/1oyqQ1zE3ob
	oCWKImcs8LrFsZiGUytMKYk6+9pQBxcE5EMoiPv/e3+JL6FJRpjKGqJg2Xc2XnmYxaRVvHwDouj
	TJpX/9kUVP1xGJ5ciIkKg2QlRZzXcygjn2oMQBz1RVV6VJbWsvJ3hi+bDpNZynTxpZSDDHn8a8d
	oHNJOFCcG5J3NgIvYdXm+t5QcrGZcfZBmj0lNSj27RkLwstaq7jdgNXJOzLGZ/LKJqmLjgLQLip
	s55ihTjdnyvtwb75Es20M7lJ9pIpbijHHjA9rWYqaKL1267qbhPMjkCvO7aOW49ZE61GSRvda/t
	nKNReIhUSj3NjUsl1q1uLpyQ0tWR96LbxdoMiqND8hNcp
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id d75a77b69052e-50b148b588bmr34689171cf.60.1773832135293;
        Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:509:2efa:f054 with SMTP id d75a77b69052e-50b148b588bmr34688621cf.60.1773832134757;
        Wed, 18 Mar 2026 04:08:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:42 +0100
Subject: [PATCH 3/5] clk: qcom: sm8750: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-3-d5c6a3b11b67@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1224;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rwd+fdD+sjWN3bjprGZY/SteXlcdMNP4NDxbH5slEHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe8EOeRZLJaD7GgO6dv0KuniqRRyymTla7vh
 JTqjRW4usOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvAAKCRDBN2bmhouD
 14sgD/9622J1xmbx/NPB8y+YfXK2DT8IpBi8tjYWPpNqXKCpfTO/RdFRwwCnCR1f7nekFuxhRcp
 3K+Vcd2wPOqKMfPsM8rsaSPsXaE/6GavEiBIiNedsVosrjpqZhvTQQoAfbiKgsRbUiMVIkYmQPm
 ekWpQ7DNPFAvoT9KHrLK34jLFJa0sBbjKsX7jwBfwlp8Bz0BVk+4LOYl7YqHrGjGYhaXl1M2Bbb
 ONDUfhSw+21vS1NbmfUM0TctuhCH2IOFTRDfulOhX5VS/La/5Dl1/99Zx1kXSUZ3d7eeUSBhUA1
 i0E8OTCrSXHIK+Mixth4vRvoGeF8g2Udvye8CPMXJlCGfFKlCMPJrVGj9YLYlm9VntTFIIl+JA2
 isXpztQcCBiafjhPol+VAhUbP4qZ1QL/V58Yy+pNkNPSr7h2C2ymme7gywfImhpZuVVcNBXnMO6
 vkgI+mv2ya1mUPNjBqLifviR6XUOFGB5KL/FfScVUGqRTlREvzYrUNEtDiPF78qM/JZ388esGz4
 PLB/B1OxCDdZIhevE7mL/9zfSvG0T+j/xoFVNLucXezbc3VkL2ZOtnr72YsQ4MG/KTPthSbH1oz
 Fi6FZBhAEb/Ci96N2/YGEd0wxDWenbEbGI0oXCc7OKvrprdLPtCNwtmPHoXnIesZx3v7+wY+lya
 aW5An99GP7lXqyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX3Yc0RZ7pCOOF
 1fpJ8cEy3EZ05pMg+Filf6dfmqnxzGn/YsMldqyDuAW4YS0Ga4ZWZ7spqyuNw+ZcLpilv1sTT6Q
 0Su4AMUiBMtnZ+SL14839lK9Ln2hOKkWQYbEHvYV6LMEC6ezcplZh/H2TO+ZpZ/JwyuXsdGDs9a
 rR+XN/YO6wxGpprEZyM70uXyqlsULY5U8tPuxI9Zgw3rrYnvlutxARdIa0X3UQ5sK5ZOevheMrV
 wz5mp8WK/Qxkeq9GKq8TbcBlf3GCsTMnX9YiVpTkoW8RISqhI8b1VTdukc1hnEQ+0YcMCZ/D+Pl
 YQt1drGVGR9Q10JPi5dLAQdypfe4pJzfSQ2paUFMfJhZ3ADUK5HY8jSZTlqBubpgM8bDe6fIRKf
 tHt4Bg2sr3zUgcEKGqT2iY4xU7qDIZ+mSVT51bt7Slvll2gXQpf19bj1mNq3YnSq+kk+eJoCErW
 YCBddeXmdPz7Vl1FBLg==
X-Proofpoint-GUID: mrEHRxkFqbJe-Y0EITgLm9idTv58--uM
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=J5YPY8RFlEepJke0YncA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mrEHRxkFqbJe-Y0EITgLm9idTv58--uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094

Remove unused header includes - drivers do not use any OF or runtime PM
API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-sm8750.c  | 2 +-
 drivers/clk/qcom/videocc-sm8750.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-sm8750.c b/drivers/clk/qcom/tcsrcc-sm8750.c
index 242e320986ef..46af98760197 100644
--- a/drivers/clk/qcom/tcsrcc-sm8750.c
+++ b/drivers/clk/qcom/tcsrcc-sm8750.c
@@ -4,8 +4,8 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
index 823aca2bdd34..5c1034dd5f57 100644
--- a/drivers/clk/qcom/videocc-sm8750.c
+++ b/drivers/clk/qcom/videocc-sm8750.c
@@ -7,7 +7,6 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm8750-videocc.h>

-- 
2.51.0

