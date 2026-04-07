Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C55145FE0
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589403; cv=none; b=CKOxEbJZhcoYw8+8YsDlZ0k9quZizp5G82yAp7WMotgPTRBOrMPOlkrp7F+TKfa1dqy8glyJTvai7FUlJAhnGiQiLTuOaLsGJHx5PvkTepWENqnpKKe+f1VvXG7k6s/CNTAxBN3EB32zJYeDAkiTzoxHHxrAFEqROdYQq4+KPfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589403; c=relaxed/simple;
	bh=4HHk02k9YaB3V/oje3HicvQ/jxq5i/u20i8lkV0JhtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfeBOc6RA1VjoZdqen80p2RENTlYQwwJ6v04KXphzH48v7wMDUYNxPOmFAq27wqPDqPZQ/1UgMUptGrUrSmLpTabZ7IlwPBGvorhF+lDo92HET6OK+fgLWKojtfpxji3d2sx3wtCDAJ2aI4qb0Rtzbk5zgYe6UAN4oHBwXrWkoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX1jWm1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxP3Csub; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX1jWm1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YxP3Csub"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J8GEr3363368
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 19:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvnMmdo4Wei5AuJO4jFfKnRL9Ab9uaFew2yOkjgAHXY=; b=GX1jWm1A22dLBEHn
	LbDMrxMuxB0ntj5CLmZzrttGhhPdimmav09K5d3WLx6I1jc5SsU1e/Mj8SJ/cqlC
	IXHLFg3bR+82fu/aDC9nVV2qHvWIZcw9leEQHv9gxEJPKBIa5GZ2Xh8biSoFiL/L
	K4GFpIxUceDEy3gn7nvoOvaIOPqeU0CqIhVoydn7RNAqkSBUqDi3eP4/Xoo7dcgW
	bVOeF3HGflNuvWPGw0lN7cTOUeG5q2KQ9d7ioZjb6vrRC7IKHF2E225eFPd8sQh7
	igpHlZaPg99KFP8pFwci2VV+cnAbtvmxA1xyaoTaBrQH7SKj5oAdP5TSI15RCkpn
	szpVPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkg195-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 19:16:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82d02942266so6779206b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 12:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589400; x=1776194200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvnMmdo4Wei5AuJO4jFfKnRL9Ab9uaFew2yOkjgAHXY=;
        b=YxP3CsubB46Rwn8H7D8hDawBw4ra8JaiiHPIpxYHvzp4rD5Yn4dfafEvN6hjBnDopN
         ST07NPBkX2kjtFjBKgHgZ5OKC/tZzZlf27UyIU+ep9nyu+OzQ0p36kd9o6TYrArkV9Cl
         NePTeDV8HbFZemfT/wIXg6KAKYhxFsk075EAaT1jBM7ZT+52WgEfgugHlFa6aciisnOQ
         GRPZ7+B3tbZCoqvJIIFTD3twhRUID6r5D21xzRSs+JEplgXa6Mb3VfeBCK/hGZ6R5X6W
         vJ18hfoGqpq+0U19X5o44xcBzlCzgiNS2Kmh9kN6CVOcLOZkan9vncbOS1X/qHVRoSNI
         n2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589400; x=1776194200;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvnMmdo4Wei5AuJO4jFfKnRL9Ab9uaFew2yOkjgAHXY=;
        b=nTSXfACpmO2eHjhZ/abpJ2K7yzfST07UqxqTVTR8zTXEnrgRwnZxMfbPZNGSBPJ7m7
         PlYBsxHYCREb6WccomsETkp0MoJBKgMqdRw/0hA5TKTtJMrImh7XgaikjkwIXntgzDLS
         TnDYLRHQMT753TatfS2ud46hHKwMHIVcERL1GsyUlwks3eW0lUwCoP37Zs4O7d68EjVh
         rBs4oWoybhfCLXvTOSYxogmZoYRD58TpDf8zQYFLl050X59Z/k9UaKemKd6bPNW3lIrP
         7OMrhLFNOIN2oaqgZ9dNcba3t+Ox+wDqB1dzxNPb0kCG3fK75xEHlqL4gxdSaBjh6Wv0
         /qGA==
X-Forwarded-Encrypted: i=1; AJvYcCVUtGGAfLALakR4+AgP4TJEZ94lCZQTsL8Dp9RJ1ymJ/DLe/Jwk0rDKQx5e5n3JTk9TAoWQMXdW11Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+g+afRBSnM6CErIvgdAy0+fnBiWSODaZtqsigyXna1Z0i1h4
	ECtHcBNUe2dsb4Z0UDpWI9YOn+lP2nwAHsw0T7QHdCoAcNM/Uq4hnMI8u1xQ8zB4TDQ/nFMudQm
	V2WWCID9t/CKcQVX2zpp3dJ7hXTe6SVZhx9m9C4e1QweOqOG7VEgVZddk3HW0uiE=
X-Gm-Gg: AeBDievTQtULjsbahXAwRTeg6G7m5I+gfB44zOLTk8kYiprnCluHnG65Pj9eX272Tc5
	C4g+6OEp/1npayiSGpj9nm9scoRt1bn8896g7odw08zpqqPK2Ht/Ln/36E8yHTyFVDx6oAFvSof
	ND/c9gnbosaTnd4s/wcR3Bj8Ug0CP80PCO5Xjb9+URCRLzd1zcAmMKVXeslfPgkohdismnzrcC4
	9VpxaRtGmNX2idoVLrO3r2kkrv21dawqcl/Z3kOMsivTw3V/1DPFeWARakDRyUTZ5d2Ux1XngU/
	Eai6mYp50NUiRm17kyEmYdFsnEu6ilcp9y897u651PibxSegT/122qUBjaNTCpSqKRXDBLmnnIm
	1qWIlJ0xNQ2pZBESLZsHjdXGHqRJOazQ0PSdhZT7GTDfT4Q==
X-Received: by 2002:a05:6a00:b53:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82d0db88417mr17663431b3a.39.1775589400507;
        Tue, 07 Apr 2026 12:16:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:b53:b0:829:793f:da6c with SMTP id d2e1a72fcca58-82d0db88417mr17663393b3a.39.1775589399957;
        Tue, 07 Apr 2026 12:16:39 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41a2asm19340341b3a.37.2026.04.07.12.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:16:39 -0700 (PDT)
Message-ID: <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:46:30 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-6-4bb5583a5054@oss.qualcomm.com>
 <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f5ffecc-007e-4a8a-9c5e-9994e7841659@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d55819 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KZt6Vqo0b7mNqYgsowAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: HaFM4IOHk-zCBOJ3n5UWx-Y7Z6UCu9O5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NSBTYWx0ZWRfX0XsaAE5cYXhu
 v0yKdfWnpCW4keFVKSyXdgH7bmqPHVAvrXMtzFWgFhmWZB0i02I5QGOXX/9UlccJx+OCFYC8yx5
 z+DiKznXK0JHqvj3KFWC/wbm4l4+daVGyLyyyAq/K3na0NgQEX/dOtpAPW23Bdt+BWse5e48Gps
 ND4X38+h1m5rwWz0IiwXkpql1tRmPmJx2NWpBdMrGQQAq9bwII9SpHB5UgJe0pqj9Hyg3jmYQQW
 kbzA3iV+DgLa8n9SYei44XjjomM8jUQTXweq433PN0IPU2C4ZUbxlghYCCEykW8lLZikU/VVNVN
 j8wL77PuMExp93R0HB76q+E4KlDhrDUi+GgaOK2mePtax55p3wPVH1Y61eSq0od3BjzMlRlSZvN
 03c8dFBgBGbIKqnsZSc4PmOpNrzbJ49lY8fExyZkk+fIPXTtljlz7ulUj3Jhb/9dyCGJog4pjHd
 ejrtFX00s1mV1XJdWRg==
X-Proofpoint-GUID: HaFM4IOHk-zCBOJ3n5UWx-Y7Z6UCu9O5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070175

On 4/7/2026 4:31 PM, Konrad Dybcio wrote:
> On 4/7/26 11:30 AM, Taniya Das wrote:
>> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>
>> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
>> which is under the GX power domain. Due to the way the support for this
>> block is implemented in its driver, pm_runtime votes result in a vote on
>> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
>> architecture which require GMU to be the sole voter of these collapsible
>> rails on behalf of GPU, except during the GPU/GMU recovery.
>>
>> To align with this architectural requirement and to realize the power
>> benefits of the IFPC feature, remove the GXPD votes during gmu resume
>> and suspend. And during the recovery sequence, enable/disable the GXPD
>> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> Can we simply make this change unconditional on the gen, so as not to
> maintain 2 separate code paths that try to achieve mostly the same thing?

We can skip the gdsc vote on A8x because the 'gdsc disable' callback is
dummy when the synced_poweroff hint is not set. Otherwise, gdsc may get
disabled during system resume while GMU assumes the ownership. Taniya
touched upon this point in the cover letter:

"""
when GX GDSC is managed through the generic GenPD runtime PM
framework, it can be unintentionally disabled by the OS during system
resume (resume_noirq/complete phases) or runtime PM suspend paths.
"""

-Akhil.

> 
> Konrad

