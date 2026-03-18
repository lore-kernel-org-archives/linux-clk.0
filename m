Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF343A382E
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830384; cv=none; b=QEm0poBu4d5F60fSheSeubCDgEvUjJPpGS7jmme9ZUV8jvJWewn96Cd7RB48LCfuWXrGi4W2dOYNK4pHW3AkGvOo8wIlDzvt05R2jzZ1WS9fMSWhbYs51PzK6XlXRBVEWgOVLRyQKu0+kj+3My6hrr38dC08vsA09Is27C/QG6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830384; c=relaxed/simple;
	bh=+1xFNvObLsaA7YVdBuQQEfCsGZyYyif+MyS5pUfiHLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=opHaXmEt5qBZzQzID8KC3bUmhAtVn4x6+hxXviqPP3XDBD8TiteYzYT71FmoRvNoFwBikRBc4NqSXKDt46rT1cJTvSaWffwSwxiC8MZsbZ+a6asJ1X4fVrv9Tluw7Nu4cRUEC+Zx1NN5Wrmr9SHXez36zNs4MJh+eHxUI3G3TIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTpUAzdq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1oF5A0e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTpUAzdq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1oF5A0e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8JuqW1049602
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ZWVyLMJKoEeAGhO1XSx1IL832XHAwKE1WtNtVyKx2s=; b=oTpUAzdqES5rxu23
	zV2bJPQBmXhwOKTB7SfwuhjZVzbPLGk4dv89MF9g8JCkg/NJEvVFVzQ/5/semE9Z
	YzowEp9BY4csCt6cJj7Vj9O83lZiGSRqD6MMH3XilbaRShcWxaiIPBkTJut+nWr0
	i0fobCb6w79EuyWM0kuSUGa1iWbVkWn7MCLOLgK59gdFa0G53RN4Y/sUDZjv0T6t
	Sh6pnEd67VbxjLxTqxTpRyJDIq+pYy0Zg1iXECZ3zEEi83t+T+Lx3WiGecUekL8T
	yOS0Rj5tRM6xNO0uFFaLrHj5BvX0f3Fcr8y5OUY7UFBkIuXFlcmiaz3YLVH/tB+G
	hPshVQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej3x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 10:39:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509007aea22so305158691cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830382; x=1774435182; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZWVyLMJKoEeAGhO1XSx1IL832XHAwKE1WtNtVyKx2s=;
        b=b1oF5A0e32OvO2YnKiato4v57sFez5jcDZ5hl4HkxrCFqqGBtx3nJf20op4yr5tgBV
         PR7YLfBsoVH+EcG59SnjRzIAGkNoH0gkhocjp9JmjbrOXgj/L/1JPISU/PYeJQDjKi1K
         Rn3lULFTg1gmZp+oI8al2lW/v0ub0ClrWnQh0xxAPQrsy+3AB8Xnd6g5vPw3DMQnxDqt
         n7kFb8qk4Bf05j7LPN/Y3Ep+xgssQwI1ayVkqohQq8IF69sb/reSfurvJBZlUiGeLzer
         06og50x9puCqSUF2DgFPpla/pj7ZdOf3lA8ry/WOdf/XZU6H7Yf1n92pe53CQsC1gFOi
         40vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830382; x=1774435182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZWVyLMJKoEeAGhO1XSx1IL832XHAwKE1WtNtVyKx2s=;
        b=KicarBapRqysFRiskf6ajJ2x5G71kEnXBgNKh8/tIcbSCESHgzJ5dzW4IuzgISUFCU
         S1B/uGCwfgXz44zGz826xS+Gq+IUu1SO2hSq77MYqeTsZsVMMMyBOxX1pMocW3x64j2l
         YPGbjHIthrPguS/7XVLxnptZg2Mdf0l/v6dWXGERroRO0NbhUxZrVm+q71nQIIgjwON1
         aN0jbdi9EWHvimn43V17FDdMsNgauXQNK6+/W2QYtZ3BWExbt/8hYjWUrM4euGOtWqkj
         x6CYjaBwT7TPtXHeTqP8Z7Tsrurkn2jUChBGYBiMs2KiBrFRPCnY/YJKJtEvCsVFAO8F
         sJww==
X-Forwarded-Encrypted: i=1; AJvYcCVr27xBtP3x3z8oBFUAok1P+BCgnusco0Keyw46oKuq1RZNrTNA5yLCuwgTYQeJonK1Qji498Mz2eY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1KWGWbxCv/eVaugKA4PUF7FiSauH9kfaNjZYLqUfibL3czkI
	DQ5s70KUj5s8iml4DJUGt23z6WoM1Zm5f/bw3STNfSS6QYFlMPHSJEtJzgtttaP8g/9UNbKMnk1
	R9n0ncWxVBbbKimGCelsIBpzD+BD/2xQkjQFaTF11jKIPBBqH70CuyTN3m3xYKQY=
X-Gm-Gg: ATEYQzyg4pJU4aTfLWFcwGn1y0FvNZTOuxq0oWXr5pJ4u8MIEU13ijpmogIhVuxJDjn
	s8wC267ftLBWsD6/nJZjMbT41LRcKoAMlSAeQutp+WJWSoaqgOHFBfmBg07N9rMBDDbXzPHx8dp
	V6V5V/oL2BWRobCNHf6Luvv8uhiZHInIX+E2IaAP3/8r6hiSmJ5eV+f37+QQ8/RbV0ZTnIBidKE
	177l38iAKlqFI5HdB2+S9FwGfSH0swIPkP4pO3Wn7PxWgJHVzbp9XZbqUJ6rGaXu0BX3ThExnqh
	20JzV83noatinJV6t9KH5o90KTbu0KgS1Z5MULLCbzwZT+4Ra2pZVao8XIIZL5g60byhjBcSCm9
	iiELsej2z23/VAhTX2VwbJGVdKa8XZLjxhf9xB4HWo166
X-Received: by 2002:ac8:7d55:0:b0:509:2053:ab60 with SMTP id d75a77b69052e-50b1487e8c3mr35481931cf.47.1773830381670;
        Wed, 18 Mar 2026 03:39:41 -0700 (PDT)
X-Received: by 2002:ac8:7d55:0:b0:509:2053:ab60 with SMTP id d75a77b69052e-50b1487e8c3mr35481651cf.47.1773830380945;
        Wed, 18 Mar 2026 03:39:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm7300906f8f.21.2026.03.18.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:39:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:39:11 +0100
Subject: [PATCH v2 3/3] arm64: defconfig: Enable Qualcomm Eliza SoC display
 clock controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-dispcc-eliza-v2-3-8c05581168d1@oss.qualcomm.com>
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+1xFNvObLsaA7YVdBuQQEfCsGZyYyif+MyS5pUfiHLU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoDkkuQju9reoCvOLERBUh13aHhJ2t07/IFOk
 gVL0+rTrCmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqA5AAKCRDBN2bmhouD
 18ZhEACNln8W7qjt9o9TePNSw7HOGiRsW9PeBq7FNipyKiDRHGfBqJzy46tgSm975hVSdgGgTdw
 3bQGlibGcJzVp8szF24NQ3nlrCv/iq3c3YV6ISL2VgZDn/0X9STNso5NJHTX1grVpF9sRP1RtHi
 ymX1VImPARmB3bLitZ1Jk5PU3G4g84L2TYI0muCm6LDdsjnKuJ+AxjBw2Q03b0GHNOPqgxO9PjX
 ccYagLpo8LbV0GGDi2IQUHAFu1W/N4B92s8Db59kVHZvN+URRHXi3e//3BCISMTPxqgq6I4HSx+
 z6UO6ShdjFp2H02q69gi7Ez1phPI/bqhhgtrG2gHgleoSCDs7tDjP087LqTCZaq+0pOXsjhEd3p
 /3uLyRlntHoG0KgTeZeMdYCEICArGkWL59j/SsbYmeQiXI82u8NZ+uxTIxzMQp04QSSSvWw0Xcs
 yfBQQ6pHlGSPxUlnkR0TeeQs8huc4on+ZDyLlLJernk1Cq5J0CEz0Akpy+lvkRb+4Yg6JrIsvf0
 ltmEDXXPfodChol7clDtJ0b5CWYqXBr+r1rDbb2iTFFSnc5OuMyqj/d8J5FsYmzn0eVwOPpQbb/
 z2EATFdW1LDqhc1VVF0qlpQvqD0kYur2+TUZyTRWu2O+gRvXWqLvqhW+3Z2MqPWpHWTtjBxakUz
 mhpMAAlaDDNJpWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba80ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=C9QGoBBn10ZjAcoWwycA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfXw13m2zO0kdKw
 ZguNzguMhN6tJRpFR/E+E7pfMgJcOimZeBmbT7r+jKYUEmpL562NB7Twjdvl9gMoQGkgbc7DxhV
 qCh5SOZFKrvQNBGSU2P27fkJd5fXGdo9luwmwd/1EZLrd2EpjHwr1IViRfo0dq6NWRHNylmMuwG
 UVCu8z0UPhNgoPLJfHBq8ampgu/r/1/ZEsITcn5uRZS6nFk8ppMV2c5HOwnBSRRhVKsUjiqfFh7
 M1YeKp8t/eFtsxytJVnLHBiF5y/pfalixxodzrXGTdkFGsAt0GNsnLusC/LCflVBujQnXAW4RBu
 XNghM8lSjmFwjC0vXI0QQ9LKweGQfTf8IdqsgoAiC48M0uHKovkODhEcx6N6F/efE5au/lfpI50
 /cXcQoyUWLUqLBsHQICzIfXCMCd1STp6M5xspUJhlynlpSL5pnm6A2Y/luOk59ggprzG1iwWhlh
 g0Z3t5VkXrCvs4HzQdA==
X-Proofpoint-GUID: _Oo9w1_f8MJ9wS1wFY0IjA6cwZF3RqKo
X-Proofpoint-ORIG-GUID: _Oo9w1_f8MJ9wS1wFY0IjA6cwZF3RqKo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089

Enable the driver for Qualcomm Eliza SoC display clock controller, used
for example on Qualcomm Eliza MTP board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Eliza MTP is being upstreamed:
https://lore.kernel.org/all/20260318-eliza-base-dt-v3-0-8a50bd2201ed@oss.qualcomm.com/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 18881bd239f9..d8938863b84a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,6 +1458,7 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.51.0

