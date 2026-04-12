Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2448F9E8
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 00:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954477; cv=none; b=JNhavTi/s+tTcMMWYI+mmc7x6lBeP25U67+FBsQDaz/y8E6IatfcSmSiuvADvPVJYpAkcYlnZaMxrmvpqluhKBVjiCjvGLLntmrv8ift9BGpyZ/v8PcyNA8jJqjDy2wAIE8XB3rPX9brIPGU2oXmoLoBbHsXQQeQ1b73kVcnqKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954477; c=relaxed/simple;
	bh=rQYUtrcd6q9RdA0Nc8Xx3VIF1B/uBZfEeT9xSfQo0ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxwM4Ci/ZnCFX/Upmn+ppp/kah92qXt7hb+DQEBpEHk+0M0sUFCDOB2qhQfOwXWfsPpFu5kMiijIIsTJ9j6wI2o2RPxaGinjlr6vXmWv27Hf4mkcz5Og9x8FQIOmpy4WRidLyDoxF7MrT4XwXsUuw8weoZXfdvNAudINkUIHNuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8sJJyMs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmM5YlqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8sJJyMs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmM5YlqW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNrqMh1596066
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 00:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iHGr+GrtNhKVXfyM/WZywZLD
	0ejh+T2wDtBuGRQYEO4=; b=W8sJJyMsOmaSub7t0HhykNH6AzXYCnmjB6pe1GxD
	iABGU15b9fi+CyRap+CDTf9i3hz4IoNaz18T4sddlkq1iTHrBjMswT0M+xhNVUuU
	eGBncuyRQ+gccuqT6fy956xYnGhOgPne+J6quaamxK1k/JydiFfl+fTcJhd/cINS
	SFtr74U38g+fPjTfOij8b+Cgli8sY3867/gFka46+hvNrTdctvh+AyBt38Yu2g6v
	Z0gcb80Ev7jXzc8a63h8VIij47lUfUWyF0NKAm+V/05mCPpVzpCtHL8Y0je48t0l
	T5Fiuf6sHFdGhs3w987tN5PcKdUsRO+M0C3KDaDZDRMAoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewksk37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 12 Apr 2026 00:41:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d831e8083so34640721cf.3
        for <linux-clk@vger.kernel.org>; Sat, 11 Apr 2026 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954475; x=1776559275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iHGr+GrtNhKVXfyM/WZywZLD0ejh+T2wDtBuGRQYEO4=;
        b=OmM5YlqW8jJizC9APonMnL0UHHZBrMu1vlmYicQDHdM260B5SVOMRrh4zuO+UtUBNL
         s5Jmc/qgtHzCMySoHP5Cdy88Dsdpo80uHmeS4ejjIlwbqvyUZB0MVCfzODBpQyWzzw7h
         ATdw/a4JA1OKNXZwvxRDC+6yq2CgkMtDW3uPijKF5Rf6ioUEzuCKyZ7x8uVpYvIZCmQi
         enYIqaoLf//snjei77VvTuxkkr6/v/jcTgxN0yrbFjz9MGwwDeYwpVWShVhQ6spqgVcJ
         yA08PPQSrvpj0SGiVBQcyDj0quWUTGQmiBVOWYYK4bRyoz3HVJbglaRFfoSWbJzcgiFV
         zTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954475; x=1776559275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHGr+GrtNhKVXfyM/WZywZLD0ejh+T2wDtBuGRQYEO4=;
        b=AQ4CyXACewzJTQYYwfF087rQe5gQqDiZtL5g3XW7hpl1U13KdDD8SCz8eZF/FDB4bc
         oaWAuqcUlAn72cagVkY0gxBgmleqfHgmvaHCQ2pao5YjjYr5ePsAiSvccHt/AMhIAAiM
         7gPL9WhtFYY0r5UXRZtTZzJMPMOMFNbHtt3GU5I+MqaXIVCVi3gW2raiQbwrdHWdIEpl
         pRlGYDLCaghU4JPyg/ce1OGY1H3ZVJFyZKsBMVrUGD093F12NVmXLyPsuzCJTRllE+H6
         b8q8Ch8iS6Qcpre819LXf5tNNpx3qvypMj/bE6GT7CYyrctn/YI8wUKJD73hM1hbQjS9
         HCVg==
X-Forwarded-Encrypted: i=1; AJvYcCVaTSbIxFS3qAQYLmqT33EdRb20GX9IVOQaC9wziN05P8azVKHd7I2QR1HOcPnYJWlxAYJu1kokg84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2dZenh1Q1pVL1TrT259WXARHda/q46HxJmAC3pnbTw7fDiOxI
	faQLwgsAfQGBvZmHAXYqAwIoZ4dhiJr+qg0+jDpRRoaWpHHd5Azf3Kd0rEbONqqjSfCQPgaFto9
	iJDQs61ts/7p0xMLlvQHTr69JQkrKzd4CCYhN9SArlqV1eJH7SsGtXdxdRMDs3P8=
X-Gm-Gg: AeBDievDGH+1HRcbRr/4lygVhOGGsAUM3M94M+OTdr3eTo3AouHnoXDxOMxNCOhVAXK
	TcwZeEFp/pIg5pr+BCJqiGNE3J0/H9tc0wHrUXFd3I0uJABRx4BbE6+w89q1h3LJv3NkhgqkJrw
	ZNwL1As77SpckXVuChwW0YO/l70WkDj9VQdpUGL0Fcf/wKn7GKS9b9PXMrwmMnXxh9CsdgerzKv
	W4BDeppUMh4sYqtVEYeCUS3OS0AJvCJqo+VZgFzCQ/cAXb92T/ofBNbm+HKaFTf6CBKyBwL/T6C
	R+0M/pRtJ2jLSbieunJEQ2QtbfOyycp+aA70/VDYA0loHC9M5vcWJ2x+qeqbYcNWBjb4bA/xxPQ
	GC9TO/0ifcm05U3cmjwc6xHbUgmAxqtDnUXMGgDw+FyLAtEkL1yUj3f2UqS7+KQt1N0D1o3Q7Kh
	/5bm82bx3YCtqHHoH+N9gwuA/KBAohF14DnVo=
X-Received: by 2002:a05:622a:5e11:b0:509:26f4:64e9 with SMTP id d75a77b69052e-50dd5c12ca6mr129340331cf.51.1775954474846;
        Sat, 11 Apr 2026 17:41:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5e11:b0:509:26f4:64e9 with SMTP id d75a77b69052e-50dd5c12ca6mr129340151cf.51.1775954474407;
        Sat, 11 Apr 2026 17:41:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm1732836e87.19.2026.04.11.17.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:41:11 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:41:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
Message-ID: <cm7cowdic42qziuwpe22b2yuakg2k5lqcdnfs3mspvbvprnbto@6kxucxrbnsc6>
References: <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
 <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69daea2b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=SXzkmgPmAAAA:8
 a=VwQbUJbxAAAA:8 a=H3Mb8alF3vWSKgz9c_UA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfX6PBaAHXgXpM0
 qwHwrpqcGLTx3nyFt49Mqhanf+dK9MWFD1v6VtfENXHhR8SYhBHl4dxwmE5GYeXQdDvF44Omm9e
 JOaAtof2Iun/LcKWddgZ5Jvt6Vg8x09Tkxqh4bSzi+tAxjYjE2qoMW5fnwJ9AdJ3c4RdNKyKepm
 7G+1Ie0ULN0XrNq4El5r0151jc6/n2q1aEAsfvD0FgaqNtVlpC+Ks/V45p4zsb/U6gmsL+6R1HU
 HVqgi2JK0Aivi4dDGLpfwel80K5ac7AtPRIUj+1XCa4dxi60hPTRmYlDGui1Fi6jo0zga5/1JFg
 km9G/KwIe/S1gpEFsKhZZxgq4NOsYuSoXXmBQX9r3fBD2psgbB1R/hxhF5lH2NDmSe9JpcwAEAF
 QoYjUeqIPV9ik4eT/ZiuuYpyeQDLNlACboUYSB+6U/tAeqhFNNi5rvlS9jhBfp7OXhZFMUDQLSY
 XXlw3+hSOqpRO4eeEyA==
X-Proofpoint-ORIG-GUID: oRE06t2YHGkGZ1oowD5ipJ4ZkijDWJD3
X-Proofpoint-GUID: oRE06t2YHGkGZ1oowD5ipJ4ZkijDWJD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120003

On Fri, Apr 10, 2026 at 10:55:53AM +0200, Konrad Dybcio wrote:
> On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
> >> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
> >>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
> >>>>
> >>>>
> >>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
> >>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
> >>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
> >>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
> >>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> From: David Heidelberg <david@ixit.cz>
> >>>>>>>>>
> >>>>>>>>> If the OS does not support recovering the state left by the
> >>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
> >>>>>>>>> start from a clean state. Add a reference to the relevant reset.
> >>>>>>>>
> >>>>>>>> This is not the relevant reset
> >>>>>>>>
> >>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
> >>>>>>>
> >>>>>>> Thanks, I prepared the fixes [1].
> >>>>>>>
> >>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
> >>>>>>>
> >>>>>>> David
> >>>>>>>
> >>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
> >>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
> >>>>>>
> >>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
> >>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
> >>>>>> place
> >>>>>
> >>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
> >>>>> change that to CORE behind the scene. I'd prefer David's approach.
> >>>>
> >>>> Back when I replied, David had a patch that removed the current RSCC
> >>>> reset definition in dt-bindings (at index 0) and re-used that index
> >>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
> >>>> specific commits when making comments, note to self :P
> >>>
> >>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
> >>> work.
> >>
> >> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
> >>
> >> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
> >> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
> >> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
> >> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
> > 
> > [...]
> > 
> >>
> >> These (or very similar warnings) are around sdm845 definitely 6.19+ /
> >> linux-next kernels for some time, but pretty harmless.
> >>
> >> LLM suggested multiple fixes, but when presenting possibility of
> >> implementing mdss reset it found it as most preferable [1].
> >>
> >> Adding MDSS reset would most likely solve it. It's not critical, but not
> >> nice to see many red lines in the dmesg.
> >>
> >> Is there something I could experiment with to get closer to have proper MDSS reset?
> > 
> > I don't have a sensible solution at this point. We tried using the MDSS
> > reset on several SDM845 devices, but they just reset. So... I don't have
> > any possible solution.
> 
> The older context talks about altering the existing dt-bindings values
> and now we're at hardware (mis)behaving? What is the issue here?

The HDK and DB845c reset if I try touching MDSS core reset.

-- 
With best wishes
Dmitry
