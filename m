Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BF7388873
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178312; cv=none; b=R5i2xu1p4DedqqUmHJ0RRv39uHjAkmzbIlLIU/+GJaaieIp4V6Fi9TyMNRHUdrdE5XXBxme0fws5iXm0JymJm3pM87ex9PETwwHfPXpFjqTTkbuSlkFs+v7WGPwTurL7M92AatCCyJuwrcgYqVkQGfBw/LEppOduWuZ8GRyisig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178312; c=relaxed/simple;
	bh=66ok9XS6LBSFLWdxSWpHTA/jSefzpGRqhRxSTD6MtKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMCMGg+tHeNy0l3vqIvPMZCl4YlJHgvWfBXGB02gRj1/3surnITEXInow8JMLIl3FgYgGA3qLuWNkiHkTTRVDDiLItGy7BEhhcpqw0aF4rEkbSKrasNejlfhUsWbKNYepK7e8aALu4DJ8prTe7OnmFe6AxEtyN4j+jMbMFFZHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp6Q/UU7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drjHKvNP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp6Q/UU7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drjHKvNP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wRcg1412238
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	36J/tFZie+L/XnoGiYndz+KyMCcSSDFH0ijdDOOWap8=; b=Qp6Q/UU73gH+fSSh
	RZqnq5/G6jJfCdJ/EpkvbSJlq42OpjWGQFG/J0jHa/4hZW/qt/KmZ1LqGmtGGNrp
	TAstqstM79uakrrGU0BxUeRg2fOnn/pZOgNADcQm369deN7va8cKxnGAow7QRqfF
	Hu8IueWIcIuF+QTLJ5it0BXLYbebd3iLToEn1F0aU7ww4wmLjNH16UE/FHISVty6
	KpWAuuus0zcohaYcgEyJ86EHnX0jqPb0lP34E7+THIOvpWd0plrS9Ubs/YPi8vd+
	5BIzDNsN7Y3sVnEB1C0a1D28hTjJIeDmyHyOnWG0+0yK5TZT74e+BXSoyllPnxrJ
	oJnJdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7kac6g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:05:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811ae55313so2811574a91.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 22:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784178308; x=1784783108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36J/tFZie+L/XnoGiYndz+KyMCcSSDFH0ijdDOOWap8=;
        b=drjHKvNPEY9nZzQ0S3/v6MoI4EjQy+1MNvWtmIAOJBcJNkBByfKMT9wQetj0dmQTnS
         e8nkw/+rJG5rmGSFUVOOMh7uhffR3LcbRqC1IG3XoU78BpZzgp6Gn8H+djhMSqr7Wzg2
         ycTDmL/+X4hWDsBKGGg8tfpRJJl5YqN3zYiVtRMByqJPS10AQlEI6sauM4Dl9NSAb4Hv
         KEj8p++rgfcIt2ABYtz4aX+4Eu+GSYdibNhSj9wcqQeFfInMYgKqdfwwoU4pnGg+PDUj
         j9RSCEdZwQb7/Z958Fdd3UcyoHoQi0SBxs8nU2GIjEgKu+2nD/ICL1g2K3aaXtVptYIk
         RTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784178308; x=1784783108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36J/tFZie+L/XnoGiYndz+KyMCcSSDFH0ijdDOOWap8=;
        b=sqhUThXui0nCH1xbjx4TxCz5exuS4Z92ja22cjGKnXstAPRwoX0U/P2qno2NDgG75b
         LvnceYt2ZKULzGRR2bRDmvPGb7jAjNfuUBHhVyRmSF8thwi38mmQ6G+VUx2USkz0Ixmc
         juiREnYbBwpwZFTyjdik1hqQwCOlmhIUxFCZdWTS+cCNcHbkT+Yx9YPKkvy0mqno5KS+
         lCi3Ql1umQybryIbfemPzW9Oz5uEN1pH14WrvZPZgaFS0bBShLKMccty6PbuxpS2B/VX
         YGvDyza7hbvAndIvYTLoe59iln8RZ04LThG9QpewXOszrr7DYyjkexQmJSWuzYDUPrHf
         reXg==
X-Forwarded-Encrypted: i=1; AHgh+RrHQ5gArLFOu2G89sUvIvyoQnNUqKfEXHE1jxGB89F0hHmC9sKd6P2bffOKt/T+LT6d+IPb8+PTmuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW/znonf+bybIcZtQTS+k5Pp0VFPgsHfql+dyOP943mdViK8Oo
	OZpSUyW0Ryusv6lHyZS13sr3G+Z1A2pHVQOLlaoWDc7+2KuIVDCeV93G6ySSOIwa/GWluBvYrCo
	NJpiyvxCoWzXRR/AManaXIl+gYdGWnukIIxjamXAoxjCSL0vdN9egnXLGpV2G2pc=
X-Gm-Gg: AfdE7cnStAIr+xmBbR2FrcGNGVOi0H+nZSk5K3c4I3o8yUp1RW7dHRy+C/gPUx5Ajfo
	Yd/g1gIpQohbJNW1zpae7ukuKuJMdgkIvBm6BLCUP4K27/9Z1o36mdaw43g0IY6OQ1+jdQWCAZP
	R4ExFkkwLiXTxDEA1aRwY6tfBL0jn2MACNG0V6cnT3foaXbmhhGDJ+ObcZbfzTQazVWnzHBdBTY
	6+ZP2B3psjsJJZmwH/3N93ywBUSe3zRO6IerIxTxqmZChqE7O4DRpGJAdI23Ti4XF5daUHwDQkJ
	O9By3+2+CZ/vifRYLaQmMw+SylESGWijUmSkhu7F6aljn2PGgE8PcJPUUF+zLh5Fe3vHrOgWw4x
	oTNR6cJrq2ssTtxC8KAPwCLZfdd0=
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr17822149a91.7.1784178307905;
        Wed, 15 Jul 2026 22:05:07 -0700 (PDT)
X-Received: by 2002:a17:90b:224a:b0:37f:b0a9:1a68 with SMTP id 98e67ed59e1d1-38dc782c68emr17822113a91.7.1784178307415;
        Wed, 15 Jul 2026 22:05:07 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a119c56sm624747a91.16.2026.07.15.22.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 22:05:07 -0700 (PDT)
Message-ID: <81c314a0-c052-4843-96a6-80d8036fa6e0@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:35:03 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc: Set
 FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON for PCIe pipe clocks
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260714-mem_on-v1-1-f5bfb6def0a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a586684 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=m8Gnl63oPaFM7zqXGsIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1C5R6lLeyL9_lhIGEr8EHNmwiPXPzzeh
X-Proofpoint-ORIG-GUID: 1C5R6lLeyL9_lhIGEr8EHNmwiPXPzzeh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA0OSBTYWx0ZWRfX/rbE3z4FTmsW
 F2l0StngATVeHv3CxJFNvRR/CuCMR2feVdntZ6wqu2cXN0Uih4gByphVnZh9/skLBNjAvgM3bUi
 F9A7aqhFXBjFFAasCxPLIlh8nA+vkrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA0OSBTYWx0ZWRfX7JxjdmNi4w+5
 MK86WY8kcVcFYlcZpUsy73F2pJBypelwif17D/2Egjs4IV+lUFo2MYy8qDVvI0XVbgkyt8bfHcD
 G5C/1Mnut+E7LmDmRdHZT8/NuDDLBxrUDSnQ48wODzq7uktETSF2h5EZeBE+JyzAKmngJ8NuHTA
 Iaa3R/amDmNKoc9voNe4eid92Z75mEGslSl3f36VgwIuPxFgTUyiO1XlXVFUZzFA8jDU6lKnFiP
 eULo4kGlPxh4/je9BnwA9AnIDL5jsXUa848yDntlQgihYmC/MktfryIqdLtUjFlorSDhNqXXWiX
 cNeSaaDaLTXQIZV/OsehDZtdSHIWeXtgQEHQ48DZqz18ZG/a7B0BWmNI9E6WxgsMa76Pwl/cVhc
 ykabEUxvFI8RM+JV0eaUjv2+/Zvq7wq17w2mxiQE/ZCJ/no7oFvpC3M89rbizVNl5/TLP5jIhgW
 wiSpkU7OM9c9y9LJ9Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160049



On 7/15/2026 11:53 AM, Qiang Yu wrote:
> Setting FORCE_MEM_CORE_ON and FORCE_PERIPH_CORE_ON for the PCIe PIPE
> clocks so that the inbound data path works correctly.
> 
> Without this, the PCIe link can come up but the endpoint can not access
> host memory, with the host sometimes seeing a completion timeout
> reported by the EP, even though the host can still read the EP's config
> space.
> 
> This issue is seen on QDU1000, Kaanapali, Glymur and Nord. Hence, apply
> FORCE_MEM_CORE_ON/FORCE_PERIPH_CORE_ON to all PCIe pipe clocks on these
> platforms.
> 

I do not see any such requirement in your code downstream, so trying to
understand a why both the memory and peripheral needs to be set?

As I understand this was not concluded with design to understand the
reasoning behind this change.




-- 
Thanks,
Taniya Das

