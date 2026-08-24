Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D6412BF2
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572569; cv=none; b=OmsF5tXSv/x0vfntIgaRdfcJuLQo67ds23OQacuUzbN0gZYcR3qV1Gvpks1imq7X9x6lZomk7wWJUY4Ew0tdD2OnJfP+CRLG6Yoq5CJUvi1yddjghF1S+fDtMLbXjySW3E9bgwZbRc/nubu0Rj/HEUTl53psM7SMk1OVAir/YEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572569; c=relaxed/simple;
	bh=IIxFBk6ES86W5Uht2UYsLFSa4TN4Ihn/e3MF0K6mvIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVYFtL1w8IVB0mW0XpQaszASJBHtn8k2iuHDYOj/qB2A+L2051hC7ZE+3QfYzmOPMW1GaiYTCZ4HSqMmHymYKRDgpLnCJjbUVspvmWoK1ntbP1GgZJnh/V+mAW4IeqpMw5M5blSo0ZKZIHtGOHc/TR2RRyN1/7IjPRCO3tbc2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL4+lyLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QN9sr45W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL4+lyLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QN9sr45W"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMdB93194976
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=; b=HL4+lyLcqcjxaZw1
	Q+8cofAPuonCdfCoO4ghl2j2X3sBIWGNcNEU0nU1Z2eE2exavoGht3qf/tHDc3xP
	t+DSaEbK1BwebhT91IFj8XDHI6aAKsBwGelx972kn/ArCfN4zqJXSvpkuDHMrgF0
	nkmcIJ7tUYaSF17UE8Negky8bjOhJ4nn2W1d6BiY4DhRH7vPdRBISpGda4AjD8bQ
	hcciJlKSzLyNQTh/Ty9IFKf6TFho02bbKPkUJ1uXReBTs3PmJ71whOAbtmZeDCM3
	N4p8QWBEQzvlgnO1qo0872lT9XVKqgpKOZAt5ul1cRD4ZSm1xyN+wMaymQuvoBV6
	eJQugg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs2yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso48095871cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572566; x=1788177366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=;
        b=QN9sr45W8HdDbq5sJGqDAlb80YNShPJ4FakNDXTss06IqD2BN9SiJAm5/XUgAK99pz
         02g6rY8PNG2xlVi28p9OArpYtZbHI9RO8TLcorO7szjkqxcsP49OZKg4GWg0ceimNg9n
         pm8WqdeS5HwohM6X93tTJ11CUlsVsNGIsmQxCOteXb4FvvK9H2DcHSChpVEfDJUve8ku
         Lz6G25X+UCY22mE7o1S4JkOfKh0AYj1AgG6qVG65U7JQIiM+wd07RS2jmYGAc2f4/mf9
         YpnLqPvX5deoVyzlxsXg+T+AzqgzxytHFWg5tixpodg4+apFleLVFPSYAjlB7aZfEUd6
         oIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572566; x=1788177366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9nqBy9mt3WozQnJzEmjl70tlvtPCUDEatMHcNTSyXQ8=;
        b=q4xkNSbwb1n6TfgywygaQ8R1xZDAXST4tME80Lfwz5S6FcFMOHq7RkgjDx5O28OjdF
         ApJKUUgfifJjyuhPXAQ9QShkglWiU2cQ0YbDYiwx1gQup6SaSWNjQQrAQFyj9kMq6auE
         U52E71WTHlgzO0oXde1kh1VKMMj0PlZBpFOWSw67MhS4GhI+5SM8KnmKUWd+SSP1cEFU
         2CVmQvCj9Wo1V6a//jk1NMvWxRdMIgzOTcswv4hTx7F/LP1W3iyOIyXZwEP35ip0qFeq
         Vdp1clvMdPPCGjTikceh4jOLxa6cdDM472LN/WmdgwoAjA4lp441dQkUmg5wFnV7P2g7
         ix/A==
X-Forwarded-Encrypted: i=1; AHgh+RpitkQ5DOYJ8hzXdvlaviiVIZQiBc84pvP0CRk/tGs/9CEs7I65keHUCFIcGLsN70P8jpb5HMVg1hg=@vger.kernel.org
X-Gm-Message-State: AFuF++lDNxT3cF+fVqrt/vsfECjJ9DKhSE1fmcI9AiVdafY8IaPgNa3d
	Tu2S1v/j2qHAc4iXAAXzOFsOAzlAWsZhpWmapXkDJhVygKYbkeb4+ingAeUJ7CuFo0mJ+XkZr52
	exQ4ZstIyrAn6zHLfuigdra03swlwk4WLuu1cZeXzy+CEJA3CS6bms3/Di6BFax0=
X-Gm-Gg: AR+sD129bb+TVM9lGvS354A1bgxRMP90Qg6gB/uEWGLLwNDkhKuNw6blXpktU/xRZDY
	yLjGtgXTgxZRweTPMQmgrzbCQtA4WXlHn1Uws7wHwi7ilxzJkAMoccdFjrb18azCELGRwz4z00T
	DM7/+ijL/bdAuMIFSxrb+j01NFWGWOrPiToWOL3SmzrqBOBNqbMZDFiGEme2wrnkj3+AgoQDKiT
	LkRi4xxmkbcOyxvKygCH95AyatrnPHx9MW+9Zs0uHoJz5s0Cz8uqmOdgKa09sCtMj6inosLqqKP
	by3ZEykXaLqBwjtlq+y0p40FjqwDAtbr/fSsbeFUQxsQKf4FPeSu3XYJeb0kX2TxDNuEma+vXrG
	/hzQdPj5L
X-Received: by 2002:a05:622a:1a84:b0:51c:1967:5091 with SMTP id d75a77b69052e-52df5bb188amr233708771cf.41.1787572565644;
        Mon, 24 Aug 2026 04:56:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1a84:b0:51c:1967:5091 with SMTP id d75a77b69052e-52df5bb188amr233708231cf.41.1787572565084;
        Mon, 24 Aug 2026 04:56:05 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:14 +0300
Subject: [PATCH v3 27/47] clk: qcom: gcc-sm8450: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-27-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IIxFBk6ES86W5Uht2UYsLFSa4TN4Ihn/e3MF0K6mvIQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDv1V5Ivi5Z2KJAdZiGa2l7TJkKi5AxcX7Ye
 agzexaVtGaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww7wAKCRAbX0TJAJUV
 VvQND/wIzRRtFggyCxCkwF+PHSVCPVc6x8xhWMitauR1FU3B2oe6xgMOlpUB0PvCCR250VOiUQE
 Yti7Xq4JKg8oy0sKmRFAWFwzAfzaC+LEJLyGqK/JCvJdLhx0aCAGyaFhUqFlnKClbgMdJf6F8Vr
 Og4BtpMqrYD+bBISRmy+3HtaoqAgNkp0QOJcI8S/mnr8+N8EVLNkQP+oDI8eoWIeqp1q3cVgPBI
 ImYgwhzNKiKXQwhZUfLb+FJEl1QubjNZ5oykFWPDzy4sSKmVK4rZ9fvEESZIUX9Tx3BuJ/xQxd5
 cRlyweXccgy+IkGGkDjSHGCJTGwL8ZyRHbECGfs3fbvQEKHrQt7tceXCW1hBgvyCG5WN2bLttup
 n3GwEm+TNOPQHdqwLd/d8m8aAzuWSUKo1dPOKvaqlSJjSIlE+zON49g2VMspLF06reFm+WQbxcy
 RHRq2aIGoz6KUSibfIBeRm4hewawcssYoFbaIO1haoloUu+XhpyeanmR91kZRoi9oMj5IQ0pHdO
 gEmNumOyPjFFB0oulaSA/zMzJDRPYP6YqKaiQpgBdk69qUmA3rU2x9cvUEMRxAZW94Nfw+VMDtr
 ZLkn55HRoQOmAGZk88eLD0UqFwbXmabC5zkRHXoT2CuFDkJXz53Aa6Dqa/ERMHJtqfJtwNvHStw
 DkmsH2SRhEb1xaQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX0G1oDoOcYumv
 LdoYrJKy7IZH3d2GgT/FgDj7C2VzQBI/YFonqMHDgjUpEe+O9gBu+AYHMv/JG02TXtG32EhiGQ6
 weloPVo0dg/8uBOMtrsfGYAGsG74UFc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX6WgUxI99xTdQ
 VyALy+BnLhf0cyK5LTLtE2OC6zJoKkDwxIM/FP0TZIEJrm6u1alkFzaEzFk5cT58RLHzXjNAjKY
 uBY5rkGL9bw4/vh3FdehFLCB8EVInMIliS403t8wrVsnld/XUnSaFtIImMkilCkvfdAnQEUcj76
 /RWnjL1VrAL8JIPXK/249QKv2uBmsaDiIUJIfSiSMWvmNEtXqzZ/M2Gpwh6DERpMOK6d3vPB/Tn
 sNzAGeHn7fAujMudGBLAN7/iZTq1pkLHE3WQWpXoJR1arNLt11dFt6IkIVZFoFlbSFjcP0wf/OG
 05Ery/vghSJDWn1+3iOxk7IuCSWUF1LCTQHeSZaaWMRUl9sR/f4U51//o41fo0iuwYwUyIZLkp0
 wOZmxDa9x0Q0DmHx6x0qC7iG9BpZAtY3RpzeUC59+PB0YZHNJRYRjserOufluqCiWACco0fqC6a
 0ZjyscgpdhvdYXWXRPg==
X-Proofpoint-ORIG-GUID: tsKfZT-JenHPgjsmwl2S2UJ3IXDorafE
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c3156 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tsKfZT-JenHPgjsmwl2S2UJ3IXDorafE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..b3ab458048dc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3399,6 +3399,7 @@ static const struct qcom_cc_desc gcc_sm8450_desc = {
 	.resets = gcc_sm8450_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8450_resets),
 	.gdscs = gcc_sm8450_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8450_gdscs),
 };
 

-- 
2.54.0

