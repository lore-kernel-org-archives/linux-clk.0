Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A33A1CEACB
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041515; cv=none; b=IgfigjszeSII7uYE49iYZWcomZ/S04WqHqgKPU9TjGQO1/F23P+RCtIld/OYMfAMHnzgdE1Hnm6HfW7hw9xo835Agow1mtKI6rdHvPanlXlU8W6uUBxNcLoLePSd8iTDWP/y05rbivCTBrj/RYZXsyMB+LfUNKdXtp7YiDsEvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041515; c=relaxed/simple;
	bh=C4i+82VCqawXzba10UfgLVMnLpSjEvh/T1+KBY4EWZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJqibkPl5z++5V5Kocxu5dvX0Aio21DBZUexCWz51IUDARAIqZbLsA1M0Yw6BQMOL0HyYc7+ujIM+CIBdgRN5BvUv00q6Dcj4l64cLEMkAm6V2F5Pq+9NATGBrbexHiDPONExldNyu0VHrYBNvgv7LXX5qnbytHZsHZoE/v4Nk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSO9h00m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSO9h00m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC2MhY017801
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=; b=WSO9h00muASik1PG
	hgjJUhe/Z5R9kzOcFzfY0VkTeXu//fkoP+y+ArJjBq8XqZGBmWanNftm6dETR3WK
	lwsl4p0ShctmgOsBSaRDTYA8yHarihKHhgjcEPLJCnKBirw39trtgV2nq1Kbaf51
	VekktYj86D8jrAcpKE5f+6Nj3sPc87YAR7pzC0Y0t4kQxSbpUXkOILS2WI8ocyQT
	LHWfJC2OxUlSyDUq8kNQHOWPmTMkHlfor2tCPzTO5+OOiT8kk8wFWCiQzwIP/FgX
	4kgAd7OTfUr5gXUH3kUZm2vddnj6PIVdbr/p04B8/LiMWbtl+2hlR6lpfC2Iv64L
	P45v3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5rrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 16:25:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ea727700so29806085a.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Jun 2025 09:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041512; x=1751646312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3K3ulOM8/2gxiv3n1FZOLEDC6VhxDRLLFSUlDuxiVZ0=;
        b=U1JHhhHy3GBdMOuesURd08sZlp4ThuIdiLk3d+YZR4Klz1N3UGLgjTAjLSOuMrHQrN
         j8uOyegzPA+JZH0o8dfgpfQUHe/GlTBM0zh9CXVDlGwqv6abHIJ3gedmKxrLPo3s5uHO
         Cal9Pn1GS6kqavE6hQ692LnWj/xqG3ilvxq1dw1Xsxv1zbGnStWB1Fz2CIKsLfF/rCKs
         jT8vhsJPb8O/I3MfIH9R8vyt0R0v+ffQ+OXkBrprOxjMWCTBVgquVDEapbJsZPVJaJHX
         kNLkkNvuRUOPs1zZ4DhrjSRuNgmOPqs8pfMPel0gXQq8G0cnfEnTRqfswmI72Xyd0JUn
         WjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3HyseIwr4EVn0mfd02q1XOzjt6A1ytdM2HVLwK5y8p1Nw5rJPms/jX4jLEOH6sicvGrX/tSimwmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4074RlK2GFw7XahIjqdsi9kowC4jB4Vbse+4U9UirCBhwV7Pm
	/sJaT0kzb66ol61raRfNFEDbnrnzt8vejcEWafJxfOI2+smNt5N+z/5sidQFr+DLI1xnYaw0OXg
	LwKjNe4q2rha/dtGrzbFOd6nmXbQ93G7WfvALh3Mb1J7WKAs9pSeKDrScX8ee8k4=
X-Gm-Gg: ASbGncsmvrAa7dq9Bg5fAgXgyhkbc+QJ/wZ2KBUuBcAg0F0K911Zhv/YhNUTIBLnXvR
	AIL/MzoLKhftyDP1N1HciLBe8xYcY1cWEwmmI3coJqWkQXTy/VdFOSAhemFA3cn3QO9HybQ/b42
	AMEjOjZJ+7OEsDNo15PiGyCtNG/DDZGaPNoUc6HClJn9RWwWhw2Rl7Uw/ThdV/dxHI+JUhnfIpD
	Y+h3Hs4ZWoAnEUOFFLpsjktG8oAvvw3tACLBUeytsXKuMADEWsFVWVqeAWSP5QJXbTp91Gac0K3
	YtxxEBV1v0Vya2cIgbBF8IDJmtZ9Jq2SqPV4nPzppUtDBCOO5HQFUIloyYo1gu3szQN019g5Cx7
	OVRo=
X-Received: by 2002:a05:620a:24cf:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d44393cb0emr186173785a.7.1751041512192;
        Fri, 27 Jun 2025 09:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF07xy/DeRmmmedPMJULYDxGN/26ma8lCZYySazHvEfgzdLyxgZdrRzYmMNDCeah7SlE5mBqA==
X-Received: by 2002:a05:620a:24cf:b0:7c0:b106:94ba with SMTP id af79cd13be357-7d44393cb0emr186170585a.7.1751041511671;
        Fri, 27 Jun 2025 09:25:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bdafsm148417266b.143.2025.06.27.09.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:25:11 -0700 (PDT)
Message-ID: <cee7bd5b-2c7e-4abc-8810-4c650207b4e7@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 18:25:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: Add NSS clock controller driver for
 IPQ5424
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-6-8d392f65102a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-qcom_ipq5424_nsscc-v2-6-8d392f65102a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IVDAWGQbHa9icyIG9FGP4YFXyuhQuY1v
X-Proofpoint-ORIG-GUID: IVDAWGQbHa9icyIG9FGP4YFXyuhQuY1v
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ec5e9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bcbUkqnWQ8Yi_cfyv-MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEzMyBTYWx0ZWRfX2GpHVJJEmOyU
 S5ZKTwiUS0wPDnyDWdbxCAsSApjrVD9kNq61V89BiMZfAzSyR8kRiusm7OYmLFWitPR+YuDVECc
 01nLVX77uRXIM1DN0qH+WGOaWsQzAPiZAskvpEaynAidqMJItlK8sKFXiTp6M21uw5dunDGxg5+
 ReYYAPJtlhLyw+yxPk9VDcm8QxDuBqjd5fdCdRNKxuJnTeS8bO5cty1T+fh3Qlxdrw2BD4CpGXn
 H1qrUajSWAmjeuN9OxisID1e4/c7pXH+V7eZCLs7+7yUM2LWPXkZAe/q+Nog/yvrvbUa7WIGsoC
 pq8k2n2uhM+9S78uttxHJVWnaUzZ3QBeSSnFMT6h0KuplY6pOdYCpURnBO2WeYfMwE20An3YWPO
 Ny2Z9hrFtH3wogBTQ3Jawscqw0eDD4IU9On/13IeCcEp9hJ2dQ70zexYz19N89LWvp6mtRnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=718 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270133

On 6/27/25 2:09 PM, Luo Jie wrote:
> NSS (Network Subsystem) clock controller provides the clocks and resets
> to the networking hardware blocks of the IPQ5424 SoC.
> 
> The icc-clk framework is used to enable NoC related clocks to create
> paths so that the networking blocks can connect to these NoCs.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
