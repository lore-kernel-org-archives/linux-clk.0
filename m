Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CC3090C2
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320519; cv=none; b=P2vXKHKnqTYBrRf6h4dq2BjUpXGp+2+TKBVXD188FjLwoLDQk/Tft/sFgoTQDSsfnX+7RI8wWoNvz3EPrCMPdlpqiKbcPsieuWXcvOljbjYUbQn9Yf32qvbgq6QvyW97rzfbHdoLQ95zZQq49He7Phfom6hfNSH6JJKBIrtMGYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320519; c=relaxed/simple;
	bh=pTfP5b+2Mi4mY0WGBgKBG7z/S2+qq8yi0Xdwud5vszg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ID2860r7591GoCh+cPjWmMcLn0jK8mgatmD45JihatcgRzlY20qRThmDnV3lF+ZY7+k3029eMOi1ryNpczq0xL5sY+9iVsVYFnC4Jg9guxrRhG2DH+RPKnTF7fA8+Z9hzUe36DkWiEB/I/Pqrc4pWo4cDSE/qU84PzQ+AlNiQYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bj+5yXt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqXlYD/K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bj+5yXt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqXlYD/K"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H90S0b985650
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hD5B3RHvIT1cskPThbNNJ0AFJPZPfutqv2uU03n6d+g=; b=Bj+5yXt+gPv272Ue
	5U9ZU/lAkN20toSqlt0vhZdmVhlla1motFRGQMqV13lwcoazT7FeVALHswMXRe4F
	UIg14rpUov98fsgJRSG848ttWzcDuLtLdG4RJEo6NsLViIH5W3h1jgmbTNt+F7Yl
	sfSDFF1EXtdVXi2H+8nDbvgD/IGpFgzyO8nVvg3m7OTuM6T1FjQNNhiJ8FaFB6Sk
	vKfp3NXg8Ly2WV6izPIfM5mlHAt23HCmDIeV1Gq5oIr1SgM2LKYPBmst6+n6A8QU
	gLXZCMNwvq10DpBfxx9traeucNogE67+7UkACtXTit7RmU/GMcKBfqSD/mlZ1Ybj
	nWP4EQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1p6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:28:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506b3baa69eso36022781cf.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 01:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320517; x=1771925317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hD5B3RHvIT1cskPThbNNJ0AFJPZPfutqv2uU03n6d+g=;
        b=iqXlYD/KRf2pCrWTupl+w7mPRWGkuYJgXbO6wgalB60syFADlPy8Yqt/5Rkae10atf
         xrjKVhzErV+TsMyBwnd7MU/MkL61uqQQ4z0Va2sTrO/bEeBfFUjYYT+vT6oHluMVxFix
         ZxEkRG+bxgPZsKGwHto1MiFIHqWaEZSURZD+ESosyEj/UWQYJ50eKs4SDjy9RQjG1j4r
         sk15Qw6RuYQYsuOAiRHqGMZeH8iwnH5ICZWMhCbuCyv25YNu+q9QRhmawklhsvjiHnTH
         Sd03KS47AqTuzNmNvX+uHVIfJr3md+8FVWuqRterSsjIcejHTKxHso2uKZHHvbrRPVii
         9Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320517; x=1771925317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hD5B3RHvIT1cskPThbNNJ0AFJPZPfutqv2uU03n6d+g=;
        b=m+4o98C9EC5B1aE+oh8KSbR8eRrF+KkKmQ8+f2Hpiwrxce5reYyxhivwD8TVkhOzGW
         S4y0gmAU7MQng7+v1K8DPVJlz67ssLNqVbjH4xsn7RG1z/+5BJ3+Z8T2KSuQEPvRpX0J
         q6RrENuxlMZ29X9jNdmaLN/9yS2XdQQLPu/RNHuRj+B4ZilxoJ/hEU1gMWjv1QRdL6CK
         FSulzLIutirSkdCrp+onERxifHufljKVdOJuwcLxJjFKRHfK2n1rUdA0VouemShUlvsK
         eZJGWgFBSR2hpNjTX+EPKGk/FGz8vk1n4Hv4k/LXrLDJP2eGQswUpi/By8MCL/QsZIR1
         7hPg==
X-Forwarded-Encrypted: i=1; AJvYcCUxOSL2q9mRmhU52obnn6rjwGza/Alfulcgle78GW3eNkEcwFGl0tYdw57s0cCHLMDWv2L2UmK8pnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2avADfvKvkYawi5s7Lz8SUwSCaqZVM19iW0p+KzD+XbVK7nG
	10ax6dg+RNoba3OYAEqvuzY1OLNHlXQEJoNwIQaspsLyxqugpo9VKKQBFRo2rlVTGi1MWNCD85F
	vZFFTzLDNbVnxaaE6J+/A1uMiSNOWyoN6506DFPM4+Zvs7wKs/ziM2EB8KORGdiM=
X-Gm-Gg: AZuq6aIMaCYPVLJ1WPxSqECaPM4wL5R1GgrPUEZjD5UVjTEHMq64zWZMFge/RXkghvi
	kEO9ymBeNspknLdY5scfulgdLnI8YuDBkG8ytn1P8egroopjWsdkrG/RTvozuVEEu7zukwrGHkC
	zmoCwjLHwZi95GpaqlHyzP/DKv/iCP8vaclYvyDV3jCy/B0ZSYYNTq2GK0IEJnTmIqU/W9T9e/o
	HTsDh09ksd9L7bMI1k2wZ/VNhnW6sZu1UJonyzoPRtDF2kIrVZzoUxbJr6C2MsS8O8om5K1OsD4
	ZjrVusBMKAMI5bJgCQezP/CUwpfq0FwsHD9QazCjjPTt1bWFXeF8I8OOncnkNq8ZKScUOfuXIT0
	5Fhz58M+8VtHlTBfhDGk35gfp3J3oljmp7ZmQQNFt1ksHMf4F2KaWLEsHGawMPcfAJpnatnVu8U
	+8etM=
X-Received: by 2002:a05:622a:728a:b0:506:bfa3:55c8 with SMTP id d75a77b69052e-506bfa37aeemr70611811cf.5.1771320516684;
        Tue, 17 Feb 2026 01:28:36 -0800 (PST)
X-Received: by 2002:a05:622a:728a:b0:506:bfa3:55c8 with SMTP id d75a77b69052e-506bfa37aeemr70611611cf.5.1771320516286;
        Tue, 17 Feb 2026 01:28:36 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f1388sm2337658a12.28.2026.02.17.01.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:28:35 -0800 (PST)
Message-ID: <da9aba75-f52a-422a-9899-6581ee9b8b7a@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:28:31 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
 <20260217-eliza-clocks-v4-4-5d09f28d4251@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-4-5d09f28d4251@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfX6FTAY+10sLJa
 IY7HrPulSy2M+rqlS7TOBerF7dRsV4MxleWaRiQKwyh1FIktIh1DN2SbPgwmCILiErUZdav6B9p
 B2m1vf4UPJNn0Mx+11XT2fgtzEx4E5TvgUFnfC69UZrCEZZpHN1eVsQ9v5vTci0+Q67cGbvyZS0
 CBHjGkGcJPOgApp8CUqTydZXV+dNI4HlpOxdNBvxvQXFKNUP/l4x6YjHbKP5y8QgeMmEu0niZkM
 Y95UjtRsTZbMNlW4okeh303Aiq24K3G8sZWdWXmpwsOm+VdmLQ3rvakPSDX6ChloMMfM9eXNKKa
 zbNjC6xkQKg9NTyqcOu0I/LlTSeBgpXoevV6dC9yVVbybqZyAPzBrtvAeg7BL5Po5gkiAjP6gwS
 7pVeXS+NfeXWLg38Zwfv4xDyTESGnHnkdsZ4hO0x1vnJodIlXPLDOoPJLqXuydS8Fh5gZr7KsQ/
 0JedivTfyH2vqTa7smA==
X-Proofpoint-ORIG-GUID: KbLALzKLHd5FwDBCGUtyWAzinbvt0a_t
X-Proofpoint-GUID: KbLALzKLHd5FwDBCGUtyWAzinbvt0a_t
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=699434c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=QfZBNxv062MJluzyly8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078

On 2/17/26 8:52 AM, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the RPMH clocks present in Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
