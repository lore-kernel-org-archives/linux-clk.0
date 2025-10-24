Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7433093AD
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761295205; cv=none; b=mzBWCoeFy0acy54bQHd1GhmF/Se+QxCyjiFrHNpfdtzo9rDx9JIBdiosyJAgQCQxMsDefWEp7ahz8PewixYToGQWymYN8olyUHHYxULkqqfh2Ejri4o9TA+1i9r0PDb4sSWNCewBW6qxW8Iq+NcH1bmBtSL8b0SEawUmGzDfOYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761295205; c=relaxed/simple;
	bh=JYG+1M6PiT/mD78iOJ1agyaZE8yQPk6FhGZI0XIiWLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ACGceBoOvFtlnZ8QPFUprOZjNvl57A4a7EnhBqs2fB5RuVTNd1M47pLs4rtuMrb1XVMhLWnFnyOSzEISqudMlD0ZoqmwAHiZ/hVZUPIIrAUh2+de8PUPawC02Ty4UWPgBYt3vgSoIQ8r/1BJkXPU2ofnMO+5UucWG5DNiPG0vCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7EkyC3V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7EkyC3V"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MHfG021689
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 08:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JOLmma9bqlEv6mHUzEz+JGLukJKbebhm4RprQi7te4=; b=N7EkyC3V4jno2qqu
	cri/U0CCVWsxtL80RgQTiqAAbi5Io/FErEVEqOQkhu4irHFPgpoas8cci/k1AldD
	bPVxwZIKQyfcuBVTYnF51Ifdgl0VjsNwLtno5vixKyubJSwxj7CsIez3sFgG5tmP
	5it57gNgFEDRDweHrXOBh4gWPdbcRQKIIYCDHP1ztfx/cSSjbmGNE0o3u6wNPcPO
	OjHIdGcPPTR5fxYnfR5Wsz/I1Neh4ZM3N0OMJGvxsO3GrIERWVoCSvBcbD56xkH/
	Z4dQotg9mBZXeo97jkhhtYHYqmy8RRlMFktz/aFkAepg0II8g9sgFp76kDNc93S4
	exhcYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8njnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 08:40:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-873eac0465eso6096796d6.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 01:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761295201; x=1761900001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JOLmma9bqlEv6mHUzEz+JGLukJKbebhm4RprQi7te4=;
        b=Ei5ohBhPzyJ3fMenL0ONLLLGI4PFJJZyHBwxL+dJLWDqtP6h2MYRHPUv3kzXSt5Blh
         nZK8j55uRlCkR4c3LEChNwO8WkeFGaptmNF0FNN/H8tJ1Cf/8qa3eH1NuNHQkGJ0l4wX
         Zpkam6tm2aMste6ceunMDGkbHxvJVZiEefJNpuF6rzgJdSj6jWafVJNhw3vafM6fNnso
         nx4gCkowD17yMuLrwzrSLOmlM08lQEVq1of9ziX5/B3rKs1zdD6X+Yk+CR0S31PvT/3P
         TZiwv4lx5XQbxbfxqy3vFmklaYeJX1dL5WGSBM0kwN5dtYJ81CcEzQmtYAFRVuVhF6XE
         NEpA==
X-Forwarded-Encrypted: i=1; AJvYcCW+R/LK/Y/F+UhdbLdvmOntyp0/oNzOHzmpGsoPoVbIQJqrqUlIJ8maK+9g1FB42nXS1379M9WrNC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxklNnjJXY4Ufj/tv1VsNsnVX8XQGljxDSlHKqv4u6CWYckSL/b
	TwbXSBXpjovi3gPqshsKs+h6DH8LhD0EwphccqtNLeM2YJ/6YEurnFNTzL0nVaIdpAlC4Y33uP+
	Ng1sKtiSfSZ8x/tMDUZjXrN39p+ysaR6KmIN3aelNJ5vyhSyI2DSiMxzXrVoBfMI=
X-Gm-Gg: ASbGncuIwK3BcRi8PHlR/xpp3/tUHoJr425ZudQvWxBTZL5u2WpqbaFFp/uOUnkiBXz
	TIDcCu0++SN/zZXf+4KnOYJ4RyDIrPkewTw0qhdd3pvsSPqkc9TC9X8A1mglBcWYYbhp/WqBJd9
	LwGUam34YSe+oZjIHfrxsUXqWMGbu8GbzP0ZqWbfhyC9dQrxxSPdR0rJJ6qzlMX8/mpdy8YfIca
	FJSlTEfjZvfcFtC6kJptKYBuYu1okxEClsh1rukywaul+K4KB+53BKNXne0qH8Hf6+CxdUmO/0U
	EfaKXWnf0yeOKkG2mTv0FEOcx9soRpVJ0jQaoGTizcxNNwOeXzc3ULVV0C1OHxE+sR7UZfwd9cY
	dMCUOj2GB3nDCbK9OXAet95gbb405CskRt/kTbyZl2lNPYQAOTQE4BIxv
X-Received: by 2002:ac8:5f10:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ea117e0b30mr119093191cf.13.1761295201566;
        Fri, 24 Oct 2025 01:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHogEfnZCnfST81Rb3Ac0hj/uzXgJkTfe2vdk/f4ZOhJqmLDy0hT9TzZwbdfJg4861TgaON+A==
X-Received: by 2002:ac8:5f10:0:b0:4dc:cb40:706e with SMTP id d75a77b69052e-4ea117e0b30mr119092961cf.13.1761295201142;
        Fri, 24 Oct 2025 01:40:01 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d51471ef6sm444517466b.72.2025.10.24.01.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:40:00 -0700 (PDT)
Message-ID: <102d9042-49cb-4aff-8b93-a882ed8da27c@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 10:39:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
 <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IN6nFmR6vR3H4kaLjv9jXukTJyI57I6g
X-Proofpoint-GUID: IN6nFmR6vR3H4kaLjv9jXukTJyI57I6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX8EQ5cvzgGwav
 6u27mF+gNbTJr6PJxVG/A+28sVHyJ7WeT9LyO5JxYOxjBjdXHo5TJ3MbgfU0TQ3NWgt2GFXKYUn
 pYqtIpT6tZK4ksxprHdR/mr9SRHvLhXaFqE04ji5mTaS68WfLCZjnwzEbK3V9C4jQVEghZ3L7F5
 b03+aAS0z6IYotSvICy1mCo5jeFQPXFNJ2bFjWlFZhdq42HFRl5NpVKwXkE5M8j/dhKCEu7AcOk
 ydyhoc1LjvstpGx9L+M66KZP19e/UoeTlytqkHPEGUoxn3hZIfxvpmPIq37X632p2nw3MeegaxW
 3RIgissfFx+okRRYQgUHxA+YK2O3SzPDpbcDz5Y6Q//B0k8ixJsmn+0PktSdcwVJppO6Ci1TOid
 H1s+0cHHhFGV5UVMxAqr0V/rSExY5g==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fb3b62 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FB20kyDvaZqv9jGj6gQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

On 10/24/25 6:24 AM, Taniya Das wrote:
> Add the newly introduced 'mem_enable_mask' to the memory control branch
> clocks of ECPRI clock controller to align to the new mem_ops handling.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

This probably fixes some ugly issue, could you please mention what
the impact/problem is?

Konrad
