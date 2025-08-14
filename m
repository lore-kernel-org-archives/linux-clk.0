Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA81029D262
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755194358; cv=none; b=Bh9EbcaBxhaLYnLSqt61ApFHepUAPrhJYz/nCuCaEWRBZTbCVI4dut//VXGzNq9unvvDQxuTgYnEOegZxuQ3H/6FOKx/eIgjo//fEffB4BcuG6+wW8a2QOtjZCA5J1DPXMIKKyfAEhvq3w0+2nN4cqdlsPQ2u5B8IRnByeoApNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755194358; c=relaxed/simple;
	bh=JS9t65y1Tb1O6melp5jomNPznMIQx6bnOe95kV9Fp1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5NNaaks2P5gdn2XsVwuuikq+TipCRYNiI7jqVfYBtV46AdhXbTyyX927tEdxOhoqvK3UYhOrvsJRS+77HA0+AKKxr6BuehvEG3hMPIiW2S3c9zK+MZWpDAwdGn161Vc5YqSgJlKHXvdM5RjuS24CZ7IyvoHrtfGCYovoQ3dXbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iH4Smz27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iH4Smz27"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9OAAA011435
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 17:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LO/W9ECJNjW/7mTqzpbQr9aX5cekagiWhhTTCfpUqyY=; b=iH4Smz27c7c6v8fC
	gd4IJ4GLcEUkrrX1oxWoEATx0vco95d3li0XOYATVXPe0c2hX/cjQQzzkwe9wMV3
	joDkba9hfIDuOe5X3SAs9c7+P935nusLu98V9W21ADk5dfZrXg4xKdZS9bKrhfIh
	XSVzFp8mB1l0WA1Z2C/vZGaHIXmev/SOnW2Zsk5NNllWmWDzUMqG3Sv5mH7fC9zy
	w1quCsa6Jc9s+i1bFXXdm1sWyWu+Nvs57+Y/Ovcf5OpgvwsjNIR/2rc0cF+wLRZO
	2WtWKVwOXHQXVUem3lWGCZPGHLqaGz3Sftt7p47Bw03BY982V4vGDJtzlBoq+j5J
	+uHwpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9ys20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 17:59:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce13aso21140365ad.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 10:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755194355; x=1755799155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO/W9ECJNjW/7mTqzpbQr9aX5cekagiWhhTTCfpUqyY=;
        b=jtXMe3vhAB3UFYkPSnSpiarFlxeWsOrwIG2wBVLPewkRKk0Sb20xJp3Z4pfLllYKzs
         GkKJE2PqVAThtWIta968FVa/Q09e37lvzRowt45X3+AS2dnWsjWFrtENHgvlkxmIN4Lq
         uKtudxK7CT4D2ZfRL0OyoZ49zfLKb1Gs3z4//vQi4MQeK33d/xAKKttjJdX06cOCxl2G
         qOFB7KawZvMWTGf4uDVUpWoUhQIfUqdR91XWLCZv2O31GSrnVvgh7AUZwKPFXv0dYffA
         NKv96sMU0gRC0LWmAYePCUY1ad9iIvZDG4gNJ8vm7PNbOH0FHea1qBfzPVQ8iW1I9RWR
         j/ug==
X-Forwarded-Encrypted: i=1; AJvYcCVPaYy3jKSKFzLMSwsdq2NTnpF/4D6Myls8fMVMbiETE99I3683bs8sOJc0NeNZh/vOomyZwKAfQ6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlYlrQFL/ifdNs35kUYLRPXixjXBSo6faOXKCnSXIaYRs82xb/
	B9eOs/tigSXu2kSijHk4JVt7VZ51OOCWW/Ub9mK7TFB/jGoeQgpYck3MYc0AtDMr7vtjrz8ftjp
	0BhMEQkq5M8bvL899t6B5CEVpe6vQJ0yVNItZRqu+iXzolyI4A7KIIZptTW/qPog=
X-Gm-Gg: ASbGncvMR5LWJSeBmXzmXkZxmw4zLlUzPMoQRAQfo2kdWbzoZEAIjswPZlUy73khaSD
	2RtIUkCrtNJTYocpPp9kXhexqGR9N1xPB+21MlB/T62zO46cU81oOrYy430T/efm0iLCtQBpKv5
	gHtyCgD+VP/5FJC45L04MoKX7hdiVWPtQkYHUPbPykrLfHsOHx5Z7qvcqiWjrxj33Vu5UgxtSGQ
	O4yAaV/YghxrWkdltSAqfWOZN+O1S1wHji+QEnlhaPYTTOSSABoTK0OslVhdlVbTPCBRDfq/Mv3
	HANqr+k3f94UJRJh0oW2scLpkCwb/OQ+Uo0xY3rG+pKW+MJA00aQMMctg5CduaU9psFr
X-Received: by 2002:a17:902:e78e:b0:242:460e:4ab8 with SMTP id d9443c01a7336-244586dbc4dmr58553145ad.46.1755194354943;
        Thu, 14 Aug 2025 10:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIklnR5m9SKzdIwzPoNhD2QB7ecbzwEviH7LYbrbwUTVp3FSf4QzZ8WYzFNV2mqkqnebnf1g==
X-Received: by 2002:a17:902:e78e:b0:242:460e:4ab8 with SMTP id d9443c01a7336-244586dbc4dmr58552725ad.46.1755194354475;
        Thu, 14 Aug 2025 10:59:14 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef595esm354448525ad.13.2025.08.14.10.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 10:59:14 -0700 (PDT)
Message-ID: <657a4915-fc24-4e6e-bd28-4e122e66c97d@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 23:29:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] dt-bindings: clock: qcom: document the Glymur
 Global Clock Controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-6-a408b390b22c@oss.qualcomm.com>
 <wttnza5lagqzda2qxeyksm464mmzycp7vwcwzrwynx7mmounti@ex7pbezr6eiy>
 <2ac5aaa8-18ba-466a-ba67-8212daf9c3b5@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <2ac5aaa8-18ba-466a-ba67-8212daf9c3b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689e23f3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/kiP2gCwObMqexHosDfpNA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=_CSq4AhyHEGRIHh0IXIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: RRwlV56hDXr86Rex2YAY0-pu2OQBJEkZ
X-Proofpoint-ORIG-GUID: RRwlV56hDXr86Rex2YAY0-pu2OQBJEkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX0qjJo/hbBiNo
 ry8LDSNZwiaJHP667npoxLkR3EJ+EvutnomV/UwnMpXZZPoqwTO4OtWt8l1Vi0Zv3iFlz7dqgX5
 /52qI/JChTpCRRajZrx1zdkUuU5SbULwioTJpg7atjluyCgliU3pvTHLPBVLvbLp4k+piW3IV9b
 B4fzn5ZJEVzNby11+/ZkIkBMoOXsEZwae7cBV2ppCGngpjc67QLyZDDDLWNcKKbq6vfO3m8MKNQ
 QQmv0POapAbU4KJ19IocxG/IpGRoZE22aKWPzLnrBw/BEUMsAz6PFQQ555LSbniklp5C2x7hPtR
 XXCEEFnM+wdPg8nd+7ld/gFvKbWO7z74cIsZBGCMb+3EvmgHJd8tF7ODTQG/Xh0Cg4V2v4AS6H+
 ol4J4ByU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164



>>> +      - description: USB 2 Phy PIPEGMUX clock source
>>> +      - description: USB 2 Phy SYS PCIE PIPEGMUX clock source
>>> +      - description: PCIe 3a pipe clock
>>> +      - description: PCIe 4b pipe clock

Bjorn, will fix this typo and the below one as well.

>>> +      - description: PCIe 4 pipe clock
>>> +      - description: PCIe 5 pipe clock
>>> +      - description: PCIe 6 pipe clock
>>> +      - description: PCIe 6b pipe clock

Got this extra due to huge list of external clocks.

>>
>> When I look at the documentation, we seem to have pipe clocks for pcie
>> 0, 1, 2, 3a, 3b, 4, 5, and 6. And this seems to better match the clock
>> defines below as well...
>>
> 
> Bjorn, the PCIE 0, 1, 2 are connected to USB4 PHY 0/1/2 pcie pipe clock
> source.
> 
>> Can you please confirm that the inputs you have listed here are complete
>> and correct? (It's not going to be possible to add things in the middle
>> later and adding 0, 1, and 2 at the bottom will not sit well with my
>> OCD).
>>
> 
> These are the complete list of external clocks and nothing else is required.
> 
>> Regards,
>> Bjorn
>>
>>> +      - description: QUSB4 0 PHY RX 0 clock source
>>> +      - description: QUSB4 0 PHY RX 1 clock source
>>> +      - description: QUSB4 1 PHY RX 0 clock source
>>> +      - description: QUSB4 1 PHY RX 1 clock source
>>> +      - description: QUSB4 2 PHY RX 0 clock source
>>> +      - description: QUSB4 2 PHY RX 1 clock source
>>> +      - description: UFS PHY RX Symbol 0 clock source
>>> +      - description: UFS PHY RX Symbol 1 clock source
>>> +      - description: UFS PHY TX Symbol 0 clock source
>>> +      - description: USB3 PHY 0 pipe clock source
>>> +      - description: USB3 PHY 1 pipe clock source
>>> +      - description: USB3 PHY 2 pipe clock source
>>> +      - description: USB3 UNI PHY pipe 0 clock source
>>> +      - description: USB3 UNI PHY pipe 1 clock source
>>> +      - description: USB4 PHY 0 pcie pipe clock source
>>> +      - description: USB4 PHY 0 Max pipe clock source
>>> +      - description: USB4 PHY 1 pcie pipe clock source
>>> +      - description: USB4 PHY 1 Max pipe clock source
>>> +      - description: USB4 PHY 2 pcie pipe clock source
>>> +      - description: USB4 PHY 2 Max pipe clock source
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - '#power-domain-cells'
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>>> +    clock-controller@100000 {
>>> +      compatible = "qcom,glymur-gcc";
>>> +      reg = <0x100000 0x1f9000>;
>>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +               <&rpmhcc RPMH_CXO_CLK_A>,
>>> +               <&sleep_clk>,
>>> +               <&usb_0_phy_dp0_gmux>,
>>> +               <&usb_0_phy_dp1_gmux>,
>>> +               <&usb_0_phy_pcie_pipegmux>,
>>> +               <&usb_0_phy_pipegmux>,
>>> +               <&usb_0_phy_sys_pcie_pipegmux>,
>>> +               <&usb_1_phy_dp0_gmux_2>,
>>> +               <&usb_1_phy_dp1_gmux_2>,
>>> +               <&usb_1_phy_pcie_pipegmux>,
>>> +               <&usb_1_phy_pipegmux>,
>>> +               <&usb_1_phy_sys_pcie_pipegmux>,
>>> +               <&usb_2_phy_dp0_gmux 2>,
>>> +               <&usb_2_phy_dp1_gmux 2>,
>>> +               <&usb_2_phy_pcie_pipegmux>,
>>> +               <&usb_2_phy_pipegmux>,
>>> +               <&usb_2_phy_sys_pcie_pipegmux>,
>>> +               <&pcie_3a_pipe>, <&pcie_4b_pipe>,

Fix here.

>>> +               <&pcie_4_pipe>, <&pcie_5_pipe>,
>>> +               <&pcie_6_pipe>, <&pcie_6b_pipe>,

Fix here as well.

>>> +               <&qusb4_0_phy_rx_0>, <&qusb4_0_phy_rx_1>,
>>> +               <&qusb4_1_phy_rx_0>, <&qusb4_1_phy_rx_1>,
>>> +               <&qusb4_2_phy_rx_0>, <&qusb4_2_phy_rx_1>,
>>> +               <&ufs_phy_rx_symbol_0>, <&ufs_phy_rx_symbol_1>,
>>> +               <&ufs_phy_tx_symbol_0>,
>>> +               <&usb3_phy_0_pipe>, <&usb3_phy_1_pipe>,
>>> +               <&usb3_phy_2_pipe>,
>>> +               <&usb3_uni_phy_pipe_0>, <&usb3_uni_phy_pipe_1>,
>>> +               <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
>>> +               <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
>>> +               <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
>>> +      #clock-cells = <1>;
>>> +      #reset-cells = <1>;
>>> +      #power-domain-cells = <1>;
>>> +    };
>>> +

-- 
Thanks,
Taniya Das

