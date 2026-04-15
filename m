Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4E838BF91
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776286294; cv=none; b=V0pA8RbI8mh5IYOe/GJElPRCE67//g8aJ1QxLFGvtcUMlBbLkOVHHquZHHruKlbPM/mmvQYZ129zM9HhQXZTkYeOJNNi1OppJcQomU1yKFamp8tSWj8dKRMH2rOHUtKhEWlwdtgwinB3xc0mwG6oDhJoZoLIMMd8H4rDy/s/ApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776286294; c=relaxed/simple;
	bh=1p8NSnHp2ZoIeGaQzlfVeCNqKATnjU5veK4IJvrBahE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXtoSuHAIfXbnDSuZpCOosGebo9qKUex+R7TCCSBEsZMycTb8ZVtqtxfG0zcSZssV9EIuoWM8jTk47fLoTnPc7oHTk5ZL06H6sDdrbL6XMnOyPBkuwL4krLt4GIh1ovchHyIpj66CpQZYANNvMzTA+wG0F4+N1djzFnMcDQ65hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ng5BTxKh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rsw83pdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ng5BTxKh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rsw83pdO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FEoSUM2834774
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 20:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uQkGrBvY1Q6Phw3ZndsRhOHv20pp4HB0vkTp3Pi0WBs=; b=ng5BTxKh1LnpJvZF
	Dr4EpzBnHj0FodO3QYrpfICS57mZGnKyqpTHGC6imcUxDsLQ4hl9N1Pz9caxfUuJ
	D8sZqGPQvnLloWQjuEqpEBEtRP+alrOBWFMLOzGMO9+wY8MapPJ/f/ODwEE5ILTn
	m5kycPBXjlVj5+YO8VYK8jXHjcaP4Bkk0nQPqr3z2PP560Ymq1GrTlwwtIp1L+Mn
	BaidGiNlV1qj41Tpi/TOGrjk475/bUZVgu1U97u8kVGryeiGnkVggF+y+z6OQy4S
	X0cLpm5RESI3oz2TDib+P3BGgS9ZAEqKdVW/HcI0dTZHrvHUIbGsh6CGZLv3Wk3d
	tGtGVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcsvh4s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 20:51:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso13002833a91.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Apr 2026 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776286290; x=1776891090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uQkGrBvY1Q6Phw3ZndsRhOHv20pp4HB0vkTp3Pi0WBs=;
        b=Rsw83pdOJp5i8feJouvkYfuf87uGWOhUI6gVK5slheA+1JtOMEa/jAEh1SR91XqTKJ
         U6VvJk07n0a0gpg8R69BglX4ArFAnXplTmiGDLQZWUjy3DnVQ5EoE7j8EeLWlRrOd7S0
         Xo5fYHuqzV0WYbo0nvbsfmAVaEx3htLfPsnM9dz0EeIcHkoa3OfsEW+iApottVKuGNZ5
         sf3JVDJaQY35eFq7jD2HBHHHiWxAatxlDzMgRpE6VihOyDWRWp/F+zMNY2MloCKrN3+c
         nhs+UD9X8ew13/hLul/H0SHDyUBdxVGLiZgj10meWtjQaORwhdIqF8Uskc8BfGQVxlX+
         qBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286290; x=1776891090;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQkGrBvY1Q6Phw3ZndsRhOHv20pp4HB0vkTp3Pi0WBs=;
        b=mswSeiIm4859HEb7HUFmouusFT3/Kn9KPo/w6bXmWFMUFtD2t6HYbr16co1HgtsVBu
         iro30/OjfA4m3hjUba+uGWKG4JWRA31oxUNgZ841oLACzZCTTK795/NvUcdb1q8RyI+w
         dWJIeIxfNAZX/FJZy7ElHK7dJN+Eqa+1wbsRnt8h4ZqV4p8Sw5zN2FuxvA1imtymk7/5
         n+QugeriVMvOegx9YQf24pFWWM3xurJlH3wteczVb/XiiUqhxK2z1nMvwuufX9TJd881
         Ocuqr7fUzUCkOSfEGUl7VeZKXl10lLIl0S9lAxl4OBOcs/MuzrhSE9wXKi6Qwav5j5Uc
         t00g==
X-Forwarded-Encrypted: i=1; AFNElJ97hiHO3KYSk7xYah2k+udWFVtc6yPohIMH7SZOOlOuR4shf70BNY0+XHQBg3gc1OCZUyGvPNCgyY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuDfWsopuHw1jSKC1H5XBMV6JaCJe9Ho05ksJOxlB2RLhPEFrL
	ZGxYRaqoEb9e2NwvLdP3Vr6097q0e2hE+PelrvyuxvwPmrx6FCbsZkxg1nEViXctH/7poqVwbuY
	gmfdVOucFg9sOvCZQ4zTIDHHt7Nbu2NyqrE9fA+ViZW3FpvnlBzt0Pv6UIeCFtlY=
X-Gm-Gg: AeBDietewupBhd86WvNgBJslP/NbmxZXVVOjObbwZcY5hkcbBfYk1H5HbNos1G3Fmpa
	iFZNQI7SgBi4blvS3saH5Inx4BrtPgEnTjbyFWsW/jmF5SWBD2oK3S7InVJiISAIIJX/xrpY/AL
	ZRtspkV75U3LH93TrlrqGX/GWa+Kvpz9CgxoPpbxzwjlIkn/A4eSDy9g2HbJ2A1uMsd6r+BjtfY
	XqxM2QQ1zUXzlBstD97yCP+ZmrYY55vMpC0q3BOU60TzxHRSwX9vn8vUEmgX3dK59hbgGjMcfhl
	yMt6ps65QheTfyv4y+D8tijeUNQ2F5sQc4Xp38Qbj1WtkdDcR2lq5W5L/MJmzKQLMNZCcDbR9jg
	C0TTTxxXIWoTg6QdJTz4vHJXtTc1KMkErkdCp2plIuigZJb8htylQ8/o=
X-Received: by 2002:a05:6a20:a111:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-39fe3f5a009mr26877745637.32.1776286290212;
        Wed, 15 Apr 2026 13:51:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:a111:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-39fe3f5a009mr26877711637.32.1776286289726;
        Wed, 15 Apr 2026 13:51:29 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581a3015sm2487185a12.16.2026.04.15.13.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 13:51:28 -0700 (PDT)
Message-ID: <a7cbd382-49ec-4b3c-b8f9-b47646d6b0aa@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 02:21:20 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/msm/a6xx: Limit GXPD votes to recovery in A8x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
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
 <df708bd9-466a-4526-ba74-548896b45e74@oss.qualcomm.com>
 <eebff16b-2671-4c7f-9930-dc4b3fa903e1@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <eebff16b-2671-4c7f-9930-dc4b3fa903e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PBNKMCDQTI9DGgtvnXPIKnH8nWaV4-z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDE5NSBTYWx0ZWRfX0aWOw6RRrb6k
 N0/kSDAFswXgrgDpkb0jU+71OEQJhkNSOIaBQCQFUk9AU8P+Q9xs2PYjI78yqRiOOBhr02IyuJL
 YJ882gF0Dse2xGTASJkCA8xw8xQH4idraeC1VUbTyeAXEQL1j8D2zg9r87+q8iyK2CRfcRHkJIj
 JQNR5AurFRSXgZgsHGaj0FuDr+XDAcHD4pvK/gd7/5l17bO1JY9ICLkwXQyTdnSRDRNNZUBvtLL
 Fhm0avKoXAU94uglmot//PN+Q2k5nicRv1T2yZ6N9gDY3eqyLUatpAUyK0vrAk/q56frZcZPjFm
 MkU5NLKXrArmj6vMic0jzmXzU0MSiynehW1jtMJLOLOGoY5kFx5+x/QSMDzKdDGBlGzAg3A1Vls
 ipqS75cXz0Vo2bSHnuSOTqAi5EGwX+pD9ojDFGvUOgnbnl21vfBgLWE3iXVtmobpwgn10q+W04A
 TGFSiGOajec9D4MiO8w==
X-Authority-Analysis: v=2.4 cv=Iby3n2qa c=1 sm=1 tr=0 ts=69dffa52 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tjBgj1cQHot02RtnpFkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: PBNKMCDQTI9DGgtvnXPIKnH8nWaV4-z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-15_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150195

On 4/14/2026 7:58 PM, Konrad Dybcio wrote:
> On 4/7/26 9:16 PM, Akhil P Oommen wrote:
>> On 4/7/2026 4:31 PM, Konrad Dybcio wrote:
>>> On 4/7/26 11:30 AM, Taniya Das wrote:
>>>> From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>
>>>> In A8x GPUs, the GX GDSC is moved to a separate block called GXCLKCTL
>>>> which is under the GX power domain. Due to the way the support for this
>>>> block is implemented in its driver, pm_runtime votes result in a vote on
>>>> GX/GMxC/MxC rails from the APPS RSC. This is against the Adreno
>>>> architecture which require GMU to be the sole voter of these collapsible
>>>> rails on behalf of GPU, except during the GPU/GMU recovery.
>>>>
>>>> To align with this architectural requirement and to realize the power
>>>> benefits of the IFPC feature, remove the GXPD votes during gmu resume
>>>> and suspend. And during the recovery sequence, enable/disable the GXPD
>>>> along with the 'synced_poweroff' genpd hint to force collapse this GDSC.
>>>>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>
>>> Can we simply make this change unconditional on the gen, so as not to
>>> maintain 2 separate code paths that try to achieve mostly the same thing?
>>
>> We can skip the gdsc vote on A8x because the 'gdsc disable' callback is
>> dummy when the synced_poweroff hint is not set. Otherwise, gdsc may get
>> disabled during system resume while GMU assumes the ownership. Taniya
>> touched upon this point in the cover letter:
>>
>> """
>> when GX GDSC is managed through the generic GenPD runtime PM
>> framework, it can be unintentionally disabled by the OS during system
>> resume (resume_noirq/complete phases) or runtime PM suspend paths.
>> """
> 
> Right, but if we made the GDSC.disable() a dummy on all platforms this
> could be done.
> 
> On a second thought though, this won't work for gmu_wrapper, so we'd
> need two paths either way.

gmu_wrapper uses a different code path for pm_resume/suspend anyway. So,
that is not a problem.

Perhaps, we can explore this separately as it would impact a lot of
chipsets. I would like the get this series merged ASAP to unblock A8x
support.

-Akhil.

> 
> Konrad

