Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3242A3E2746
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939822; cv=none; b=V5TXJJVEjYUJoHd0Syx6wNx5y7qylgh2Wspt4prOCZzMCw0CecXJ6TjFZKukfCa/O9aQPeF3rEbIZ++RTLDOiPRu93mu9/g7X+sSbsxR6QRqJQpqbk8TE7VNrYdxirfoJeWqc4lrRNJl2g7UVPHmdUfXPFnr9m1dY0ZZUpm+Vv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939822; c=relaxed/simple;
	bh=Vh2sWX1iyHi9Tw+t86WJ+jfswAcvxYFSL2CPGjT58ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6tav0N+aoyBQVpxspwVNcZnXRF+oAyILqbN4lDkQtJHrr6hz4tmLAUcet4t4gtKMu8zJjT4SuLuHYWHyTohWwMJKZkYirFY9QMMZXHlZcY2EIygDlvFBwFdhvvn1E8jwDFmkKA47FTaHI5oceqcNTi34QajVkwpih6MI0bbwDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A+kFtuhG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utvv/NL/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A+kFtuhG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utvv/NL/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NeIS731612
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=; b=A+kFtuhGIQ5g3B9F
	8Ys+YJmsUnQkhIhiE5p8bOrhfpd7AeMzmnJMRZlzn7QCnc6xRV7EyvtLaYW72R3B
	ZTXe/SzZ9mnWr861xgCXBL6R4HLjk1iqO7v1NmYYLUqI3WLbrCWCDoizg887Jpv9
	S/wOed+SL7F1rgnrACNDt6DqKVWqE1wPO7TNY1FLpOCmg+l8kCUjZNmHPaJIhQAo
	mYdnUlYWDBvBG7yUSD3LPdmhy/HRG4BZqUQgvj/qRTWkguNL/VCUJ+7+RRKxWU68
	NVFj99ecao53OOM+L4fMVGd16NWGmLjH0kqd2N2vXZuULhzckXI4EME5EKl2+JnH
	pJQC3w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a4q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 10:50:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e8e83314abso10951546d6.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783939818; x=1784544618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=;
        b=Utvv/NL/GX2lFK5hLXmMzXbVlxikUTOGVuZTEqvaT8ElmOU5SJ1BNHUHarL/iDtNlU
         wMeHRQYWoZ1ldvXTNL+9tirbYNqu8cdiyTdwfqFVlVr0nTtL85MJ8xabNh5bPYNsuQzS
         Mtj4SSaUK5WyLKIwjvuUg+i9kGUsIz6kjtPgpAXPEWRJqWiW2bosCqY/C28yVSYu9DsN
         cSdhJYr5LriDXyxOtxUHPBrXw8fKFxuK/Fu/hYDUhslKxpFOTvdreMOTdyXN7uGYRTS/
         b5KWgwVMKRvFPXcIxO18d+f4HKB7ZNSvEsI4MBv5/el1AdzFm4TqbVcQt7AU+d3ocKAA
         6GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783939818; x=1784544618;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEf9r2CGUDDvdRTVlkeJE3LCyB6+x1X6aW6SrYpfnPM=;
        b=Wy4G6yAborGp08okND+tb4O5PsGgJL5aviTTsFu93cBFlWK8/39AEdanBfYq3+w3xJ
         mtW6FVSNj1nDBB0vpKRXOyp4RKB6o4qqK51Fw+3dZAXJkwsD8DLz6cryg3OJcLPj8mQP
         8pyAM/jbKRvRyVM1NK73Vo0FMZVqENI6JEiYz00zVsyS3wXUgTkUs6ZH5E4VfmEgTcAb
         PNs/iWfTJlax3lG+QCAQqmoodE5NKhaRlK+B9S2c2Zp5VPqbHR1pEen5h+RnvhCxBYTI
         gag7T+8JR4aeWgqLlrZ/8JoSzjCjkujG2FEQUEl5zS/uKKvw9OSgsW1PBx5KnhDHKrxt
         rYGw==
X-Forwarded-Encrypted: i=1; AHgh+RryXTsffaWL2TyP/31h5ugsNeHPxcKTX38wBEg4UV4me9fL4ZkGstTDRdTgVaDTWoZ3xk61v25g6n0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNqRFvNmTgsoUja2+N++99al6HPzucTarlo//qJcs9k4XXNNMD
	oLytnsi5b/veu5lfGM6tnpuFnrvQauaEX+2NPMj07DT6WQMDQVtvaBqxGLqyUHXLW3RyYYGjpl1
	d3SdXqmC3ABFUParD2I7cHrUj6gm+LGOY7DiH2DdzDL9DWEsArCvfTWu9UAYJeAg=
X-Gm-Gg: AfdE7ckdmUuJQLP7XAK8Z91LU+oo4UkD4PnzIeZuhbKE9nPGn6C3lhH5AU3Kt6pp0hx
	Gf5Moo4aLZDghhGSb3B9mIgTtGEsk0iiXxp7zGo8tmcWi9RwboSVddzIyQ7f5S5/an87tgpqt/O
	DKkyRLWwGCSHNIh4WExwEyhw4eF9fOUCfiBzbkpGoT2sqX1UQhDive0qdej9f6EFjllWj4oxW1w
	BB3+zsN9/ri0jnIrYDwNaELGAERPFUPEOoR8J8id7fEVAKuuFt44cDdROKj+7NPkA+5bRVsBfe5
	KrBuxb42atP93SERSV1jA4GUua8nO8szTPAaygB52lJSaCIc0VmuUGBBUFiqPcH+4fCvErc4kOf
	kG1TKnxEIG4a43zfY1hYSLSun0hfaEht8BdY=
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr567815185a.7.1783939818516;
        Mon, 13 Jul 2026 03:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:440e:b0:926:e8e6:3c28 with SMTP id af79cd13be357-92ef2cb409bmr567813285a.7.1783939818123;
        Mon, 13 Jul 2026 03:50:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e19cb6c0sm631526866b.26.2026.07.13.03.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:50:17 -0700 (PDT)
Message-ID: <6052772a-bcf0-4e23-89c6-9516a6f68f20@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: qcom: dispcc-sm8450: Fix
 disp_cc_mdss_mdp_clk_src ops
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
 <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-1-fc1a07ac5601@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfXyRERBbsBIE21
 oqS9LuANLAwV0eSIape8h33/r5wiTeJTMx0AWXIuxvHNePfsNbvsUFCen+7AqgRkVVp4/0nj6et
 SjMLRwp7nGK3j2EEEuCKMmCffKTsaGWeMnu1r7W+hVUFkUK1F7YUPhyPs1m/CBpgO+qE5bEHHPp
 wFaxgg2sfhJKsbs5DXD940pQaBnDSa8jo/2N3geK5bGnHs84FmEvtlrbbGFQyl31xG3UjhvVAC6
 Dz18gum1emQ1xTFMPusTY+2XPkCwVqatRkc4SsgwAoMUrnnezG4GwN44NzxK4DR2NMwZ7ew5sSo
 DGg3oEVtrGO/Wib1M50BTnG+n3zegXHYdv3pW7CYEzWt6Cxv2TyEp2PgwRysXYO6coIv7/ITaeI
 HxNoO7U+KuIGHyFA5PfhXR93Tj/BrEaD79OWWCf4BrcJFl0HURugxaljC5pjQ+nruzXxBgCVVTm
 sJNSbxjUdwG9NKPKe8A==
X-Proofpoint-ORIG-GUID: j2cuADDaeBwrt28s85tu5-4lT5olIXUq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExMiBTYWx0ZWRfX/8FeUfvlLsEd
 B8wsg3x6sRPos5oZznWOyD/0OHXMLrAoyA1Hr1NVnzP9DNPcbFPI7uQhrOrhmTaAsDIGrfBK7ZC
 PCOlv1GDKD94m8f3aMZFIp7W4uSCI2E=
X-Proofpoint-GUID: j2cuADDaeBwrt28s85tu5-4lT5olIXUq
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54c2eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=LLcCrvt9GrqY8lSa8nIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130112

On 7/12/26 5:10 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> If the clock frequency is changed at registration time, a flicker will be
> visible at boot.
> Switching to clk_rcg2_shared_no_init_park_ops fixes this.
> 
> Fixes: 16fb89f92ec4 ("clk: qcom: Add support for Display Clock Controller on SM8450")
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
