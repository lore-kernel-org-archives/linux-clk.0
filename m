Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E323E1CFC
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 18:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758307; cv=none; b=O7uTtWCPNQY+lpPiafAE1JWKd40Wo4tuwAroyWaRCrM9nUhk6uxf02I818jvt9EGb9HEALek4N0lkAiqkKPvcxviFujuph7bBeWunRl/2cXAfVdzt6K8Q/QppaUJKNBpMuV15nIFjTB2xU/6f7FZ7df3/lNyNlytSK5A5qrXt6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758307; c=relaxed/simple;
	bh=dWcGPZUTYNR+IrjazAYIkxGZaepcVATPwDyqe7mibkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWnuZyxOzGO7e+oG8HC9uXh9ztPeDv+0s5Y1t763ao2Q8E2IInvW6W379IsNSPvDdVeKSZvI2+x4UjDgRFnibPldOITrtP0vAnOqGMQC068sN2Kay/+s5rB2z/LiUBF15bUfKaHqpa8BKS6AwHGqkQEBp7zXxVrQnvrVzx1oIZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PAgb7lkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FS9Nt1E9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PAgb7lkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FS9Nt1E9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1WWm1972641
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 18:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=; b=PAgb7lkp52h2aYe7
	X/q/AUNoT8wFXcENwF2xkHMQdpolfuJRSn3wDifsClUkQSrrf/zlY8GzlBWXEd6C
	7SvU3SDb5KzHJPPb83l5BBzoh9n0peh9a6bL5IjpU4fo0SthbVvtKQfL1fehBYva
	H/M9mnm0jSNxjxaV9U4U15b/3mwzoOByXOQe1IbfZSX9KtNupF6qYNymkSzHBeA7
	+7bkSGm/7xnnft1jUn6clpeEMxdJu59BOhyMwUyFCJwNHe7VN4PZCWYUnxl0XOPq
	Quzs9LMgIs1X1jYeFD59B4dLMq31tO3oF7cMpX/ltWeGczFMSxw4O+gbQZFFr1q4
	lGHE7Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1692-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 18:11:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76bb22a8ceso1409447a12.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758305; x=1776363105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=FS9Nt1E932rGf8Mv8vTX/nP3Zy311RndazOYsFG+ggmz3+0HrRMulLXE+Yq9YkTB8V
         2m32gGq1P9kDyMVPapyBf5NZzQomvj0zkFWW6YPm9wb3A0Yk6KwmtGK3y38uW4UmmwkD
         wYiFmwiYHvnCqSAn4/qSqHr00+rT/uHzsywOuU96J0Il8dQIAXOCRkmIyXnHFw/mCVsX
         i8eZ/Ynrfv9QcSzuAoC/mf7L+SargKnlwO3I+KVecmUTv65aq5bkGEvXJ493arUSt+B0
         owXQFizJsEfLEkKnJQWjM36FyhSaKCR/qpgMt2ambm932x275rgR1nLAg4RV2Kkzu7Z2
         HOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758305; x=1776363105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2hSeCqy3196ZrPyXqAGFPnwN9LeRm2Fe9O2th3jhQA=;
        b=BAKFFMv1EorTQDQE/X3Lyx6yUoT9cSMXH+KFKt+b3yLCZQPXXnvb+duttbjWSV7l3H
         RANzaGrKIkFRzZ4PrayvUvFx5AUk6f4JLpVtIRv8MDXd95jtEQ7JVuNA6db6oeSL2ofz
         CfJYryeNwhLtvP55GXqeHnbMtNuW9hcAegyqTenuwgcvk+6+TgnOLtqWNwwIXR4dPyc0
         qB8H3fjB3qvFgp4LFSFow5fpGJ3qxrI3hnhcpBGXv5zqZpNVM41DgqjxIMPkyIz9Fn/n
         b9Cqx8BNZQ36FJ0mSD2KjJvbV3SLe/ouKo1C7txsJHIZDPgQcB6dN7IvSbnlzrarhTGJ
         +Kmw==
X-Forwarded-Encrypted: i=1; AJvYcCVZq4ViXz4QAQcdZFdmHEvQq8c2dgZCrUl142VruA2INOEhWRYnrVoZH+2+DM3ARM9jhRWAf/UeYgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtA1ASfC5pnslF+KOn/1Q0hnD3jhKNBRA6L27LAl8CLqu9U9HZ
	FL9TFckhzi7/pgllxqfAXHc8wVQB7V4mtx7mWjAHYLLRfUo+UbTbMAw0mvdmDf096LJ0ApT+qOu
	Uj+UQ7fiJ70wCLzDFMAblCGoFZnWdlU0mbDdULO0msc+2NP/LcOI29TodBQZLn2DIbN5GJRM=
X-Gm-Gg: AeBDietWxTyzABUEOvyeCxLOpgkH43p57yeHxGz9RYn/SvuzxkcQuoDWwN0ZvdDXYgs
	1VkfxqObsg+Yh+bQncnGu0cgF5KcJAD1q+XZSndxCWgEu42sk3UK5ohkmwtJUzgB7Ag59wMme5G
	0QGBb+30EZdqJ4Lw0GCuRWXaLK1FS5joyOyZEtvv5JZeYGqsM2WTdxc37U1swW8mcrYXSn6sVL0
	k8YqKjX3oUahcT24wWJsaUKyEs8/f5VuAxvrPAB/7g0NNjxgVUwKf+y7Iwfw8vbj+ZiHbgMa0+9
	0M0FDgfJtH8PEmpNEdM2NjbtHT/6FlxIP4hVto/yPju56D08/YjChBZW1bquSRJk/MIAjJmEkEd
	0RZYigzNq1SWBjMeCnZSm49al4sBJPZB27HlioT5CKRCTOQ==
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31142020637.17.1775758304832;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a4:b0:39c:4e62:b838 with SMTP id adf61e73a8af0-39f2edf5056mr31141967637.17.1775758304218;
        Thu, 09 Apr 2026 11:11:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:48 +0530
Subject: [PATCH v2 7/8] arm64: defconfig: Enable clock controllers on
 Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-7-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: f_oSpbRhbpM9ciBH0ndleEsvXkM0wLu3
X-Proofpoint-GUID: f_oSpbRhbpM9ciBH0ndleEsvXkM0wLu3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX/eGhy9A77f47
 9sR3alXltmtR690AKulagbl8sAqR9HF35Q9ZwlsmfO6NbfOEtCg0E/inyIevEsB3cWUu/t4vEGu
 /z4tLep6RlcdZ2onVzXWn576epVcWGTRmqwBYAf3jqrE1zcSlM2cLs952klOISLWZ+nbtZpKOSi
 3jotrHXju5wrazNG/My5mFIPP3UBifbYarCcM4DUZo6vaWzq0c7WUV5b2D8P2bkOuLJ5xut5TIw
 t97C/vpWURvbvgWlIeusT8vdNlgPDE8YQ6I3TAEqtQitsYyW67UE/bl2No8lwdCxy/9nMVLdkUR
 hnGxBuo2GxAZ2Zn8CdiQintFhkA3ac2ULnvbczJ7wV12XEdK78lQy0rQxPlG/K5FH4HMJGs2ira
 0j7eWCSg3G6NBPB4qa5yLuWYUNKfZUk1wqwWhmjGOMA/6XveCOB6AdKq0DrbMJuPzRTtF1SNUrg
 BBMNLltC71bylNAJ0yA==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7ebe2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2e1B0ptGhY38lJQULHwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167

Enable the video, camera and gpu clock controllers for their respective
functionalities on the Qualcomm Eliza MTP board.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29bf631d517c38486f6896ffd82dcc9..130e8716e67d69c54cde3f66db09b352f736feaf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1475,9 +1475,12 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_ELIZA_CAMCC=m
 CONFIG_CLK_ELIZA_DISPCC=m
 CONFIG_CLK_ELIZA_GCC=y
+CONFIG_CLK_ELIZA_GPUCC=m
 CONFIG_CLK_ELIZA_TCSRCC=m
+CONFIG_CLK_ELIZA_VIDEOCC=m
 CONFIG_CLK_GLYMUR_DISPCC=m
 CONFIG_CLK_GLYMUR_GCC=y
 CONFIG_CLK_GLYMUR_TCSRCC=m

-- 
2.34.1

