Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F60136212C
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144030; cv=none; b=N+M9HRO9zYE3iFQcyxawRCKTEhY2AuBjXY+29DxIoKfwCZDH1+762tX+7fwSlDPZj4R5z8efdhMtsd3J6VSkzZ+V0U0JmpbVkfCf9HXFtYMtiiE82appiuqtorHB339DRDq3YZDuX3PhLY9mWRcOXHs13c+UeIyRxGDLj+jsMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144030; c=relaxed/simple;
	bh=ofaOcaFEo5VEe0WMa48AwttEJOkWIiAPj9t3Vq14JXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKeltJspvuk/0cbAI4/YSip+BEPZJSf595v8JePaNjEXNbJ8VyfKStqOGw+OfmXTrFt4U28p5bUkdPNM5xdXsFMs9DaNbzeB0X4QVgavQVPDASwtIvKUvoLKqMtGpqlPgCl7GNFTHLtxB8jF83kyAMoWsFLSDC5Kct8Cna9MC0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLicXt1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOcaK026; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLicXt1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOcaK026"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClECe321529
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZPEYEYPf23oSgx6pACDahLtv4Ld0Kzo45qAIrz/EnE=; b=ZLicXt1c8rAgrRFm
	nfZ2fhoSay1IUP9gjNarWWRXkeeVd01qta8JQf4cOGwT8qDqefIloUvnl4PD71js
	BJFl+bDUV+8OB9Cp7ZX3+pB60uOz6Iu8gQSd8LooO5NtzbsVDslhewi1+jtvQNPp
	UIKj80EBMhasPX41Tmc4TsP1SEWXteXw45OKqQFcrA1/tERijFOQtZUbJ8r/zGCX
	jyUxYzJuoA0cIR6qgW6c/U27zXBe3KhP59Xy0kYevXZfw8mxYKCCHGJf4nfwu26+
	xjN3KhIsnpBCqj8VEMsGTcWsDEcu//KdCmRfcF0EcaBBiN0rFQr8h0NZgdArGOkN
	X/vuHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yftua4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso185533085a.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144028; x=1787748828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZPEYEYPf23oSgx6pACDahLtv4Ld0Kzo45qAIrz/EnE=;
        b=gOcaK026jIG5w+WbBKZWKtPOIklt39wq+3Xg+2pyWP77g2f7G16FWlOZdHfiCse5oA
         K3PqevMtxJURDZRJaCAsSSYWhJbMz3McnVKNfQXKLErl39FENJl1NS68AmBST3NoR8wU
         wZPsrC+srpRcTIC0to1wUAWPHKNq0rFtkaW5+S7J77f4h+oqlwmeklSwK4V7G9s/pGXq
         3V9i9wEzUkfFDkiPmnRaNdUm4gNleU4MqZpxmHpGEFCAjJOLgJxm0vgtQlR7hCNzmSjC
         6pmcFbOC9qrGrsvVO3xxdg89sm0yet1/13YPm0asUPfnQNBCCAuGzpMbhATxTNJLxXgh
         kfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144028; x=1787748828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tZPEYEYPf23oSgx6pACDahLtv4Ld0Kzo45qAIrz/EnE=;
        b=QX9v1kzMBpYjL/X3Udcd7gZUiRn42Yp+qhS2SSNTdGOjjFzK4Ss1a6ovm3Poy+DqUF
         1Rit8lRWYWkgHFUVhZ+/TxAiJJYmRleBprAuQVNelMk8I2VNs55LxvWyiKh7SqWrfV2K
         DGeXZpQvw6W8Xy5e7Urdp1gVnxXmO+Bh7g01XgPHki8QgTmE9lkgLA7w63LlWToBOmqJ
         6+vVV7km6/N4G9wXZZyDnQBQWsKmFbrRctMq/ZGmh1cJswNTgrRcwpFQtSYWKS6Q1wMA
         DelDLtg3tAk5htUcRgotnE9g1j+GAwg0C8AWAg2nrG16tZ1QyaOkKnfXecPAHSb7K6Hd
         BRfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfHujo6QwTll0c6RUgJNIy69QJ7/pRx0Nl37RL66JjN0oCIRkD+nieszX1vP5xM6jgGK/SN+rOSE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMkIGEBA7LqsFxydxmEE6tfMLbRtmagxfME9FgXpEg0elSaLbR
	SFe15jxi32C8VjaKGzGQW9EnAzWcCGZkbT0//RTq+KM9yCUGDkiKt+QaELZKGkEriKJh7drZuZu
	PIUzWqMgzLV5MNthHGlw2RC6NDnZE7ker1SlX1hk3q5W59AyblIc6KzEfjs68/Sk=
X-Gm-Gg: AR+sD10HIBDytynYfG6czs2cidcKrxQV1T80nwjsb7N5vCPkCPfFhq7amZoQpoCZdNV
	SZzuQcPguHyaQpIW6qC9g5M3WNsSoGzAVBQXnVpM9vpTN2EDefNwVFvzywVN8zlEARc76jYTPmY
	HvvUxK3yQ02+1nT+v4EI7+yxQBnlphE0gKwlG0SF/Y7WO0WBMaok7FqLwxSZ3TPc01/FlVMiygN
	AwRwDUONt096PWVLR4gunYoQda729vpxDVXb3DtHLq2XLPSYMmGs3ED/6AdtjxyJpMqTljTetuc
	+m1F0vbIl/pOtuTj9lehMb+mDRNAoyoO0c7by5LdnUT9nYpvz1BQtGv+Ory64isJUer2vDCSfl4
	UwKVzNzf3
X-Received: by 2002:a05:620a:2b85:b0:936:a072:d749 with SMTP id af79cd13be357-9371e2e69dbmr410802985a.23.1787144027748;
        Wed, 19 Aug 2026 05:53:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b85:b0:936:a072:d749 with SMTP id af79cd13be357-9371e2e69dbmr410796585a.23.1787144027209;
        Wed, 19 Aug 2026 05:53:47 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:59 +0300
Subject: [PATCH 14/16] arm64: dts: qcom: sm8750: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-14-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ofaOcaFEo5VEe0WMa48AwttEJOkWIiAPj9t3Vq14JXU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacq8k0ernJQldynpVkH4+/C9DtsD7XYg7AD0
 ZIdKR+/OMaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnKgAKCRAbX0TJAJUV
 VpJmEACvo6w0RGh9FkkMI0Zg1pIpHu8GByqpiWTPHuC4mDqCj1Mm+V6BuPOHrYWkyUgDKRyuMUf
 YKeDR+79gzWCVzBvw1DrWxcRUnlSLoxO4vE/7aNDbIPGxCOxrN6vBQDeRYQ4Gim1JvsuWgc5Yb1
 bMhkJ8OQLVUCncisB807qIsygZEV6gd3yrHAxdcqGcj0RU/wKCwpq6uaXyvZIG+QnWeqDBago+H
 kJfsFKVTN2B5bbY2GgQXZvBdbj1KpVk1S6kjibprkGgb/hnPo2DTXpzV52KaHkja7RMKuXPnwqR
 HVFmuz5CPrBUsZhqBpQ6Zf1e6kZR3AmI8AMzsz77oiLYDznz3SQSfPf1gJ8USySn+1gKZzpAkGb
 7qjsqnA4BKBDob2XN+hZzH8Z4mCq+3l04vvKrEyWKqvJgfsHbtGG0HCaxm5KqpoMZcUCnT2T6YF
 bFCJmr2X3s/WxlY6Q9Dvyc9doAhK8accTeJRXEjM1uwKSw1UFZSzdz9M7HPM3PRQoIA+ztgrhML
 w0h3hkxwGz3oYUR+fLNqxKy13MSH+fGxrUgfFvs/XFvQdvbx8JvYtxTfmWpuQKx/b/EEmWQiuEi
 G1mA40ZmKSy00BUOF4qYh7fWKea28Q8Bmd0PAeMLfNs+8sdQlCO3Puv/4vKNHwtS3KIWgCXJGeu
 i87YXwJHHWiN9UA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a85a75c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX5Z7iW9UpGl5F
 1p7w9ni2i1p5u3U6aI3ZlYCaq8B6x5XFDQJ206RrKMHUvF2FZJrjTvkWg30tkqARrnwJ5eYEElM
 XuHCI0u4+N6k4ZFYORDicWJm8mGeUTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX/nbDGbPGubk0
 u1vsvd5WpurjQ+rvPL7qyQchCF4+rfwKVKpXJ2OLiWu6RtpkSPb6D9bnIQQ6H//B4g5a7BWN2yq
 w2egkD9qvx48983dcFPx2Qrfiuke/1+LaO9DBcKUH4emLlJ9XJ5sLHAAtte7XzXVYJFhcfY8Q+k
 YbRcEzTzBEM9ETV4CrkKkGGD3yd4fy1p76V/P13ri8BH9JsOYlASrP5qvA8TOTuCv+hHfqteR/J
 qAPzcl705Hou/3RBX5NKs2IVF2Wujf1SU94WS//+eifCnnjSHro2HPALXB5M8DjxjfvHgwNG81G
 ia9o6hK8Se+27prW+bYIIeY6SV/2TP6lIj2iH+fMP0BLFzNpUyGm7fQSivEzhIzvcIAAX0qT7aO
 JX5dZYek+LltlIq9h4HVDRt0UNo71zdaxLa7gmMVaT7wB+ZS6A1BwFIFssW8tUQEIGXbfqF2eLZ
 XGEwK6MRjH3NSwMXU5A==
X-Proofpoint-GUID: 7lgMVlgz-Er3RlCWhJunJ0xoxGeWe93r
X-Proofpoint-ORIG-GUID: 7lgMVlgz-Er3RlCWhJunJ0xoxGeWe93r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190100

The GCC GDSCs on SM8750 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df8e..cda18d4dc6a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -676,6 +676,8 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

