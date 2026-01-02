Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CC1A9FBA
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347045; cv=none; b=spVhRkQ1J790n2x4YNUKT9IZS+rt0fAR63wh2u4rFG2MhlKo1zjYTCSIfTm/RXvhF5K6WoWlv9MeC2cFvr8oVJoxP5U+9Dg2PA4zY3UdBJccxIGpGe0lSR5JBrIEn1Tpvb1QNScfwsbPgeVwSEPgEFDK/hVK5J83eVHUFpRHstk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347045; c=relaxed/simple;
	bh=FqGhFooRf3dVZrhD2545Nbq1W16XkG+oIz5X5zYASlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWnEMBfARLrE4CjfQgS+xBTubIi4QPnjnF+QIBbWiuHjbvS0dSdlp1MMioxyutu4+iAl7CpAIaWtAdttplWpkQOf+HLJ9NnkvN7IgxcAGULgBqkpksJm2j6iAEO2+0aYP323JgTuORVDMP740H8ZecNH8HNcGMgXxgsWZUtHgQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pStqnwwa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mckp5SL9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pStqnwwa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mckp5SL9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WQik810053
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 09:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NO2ywtEGxXnmmSDCb36UkShK/n3vc+3TebRaQCb+gY=; b=pStqnwwa9UAMD0FQ
	9oEvOSHACcwjer3xAJHDXYyewB3FMs+J/xRaN7OboAI28hq0wuCWWusHc27upbcc
	i+ia8KL2BzUxQu9toRvcT/LlPcXEwBreoonmbkZKnRWFuOwwRPZPt4GV0I6OxaGq
	Qw9FI/Q0+wyfSIurs/15DdJgcQ4JKOQueelUCyWNyD3gbruoiJXW5bShf5jr63i2
	6ZuIEVJYN9yJ7uAG0e7wJEDYC+XDBSsvoGxwxGNVmygNlJGVvjNeGDAEZ0nbGq+D
	3K6zeNPEsv5FGkcedtPPV9gKnsXopJwvV5prAmjnW46DY/CI1SAezv9OVyyUowpK
	gpsWiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6am1hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 09:44:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a08cbeb87eso194873545ad.3
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 01:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767347042; x=1767951842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NO2ywtEGxXnmmSDCb36UkShK/n3vc+3TebRaQCb+gY=;
        b=Mckp5SL9I2LJXqUrUkwyWaqy+kNkAB4SzoAavslFPIboOt4BxPjk/+Zw+6ENlEh6xQ
         tsQInp9YH8ET/zGp9//VKFjrQqLdSwX2S08hJgDI4m5T+bxYCpqGMibpyzAnpfD8W1eD
         qe8AOjgS4Bwvl6BPVVzvCa+wTduIobzcMx20sY/nwTgAUmkBS4rMREhvuyj0t7WZG6EA
         EYJ3YkqddMgXGSxwUn0leO8Y5rlrcHeFDanCJWA9ur5EvT5nxVbjmfw+0FU64t8jnxuC
         bLg3KZNQ87FFpqKKkVSzdKutu8hth9WAwLJ+T7rp4EFwFCV9X1MUM5QbaoBV5T6bDBka
         w0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767347042; x=1767951842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5NO2ywtEGxXnmmSDCb36UkShK/n3vc+3TebRaQCb+gY=;
        b=GFzYHSVLJ9plYxO5u05CqZKXUO1+/3mqFUWQbZ8CVDfSw5+9VWNnkxJRsbE+b8FEJY
         fug4MSP04Kj+nEuaFzOkltA6WXNdaQNc4CeG0MorVhLtbAv2VLnEJtGh7xhT+jiJqcEY
         AUgpXSMkF0vCu/tShbqkIWmkDErIBw+z6NnCn3OxXR5TUHOStknu1pyoD4i6qm7GAPhO
         0iweN/7ZXKR33myZ4/3eDPSomNAHWeLIKdmXt49m3cHhobad0IGGEUG6YVwpitX/ZPas
         5HZg8wRxGlk0Fqg4Zupdc6mDwhgDGc3fZPgUIHhrOJRUAmaLC35h6VZG+/tU4GG3sjEB
         NvOg==
X-Forwarded-Encrypted: i=1; AJvYcCXIm1BRv/rv45541ghA/8wiuJwxz8WXfrIREcKmRze4rQiMYQB1SN51CXMGsdnrghvTCsqfFvn7Wco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4oZOryj3jMNBTTq03MWXF0OQn+qcAqPTvsY9PJS6TMsNpFI93
	F7eDexRmnnyg/WF1ZDxmtEqZ5+xslsaE0r6oA3ikDURoLikxkpsN0UAZEKnoHI60Mgh4bGsW6f4
	ljE5Kz9I4u0mT2yRxs0l56zYOAI5RodCgo99wkLfWZ1SKhEWbHbqFkVnLu2oXQR0=
X-Gm-Gg: AY/fxX5sRj6PyF2CIQ0p+3CoSIzp7rFRP7mK+rjIkPDKuJGuRHQZsHPk8QpG7CMgJQu
	SPBdeIVkVDHNCWo6QVnjwstU4B4GjfC5AxZw5uFqv+T8l86/O/jurkxSXbujKOOtut4Fw6Pv5sa
	h8Asbev60TMlIPbSRjSJOo/Op3BAntskCxo7jUOGqzQJzVx1dFYG0+wY7CNBrkUH3c8/coEy3bB
	PXu/LXeZD5pP0/AsnUTr7mAA6Pdrj4COYD3hMEjZmhrLlQlO7pnA49fS+Pw8K6vYH8hohyBEKtj
	Uf0V7K7J5koODOjYbPMJbOPhD59Z3Xnh6H/lUaAlVMXNzadkVOpde4XXg6SSv7dA1zpSn9MKUTI
	Yq54B/zUL+x0BZ9TBI49Ih9t8HvDEH57iq6+Msuu7RmUu
X-Received: by 2002:a17:903:3c50:b0:2a0:9040:637b with SMTP id d9443c01a7336-2a2f2423178mr429122615ad.26.1767347041414;
        Fri, 02 Jan 2026 01:44:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlAfJ7GPX4WaV02+Q6/Jii6uP9NcsKWMUgcvCnfmuvI0T8Wm1INga2Wpus+2H/d/9fftVldQ==
X-Received: by 2002:a17:903:3c50:b0:2a0:9040:637b with SMTP id d9443c01a7336-2a2f2423178mr429122465ad.26.1767347040946;
        Fri, 02 Jan 2026 01:44:00 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66829sm376154255ad.10.2026.01.02.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:44:00 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 15:13:07 +0530
Subject: [PATCH 7/7] clk: qcom: gcc-kaanapali: Do not turn off PCIe GDSCs
 during gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pci_gdsc_fix-v1-7-b17ed3d175bc@oss.qualcomm.com>
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767346994; l=1214;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FqGhFooRf3dVZrhD2545Nbq1W16XkG+oIz5X5zYASlA=;
 b=0JXIyA4A3ptKPWqvekt+GnVKHf05nsknUmZQS3bwYlx7RZdB5HqrDTuiGBpawaWnuJVCJESLO
 OzZ1UrjVbwMCgUpJFwHuHXOsShb+Dx+bp8WIM9psPB8oH6XFa3tR9P5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: Zn9ks3hIe67-XHsf41oBgqNFS84Ns6SR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX1BaaqzX1EGRM
 Phqjw1rfi3in2MRBkyVGCO2DxKmKyLgzu5OUfcOeryz3qPnXYK8h0dH3e1ezXlFiK436I5bnz3R
 nibP7Zfy2AhVOd87yLL/i3PuV/cVFEKA8OR/aTaE3nsKnpF5eVB9VvB8zfolY9GSnr7CvzLf252
 /X2TWIad+OS0YU7fmQdFpuRYEeBQtyA6WQPuRA6jCp+LiRFmM4ramqsO1238TXfSnUhVXywgE07
 nIRx+8YFOuwQNG9ADEXY9SoC5NZiGANpW9hQ152DFoukMTR0EeXcaUy2Xkbz5TUpA3LALyG7oxR
 mDftAUjHht5ihOaxbi02eb2tLgTNX5DxqHuPI20Gagnfnn+ldfFo6IfMGCVWsIipcGn1OgiyFUR
 4ZGlpTyBRgtO9qs6bYkP7uZZDzRCgIzxzq+TIRll6v4P1/mMSptr38ziAFJqfXFQJlOjYHmbHUk
 MiR+q4zZsG0PBnwaf/A==
X-Proofpoint-GUID: Zn9ks3hIe67-XHsf41oBgqNFS84Ns6SR
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=69579362 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ByFm4HHrRE6C6VNyrcUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Cc: stable@vger.kernel.org
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 182b152df14c252035fb28adb2e652bbfa22114a..1bae1c9dbc7764996e7c0228f9fab72d5e630cfa 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3141,7 +3141,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
 	.pd = {
 		.name = "gcc_pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
 };
 

-- 
2.34.1

