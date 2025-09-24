Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8612D8783
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758705968; cv=none; b=C9jOXHEasRzxBiGHjH2mw5i3r8Se5HRFvMEmC2ZRXo0ragOmK11t3sUvTnvq66+3l/0PdxywTRZop9ioihdxEASrXfOh7YPAzMnK6Gse9HOOsiulhbKR1GO0IrSddxKa3BHCz8RJqAqmUMTYNt4UOUxN8VsLDbr0NIgW+ti++q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758705968; c=relaxed/simple;
	bh=kGACjza4kLFIuoVjadheB4VrqhuF9hGSAnViyIKI53o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSZoEWgch9iAFvqV4v3wrD04FfmiL67pxRQFlsO24T8JLiMnVI3DWmfWGaQ40uu2Id4ptaykpwH2GUbaUzKcfpcaSSjoTu6N3KazsPuUo0hCorW01L6mv05nRTqvbt1e7Y5+RBpfONdgibx5EQqmfeQGBkxq8VC8Znj44eb3gnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jai9rjcH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jai9rjcH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iD6M029478
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iVQMdHaKcnbaZ6S3hoE/B2b2HZTKVXu/iQm4DA6Owg=; b=Jai9rjcHmdFpIyPn
	GhFb/ev+IBXZBXDdtGjtVRQErQQOqFxcHrsAiQqchlgk5reYMWNOMQk0bCc9b264
	a05jyel7Ju6AmLesjrIkUcGS01cKPUtpdEppUa2vEQkI3OwaJbrAAyVHahI/h3Ym
	xdgkzuQ5EOITT12S1J1OJ2f55cIpwBehHSy88/TUd+J6GQtAnY5Iig3JAWCL7eUy
	MC9j4CakhgXYUeOdojpdRthM3lHzsfKZBP0uemm+tvmLwDaP6FcwTaLjfxMRFTp0
	Zdawoyf8aDDILJSmnEIJImils6X8kMGu9Cf6nULT22uVKTbRVjqcw78rNR2obYqt
	DWIYIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fkp8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 09:26:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4c39b8cb20fso24191871cf.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 02:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705960; x=1759310760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iVQMdHaKcnbaZ6S3hoE/B2b2HZTKVXu/iQm4DA6Owg=;
        b=MkqglATjomC3RMNpOOMdqcFziHW59h53HlKtt21Wdu9l4Qaavyps8PEpuLoMLzO1ms
         PLicEvWkLEXGYXGmHB7hHQeUtFNS4MPH22Eub2t44nYuuJqko6ZEokdPi9/ZWTbsuIBr
         Hb5OzL1VLkkj0wobD+edJ7CGxnhzG+yB8dyIbb9hIYG9yej7Ns+Holg/NojRo+q16jZK
         amvihnGgkmfEgomSL08Q8Y+pubMpUkIMKjbPcLouQP0TOuVUW8X2eq5UZB1VCI+Poi3f
         NmTPInpJ1Is+Rv+yRfxJULMQUCpGLNdU2dNFjQfbwxXafxJ2o9gFbTPHWZj75tDC8/N5
         vDJw==
X-Forwarded-Encrypted: i=1; AJvYcCVSEuRyOOMKQflXUjWbtOmWRjR2J+SpShkoYKK77htYBaKxNgs2BlSsuTbdcpPSbBqWcT9eF8iGOVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2DULKJc94tW5XqnqFYsqq9JRHzIM+UvERikOhS7O2eEspg+Y
	+zZMxWTQ24eaoTk2pVzoEfYZ4BD86LUCoEKTKZRjg1sFURfswXpmlcb9SpPEPYleOahiIDnjfo/
	LDcavCy8U6CE8ixL+k+uxy8q+33NogNuE64ZWEfq72+Z7V9Cpf429oOfHMoqXcGI=
X-Gm-Gg: ASbGncuej1rVFOii577JnVEaGI3M1RDzNaJ+rkyk6E6og0DJRRK0SSTc91tmMDiHKer
	JHodu/OHCnD15RNReqMLhM5RvuPr157gFpTEi8NmpZZnpOiHvXF89OisPjOClXKi1Adq9aV0G/U
	E8rsnHsGHUhk2seqKMr/PIM/eDrPyG/+QC9gkh1mWqLZ/KYSYZeLDQHP/gAS/m8ezc5rgiMWqiQ
	TITzaBe9dgyk6AtUx/wCLDj3fJXc2ZpiiEj8EbtxHaLF+e8IisQ5dW8NQ29wFLlpYCT9jq5Vk40
	2W4HxMk/jCniMJPnFk+vuUY2297c8LaJD+zUBVwUuu4d9P3biJCNILkDkcgmm8P+vjtAIngHJwV
	19GvgXZkw3tBdvdoc1ig+/g==
X-Received: by 2002:ac8:7dd0:0:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4d36feee39fmr44886721cf.8.1758705959687;
        Wed, 24 Sep 2025 02:25:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9jltynsPceOPKBs258SdQflImCClEP7oCDtLUeJd2HIiXbb4/Fq4DcND9VXplQIu2TahAkQ==
X-Received: by 2002:ac8:7dd0:0:b0:4b7:9ae7:4cdd with SMTP id d75a77b69052e-4d36feee39fmr44886531cf.8.1758705959191;
        Wed, 24 Sep 2025 02:25:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm786252166b.111.2025.09.24.02.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 02:25:58 -0700 (PDT)
Message-ID: <9455818f-3f6f-4985-8389-fccc7852b569@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:25:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Update the halt check flags for pipe
 clocks
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250924-glymur_gcc_usb_fixes-v1-1-a90568723e64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v1cm69hcJ4NW4tN9cv-kNlR-7YQEAwCz
X-Proofpoint-GUID: v1cm69hcJ4NW4tN9cv-kNlR-7YQEAwCz
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d3b929 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yrTspkcuTgY8Q9LkLrEA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX/mfgNg6pJ/PF
 QT3VHisBc9vLVKhl5w1D1L+5XXt0c0Gf9fQ+/LQxWYIVobE+bC2OZGXfv5qYk6mPnBwC0NVH0EY
 67KBWpR3KWuKJa0+Jh3i3JpfXFB5NJecGkmAh30mHmLN2GHPrpMemnoSQr8n2LZq1B2O0jgJJqV
 3w/P7rsiTfEYtSpAFfDP4yCuiBwzU11/PviHZhFrT2nlhzRlybpxgeLeXd9dZfE/PwD0l4cuZVN
 12S+0MTcRzjffOzxBSlmSxYYJcshI6tyaZ7nRuwdJKsME3kKEz+rggRTmsEDNQ0/7VQW7PpkD6I
 OjJ3Tya7/+rh2Vm5XOFQtv2NOdZ0M6sGUedq8MeSjfiiox79VXnvtrULqOYNLQyjnNfc846J+IG
 hNgmEUsr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On 9/24/25 9:17 AM, Taniya Das wrote:
> The pipe clocks for PCIE and USB are externally sourced and the should
> not be polled by the clock driver. Update the halt_check flags to 'SKIP'
> to disable polling for these clocks.

"This helps avoid xxx is stuck at 'off' warnings, which are benign,
since all consumers of the PHYs must initialize a given instance before
performing any operations"

> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

The patch subject must say 'gcc-glymur: instead of just 'gcc:'

Otherwise LGTM, I've been carrying a similar fix on x1e, as it
(obviously) turned out to be necessary for the usecase

With that fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
