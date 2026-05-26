Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2877C3C8C47
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779552; cv=none; b=XOf2GKfu/OkebwhgAAvIVnrgDO0l65bg/W2iq60dxrIgeEOTUWwTRlWtsJ+549/W+FPtqEWriy6pRBOHdUIK/HiD+gPKCgZleSVGqHtscCXzdfICLxa0r4d+idxhjVCFTHhtUHHU8RX3Kw+twlD1kIv/O8+M4MvBmTy27k3L5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779552; c=relaxed/simple;
	bh=duHgp5PU7H3VnmkXV/cKIwFSafwUE0CMTvpblVvvagY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S78sY83xbjNV3KpgJzBofICLnRpTuCMuMUfzOM1m7Pnl2IHjHiMopMk8PBXSvRKZ+LynsnXou+pvLTB4BJoUnIF/oCwI4wR0jkX+gW+8nw12nzJ9Fo0xAVkr6C4z6c9h1L0fub/DPZ68AMY0/iZOHhrPRt+aLWjcGMTL+Edbc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGk+HAUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghgrUmg7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGk+HAUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghgrUmg7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q0s0YE691689
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=; b=gGk+HAUHmsFiNZW3
	kDQZOWEzXWieKVCQBc+JuGtPJPRn/XgHBE/cr+nX+ZSz63EBqwRsyZBCbJ1htuBf
	odPfeghx5Mc+Ng4mCntlFurDT4iw5vQIxlcjWl4LW7ldU0IajYS9AEdlfn1o1BJV
	kRn9Z1i5HfgM3maa64DJMCd191P/QpOCEUVWbbAUALLYybVRX4/HFOIjekF3SZ7Z
	6zj+0mjH1cscblmQxVW7UdRqVgQqFfJ3y4UCuA+YgLa1JyR34q8cc4qLfS+U3XTI
	vEydTn2fc65R0XNRLLKaHNWNvZCtr11lEDOm2WZwbzxQhun6MKuzLDuV6RqcsMOm
	Ll/cgg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jtrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:12:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d4b3f3a1so88964751cf.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 00:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779549; x=1780384349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=;
        b=ghgrUmg7KMm1wH5jEgg9TyM0o9yzLFwbKq84k+0G+ILZiH8hFfwJH5Qh+2TR2xg5xL
         d3It+lIJBViCY3fFA0FhQUbj9ug0ARtNJPMaoTpmbYadyQum5/CnLdQgMTT7jCElMDVv
         tjRho/oOynuxEvrNg7D/3om1CgeEEDkIXXRy/P9adrEnnlVfFU4KvjCxTWJ6KAwApq03
         shcHyMIkg1+zojeaPWz89KXRyFONQbKqbb3r6O6yvTpSKDGmzawEWtEtsqrttipRmCDT
         XEW3+UMxqSGaZY3nj/WFQoByKZz60iBrJ2pJaZoSP9YbmGE2WmCzuFh3sWX06/nxRz46
         w44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779549; x=1780384349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWdgtUrDDLs+SwDw7Ttc1k9bUcNpPRyysb2PX/GXq64=;
        b=DluISsL+T/DuY0hfKrbv5iftYBHOhhl81yO6x31JMQbIDgQeK6CA2Roaq/aWUvKCta
         I8mn595TEZ104ZH8E+b52IJKp7f0u8HchrT2Ifsl4sLZ/2SSGFMQ467vT8C/VldD/NYe
         5yMa7f7Odn4eTRyYJg6n52Yrnpqc/xQEm+ywMfe9kOjuRwtVRX1cWr9l7EfhiUU6A9co
         HtpY7eatdyCJcu8FxG7FZzz4fqwqMXqwGnwdyrA6CPaiokRVaaKHwcCFEoGwUKchG1Q5
         nzD9RkxF8JGDGvYgyctCv0VG8YYW8da43aHFkpSgXNxf+veBcR/0H9/SjTucus1TiAdt
         7xyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9c3zNgUgpOg57PCtBwDWI0D0UJBEochY1ujf3Tz3IibgUPcGl5VgCU0PtstwArDplpm4+rZPLjuks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoI5RpN1PiOJyncM1A/Sh5miBPggph2lpG9xf7CO+GICyaHqt1
	pegHL7vV314LvGkKm7x+pTJ7cT4meXwIIS1EYobodF6iag3tH7bwYZnUEje4Q4Ic5qqwI0iq72r
	6twnuoam5NEN8Ms9OO/pf5GIT2BATvOy+o3nI6/8Bp/oZIAOnQ19rIXubYPiIzB8=
X-Gm-Gg: Acq92OGTn0oik417vGfobVO3MiVlFqXGblDL4fUnWJjCMWf2l+f21gPa33Xtm472R+O
	8uzJAv/Sh5kLnqUWDf4ZaX0XN4qsCdmMwKCVVf3dhKBW6dyLPKv3b2oxARPPI18TU1CJix0ndw2
	WMQZnlbFqwoTkbQOe+Gpg5g1ob8G1/3pasdf2gNrRzx8z+hS7nMvMbXfru/8r+oVjcmBD5XxMmk
	Onkz7tpiYsu4Begqm/S1atoq8pkh8a/8RVCFpre0n4vjTOFekhZNPwklSjC1aDrIe06907FoYVl
	JjlimYz2WwOE4u2cVveZK5ejO3hywpEbaoXnmNifIRmTN1/ciUT70WAmoJVXUjmy6AmJRpW2xa2
	OqtMX5DKu7acXC6tGGbLb30rBor6EfD5iOtz+WoTUR69cj5sSM1RTzQd1I+Q+NGHE
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr250026021cf.11.1779779549508;
        Tue, 26 May 2026 00:12:29 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-516d42eee7fmr250025791cf.11.1779779549099;
        Tue, 26 May 2026 00:12:29 -0700 (PDT)
Received: from [172.16.1.42] (135.31.0.109.rev.sfr.net. [109.0.31.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm35552477f8f.36.2026.05.26.00.12.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:12:28 -0700 (PDT)
Message-ID: <61353034-51a8-4be9-8f7f-b15f5d60fcb3@oss.qualcomm.com>
Date: Tue, 26 May 2026 09:12:27 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Move EVA clocks to critical
 clock list
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-1-b61c7755c403@oss.qualcomm.com>
 <dyukhyihftgrm53tdiugcfx36tfngelm3hi2otpxy4pzdiwlsm@ixh6amjmeglm>
 <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <51c4edd9-ab60-4621-b7cc-af32729e3dc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SA3J3rRNTJ2DSNwNn51GsifgqP1-qh1C
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a1547de cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=yjcNvhZPqzdadiy9JSnYTw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=utSEQufgUorn1GdmO8cA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: SA3J3rRNTJ2DSNwNn51GsifgqP1-qh1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MSBTYWx0ZWRfX27qu2JOoWmJd
 Yj8D4HgrZqRdT0m4epvKXqjitliX1aMDXbNMet4nEi6FTtoLaOUSRrqLm27N5AsvX5woZewo1iv
 jQJpHsO8rUEKTPlY7zkjEgsYL33/+J8j1EsoVw4HTLIvCVeWaIPoRD77FyI7OqmuvDwiSZeGm9G
 R5rMaS3WYjFp+vyq4ZdDC8rOkJCkRQwwNO4udre1jyy0RYGmtsnMi4MgRIfadppsuXb5iVZ7Ny0
 gYlECgUUY5d50/vkY+tVcnKq43Xz1+i+2zWnE20VifaiT70bnjSlOlvdpwOHzuCgHJS+2aJMukD
 6ngNAyVy0AP5iPhq7bzI6WRSf9vNGxxHWlKgud4qT0CnWbzRm/B4D5oTF8pwoDn7vyPi/XqtzWO
 0ehmBCnuRUw7HxXo4A3TDN4pdbP6EzeCmJApjIeHiNNK5YbwG5fNxHYVvJomFl+aXWUpfB2/Apf
 rF620DL6hxASI977J1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260061

On 26/05/2026 09:07, Taniya Das wrote:
> 
> 
> On 5/26/2026 11:16 AM, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 10:59:44AM +0530, Taniya Das wrote:
>>> The gcc_eva_ahb_clk and gcc_eva_xo_clk branch clocks should not be
>>> registered as standalone GCC branch clocks.
>>
>> , otherwise .... what?
> 
> If registered as normal branch clocks, they may be gated, which
> breaks access to the EVA clock controller during clock controller probe.

At least for the gcc_eva_ahb_clk I'd expect platforms actually reference 
that clock (as well as they do for GCC_VIDEO_AHB_CLK). For the XO clk 
it's fine as it follows other XO clocks, but please add it to the commit 
message.

-- 
With best wishes
Dmitry
