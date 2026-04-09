Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49D15C14F
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769872; cv=none; b=lvRLByBLYRyDaB9Kdk2Csre2wMFkFiu/TQPoPTBOYOTeu5+mvCXbFqCR26xT62JNQY5vZ1G8PEfKPGoFevFX7sYmNUS53n5S0tD5RIHDfEC5RAJPTq5ZDFT7qw7UN0ePqPdyv6yy1+ULmn5S2J1zvCgjSX/TKalLx/xHukxM/ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769872; c=relaxed/simple;
	bh=Mf0qsRAF6MIxZLHl/USOoVexu9tPXjRD33F+MdM35GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyw1G/zmabD7pjJMgr+8PlDBWPxvoTF8ocmpVBVtehyvv7rHZ6SfcwTDGqXG1r5UQA6PPUQgraRJ8qCHD0m7vvnqInaS7EIknRjgJ+PxjE+bFe4pn/7Si5zECsNb+1fgu2KrdzrkaqIjwACTSGuz51GXZ9DukGw6DUnRdByHo+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mxlah4iP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jva27f6M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mxlah4iP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jva27f6M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639I2VUu3352593
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 21:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MvP4PI/IHkaNVMOHL4GMv34r
	8KDtq/CI7OBkFFUwXxM=; b=Mxlah4iPaTW4PjMNET5leXV8FINOLMZZIE9/NNex
	ZNAuKIq0SXfzX+JmnjggtrX3QqYgv4oqRd+FdrpGFU0hBxCQ2WriY+Y7Td97wHJt
	MwCr0yDCMCJziYMANNCx+fDZwlUnWURSZbumFgjVd+RIQ2FbWkFCk1rxKz0a0p+2
	nxSyLQCBx2i/7ZXMkqqTijLDmV6o+i8F/g6xgHykszi2ZmQK6SHOwrUcS7PK5Ne4
	NZQ7he8b6BbRQ0cM5LaJJzh7BRJi3YqtnGGPOoWDNwWxZ2Gv1DUvCsVwlq5JmdK4
	1lsCUUCSu6O0aP1NHzDZ0skPVBQRbjHCwRREqZw+0DLW2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qsy14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 21:24:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso26129601cf.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 14:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775769870; x=1776374670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvP4PI/IHkaNVMOHL4GMv34r8KDtq/CI7OBkFFUwXxM=;
        b=jva27f6Mon1mBcPfDgFlBtg+Ct3EhRL3K9+X8CJWOkW+LRIG9bwtCbu9MBh2puRstj
         Jwr7QBMpNX5MuXg3WiUUon9hUr9zhDrsPa4VdWn9M8+ts6ZnWe+mtfLssI6yyG7Wchg3
         HnX0ixtVKAlK8aB9K3JdCXRrVbOqMA0x4gvv8azy++UKRF+etdnmb8iS9QbPLGYtobck
         FAFK4u2Xqh4cgfmpnnQjp/xdJdtuBmeSD0P8yFv90p1kWdgR4CEsVtpy3TvBb3tSd2Mh
         R0mN3ACV+3unCGIYVPBzLN4QRgrXt6863O2zmQUxl9L9ehGC0S3wxSY/xACKbjU974mz
         6wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769870; x=1776374670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvP4PI/IHkaNVMOHL4GMv34r8KDtq/CI7OBkFFUwXxM=;
        b=Y8DOYIYQzMsZJAs81Y1hTguAXTS1VQg40/z5B0kqewAie6aLJ3bpxQD8xi0apmp29z
         TAuiZjVwErp9yUouejhscLj70dsCfX4ZadWuBWd4gKNf2AFeyre2xNX2HbOrTgfku1z8
         1mLgeB9QCVDrz6fNbpkj+kQEyKLr3OhfCrD3U1vjs8EMRzwBXF4um5CP7hIMHpiirsQd
         lMc7i7IaMBQsU/aayD0bChrO05Qr6ebrptwCPwdTy0rWHzDuxhFU03fmusJPriR7ijKV
         ZyWJKrcVjdpco+AO3cpvTSF2sYkb/QtBkVB6XV+wg7rgOFPb3X2U/HMLWjv3dWWvSFF1
         uUmA==
X-Forwarded-Encrypted: i=1; AJvYcCXNKMWO7dwBcMj0nUUbxM3fgP1xAumP54CaBQbLUBCBqkbmkU0pAjlrlUaWlll6REJcKCMtRMYeLro=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0MgroH6EIFgp2l9NwMAoxj9nNMtes49Kn2y7zXAsPUPHzlI9
	BnMmwgixjyjYqyQzenqSkS8mR0lPj7y3qCu8E/2DCF6MQkvQ3pLjibgj3/u+PulL4faV1RDMB2V
	7T4zs9qf2bMV4Jou8BI9Join9mA0xoGs3dMsIdg9wq24AYFD7uRBCDdITKBygQqAYLt9CgIw=
X-Gm-Gg: AeBDietze/562ZlUdgIXEcncCNAulO7zg1leBAiglH/8E9fFs5TloX/S5x8+y9Y7Isd
	bEnS3EHJNXGn1DKnZBs53oLfX5aXBPGJSc5uvfLXxEBIkyk+6rvfZIF9pSgQlDicYN0ZnMvT2AC
	7Q4n0gu2D7JRANT8A++sKYePGEDMjEuv+u5aviD906rPY/WtOA1vZktvJlKldj02EHW1nk52n1v
	Wf1V8I1sb/V/3+6kLxZei+wFuKrh9tAp573s8JiQ2SEAK9U9H0SO+T/HrBryJUA8yz/pOVaTuZE
	dgIKeOahEPSaxdNyY6Fpw9VBHt15PGZ80UQjKfnZpb7YaKngZGv01lOn3WwsQIVAacfiVkFs0aV
	4hnXyAiPtlwRg1qRs5gwSpIhFYyEEwLUn2EvvqVg3Uvvik1OEQAp4631FweNGoE+g3ckbd7+HLp
	2CAeFnCyOu2OBdjkCudVwXVzEKO6FwlyzRqUM=
X-Received: by 2002:a05:622a:4a8b:b0:50d:6acb:42db with SMTP id d75a77b69052e-50dd5ad9882mr14906191cf.23.1775769869763;
        Thu, 09 Apr 2026 14:24:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4a8b:b0:50d:6acb:42db with SMTP id d75a77b69052e-50dd5ad9882mr14905741cf.23.1775769869259;
        Thu, 09 Apr 2026 14:24:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e492cb196sm1897911fa.17.2026.04.09.14.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:24:28 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NyBTYWx0ZWRfX2UCPlyUCuqLP
 f4qDm1x85nGgC7yfpTUvyniGgtsI1Aez1o1INp+1sE9TCDiCwg5ZskewBKpgTFEb6dZcqQEEOgf
 ya0p7eT+rgubMkLL2F9mmoZDYV6pd0U7V2hOHc7+tPQpGItRHugwjfDynSV2SI9aKmvD/LZxkjg
 Y7BciepNcEBcawJE0MpNt+ynhAoewU/vUC2lX/wtHF6rz2KqFEnWk4shpNuVLF8vbqR45ew+Fum
 piaW326PwRJ73k8BApN+CK5qPqunk+O3yU553f9oWgwwxCmxFHhZgaz7BFU8TjeHTqLAhRViEDn
 Bb7AZo4xy8GKiGyMFugxcp2+5larVTLRIl1qag3mfIvX6pDTxh2FMCyWqqo8zbpRWJkpYW9iHJV
 3KVlCyHSs40/3ppL1f74+0fa9IuF7+bQTVfSdkqK0iSIjqucDu27F0L4kY40oYiiKIue3a8g+Bp
 JmfwtM/rtLjtobdKlzw==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8190e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=bwGbKnmsAAAA:8 a=0tHUiYncBWPk1K_QiEYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=EWLf6cg6Bh5aS0AxDgDu:22 a=nuVVIWbBudwLbAahYuja:22
X-Proofpoint-GUID: 1wvW0ApVvV1hQluf-rwcQ8J7s5UtHHcF
X-Proofpoint-ORIG-GUID: 1wvW0ApVvV1hQluf-rwcQ8J7s5UtHHcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090197

On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
> > > 
> > > 
> > > On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> > > > On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> > > > > On 2/18/26 12:18 PM, David Heidelberg wrote:
> > > > > > On 18/02/2026 11:30, Konrad Dybcio wrote:
> > > > > > > On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> > > > > > > > From: David Heidelberg <david@ixit.cz>
> > > > > > > > 
> > > > > > > > If the OS does not support recovering the state left by the
> > > > > > > > bootloader it needs a way to reset display hardware, so that it can
> > > > > > > > start from a clean state. Add a reference to the relevant reset.
> > > > > > > 
> > > > > > > This is not the relevant reset
> > > > > > > 
> > > > > > > You want MDSS_CORE_BCR @ 0xaf0_2000
> > > > > > 
> > > > > > Thanks, I prepared the fixes [1].
> > > > > > 
> > > > > > I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> > > > > > 
> > > > > > David
> > > > > > 
> > > > > > [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> > > > > > [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> > > > > 
> > > > > Please don't alter the contents of dt-bindings, it really doesn't matter
> > > > > if on sdm845 it's reset0 or reset1, that's why we define them in the first
> > > > > place
> > > > 
> > > > I dpn't think that will pass. Current reset is defined as RSCC, we can't
> > > > change that to CORE behind the scene. I'd prefer David's approach.
> > > 
> > > Back when I replied, David had a patch that removed the current RSCC
> > > reset definition in dt-bindings (at index 0) and re-used that index
> > > for CORE, putting RSCC at index 1. Perhaps it's better to link to
> > > specific commits when making comments, note to self :P
> > 
> > Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
> > work.
> 
> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]

[...]

> 
> These (or very similar warnings) are around sdm845 definitely 6.19+ /
> linux-next kernels for some time, but pretty harmless.
> 
> LLM suggested multiple fixes, but when presenting possibility of
> implementing mdss reset it found it as most preferable [1].
> 
> Adding MDSS reset would most likely solve it. It's not critical, but not
> nice to see many red lines in the dmesg.
> 
> Is there something I could experiment with to get closer to have proper MDSS reset?

I don't have a sensible solution at this point. We tried using the MDSS
reset on several SDM845 devices, but they just reset. So... I don't have
any possible solution.

> 
> David
> 
> [1] https://paste.sr.ht/~okias/c20e8bb1a67ba09df558d56da84894d71ddc1b54

-- 
With best wishes
Dmitry
