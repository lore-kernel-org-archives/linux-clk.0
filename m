Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8E3D6CC2
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365570; cv=none; b=ENyZPqxSp5yf1V26AYLXBnzm3MlOP98t5nQLKTFwwY+XlRhwU3jxlu1plA0KN+8S6dgJp0qUjDiGTykYFG10mxil+1buOSeERyeHPGa6fyz1KonA+5T6MzishK+DsdAbCTJZzaffR9dhT336g4unrGpZW5PBWK2b+QQngCEst6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365570; c=relaxed/simple;
	bh=KL4znERtt/tJO4ikEqK5eErCZF16B28Ar9LH6Hju0GY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W2mPxiR7tiuJ7D0iKOwfBo2WSIONggdl2f20hskMIUaH3N1LmVYDFjV36Sdn3OjUCOUFNDrJzzUrr+4wzJsAr6rojg+pi8pMqJ6wKT0mxaIcPQtgzuTkobk6V8aseS0SkA5CjYsbX0tcFePxNbccI/KyhZz5plKCmMTg0aUI8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGo22BVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAvwdHem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGo22BVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAvwdHem"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S4aUPR2112789
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 08:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyV96uodgdeNjz4t0ZV0JjfLYUJILt61U+hBRQpFU/E=; b=aGo22BVc2lIYE6ya
	cPp2mw/mt4btxIjD72T6x/OYQ4UOOPYr+rldbx0gGyqXt180/p67T3mK/VpRxiQ0
	BrkTHFsA1bmj8ZQPWtIpFdQbzgINBeRhhDetym/o+iB0l8pNvS2+Vk4V6R81SRRv
	Y6/EocRlLPklgQOfsJYYQ/piTlLxquuYr3xgBRS6X28kCaiZISbaGkFkujFWcycQ
	nGCUNKyvLR9Hq78tqlU9YFWEW6GXfTFEPJ/ewK1xaWEQJwbqopXccWbY0rXPGkop
	Nj2eIKZTnmvf6sM/zhNcbtCUq0cDZBf1LmsoZTC88MUEhSgUhlaNC6nCcid9Lgvs
	Hm4DSA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbjn06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 08:39:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso119158171cf.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 01:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777365567; x=1777970367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyV96uodgdeNjz4t0ZV0JjfLYUJILt61U+hBRQpFU/E=;
        b=TAvwdHemCNtoWuEHG60VQM6oeSeVDuV9XFxVkecuMA9G05tp0zZgQeIEHStdS8kA34
         5wqDcaWGIjKNXkQ3nJS7zbVE4ret44mOSS6nT0POxGQ17bTxG0la9xwp9et45w9iCccq
         6PZulW29RvQSan0bCOZ5oUi3z2KMIbwS9ut2gd9X9BAjBpEiUoFr4QxvNwgHrKXp1E1A
         arBduF4s5a6z5W7bc9saGFhD752B8QsPm2ADWKwt9ZS2Nn1gVg/Tzb7sFBWv4NSRhjnI
         MS14rt+xgVFScAVCa51Yftg6W9fTtBLNMThko/OVCRtGnDHOwnNVqv6JleUsKNHjPyuG
         wIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777365567; x=1777970367;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyV96uodgdeNjz4t0ZV0JjfLYUJILt61U+hBRQpFU/E=;
        b=rem9zMdqi3A2n1+afwOlfxngPniKcXc5B7/GGqiqI99iOSQhZZDT5UTWg3OOXQ7xuP
         PeVV09qKYGiXcA47v+66dbaNpV6z20/wTPoFZv/+QcUrB7nhJ+OrakEZa07dsXWS2Jk/
         SlPYPw8/DXstnoPOKyj5iqIcL4OzpSY9XnY7TOH8j35XFNIMiulfhr/genH0Sc7pAVtx
         IZYbeVRpvITgR66hzPqZGvZ+bVLAM+8DyZwbsbTWWl8EvTeDFVveyLGO/dWe6qnnwCHL
         l4ne2Wij8Da5L+71cvcndWbODfX00HG3fZBPkmtFQps7FcbEXB9SvJo9dJv+mroGzRrX
         6qtw==
X-Forwarded-Encrypted: i=1; AFNElJ8unJ3CzvlROqzj0H3Tb8LiVOm1L9omaYeEYYd0zv0wRAT8gevHHT4H0DBdFslbcJxWiPryWMI5ibY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOrgArtgRSgKTSKSQkAzDfyh/K3vh9QMxXoPTNog1CGr+TBYB
	7PZQSDATD5LOYG/Yggyi+KmRTd2ao7mgNX4nzzlY2ilY1sqB12Aay0dVp7cpWDRKqCTeRVg0Tj/
	s4Z8fgt457/40Eaq4fexRlvpITPJnzZkjh+29YFLvU/Qzm6cjCq//Ce2LXYlAPgU=
X-Gm-Gg: AeBDiesWooQbOozRO1Eo/QPsCIXW/7as3OpsYLt3zXuj9eTtNBrg9z80YOPFcz+MuzT
	onNmhrRvEipCX7NRInnb31jQAgHVovhIkeeXHR9qWbybBRa1AABuqXjdCMwGn/1VA/WT9R0fdnw
	oQh5RpO7x5QhMbAf1ku27NrL0fOipRfapSM4kDJUEar8uehznIGYiJASDiMzk+TV7sV7NPo+jOL
	NkWF0rGR64E9g8kWfQFOmT6IooNFze35yncEwFAsvZLfVjCYQet/4ha8JX1KRS8PH5J+GHk0mej
	cuYJQsba6igRmUCM/HeYFSiEfWlzvrO4eCIR5LvCLNYIzCdDHU9kGeAGMFVxRzn8NxHX6GaP2LP
	+bRms9h5HBy0uRnl3scAzdOjNbKx8MBd6PN5S8LKBhzBedYxw5uyAcvW9YN0Hzaf4DlwboBbnVw
	sNOocSnLUa6IzoDagTDxXFsqUDpltFRLZRsaY6uHgY0GYDGCurK+0zykvTQbc+70UjfJDRmscPy
	H7y12O2E6IcnovVMh95A0A1qxI=
X-Received: by 2002:a05:622a:653:b0:50e:5a33:672c with SMTP id d75a77b69052e-5100e125124mr27627751cf.17.1777365566827;
        Tue, 28 Apr 2026 01:39:26 -0700 (PDT)
X-Received: by 2002:a05:622a:653:b0:50e:5a33:672c with SMTP id d75a77b69052e-5100e125124mr27627481cf.17.1777365566209;
        Tue, 28 Apr 2026 01:39:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb809021ffcsm65545566b.23.2026.04.28.01.39.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 01:39:25 -0700 (PDT)
Message-ID: <67a51928-1c16-48a6-ac65-f67c36297e5e@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:39:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src
 from getting parked
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
 <ae-YlXZAuWqgPd-c@baldur>
Content-Language: en-US, nl
In-Reply-To: <ae-YlXZAuWqgPd-c@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AzhYxOU_Q_i39PlOic-zUPfsqU8-W_GE
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f07240 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=UM9yahQYuGUx-RwQQNcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: AzhYxOU_Q_i39PlOic-zUPfsqU8-W_GE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3OSBTYWx0ZWRfX7wjjDIOIgu3H
 koNRsoZWN14mnNjlc3cKZeB1Ao4kPJJV03+oFazouqgUhRpP5GbaVVwV5uApypclkB6SNPD9KST
 GvK0yRoX5QCKen1joHIzop5jvEME1X8edEBtLioLUljZd8NhibLZ2acsZAfkHx+WGPBZSGMsj3M
 Zly7Qi1ZYK545uAyJoQqNaxf3e7iClsN664BlUn8mGzY8twQdqw4897Ru8WjlOVb9C2EkYszHD2
 Cak2KsGnlEsDeYs+yWh37GlR91gYcmMlOz7uYfn3cTKHRAHqbBxQbJuGWD3I9fcut2SYEFQeQQ1
 2TU5xjZmtCc5H+evosPNW1VWyiWfGxwlUiHFYD81QXW/X2u+pbqOPcPF+B89RxqKok1UdLPN4QV
 KyhDzZXIdmVbOl8d8zi5vxQ0s34MM08lWOoOenJ0xPubjXcfYqx9dW3gvaI46gv+hjz6/aEE9QO
 WhMg3ZQDiq72Oskr3PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280079

Hi,

On 27-Apr-26 19:12, Bjorn Andersson wrote:
> On Sat, Apr 25, 2026 at 02:33:51PM +0200, Hans de Goede wrote:
>> Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
>> to stop functioning. The EFI GOP framebuffer should keep working until
>> the msm display driver loads, to help with boot debugging and to ensure
>> display output when the msm module is not in the initramfs.
>>
>> Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
>> to keep the EFI GOP working after binding the x1e80100-dispcc driver.
>>
> 
> Wonderful, thank you!
> 
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> Could we attribute this to one of the commits that changed the parking
> behavior and get a Fixes: here, so that we could pick it for -rc?

Ok, looking at the clk-rcg2.c git log I think that should be:

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")

Please let me know if you want a v2 with that tag added instead
of having the tag separately in thread here.

Regards,

Hans




>> ---
>>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
>> index aa7fd43969f9..cd45bedf2649 100644
>> --- a/drivers/clk/qcom/dispcc-x1e80100.c
>> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
>> @@ -580,7 +580,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>>  		.parent_data = disp_cc_parent_data_6,
>>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
>>  		.flags = CLK_SET_RATE_PARENT,
>> -		.ops = &clk_rcg2_shared_ops,
>> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>>  	},
>>  };
>>  
>> -- 
>> 2.54.0
>>

