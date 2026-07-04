Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B71D89EF
	for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2026 00:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124599; cv=none; b=LMmpjsvuRXc5Cr+EYRYzmyNI0IE/+F6fZ2y0QtOuLt6W9ine3NOwF9mBgqOvohJY+1ecuTpol09d4kbefYzyDXfs1eacqiXOjO+rLhNM1RbaUai3ubcpaCCqH8My64wGTnMlWEOErjTY1iMTlcIXtbb91YIi5xQZ2O0tIIRX+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124599; c=relaxed/simple;
	bh=KPZo42l65hTImjZ55/y4AAsr6m2lG5IImpSre4pcMjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbCqRq3xcVEcRrJ/KhN0nEjbOu2UgAsDisfE0v+Px3ZzFsFyq1+8Hx67YayCNJEphxLq/r8wzQNmUQ4EoEwP8rvu2xqrce1Z4xbr44a6O3Uv3b6RvNGX+FZqgis4fHrvb/gkfopXuPPNjB5/6JaF/lAWAqPvOypCOvOTUIQc+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p3yzhfuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9K63Pw6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p3yzhfuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9K63Pw6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPbk41005967
	for <linux-clk@vger.kernel.org>; Sat, 4 Jul 2026 00:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5OVmVCNKgOLLiZI197tnD6iA
	z9XinbgJfYuM1B+BsNs=; b=p3yzhfuPiXmLYOM0JzkUf3GCCJN8wBIVk/zuXW8h
	kzAqLnnwzdzDU2dIXETT9lx6dBA+/+dvYKeNXd/IZpb8WRlSV9ZfEDShaTMdf+Z3
	P5otFKNFl6yYLPral7yNv32hWU1P55SOtLvMqsK1S8YF+wPQzCtzwaN9dFgqbyDX
	HAERCB2IZiW0v76hUKS7petC+yw3JXAwjHshZSSQ4N+V+yjz6fpk+DWZFykjBqqN
	8y0Xxj11JQO4TxWSX7qL5vnrw57HcK9nOu78Xvwy4PamOnXw7kJUSrQHnoEu9RMj
	Qw/0v2Y4lCJVbye7ViNoYoXCsiKFo5UJS0Iw+Y84AVIalQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyd2sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2026 00:23:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so90872485a.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124596; x=1783729396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5OVmVCNKgOLLiZI197tnD6iAz9XinbgJfYuM1B+BsNs=;
        b=X9K63Pw61fDqAzvmzSQV4SPgsOzhgS3Gpz6muSa+LTHIFee/PMGBbom4i/oXEuECAX
         kOyGk0e3yRLupaKdpz2otabMoEjCtrCz03mSEgU0ctX7g9JgI1iWcSk1bn/biCEHWo8C
         eycc48E4ZOUhCfe9yqq+6ww2WSpBADGu4WMM5LVos8LfQGuxbHAP7mspM6M74YQSAZcr
         TaDQCAjLoJo1blHbVTJLWtCTWIZFbO6FcsYu8HSuhRU1vGJIoPt0QvDI9KvGCw+bE/8/
         kX987vhbvN4LUd/3ZymdH55aSS9CZ1iqP2KnlvJiqmvpdAktDR3h4J2eSBinBn5GD2SF
         lFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124596; x=1783729396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OVmVCNKgOLLiZI197tnD6iAz9XinbgJfYuM1B+BsNs=;
        b=FW56rXp/Gqd9KmOuvqWEK5bRRVl4HTT6Vlvv0dnu66bWLgrHNZz2YxjKIq1D5Scd6L
         +is8cdALLMuxpoE0HRJ+wKkzo/jRMqqv/6S59mN+46QrEFPsSBFBEgpe3GOeJMu2oBQx
         7iFNIzCEKJ/+CirvN+XVSjG+FsK+CkSG6XyFLhDDXT06QCIO6mhgcu9ufNn9eV4YSU4f
         3pNyEFCE3hphZhTmz47lSJWyE4e+mEaHTo3FBxxO6/ycmFBtKxYaj5RKf2N2gm3nrBam
         yTxXzeOTBYmXv0O1ypCqbc2afjmQrhDZeuBxR6IahPHtpfIdHecR+5X4ZeOsWlZVZaFJ
         wPtQ==
X-Forwarded-Encrypted: i=1; AFNElJ89dL0j2bBgHu30XSSBWMmUUrCQBe3D9jkEwGjoTuoKRLx0xjjPHjH7OvTKiqUmYv3hZ0V0tK4iFQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFJJvE8CPeTwrLc4WsfgP4a/ho2//cG3wQJuEIFaBUTU9z6E4
	1532ZOq6oG458PkmjpqoBYe50kYUXCDPpIdpKFjNi/kC5Snk36r7CkgwssmQom/PtUsn6XtU7ax
	8zbCsht38wesZ2TgWupthmlgi5tClHVlCysWmjFxi7Ee/deQgiLYdR2t4qhGfGMs=
X-Gm-Gg: AfdE7cludl/ydvdWbke8DkfzhJLSGIfoXaNPFnFq+R5UV8lyryao8byZ7LBvKUo3GTe
	9854KsLdpevVWPHUQnYlNOkFSkh6f6jKhe4CSZ25x7JF69KYbYq/y5lsjXg1ziJQBx8p44/L2zw
	I96e7Egpg/mRXxy5NnHNt9TKBmqB0LsNjU3xV2WHXxWf6yocDpKIbdrYfdFACFQRcnO+gjwzQsO
	XpHLZVTyoH306IoUBsmRS6cxVftJ3cp9RWwBy4EVqUxZN0qMDErOebsMvqJtSJblXApumVwhyfL
	1mFTQep6WmMbSrBbpLrgc59Ty8mpBBvm2QtTYng1l+vsTVSzYOkPeaTCyFZIPfYPjxAKJ7qmcEe
	+ya2ACQmPBw3Sto3+G8SbjZYGAgyrK6gDdHdu8IHJna6q6ahDBUN9OXWLBHMdmuCrC16P6DW28t
	HnUSEG3/kQAnKc/DFkbTW0+gXs
X-Received: by 2002:a05:620a:700d:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e9a512f0fmr246530185a.67.1783124595812;
        Fri, 03 Jul 2026 17:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:700d:b0:92e:64af:3e59 with SMTP id af79cd13be357-92e9a512f0fmr246525985a.67.1783124595311;
        Fri, 03 Jul 2026 17:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701a7sm866645e87.12.2026.07.03.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:23:12 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:23:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/19] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Message-ID: <pct3rk2jr5ed3apeniqv26mmhkye2dvzkxb4banvvnbn46jmq4@vgde7zbudux7>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-15-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX1oUnrAeRAdMk
 VZvlNer4cbiV2+yxnza0w+WrFcotj7PwVBh1BYa/J6PFvk2zT1WGSrKP+xYjK0/uFY60vXm1O/w
 jRtSVxmG/klgu3fMu+Fa8MB+qnl7+QdVAHtnexAj4EM4mVfmd1Ni2bDNDo0WdQDgPlWydP0nQob
 ap9hobf36L3XXMLK/uwc2z+W/oM4XTZ26363233i7LB+D67+/g+qvDs4oO26vNaA7TO5HIopDT7
 ouEsn5Jwu3IMtflv9JLvUnZA2t/U8gcxq4UOsKn0OqU26rvZa5ANtkCQxwq+EYf8i4wctOfBL7s
 b5eWKEktsuE3YSv8NwQIdB6GOkaQijPm4s8jMQPqbXNWCfGEdaXG7o11ovlht9GXxvdgTMOEnOL
 HteX2p+kzAqtQH+ghWKz/MNg3q49crPS18UJZLV2EenzZE2UZyQ4p7vK5bpXMcXfeskDhbZ/BUA
 b1dKlvG5/LcrW3NWqJA==
X-Proofpoint-GUID: eVbuSBU3gSxbVUdLxfrtiMQu7iKwX4mB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX4VJsLZBld32s
 GnWND/AsowP1p8V8szMuYWE6Ircykrk9HAHsw51arqA66bTKlBa8KR4DKfHRrXmK5r2Q056ppJ6
 AAjxDv29Lkwvrm4WoG1GZc6M9Lxuk+w=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a485274 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OumLNwlXtCAUlcyMYLYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eVbuSBU3gSxbVUdLxfrtiMQu7iKwX4mB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001

On Fri, Jul 03, 2026 at 12:01:37AM +0530, Imran Shaik wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> 
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

As a reminder, fixes should come before all other patches.

> ---
>  drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
> index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
> --- a/drivers/clk/qcom/gpucc-qcm2290.c
> +++ b/drivers/clk/qcom/gpucc-qcm2290.c
> @@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
>  		.parent_data = gpu_cc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
