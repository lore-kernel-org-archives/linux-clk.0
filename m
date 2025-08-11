Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F35275AFD
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908438; cv=none; b=niNnaDov/NbSRIGeubt0ZFeX0QUDKDoJfCuCEJ/iL18tv56WMRIDLldqBuQcQSf25ZU1/96EiLVzkxAiKphWUj8VRivUyOFuEHTFvmqC4a/K6nP943qw8D5tIXi5M1dDZWhWQfniXihjsLkq81+WSBGrr1OBBdxC/eHp5fRkfsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908438; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJjiX9vwL6hqlvuw59LSnI72WPNb1kssR/J1LXy5pwOAupVfhV8SHb5yfOPbYoDFJXmeoq/VgpSkh3Ekw62HS1HRD0ysmCIBmu3LWtqX2uAv5RyCiTflKfh0h3cU22U4P/kVhkLQOlajZMAVTFmP03tzGeh6T0KHE9ZN4ag0948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pc1LXYLl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pc1LXYLl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGYc7024404
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=pc1LXYLl7ATW5RR/
	kv8JpWpVMMWw6zDJPpFQHQ7cxCdNIoJw23Y6C7KZquAnSB8OpJRQyTNuUJmSS2P8
	OshHPidOWm4CVWrVdmth4VW0r4vZPE55OsDDgssvmsUTt/BdbJ31BFlZgtSgKw6u
	E5FvUgMV20hUv8uySTQi+0+JWH6RpvQtQ7NoBGZErnvXEUYUFo47K2YZFiQxtGKy
	O8OpMdA7wDrjvoHYcdH2V/PTSigHqq6CGLD6XUhkV1u1O6BR68MvKKcxgpf5IP4F
	W1/hcINTOUS+nKozwZdV4icJmqr/nJyWezckGN2Zs8kVO1JGkW/50a5rEpNKXsX8
	CvANDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem481c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:33:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e854f77629so5374185a.0
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908435; x=1755513235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=VocZR4/O2mkq1FBUMn339DtZwmFWLXbVZwaeUYXDcp/wRP0D2F6NbFl7mssxb/2bkJ
         ptgNglghiHUJI+ipsznEySW1WITi68neEFdcrcCbvDJvhb3riFaKsJlcclZyA76TF/yq
         pbeVqqE8LyD88sTkv3KBfvu6lkav/K25S2b881ja/xGAziRT5ldx9a/tzn8817ZtT1ic
         DwWBblO/Cwl6IOhd6OJuEHlK7yU7BqcSusysTT4mClfHsx9E1EAm2xRJTLZ+G6z4UQj9
         wTKBFwD4Q0Ls5bdxUNVYoXhPG/XtF2U4vcmrmA7vBW8gp7JEl/WZUydeTUK2/CtglLUw
         poIg==
X-Gm-Message-State: AOJu0Ywh2zJsXG/E8+kGVrgq3JrxudQu/fP3QP5w+dOy9koez6vztXyi
	2TVQjw8G07QU78duK15NsvnbFCe6t1MBsRP+GVT9xWMeG8imRaqJ5SNZ1EAtggfcSGarVu/mpTy
	SdZcHp2wRVQc1+o7lqF/kLusvwCt44xa/DqigdJOeMFETAp7JB2hEDREDn0MqnZo=
X-Gm-Gg: ASbGncukAckVpPyk5HDRWFQQxaWbYiSp+oKzCJx6igFzIWOGtsVFpOkScefmXry/TU+
	IzL4iPCt9f2ZKWHKAMp30WTxVwCA0eUaJMSJgF49V1WcQoq4mviwKDLLw+z8q2P57J+T0NhZGg/
	4a9jbJo/GAKlKXU5j0+nsPeHHC73JHpwbtzF13nJQBBml98cSqkX0cNxmvZWGRQrNjRQABuLccP
	QyCX7CcZ+4d7jBfv3EXxnEaI0rvKpiSRGB7LCnzgwYAdaqqpdIP+xPfLh0kCR86M93fqNkj4ExS
	+7321j45H6IpTkfhGaHyguOS5vJQGEN7Tx+pXwDOsphy4jo49da6vGh4Uyo0fBETTMPAS7d17DJ
	bUQRWvwJAMFvcojwSRw==
X-Received: by 2002:a05:620a:29c9:b0:7e6:9e1a:19 with SMTP id af79cd13be357-7e83b93732bmr541386885a.13.1754908435010;
        Mon, 11 Aug 2025 03:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbXlR521bZxyPm/3VZyKzhpc/wr/UGlYqSFDZBHoNqcD9JWEIFdYtyNL9kNg45d9xLhLh1XQ==
X-Received: by 2002:a05:620a:29c9:b0:7e6:9e1a:19 with SMTP id af79cd13be357-7e83b93732bmr541385685a.13.1754908434580;
        Mon, 11 Aug 2025 03:33:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:33:53 -0700 (PDT)
Message-ID: <09144409-48ea-4b74-aac1-32000424a46b@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 98MGY3ZIEVGvT-O57VyikwrNZBSSWa8E
X-Proofpoint-ORIG-GUID: 98MGY3ZIEVGvT-O57VyikwrNZBSSWa8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXzKkCpDp93wmU
 8iw7wwJWO5neVeS8uBgpqA8zan4oN/7Ak77ZyZSl/wUpyTV1S11pMskqvLJdJjSQtkwNyhqFjdw
 aFGi6QE5J2TKqN+kPVEMqxOnEZOqYf1PP6WltXmwAn7iCH/N7/oy6n45E/U6Fp6T+jytsJmmAlS
 vl/fFuOvN4O8VAldo6CjJei6R3tik9Z4VlVK7C4DdEiG4ttS79fvbwHVGLNQRA+fq7oox2iX6Ct
 TaOddsTeNuAI+LvSmi6TgDNmD/Icr8MTR/d66xEw5+Z0NgpMX3/7bsFoZQu1rooTNz0GsfnnKga
 bIbmPnnbDhm3VtruLb6KsnvoR5CEa6p9bMOvHDG+SVbmJdPBaBTgfS/QQD4++jqDb77GrNb3LuA
 ps4aBC4E
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c714 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
