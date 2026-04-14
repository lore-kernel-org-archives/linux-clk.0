Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADBF246768
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176360; cv=none; b=PBIt9ogO1f5lwFDcrE/rmsvpzbjo3tlcN5KUMDvO6N4t58Z+0mUkW+LyBA1Pnd9AaVzhXfsA06Iaf/smeA3S0QGJFlQ78mpqdFv89Iuh16ixQO0A0cC1VtxrAuvjv0CvJytvYRxY2+pFTLbnfxGDTM3YoZsYSuEYUzZuInXY5hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176360; c=relaxed/simple;
	bh=i/lB2Oeq0X9k5L2g/I/uYeWXjl4qrKPsO9J5W8JvCVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJnRTD08tOZmLg9xiVeDgSlqw0GpLhpntiOrCsTyhu8EvY+VHc2onJ+UWtCne7QhASOlTLsAXhmmypffrxM74HqITlD1A3sG9xsvHo3QJhjAFeTMsiMv7W6N4ocSBfPRmmhSg25qlsgQCbReb6UdYd5cm8k9M0xERYFTAXavCw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzzr0Pie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VDyPRkqI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzzr0Pie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VDyPRkqI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ECHMql3157741
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eaCDwyeDl2rP+JYe0dZC4JPgSHyiJbIFsFG4/04UYG4=; b=hzzr0PiebiYSgqkR
	16SH7lDvSGZi13bmw03O96NlxNPZVddocmp1ZgaD3uNdtLGuk4R2dfNO8FJaPXrt
	Qjak6seZHFG2sNq0JeZ3UCVL06iWIzN7ApUcnUxdkHUrgW/Qf0LiEjCqrYLkHs7i
	JYdGeYZ3XCdo6asjQSyhI1eanrHscUdgJBfKq11c+mqfXsF2ngfh9oKUiZl/hREU
	36/Ht5Kwfxw4vxQWTNXm9Eqv9Pc9DerVD3hG3tlt7yXM7GjQT/Sxp5bqrod6cG5B
	CmPYFR+dEcxRH9+2XVxz+LS1NooPQx7pUQL0IgEYJDATui1o/EHd9YmJKK/KpDoQ
	4nR+hQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bb0vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 14:19:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f777e3856so98424e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776176357; x=1776781157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaCDwyeDl2rP+JYe0dZC4JPgSHyiJbIFsFG4/04UYG4=;
        b=VDyPRkqI+94xhsYo/8eJI8JcrEZndIJknrxfLMV8MpNcZBKAM7V7zC4tVlZkfUx122
         QceOOlsaJ3ZXhMxug+jcKfkVxj3Qja8eX9jIGddg++CTZQGwpiF/UxqWAdJ9A/NPnmXT
         qapttIV/W4XKIHA2/XMzBx+uGSxGrGba58yeKlrJ4empPAo3FHgjTe/A2gNIpL/ye/Wk
         FVrEWbcDzr1/6ZxMTgU1n2vHY7Ie7zGxoBMCfgK8siEryaXMs9grmi7qhQ5M9d2nXLgs
         0JJ4+bsF1Rj8KuJMESvoS1UmKmFffWlmpB4AVt0aVjJPVXxCxTBVW4HXxrS/FcJ4OgZS
         w/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176357; x=1776781157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaCDwyeDl2rP+JYe0dZC4JPgSHyiJbIFsFG4/04UYG4=;
        b=ReNHQuH5/2mE7rQcB+qa5Tw/g5vOJc4Ix/V51opnQX3cWWxQof3g0/a09ivanCg/TY
         msxUWnJXguz2lIzEJmy35XFQS6Mj8rL3ItOS6aOq9w2JnRMvISHMLyZgjrUpkSOfLcXO
         kL9Fium7AFuK+6Jl+rXyzvtXXnS4wFmSVnibaCSPikymz3CG2jyanYPND9oDR26/i9GU
         oq3LYmBu4RoZUc1SXV93eoBlHel1/9LFEKPthkgomhghe4eWzNy6mrmQF5i2VM2uLtTu
         f2YbSt3iB8b4+QhvUDnR12yUT2s436fFK0nfB25wg+myiMj2ylOK1Ivu+rrfZirjDcpF
         FMDw==
X-Forwarded-Encrypted: i=1; AFNElJ/Urt5X9UgVk+FJc4Qt9QLIj0Vurja9TBuchs5MSdJxDt7mWn6Gv29XoCf9p5B13FmbnPq2aTs33ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CeM/FZcTbQkmcbyrM0qymVxt2lm9deQ1Y2LLYtnG8+Qu87zg
	/1MHKLRAsX//GaNWZiVANB1crO4x+f3Mbu4VKWS05hyVuBzYgv7qlHQ31dHUz7DK5sFeUwz0h8q
	2+cVWHJD9pHPfFaMq+NPzsGBeYqM1VmMvJs9M5qPQT5l2SHLZuRCK1zsW38eRBJC5Wc/j7p4=
X-Gm-Gg: AeBDieuQ0RrZZEvBdihDw2tHr6vENj+gfJPBHik6kb3LOsg3C/97TaZkFtu4mgAQod2
	ZtsAwZpFS3+W4zlk45RwXAqfqoxnY6PAqOsAGqVxqh2t47vc5gVSQokOQgYRNhMXQ1e53Z0aqAK
	pIfqBlHwKSOZ4LyKZ42anz/1/Qvlv5pp0yfQu4yIHj7Tn6Vjuip6G5vnxjKSDX6TOVMjWPZBR2V
	6n4sw/yKyCRODa13OrpxiUNX0RZ3rCRzOgPTflt+p7UVPruf4D3/EOwnKdxey8v1+sICMxPKS99
	nwckNikxgoZf9F1aeszH8RZjB7wyX6YZKbB6j7QZWKK8llN7JffaDWMe43lAT73ZuXzgAYnj4zW
	OWy5OL/prhNDM0Blu0QKSzLtBpfijg3IMpiD/oPWZgy5hyeIgn+MPFlRIYkDpBqaPOENGSmw9Z4
	oLQ5WLfNLDeoGssA==
X-Received: by 2002:a05:6123:4213:10b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-56f3ec51cdcmr2942164e0c.3.1776176357295;
        Tue, 14 Apr 2026 07:19:17 -0700 (PDT)
X-Received: by 2002:a05:6123:4213:10b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-56f3ec51cdcmr2942133e0c.3.1776176356816;
        Tue, 14 Apr 2026 07:19:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd51bcsm410039366b.17.2026.04.14.07.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:19:15 -0700 (PDT)
Message-ID: <7363d57c-5d01-4e94-8b75-f8b5e466fb33@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:19:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: Add Hawi TCSR clock controller driver
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-5-c7a185389d9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzNCBTYWx0ZWRfXwYIWzaZczO8S
 3IUEyF4qjT4LqQHQOfaXLtfWpeu6zWshZF04SorsOgfXD3ShNkX3VOuAj8k1xN5VhGY71tTmgr3
 JtjwYe/rLEyWZzKZgM20XHaWYS0QLj85V6ToknlXocN3klR/nm1N7fzbFDUc3ZlRbVEjcyZX7vj
 bH9FH9Lu05/VRQ1lNggbdYj0PAjK8JpBm0ACdC2HvU2givmhMvm6QqRI1HnwYG39gk4ze/6wEtI
 62pq1uWLryUuAFkpxG8MMl6DECPNN4tphANl3w2toGKRGgZ+YlNzCimUOs7upUDDi+HM8sWzc8k
 apHOfsaA6yUQjcYHpqYnr0nlOFK7znnbOZBZ4IWo1UvMCWpCOHYUv7wFtdg3MSjdvFV59MrK+Ol
 IjRDBKQkuR6/ZjsRwt6TSxQfkFyol2Bpilnm5ZOjedjZh/229HI/giDth5dvXmwir8L4P7gfXNO
 9pfU1oNGVwW5U5IL4Dg==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de4ce6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HxGML4-F7vsqb9dMjnkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: aKfJD4WoE3RYHownj75PBf63dqjr1pNB
X-Proofpoint-GUID: aKfJD4WoE3RYHownj75PBf63dqjr1pNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140134

On 4/9/26 10:51 PM, Vivek Aknurwar wrote:
> Add support for the TCSR clock controller found on the Qualcomm Hawi SoC.
> This controller provides reference clocks for various peripherals
> including PCIe, UFS, and USB.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
