Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399483B47FC
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074328; cv=none; b=jRoIF6C7vgeCoPm2vPPL0o8hgV9Yd8c2/vIc7mXET71m0ulcdeMf4FFjM8xHziyho5wBCmVJId5SC8gB+XVKBG+OQxlUtGTjkCossiXwVKczsyWHp0ATkpcGPsYv/s/rIfcziiThRfdsN1VwFl51ms3pgrlHCzXqgLPhYlt8o1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074328; c=relaxed/simple;
	bh=HcdxR0QkQCwxHy3Cnbsvr5l5RGluBp3hnIhcPvLMuEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fGl4C/M40zY3JwMdLTqV2IzkrhXHzuaNgymupLOEfg0Rjoa8BQqKSy5DhaQUcxVeAY9Wh2mjft+oLZ3zw9PibcECq4EQRsWhe2TkaegZ3Sb9GTtvlTsDpvKb+rocH9U7E/Sr/nw2EvbsEM/dgxlYblASREk9D94Npx4or2sdHwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKYOv+4l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2yf1boD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKYOv+4l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2yf1boD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rlEd3123714
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=; b=jKYOv+4lcTBCAhE8
	i4qzPPQPd2ZSydMfWzxqJKxKm0IZpxvIA/KGMhN3OI4abRxDi9gQiLmaRJqL5b5Y
	aFUf4rJs1Syyq8JARo7FvZBtcii2lYmTGNz71PV9aBb4acrn9IPI6/EBwlyLbzir
	iSDSozwFgnyylT/P3uHoTq6zEWJWIv5qjRcgmvpktKz8qGDP6ghN6P1bFxMJYSLj
	dqkS+5Tk1hujIcGaBlS5K1V5blo7Nk7qKE59B405z6d6f3rpxqtcURpI8kcQjuqb
	TjPK7vKPi2fRQurlmLxZypy5q9aU/GmrDLj4yDp8xGFWvvRNZ5MI9LZiU7/RF2Nd
	KSLXzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcusr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:25:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so2943511cf.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074325; x=1783679125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=;
        b=M2yf1boDcrSJZE1Z6B+Xi1+no5AfuCkhm3gPevHnAVkxZKb6c0T13CWum0UpvlNu2o
         k2Na+s7h1tC+vCvkKX1lZc0BePeg5VhT1OuLiDCGMdjI7aEJ0jEKVAaRM0wU3AHsGeRM
         4GBdvSTejAwjrTds30saFlWwFZl3ZNtoWBBCinA6YpVqhgbn6dnH+kbiyjBHz/XcxL61
         5W44ZoBGAI63nBwLfaxW6lHF66+I8nAd2Ky/dA+Xs0mrcRZ8Tjp9IfGmoVIpYd06sq4i
         xUdrlcbEDwDvTuVUK2lPhHWwf+E3vGYpBXgsm+1w6edflyUOaW1g7iD2eOB3pbXr61kH
         HLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074325; x=1783679125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFmVjSKmtezW+iC/SEgcCIOX0juiZJsRO1owbDX0Df8=;
        b=FNntkXsMQrJS4/S4Tn+2CGJvo/v/pIUom/R4OysPlnskiZ610Z1g1tauwjpJPINjVf
         DJSvN9aQK80+iipMmSSwHuHH17CfyfhcHj0dzjPvjVbZWa8yBPNc7En2KPXn0IY+/oUt
         uGVAz7R8q95skkwKWRtACKWR8n+rZV2osTZTFFwmRvUv/ifj/rsuSi3kJMmdzmttKGCU
         va64knk/MwPt4Sw8IPpKSI0fwyC4BndGspmHjzNrJZfdnY40dZikQs0eAzFmk4CtonZQ
         yIxYhfJo7AxhEmrfm+Syo6nqnB8OeW5eK1VIZTfT3rHFwGeCshBolCqBiD60XwA3tyBC
         EOVw==
X-Forwarded-Encrypted: i=1; AFNElJ/CEQWha9Rm1R8AnBL3LYnh9CQS1yysN3I0kH6zRl/1MHDa2vSgkDB+etx1DUBrKIExxIYymk+KhDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwowaKCsGmkI40tai+ySCtvtIlyUXm+CQw0KPnDOMZSyaLWbhBx
	eLkhWHjnXRqtOfiTNY15LPLDh56TJhM6MY9yBa+XOTiEJwSuEr8YA0fqauWUN8gQ+kPH/08QryP
	kehwPynpdvXp20ccwYzb/mcrexhedUuheocr+waGMhsqFMjv3ZazEvW9Rv4TE/ow=
X-Gm-Gg: AfdE7cmaDJYYgyQO2xBbneyXYDRYSPh9G6tSm+62gslswySm50Q4a+XNi62cAhThsNK
	d2UcqUW8yvB88J9OAbA3jVS+vteTPLjNydPw/owmAFBSO2pDDpsmhSUlahb+RgO5E34cYVcshO3
	+aUxC3auKoaNe/18LvokRptQzk/EWqBt0tMgqc3n6lstJilBujwlNrcvfAUxVPG4valEWzKXXiI
	wx9R1+oYF85Szz4wAJzyRisJI1kTofGNvCaCCsbEvWF7QKsPgpW9fpFOScKiJclLKhV0z26CF2g
	TD30Zp4F252+srS5+v26gVGy0SnwK+HNifzRm4jsIUFuXDaRvGHdigL+Wb6Y5+uS0/p+As6JNK3
	urUxExdO+guZ2cjRosrMoCIXjW+m7QkcB5dI=
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr79863721cf.4.1783074325303;
        Fri, 03 Jul 2026 03:25:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51c26a69173mr79863451cf.4.1783074324941;
        Fri, 03 Jul 2026 03:25:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6059e4csm263041166b.1.2026.07.03.03.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:25:24 -0700 (PDT)
Message-ID: <e5c4c9e3-aecd-4559-a536-e5f2f9b19ed5@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 12:25:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] ARM/arm64: defconfig: Drop redundant Qualcomm
 clock entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
 <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfXypjgEO7je9Dr
 e/+OmeV/c64CYv4uyxErCPR8w0Lgqm5nmc/UqHg/JUwrTZD+S601utHiDGO0fk3h6uUVfIKUAOv
 wLAoFj4sCDp8zpGm+4d0KDZRGplcVJ0=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478e16 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pIb2VplZuXs3id8JfLcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMCBTYWx0ZWRfX19MUfib1FPIC
 FNSPKxyFea7F4ELgs8WdDGxRFnnPJafoFRNbY9+h1cZXk8G13/73t8it9yFpQFH7OF35akLTiO9
 Kwm2qjnv40J8ks/XYDoE7RVVHsdz3eSSk7cKtH7rXOWMG+z8axoXddsL7hVN+ik0wCmHi36DaoW
 WAOOzVRmbZbkGVbBdJMnzuuQS9FHZ0FzSkMOxAfQCGPo8cHYtwvGJktyJaZQOOwqEIniotqDtjO
 bLWuVwCzxq0QHKN4zqUwk4i3reDk0gSZcBdqSqU1OSJLaKrv2a8rETuRT/Ae/dyV78S35vQN9mr
 h4gPqsKHyzjgx+Sw76UNTBw3Vuxf+7ndaaTSD6v7HMU9MXXU5YCY2YpztOjjlWwl+adakGgxSHn
 1BWJuz/D/g6ab12MRL6h9ZLMRuvGLpFJNB1AfrryCkHdl+yyu0x2YRNga333lbI4ThhxcLVCMzu
 hpzKdNzQyrD01yIrm4w==
X-Proofpoint-ORIG-GUID: TkDOCjHiCBnHIJjW1uU160O7aRtCZB01
X-Proofpoint-GUID: TkDOCjHiCBnHIJjW1uU160O7aRtCZB01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030100

On 7/3/26 12:04 PM, Krzysztof Kozlowski wrote:
> Drop all drivers from defconfig which have defaults in Kconfig.  Drop
> also MDM_LCC_9615 which is gone since commit bac4675a4d1b ("clk: qcom:
> drop lcc-mdm9615 in favour of lcc-msm8960").
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
