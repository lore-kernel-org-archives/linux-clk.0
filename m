Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981E923183F
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 04:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400199; cv=none; b=JAh3m0CdJIGn0VdFp5lQokTjfJMhv96SuokSiGH+FsQHhAw/KUEDDZ8qBpQeZbvqIUhvrEZWG3bPDN3nKl4cmdKjGUUZGcVuTW775h0g1rZPCjaZp976aww95LV2JWWJp+58LT3GNlHDdhH3nXw61PEyIn+VfWUULeumJ+Gt/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400199; c=relaxed/simple;
	bh=mlRumB9cj3I5e+lkTXBh8BkejiErVbUy+fnvn4ziiBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEizX9yLp64b0RjMQyg12IvgE9wahUy9dTlrbgc0JqoY6JGsRWDsb8hmjg7KBuS2PD7wMN58bargVFVdzPS/Gfk2MEE9e8qZy00f2UGq0AraI70qkRCQLqmzn1IniFHw/KS7+iok+f7OiAmjvOoLGVH7i5hMddfQKnk1eic/U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RaEG282g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MK19dsKP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RaEG282g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MK19dsKP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749GSx2499136
	for <linux-clk@vger.kernel.org>; Tue, 7 Jul 2026 04:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=; b=RaEG282gCobcPoTv
	lXLDIX6vFMP/KmKGFQByZhfts6PobiV3iaE33+I15JI/xvYYRyXNvqqP+Upl4Dzs
	atcaT1PB1ZzqDQHOeq4rRAbYyY/+HrAB+z1LrD95r3r1AqiI5cRnR01O7TrC8Dz8
	fn/9JOZG6drPfbDp/+hpn/zJs9kMFYF/JsWaGrOopSufKMne3v4K2fGemvzKRlkH
	v/C8BcgtysaBAyrGqSiMRKpr4T1qb/8jcpYRXOSSUoash97rYsmKW+sTSyK0AN06
	N5enwb3omUlowcEImAC3u6O1hH2KrKya5S7Y7VfasiSrm8dMFTaofhEtMw50IWxD
	AxXOJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hscmgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 04:56:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cae134ab3aso65717025ad.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400196; x=1784004996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=;
        b=MK19dsKPXpZ/Xh5AZ7qi/C9Fi0dAOzEu6u4twH3ry4emHQbpxn3PphHdblutNgfz/J
         4Zm1+0syvICzQ5yzzEJODG1prmFLFM3q/WaWmUGlmL7dh0y4hulK+LOVD4gbZxNTsNJw
         qm9PTEv6Xu9okQUMJ4etiqAyw1PJcM09jjaNrJVeCGjRQn3/vOpAFuGJ756jc0Pa4LMm
         LxG+s0vWKJ4Io4qAB5L4M/RJdg5MfovOjcbuYrkctzLiktZ9KQCRn7MKOeDI9pPA7A26
         KqcPAlP1MnuRKgLY3eatdR7BZ6+vCM3HwAj07djd3fafLdHw+jZI/m/clzla2ipJ5/0E
         6C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400196; x=1784004996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Il0LDmiFWS45qZ5iMnewxPhdHAIaREgSi6o+bkCleJI=;
        b=sbRJ+HWYQDbwYCipZzcrJBSIew+lHOdsLKwNkzTIQ0lKAyn/6X7+erU9La3xDmN1nT
         g6YgZGxZUzl/FFviOnLOE7Rz6g0jet7e8BJhdH2+NdF6sYSLGuLP0KQAwg1M7Un+L3TF
         jRkYpN0R/I0+5P/r1+MT7wzmd1PjMqE8fZjLuU1KfwdFY4R3FeMGqVsfTrMCteS6gNBj
         QKmaPESnS77twCgrmKiJtwkTR0lkoIAuuzjQ67krFJ41s//TsFv/tUXA8cQPyi5WMevm
         sv55dSzXbJHNT6jCAhYkC6LEb+QKJvZniqLy9klLlqPlT6oOyjsm48XfKceVR3uRRDTg
         I5TA==
X-Forwarded-Encrypted: i=1; AHgh+RqBoXRJGGif6TaIxgwtcnksyYSLsVDaVGJN9WWtMsPY61iAqYo/SRUItn3Lr8JvA32PAO4YtClqcF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3eG8Uq+GD9DG+ZEeUDdaO4YTfAcOfg6FsFfPgeDVAVbdjrMMY
	kvQEx4fAsY8jQERENuGox3y3q6MLiLqF9afJTPebmUnL7rPQO8326auCY1ay08XOvpvGyrThSJq
	tuWmIP3vbs+njfS3OImmRHqNStdEwkV0XEMd3daHvr6dI3R7p4t5/zpZCzWKofq0=
X-Gm-Gg: AfdE7clbNz4kGFYpGgjPlJzTIYNI+Mb84C/oFPNQDq3/EC1fkhiZtid7FOuLzUkAHam
	2+4iCXp9GpYfbZm80DcrMAAyNASiphjTLPi5V+4WHqdCgHQxZHqLeSvknhKIScSryIDG9K35hnu
	+he3WJWyorpcs8EQ3t7q/sZH0usC1JrQVKwksptiGgARb/BtWztwWyzUS0FxCZv0LwnINHNxZZO
	82tmefE0Yv2+gQnG13pDDVJVQOn57d6VUwtHPGLGKOVADHwx1Gm09jCQoHk7VZm8tdC6xOQluoc
	JEiT5dWHIKoxuBlSjsLBQZcP9jc1uoONm4HYLskKQaMSlFD2MN8RNDFpFsCYgejDHc0dhbX+c7Z
	vDxkGaGJghEf9hDvIhrMMS2VmBNgM1DNMHJgms5I=
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr39933145ad.2.1783400195618;
        Mon, 06 Jul 2026 21:56:35 -0700 (PDT)
X-Received: by 2002:a17:902:f60e:b0:2c8:25c8:85a6 with SMTP id d9443c01a7336-2ccbe4004demr39932945ad.2.1783400195167;
        Mon, 06 Jul 2026 21:56:35 -0700 (PDT)
Received: from [10.217.216.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bdddsm4515115ad.77.2026.07.06.21.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:56:34 -0700 (PDT)
Message-ID: <ca6149f9-d6a2-4dd5-972b-12999c7243c3@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:26:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: Add Nord display clock controller support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-4-860c84539804@oss.qualcomm.com>
 <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <ajtEMi-HQ3AAOTog@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bs16HYsp1V7dlGi4lKsZqpUrSrBCua9T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX5qj1zc7RW5cq
 k96X60GcJww7orQaBk5l8y21QvuwTZbocj/A85SiYj3ztY+BuJLj9puQI9XOrN2YmXt4loO+VMr
 g4Ly9S8JY7sbnlEu0JYsePA+n0dK4iiUK/K3CvwYdq2ntm7wDVnlGmPIS+FJOrKWjX0hb6DiYoL
 JWq3jEFnJOJXB+Kwb3O31W1xcDdUE+WekTV8toVNYOQRwGJSDe4RSPm0teaA2FixEE8f7mvPjaZ
 g97PeSE3a4TCiSpcuWNBUxWFh0jCL/nvZEZJvvgA5eNchIkNMwVypedmcMBQNgmTEqHzNsD+8z6
 wr5QMqlMga2jXKMrOsWgFMHNqWR56Bf+ud1U2Zx0omIUpNUVDkhutW614A7Xklw1/zDHzRw7tJU
 sxuxYKXNW1N13iCuy/BfWMCNdFsEX5HqH/5G75Zyw4Q6WJp2Mut9sqNT+aubD2Wm/VP/sZmUrVn
 Z90oG42rEIfHrBIF+Rg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MyBTYWx0ZWRfX9r8m8DQf2KJz
 NXWiPRyfg5XRbPJT9rzqes91tsQqEs+gTcxNVrDuAJEM6ocK1UU3rUJKt0bxHsycTR4r0lSJ3Pe
 W2vG5lI1y+SGFCUWfMVU/SAcxs0JCy8=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c8704 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kwMOkDkW8xLcxF6SdFYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bs16HYsp1V7dlGi4lKsZqpUrSrBCua9T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070043



On 6/24/2026 8:12 AM, Shawn Guo wrote:
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> This include shouldn't be needed.


Yes, I will remove this in the next patch.

-- 
Thanks,
Taniya Das

