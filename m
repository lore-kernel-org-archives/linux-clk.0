Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C6334A76D
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227204; cv=none; b=u1hdGlw6ucGewnOPAc1QvtfsWO69hIG5opv0TDnmhdt12yc/C/qTsVetscmsBapUGaAjMoTHBI8AnLNjsJNv/Nqd27wd1H0qjx4IiCZViz4CXFDouJ2zG5oK7Zv6aimCN6Fc8O3/tt94Ow7n457dbyc+zv/RkqgNOGNC+f3EbLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227204; c=relaxed/simple;
	bh=8XU3LRgtIn/4xl/haqItjUSBjJXoc4lR43X4p0kWuGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTEPQ59HSIzuKxX2RpHSmYRFjZeoxEWcfLQHawJKjwI2EVsS9g6mXXZxu0+6xvjK/ygBG/tJlIx7VA3GlQuv9pIzm6YCoMnBXEZV68OvpqUnd+sLSDEe5hhuhWNN8evZ93a0zv+ZPwNk4kUqh7tyRg4uHvV9eAMWc8iapxxSpFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=poF2tdhv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T59Qg3a6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="poF2tdhv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T59Qg3a6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CITkq1246041
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 17:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xk5etMzqwxQ6Iz1TvIYD65fLeP8TqLW+iR2z41xp4qQ=; b=poF2tdhvrJ18E4Go
	Ib5K8cAQrIT9bRPzY/WoTnYZSsSoKe9tgR0iI8+qaSvA0gYq/anlNjojb50JQEnd
	BXh+LwNOB8oGrexd++E41oVDQDE/OUDsxReSLbKmaX3ud1oBVT6kGjUclhzQaSbm
	1AKGbjMNHnKsOK54GX7G0vd//JxuFTcPTpMldKL/dmcmLQ1tLdDpTrnL7AFx2kH+
	w7CLxhBE+2ZH9kQkrr72z5R/BGtIF+HQoBqQqs1a2QEv2wjx/qeyStNTUYnRkI8Y
	BE6jHCJ9sKbe+/UHFVlMBi7UfxXLRE2RxdxWRne8CaTLE1bNc/V4g7KR5ToMXUE+
	8R8xWA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru9bh60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 17:46:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so182546b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 09:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227203; x=1770832003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xk5etMzqwxQ6Iz1TvIYD65fLeP8TqLW+iR2z41xp4qQ=;
        b=T59Qg3a6Su1QYQgi822QTHXi8FzdjxcxHCA0IBl/biobY/KrjHNBjSKM49o6LzaZ1g
         HKOKMh1NzI/vxOBfAKA8OXJv4zWcwsuqQ97LU8mhw/cMouFSe3ox0aduA5vvxAydpd5v
         SVi+ELUFPlWVstZVbxXcKzQaDq/EISMp65JMEVsWxnrs/pLGd7OZmXE/pE97NXO6SBD2
         1e/UUQ3yXbpH0A5BSxsn3u5E142NAV333dar3XM+CHzymnlcCQoZ/lbI2UOQn20191Bk
         ycUHa28DPoQ0H9ZBhig+p8HN+VgncUunmXVzDZJd43vCNcQI1t7/BR/hV/Unl/FZRfPC
         qkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227203; x=1770832003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk5etMzqwxQ6Iz1TvIYD65fLeP8TqLW+iR2z41xp4qQ=;
        b=JzrTUOysgBBUBd6ogdl0DplvmMMTUam+7BdOzApwh1xbERWmEwd8kZQH/RYzLUnKAR
         pP1vKNgAPPxi0R7UTwa/FtTDSsdnWusAiy9y95NyzRiYotA9JFW7+t+jknpLPHKEOyWa
         HG9OoLS+6FwTks3JwcoM5ddcsJrzfB1MTlymExcxcV3K4LgWLjmDYCyKw0kaxSKpTtSD
         4qjL7mwceRgjRn/flgWumtDnGQwkGaBNjCl5FubnyjpHGiv5hnWApq/2fgXZ0Yk0sTyH
         5EnCr8mBRuGaG4O03dtlobwMaWFs1VxS8x0pwv99TBK1DNIx6rctIzQkUoyY/nM10wyg
         MWJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbs+WDkxjm+fxSnAxxTm9SUIuuzGJv7lQwXNUoZfZamGEIotaOYyTmMf/rFklGkD+QunvzZ2j6KZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe1m18o57NlNytkqkl4OR5deHFufcWpX5Ds+VPw6jzI0N06Vq1
	iJcpPiP1fj4vYYTst3/0t/DGGbMdmJlLopqdYxVwsKHVv5Spr4LsM/Y3R0ZwvVh/8tzMT7aP/9a
	pi+Nl3dakDPi5qX+ZogKqaJe3sFiGTjsCN3GgEbk+/D4MuWZzqizd49KO/bDx78A=
X-Gm-Gg: AZuq6aKaEqsQ35fB36TlPS5C2NavWwYl2wrMClKqcx6tGXX06lel/aXnG+DZpxcVygN
	aEx95YAj87OYVAYKst+tUybXDGxbvwvFYpLUMr2Q3apsnzv/H7fzuqlU+X5YMTDFf2TZTqvbqDj
	jq47Jj7wEdni9fYA6h4B9ObmBx/ljsJYEfbhMW1zWh5gZCbX72Lxj8gP03xjK4L/1bmLoj27/AI
	YANjEWdrg6eIDTMjC4ORTEws+ssmkPbKCNFpocLOCzpGZPOET+OQ+aNMkG84PP6JbxuxWRktu7e
	V0J9mhg2EnhlcRlzGGgmCvQ3L7naAihwMFTHcPF9wb4RR7+6y0h4c/WVs82K1VVblsw1JwZJBqj
	JyVO7C2b8lLlz51jq2060d8+zMHOkp7XQeqlIVMPNZ+8Z
X-Received: by 2002:a05:6a00:22d5:b0:81f:43f7:183c with SMTP id d2e1a72fcca58-8241c4ebf69mr3793476b3a.45.1770227202723;
        Wed, 04 Feb 2026 09:46:42 -0800 (PST)
X-Received: by 2002:a05:6a00:22d5:b0:81f:43f7:183c with SMTP id d2e1a72fcca58-8241c4ebf69mr3793446b3a.45.1770227202292;
        Wed, 04 Feb 2026 09:46:42 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d16401esm3254706b3a.4.2026.02.04.09.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:46:41 -0800 (PST)
Message-ID: <97535aa1-6eb2-44b2-b04b-e7608d630fcc@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:16:34 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
 <aki2cw65fdl2toctcquprkzpltz4tejsyf2sudlfqy5hsluvx3@ayi7wqaa2csq>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <aki2cw65fdl2toctcquprkzpltz4tejsyf2sudlfqy5hsluvx3@ayi7wqaa2csq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX0v1MZTr2raRl
 Z1NGpwez6YcYOZKPxa7jP1mxrZxVVEj3vV9p1wX0bbNQB+YX8Gx6alaCAnIF6LlxjPDGZR2UQ0a
 YNifR3wkQIEFJgSj202v/nUOloaNPcwYcaNKlgWy6sPRNTqXyjBlh2I4XJZlB+PTwKfhqpQLUuc
 Ss8A6RLDbFSlfxT/fnXrgY7PTkZPBu0PqhoxwV+AefNWZKhS0o+Ybo6/b5vx0juXrQpJrERWGbe
 eoe1UYj4x9MqvD/WZNphvjtF1CtZR1/6OGCl2IscInuuBGDI/ImVfZGjquM7kBLK41cVAE/doDL
 mGRwR2k6ni805BIa4Rp2afQlbdqmAJbvJ1gCYLP+vYJCQSNsU8+F/aqNIkrN//DNpIfZ5YB6Qug
 T3Ru6hQqRjLfAAgvmsBEP3qeJiazsQNjfXHvh3YzRtfXjUIGpFyrdjys38msnNWaM7Y1dl/Hq+g
 4BbxgdfzR7lU/F5Cv/A==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69838603 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=f8uzmviW7ZrpKRLwxXwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: aj-7s8MJhsq9V94vutvu9C1AwMZHUNb0
X-Proofpoint-ORIG-GUID: aj-7s8MJhsq9V94vutvu9C1AwMZHUNb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135



On 1/29/2026 6:07 AM, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 12:56:34AM +0530, Jagadeesh Kona wrote:
>> Add support for the video clock controller for video clients to be
>> able to request for videocc clocks on X1P42100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/Kconfig            |  10 +
>>  drivers/clk/qcom/Makefile           |   1 +
>>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
>>  3 files changed, 596 insertions(+)
> 
> The videocc driver looks almost like videocc-sm8550.c. Would it be
> easier to merge them into a single file?
> 

There is significant delta, the BSE clocks are newly added and few cdiv clocks
are removed. Along with that the frequency tables of most RCG's are also changed,
accordingly initial PLL configurations also need to be updated, hence added this
as a separate driver.

Thanks,
Jagadeesh
 

