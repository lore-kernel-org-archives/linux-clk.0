Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27D39B4B4
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055050; cv=none; b=L7pJPqm9G15wEA67WappQFNQVQzb/Mt5g1+ZvdVTYvTWRg231iV7y/f0rbifqqvzpQbgWzvHpZGcdmVNuYjx7Svcme5Oh7avQJowa2tEG27clh7/rzJTjDVnAAZzjmWi3NFijwJ5OkZAfFq9mCP4YuRTZM+1nP1d7YEXEG7vCV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055050; c=relaxed/simple;
	bh=vIupXVvqq0aF0TbLaTcRw65mQz1unZS5rK0UxQXwVv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uhlaHsnbc3uzhRmDSGXlsyeLebIawerx+0w2KxF2KNPfQrlFYHwCLkH1zHXSMeS65QC4/ZMOf2dgZZYFjqH1jSDgwx9G8E/j7NWkB5ybE2lb2QvmW6eRwfM5wtdic9MIVAepnZ4yqx9isoK6vNHc9sgSj70bmiMRN6q5lqCAokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BVKto9Np; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsgXIMDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BVKto9Np";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsgXIMDu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297fG5f4080713
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 11:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iJfBOWNK2bjijtz10fDSacvDWmfQHMuUpjyXhkkiV4=; b=BVKto9NphX8o+346
	+v1lkz+UrJILFuEekqB/dlREsLONTKPaAf4tPmgiSdTrN1AIuE3P3Nu4OFfiLFiY
	QZqetbc42AO8EC+alwdmjzzImaM5K5DZpzRw1sultw9uXvKcXcxBpo/0KmiMqZLd
	JSSkUn3IOxbRXLfm619eq+a4SKe7E6DcB6f8nB58ganvw9P3CHtuqhdnEtcQ61Z8
	C7mpm4/P4xQukJc3Gye+ZwE//T+WdYiBAtEBr5HGnss2xBYWQx/IFJryzo7argGg
	VFjsYdbjcIx7Bzw01JpdbYAhgKhD54mcOgtUD05KV6pJEZt9eeVV5sUuw6cIE/7d
	iFEHyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd4q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 11:17:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8e89d19bso29286585a.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055043; x=1773659843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/iJfBOWNK2bjijtz10fDSacvDWmfQHMuUpjyXhkkiV4=;
        b=jsgXIMDuS4puhzznkKsi7UMCytXk06rtU+0++FmbTw0A34rUQXP+c1qFFGadNLe7DC
         zedadK7wQLWQFCDKsF34zrCT5FD8iy8Tj8tD6J5sgq8Ntxq2GK0i9rxBPB123TGJA3Zg
         d7Fp33grRdBTF1Br6NQDeqF0/XFZvAvUKGhXc2xb8qIIFvD5GTLz/ZH2OCPduNrxrZG9
         A+bS6A0QhaXSjZhwSb0wL1qwoGOaNiNvG+RyMujUvqImVZPYNgYRZxftjJaxTEzwNWgY
         1b/NkGQc0OCnKO+4YQf3sGqPfRKOvQ8aoirt2dGFdITJZhAtok4ejgzQg026qPrkjUp0
         cKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055043; x=1773659843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iJfBOWNK2bjijtz10fDSacvDWmfQHMuUpjyXhkkiV4=;
        b=Y5cPl8dlX2VLPvrgxknAnryIq5l+pZGUYm5PRR3y4zeguf1jL6P+vuz7mJCxQSBh42
         4n2M1q3ooDWul0Ee2vk7yfjcis4cI5JO66bA8C8DQ96hL1v/n2VxBN3ZXXZiM+zOEuVd
         IX+w7uMmHlUrfc89gHM93iBpzly6Ry2wVzIUlqSrHjQv5pRNBs1uqlPXe1kiNc3HIvgT
         p2jo2z2aqexnNKXODQki2lDg1Hhvgv67LT2ELOsmPc0wNWVCRFaigFpwwX+1W7B5l9RZ
         Ob4JN6Ki2knZJ8aXfNwxTlIJ8+xcED5vDjNHknFaxwcOzD7IqPm1hMNQzj1v7BVJqwry
         1sTg==
X-Forwarded-Encrypted: i=1; AJvYcCXMBQaKyRTHWa1TmECsB1udLgvjmWha64BULwQTGncElEKPKFs+xYKKjeJUunPHmN0AzbM49+jq2lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvrTQS7FPbbQYz01C6PZikiV2/+d/oZiOgt5bV3mNGaRiWTjKC
	vbgbnlZu/4Q1iPLKxDgvChnxRAP+CTDZSS8/cqOBVVNUNDAUvJrCr/5bTTD0lLCgLjUvHzd6AvK
	wjAQD61UiRr5CTSqtyVDq/QGkd00PUVzu9xM8rC6vhn4JAqMN22mYgszri6h+Phg=
X-Gm-Gg: ATEYQzwDqvsdoJDNlAyXmh/avSmcPiB5Ymf+blPHon+sl1ZtyPFAr0TEctrS9otH2uC
	rIv1XLZdM+tr2MWtZt6UuSk0l91u9Qd4LqLIg/isTKL9t6BFYbQJMqYrisScG8xwz/F6nGS2pDv
	ahncfT4fgGQcTioxWjY7NrQ+bxJquF0LGKIjt+Hyjvdm8Kyh13/v1LgSB8hogcUyy6mmIU757EJ
	bzWBxePDFX7Z7XwEKoZ7LcCRlp0vR0AYS7Rutg+AOR+srCUeInzSaJ2MogrCGDtySAw8k3Dix9G
	wCkduWX5/5SXIovNhwSdQTrSgnH8VtdiFJzBbgKE2qbEEUdhu24Qlbov4UY0DwX44692T1FsXfK
	YCO9jGSilNy4c1w7gsq0XxxuidjQHIpDMMPl8vVSM/Qo/qXdimkCIR+dQ5YoWtb3/PreUcDnBa2
	XFF1w=
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr225068385a.0.1773055043353;
        Mon, 09 Mar 2026 04:17:23 -0700 (PDT)
X-Received: by 2002:a05:620a:7004:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8cd8b9b46a0mr225065185a.0.1773055042900;
        Mon, 09 Mar 2026 04:17:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66298248bb4sm353697a12.16.2026.03.09.04.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:17:22 -0700 (PDT)
Message-ID: <fa8ff125-8680-44c1-b516-66d06eda7b91@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:17:18 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Tie up the CX power domain
 to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-3-f682c82f116f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CEIVheRzuZYn87MmrUoKZ-j6aEKtu0vX
X-Proofpoint-GUID: CEIVheRzuZYn87MmrUoKZ-j6aEKtu0vX
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeac43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XFCnTzhwHPFgJtnojrQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfXyVPI02xQ6MVm
 +Z6+g1+pQGn6PRN9jv8skDVTz9xIfjMfWhz05GvQREgJzryWIEo7dKXeIHa9fhRjOeUE0qiVsmM
 r8ll+bEzrqyPv2Rq0wusk89nySGlR6st0U1ek+yQ+8+yPM9hEo533AM/GkSxIUxr5lhXCh1mKCc
 ZZNdeL2sFng24X1Fmno3cg/SQbTG7Dvpxs8zS2FsXfku2WgEFHovhV9s1aFrXPzsaPaIAiakFon
 1tX52rzJZvH8eKbvoYF6KfGLclQ7pIlxHck2ZWR1iY2kaE4+GqcMHb3Q3vWVoOnR2a6fpEuT/lf
 M4qjr+q1oLHYJFhoPYTn1Ndaijj6nfuEYxUpPtxOlSX6VkOGp7mTq6/pj3beHOVHzDFzObd+/cJ
 OpDr0YTSUUaPXhOtiActEl8nuAq8q1kNpflxfkjPZpWvvdxMFBvbWWU1qKJCu1lusLRGa3r6JXr
 FvpFdfoJxVRZ3dWa1Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103

On 3/9/26 11:06 AM, Abel Vesa wrote:
> It has been concluded off-list that the Global Clock Controller needs to
> scale the RPMh CX power domain, otherwise some of the subsystems might
> crash or be unstable. So adding the RPMh CX power domain to the clock
> controller which will result in all GDSCs being parented by CX. This way,
> the vote from the consumers of each GDSC will trickle all the way to CX.
> 
> So add the power domain and Make sure the required OPP is nominal.
> 
> Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e269cec7942c..2d1ffbf53730 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -764,6 +764,8 @@ gcc: clock-controller@100000 {
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +			required-opps = <&rpmhpd_opp_nom>;

Let's not keep the system at close-to-full power all the time.
Please drop required-opps.

Konrad
