Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A743CCA15
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220534; cv=none; b=XyRQ405ZiUkRZAmSywYpPx/NjuuzEn+X73XU6OJNzVOyO2QF+7IkzEn1DrzuPbg2ZBWJ0vI8+iCO3hViDeneN+O1SQCV9gFkECSpHlZTEMfyqzEdUjKF1lsuLdo1XiwGd7jdwl1bRGNLe3+amlaXQ29vab2/e7ZLneAaJcG4Ubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220534; c=relaxed/simple;
	bh=ivFZTMy2U9W+rvDCVTji23OilOk8MA+0adR4aza65Fg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYepn+yIj12ec8Be7Kwja9Wa2BIjQBrpdysUNDpJfYm59l626SejLCKp0iifRJYcLMo103hbyhyylxgq1ox5cNegm/XUcoN7cWO8eu4IEREXATk+T0LIxxbtGgBmjoFdqYX6IuqTlFsvxgkhCtL1w9dfvUIGy9tF1tg5BS1qjpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+m/U9S8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLz+9GtY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+m/U9S8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLz+9GtY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6n8x53732028
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2Uj7I+c2RWFNa6rrzX8ioPvVR44VGhkXy1dJC/mw3I=; b=d+m/U9S8U1cftpkQ
	+das9v1w3SbS8jvvmvNWutvC/88PbMASIauYFuW4kuJkbzC2iCHjSJLUDe6CgY/H
	dML0nsPkIlkW28uqprqH7bteVCZxOqRYtWzlg3u95pmKiyWlhXD/27+EIaoi8Ygw
	Ccu3TzRhibldlFIDRCNXeaE8uISNF6yTwSLsDaa9I4Zg9ItqrEa6VqthLVu2o5jS
	U9o/2VQk8mM42uaq0Mx39xwv7zMIBmB1Y5Iq0DGujFxgnmj4tcVtjOxDe97NKRg+
	yxeTOk8k3v1kGSOT4XWxCsNub7rCfPWOXfdv2YRBXrapf7ARXdRZHEvTrtiHKQkJ
	u+iAKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88rbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:08:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-933023a5980so330434285a.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220521; x=1787825321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2Uj7I+c2RWFNa6rrzX8ioPvVR44VGhkXy1dJC/mw3I=;
        b=iLz+9GtYJXSXL4Cd0MZAA2pkto8LNGvXqaIouR6PZZKV6V9eHGamwjTzzo+JF6cMTl
         mSK9sJOW8vSz1lNC6Zq6qqB05WxWn5xE6OC+ziCNh2IKkrc4pEc5884SGhpj+Ty+NlAN
         cZQ5RHGeg5HSgPrN5U9Rxqxd4gViTol1bwYN9VEL/nr6TYsZGBL9jjcvNC87ionMEg2l
         Pn55c0jwtekMtsKTcKkmwXfuZ1fXkUpk1Bi4ory7jL/XkYn3+E8h/9Y2fgo5vUbI+YZO
         ca6CXhNaXyi8DK3jesr2NMBTRWkGfS3vbsdc5qJLqCQg8oNLOB5cLMX/4J3mt0bz7ijf
         CMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220521; x=1787825321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2Uj7I+c2RWFNa6rrzX8ioPvVR44VGhkXy1dJC/mw3I=;
        b=S7XZ8kchVbN/jijRdfFrSQAez2j6+XWxlTiKLtPJ84iAOmvFj+8rg3hpICksCUBO9/
         YadYWQCtBZAQAuf+KCdYEuqx2s4JfEXrVDOkEtwiv0HZLmjSUeIJd0GPvzsJFg6+DLBm
         69Ck4Y+hYTfaV3TZI47SGApfo8jV1xa5mYA1i0mREs4497AjDnzZUCb46aefHCKZPYQ9
         dqehYInXMUCO9Fe1xJ+BKHoojRrAQx/6CX8jXJUJPic2Meb+tCMBRPxrKElGowQ9Gerx
         huxKneSDoDh2UjwhghrX1mHJXR0jQvTsYtrNBwn3I/F0DYaPnOeogjJMNflR/IktXApF
         TZ7g==
X-Forwarded-Encrypted: i=1; AHgh+RrrOSaA/7fog2tfB6Ww7mdXLj27aDmzV1k8JIFybS2B6wQpuLf58yssfKl0yTkWiX/Yw+gIV7DXnOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGrxH8eQA08PjXiF2f9QWa4I/M4W72XDGD3/hNnZMdW4Zhd6t
	TVLCQ0GPciCxWgLs/9SCE2oVZbYCFF2847aYQ/EgQvdBTtSNUgCaqBv/8jYWLbBIhsw9tz7FGGf
	0guW/bzL+dL3mcQvyA94AoMuRd+vrtltKwnUpjpsgrubZezoRcGC5zqpZ6zUdh/I=
X-Gm-Gg: AR+sD10G7TsbAvncWBoBKFR1/x5XhUM6ZZmS/DmZ9s7SKIYWe2zPr3aA03HQuKBvn5W
	+qbvJsA7XIwmAU9PuLrAmAiD+Puv+laFnTB/iCHDv+e9bWj0zywOYHshYana/f+cLiMIhghsh+O
	05STsTTiF/A528oQwHYJDVR0vfGoY1glv4+ts0NUT81lCQy/DlbAg1NTrbTGlLLE9O6lOe01jc7
	Ax0aDhISDZUy8COMOoJJRg6+nRg7P2DiKzbQWMQF93xARLRANigHasHjr860OF8zkxnBA/HS10L
	93vvFLWVAVbCo9QfqVkXy1rY0LSs5cVeWgRp70CqMS0w1N5ZrwH6UwFS7zRVCaKRuT9Z1T16SMO
	C7tjXLMA1
X-Received: by 2002:a05:620a:72ce:20b0:937:2c63:22ec with SMTP id af79cd13be357-9372c632bf7mr275841085a.46.1787220520817;
        Thu, 20 Aug 2026 03:08:40 -0700 (PDT)
X-Received: by 2002:a05:620a:72ce:20b0:937:2c63:22ec with SMTP id af79cd13be357-9372c632bf7mr275835685a.46.1787220520258;
        Thu, 20 Aug 2026 03:08:40 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:05 +0300
Subject: [PATCH v2 02/16] clk: qcom: gcc-sm8350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-2-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ivFZTMy2U9W+rvDCVTji23OilOk8MA+0adR4aza65Fg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHdzaALfE2vnHJt5ATIYhHfYQy2oQa1nfEUQ
 60P8bpe52uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR3QAKCRAbX0TJAJUV
 VluID/9YiHReWFm2wUlZD3t0BDNQ6GQzfhOso87UJsLFhGc4CT5YovinQwzLoPrTLEwH4H+YWTg
 rAzu0Iy5jWx4gOv81i2osuIhlz659ZebIyd8TiEVcfbhj5KnNW0usqiL2N8ExmXwDC/34/W9Ay1
 +KHd42EIbmu5mclcdEjxuVmb72dwZatRrofGrxdRYjnf/85Gymac74czlv3wsBHjHKODnRx3Qjv
 t55XLAFh8zQJPiXB8PNVuzeV5nerVO0xpI4n2Odi4vjmpTKDKvRplc9qor+L10FHA8fVL39PCCs
 P0tPNNb5Z4Knxvj7YkCKm9rMD0gwZxq+5RwdchdrZsVBO6qrobN5D31CzVKA65tjyy8HQnjNSvz
 vu1EIEGdwwXkOU6IHv4LgdEQmfNtUp46ZjoIxub25WWYXirjYQ4mZygGdKjo7+VOpr4CsMdkwis
 zYjzYJafFu8SyQ1eCRT5IBBmisB7P3K0Vpoj0uE7lotTbVCF04xizRnb8yHvAnNJ/R3m4jCf8/u
 PPAbZ3CIZ4cGJMp0l8VLxRYq8P212l11lQS7fJonhPw2faUZOeGfTkd4U96w29OMtuNwhx2uWkR
 KnL0jtEIt9xpj8j6BZoEnBdEabqMavG/GZ5hLSVIJz5y6jk+xUjEwtZl5smq9r+KmJan5LEF8sF
 sHo5bXb9IJxJ3Vg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX98qOXbyOHOJc
 AUF0zVtW276yWrVvdqicJCEo9r7PV3PDA2OkOQVPLFyfnjnB3ZRsY0ue/GGt9bXrx/3ZYtdy171
 tVlvoSAkNEvey6ZADIMGK6+e4aDsThnVC/VhB4S4zHlPeUP06ooCWtbzB7SmxQFjhdLZ+QiqHrU
 XUygPE9QWJQBLe/sZWJgNFSR67RAWIQUngNvbiuWl7hBuxY+JZTGcbsqOkVQV4RLopMFB+rINLU
 E5bjrXgjWdqRLslvp93W4Bq/GVArP3xgBEq7SSw3voXXNN6+iQTvjyuflprzzRWIVcaTOS2niww
 h8pDddo5qZKrYdDV2/rdiYkiFemePfTeyaRO8ZUoG/cgaAD5kjeW3BI928Ozkjbv02yJkmhtOMy
 4QJPwmxTPiJd+Kebscx3M+2om/4NBU8x7yCDUimHAVFUy8G83Z2rSgg1jniHxtOmZEbw4nOQzl4
 MqM/gBxPru4TLnIFnBw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86d229 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX3h1GSEMLL/7x
 yzl5mQLuPHkWHtoWRwRmag7NDaqF22rKF2oB4SvwcNT4qnDli1yPlw4TGlg4bVHcp4ddr4hC4xF
 r1+h/O4YlflnppW6+Bm5WoCT6iTaJ6M=
X-Proofpoint-ORIG-GUID: TBOCQHY-Gsgp_5oneGY_hGUps6dWXru1
X-Proofpoint-GUID: TBOCQHY-Gsgp_5oneGY_hGUps6dWXru1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8350.c b/drivers/clk/qcom/gcc-sm8350.c
index 2d94f3046b71..996ee8592fab 100644
--- a/drivers/clk/qcom/gcc-sm8350.c
+++ b/drivers/clk/qcom/gcc-sm8350.c
@@ -3786,6 +3786,7 @@ static const struct qcom_cc_desc gcc_sm8350_desc = {
 	.resets = gcc_sm8350_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8350_resets),
 	.gdscs = gcc_sm8350_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8350_gdscs),
 };
 

-- 
2.54.0

