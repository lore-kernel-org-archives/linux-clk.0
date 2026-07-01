Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575843637D
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907902; cv=none; b=PHJo9n+RHsVvht/3NAR5zNkeemrr1PVaFWJ+8qgx6TeTBx7/pcOraMRW3kvPAa9CkVZ+IqTTRE+TV/HfeAXUub+cxCP1DUS7LAE0yA1KeSH3RI1uogKrNoYgTDDQkxp4MDESb9cahqrEj48rGhQl3CNma7F84TOcGERwJJWrpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907902; c=relaxed/simple;
	bh=q19NDw1cfxlgfuBl5CY+fS/82JUPx7DJTsiKMBEL48k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N6F9r/Du90PFKbjqObGU89tCJnHj+CyWzLi+e32g4PWSsBt8polRYa6iCQX/JA/LmGeseUO2f4tb/E9bEoy6jzREx/bfNIQgoJSomWV5i8WzKl67D2mshGi5fUQX+wBYpkBT4vO2ZojGdRTohs9vTvacYapTawfEtVXlUKP/obI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Klim+wlA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lm5NmY7u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Klim+wlA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lm5NmY7u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Waj744292
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 12:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qM0Pbr7CZMBgBqjdkP4IS8M02Nun6iQQA+v/dbTvWHs=; b=Klim+wlAcMzN+LNs
	fZISLHfsFqNbIiqd1iEKvDsgLEQPpQzNfCtMwzH4xkv8Zp1+b87m8vZy6WUnsiFR
	LUujH8UXHMd15fNRBl8+tJQyzM5q/64naSHqe+DaszYYNITq0qjMTYXJE44uJxgj
	NpU3hma3Iafcr7rWux5KxHfnsdUdx/k4q0qE6rhAbkKDeMEoFJ3BXGN+exs+CClo
	bzneRn4EgMDBrwEmZhnWcKgjuco9WRXLEWQOGAm3UY/S6O4WRlz1vzG5yfm9szMT
	2g4nOhSm+6MQ327xJKHw/3whfw573aOtl2UTL5kwNEdOWqqGqT1bqjPF0fwt3nF5
	AIPwwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4x0thd2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 12:11:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0c6ea10e8so1728756d6.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782907899; x=1783512699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qM0Pbr7CZMBgBqjdkP4IS8M02Nun6iQQA+v/dbTvWHs=;
        b=Lm5NmY7umtgfAtMsx6o+DltBMnDH7I6YcJ2tTzSr8se8O/OUJ2v6OrMx3dE6AAPm/q
         ytbWhVXUichEMb4oOER+wzL6Kq9K8vCesJN6riykkg3nqjcTH9SrDgBKlzwU2vCobHy3
         IBsSxily4+G5qLRw1E0DEZYtJOqpcLRsMnLrqkpkICr3kNc8vxHndwwtrlcAXO0ImP2C
         p5PYrRet0JudRr/S03iVIYne+nZpSCDiEv8yuLEr2JwI4xxV6Y6+Yuy3TxTcvMwUVUGt
         NBgCj185UL5gYfycLwBRpdSX/R8YL6uKdzDimLn+xJInJhLvo6CJw6yl8GrsL9KWi7LD
         9fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907899; x=1783512699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qM0Pbr7CZMBgBqjdkP4IS8M02Nun6iQQA+v/dbTvWHs=;
        b=RkE3uWCeQTpvK7d9ZmWxlR0FayTlNBa/6AOOI+lfhnEdvKE/ZX4Aieg86ScU7m4as8
         NYAl3YSfBBIy92rFiE+3l/eHKUYjiRVRmuGxH0Z0Jr0aurjFn8QwjFYd0/I4fOFqpyIR
         IOJl92RwJxfe2uBhKA/7KfMTLSL891uKprmkvQW2BdLQY2hUeQEGWI2FQpchePQmTQS4
         rbxVK3TaHYXD4eY32wjF74wrV5U9zpHsTmQPp0RVBFtGUiT8lC5LZhG2JNsy1VUVCXIj
         TApmF1dOUSarZgpJMlGi6R68T4IvrKaC1cHQMmOkzVg6Nbx/+/QZTK2nmmuggPUIWxAz
         ZcxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiXdGOiVSQco1iuv3vpsi6jIcxi8RsWhnisvxyLjZc+sWnQFJl+6l13js5p3mPiXOHocFy6fI6BUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJ+B5yvoVLDVxjhep0GbL1JFe4Km7baJ3GXu7/y/eYNP3SSCi
	P8ijFsPo7r9TBLXPEsZYQeY7uhJ2GoMGLROn+8Y1OyeLGw+x+cjqrmH9taD0o/rXlV4jIGTnLdt
	9JpruYzm9gleobbubUBaJsgc/xiZZBOdYi5wvitEdo3qQy1EDohE1MlHgUN4IJ90=
X-Gm-Gg: AfdE7clP75UIdiVPuMnEKmVgoSKf3VEJhLbHq4nrhQaPMTrD7VWpv52danPxlGHGRzj
	UOERkumPsmb1omgczNADSstlItfC1DdPTvIH9Foyf2zAY65nootwCfUZ75aA4urjEDm3EE4wlbL
	sZGwZZWa5noFA0aKCtq4B0JtlgcfwT8YS7im0P/cxXfJl0+LeIkwxIiI+UPYXznkTIgeqeka9E9
	+jNJqNWmoVLlxfrZcvJIdO2qh0KHFuauTyrMIstBwEmoOco7IsjCiJPVzC0GmRR/1tPoMajO5+d
	dBfkJwAZsAgxNiRDKNy7Jd3TbXBbcoZKaE1i2sGeAVsgN3H3xSctHbj/O1HJTZKw8N6gre6S5KE
	qsmm2rBUM0S7+4ov/63CiLFq0AIhxIm3Z/HQ=
X-Received: by 2002:a05:6214:2aa6:b0:8e9:f5a1:7704 with SMTP id 6a1803df08f44-8f3c8ffa689mr11211406d6.10.1782907898992;
        Wed, 01 Jul 2026 05:11:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa6:b0:8e9:f5a1:7704 with SMTP id 6a1803df08f44-8f3c8ffa689mr11210826d6.10.1782907898293;
        Wed, 01 Jul 2026 05:11:38 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c98927csm2612885a12.30.2026.07.01.05.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:11:37 -0700 (PDT)
Message-ID: <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cALhvOgCJkyfA7MXch367DoYXU1lJEyS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfXwr0n0btmca7m
 uMi4EZ4ZR2G7nimZn0be6iCvE+VnumbY9D4Wlk3Yt8gp8w4FkkA1ZbIZp30oAmNVaQTUglcd2v5
 LMgWR4mL/1A89bEaAzThhC6T4l0/xVk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfX17S5L+v+ipj8
 YVKuWNMVdQtLrBpi09xn+wTcR2NXFufyxKwWwVe6OGiegJGW+Y35nBqwBGitAFO4UEHhOEQ7bbr
 4JEw6hmvk8sQ5XZvo6SMCTq2O4Gp+xIduBqjrfdTa9pygwsAF+0/4M6x1rIU2h3VW6WZMFFz/jT
 gea3iSJH5ciblX5ItzSoXRGo3vo6CCmNAqQzqeRdmGeFeSUQfQrWDD3myXFM5dffoHIqnq1Pk/N
 EivgbETGu1CaM4bhpxG0qx75Kg3A6Z7QliUG77WZa8s94LJq6/CYMqgxy6hwq+ISVxPX30lntED
 gRxA2IZcZySIt7XcJAsbVv27nvgLpAOgDLXdeNWTW9IYM7LM0EN74s6pEHFfcl+EsnoqyywdS7u
 wQBQbzkBpPxVfX5Ji150O2AGrVSoKjZ4fom+OdumLhyQVFXxoM5oNuKHgT9C/bj/pD3rCC+GyIM
 IeSuomm9EfbF5EVLUMw==
X-Authority-Analysis: v=2.4 cv=T5+8ifKQ c=1 sm=1 tr=0 ts=6a4503fb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Mx4pEHAkPCgqNRbZu6sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: cALhvOgCJkyfA7MXch367DoYXU1lJEyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010128

On 6/29/26 5:14 PM, Antony Kurniawan Soemardi wrote:
> On 6/29/2026 4:15 PM, Konrad Dybcio wrote:
>> On 6/28/26 8:07 PM, Antony Kurniawan Soemardi wrote:
>>> On 6/24/2026 2:39 PM, Konrad Dybcio wrote:
>>>> On 6/24/26 3:57 AM, Antony Kurniawan Soemardi wrote:
>>>>> On 6/23/2026 4:43 PM, Konrad Dybcio wrote:
>>>>>> On 6/23/26 8:05 AM, Pengpeng Hou wrote:
>>>>>>> The HFPLL enable helper waits for the lock bit but ignores the
>>>>>>> regmap_read_poll_timeout() result. The polling condition is also
>>>>>>> inconsistent with clk_hfpll_init(), which treats the lock bit being set
>>>>>>> as the locked state.
>>>>>>>
>>>>>>> Wait for the lock bit to become set, return timeout errors from the
>>>>>>> helper, and propagate those errors through clk_hfpll_enable() and
>>>>>>> clk_hfpll_set_rate() instead of enabling the output unconditionally.
>>>>>>>
>>>>>>> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>>>>>>> ---
>>>>>>
>>>>>> This looks good on the surface..
>>>>>>
>>>>>> +Herman, Anthony, Dmitry could you please give this a spin on 8x60?
>>>>>>
>>>>>> Konrad
>>>>>
>>>>> Just to clarify, this patch impacts cpufreq and gpufreq for Qualcomm
>>>>> Krait era, is that correct?
>>>>
>>>> Seems that way - cpu, L2, and GPU, maybe others
>>>
>>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
>>
>> [...]
>>
>>> [    2.679716] L2 @ Undefined rate. Forcing new rate
>>
>> This seems odd. What's the reported rate there?
> 
> if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.

Hm, are the parents registered?

I see:

p_data[0].fw_name = hfpll_name; // "hfpll_l2" lookup via clock-names
p_data[0].name = hfpll_name; // legacy global clk lookup for
			     // clk.name == 'hfpll_l2'	
			     // (registered in gcc-msm8960.c)

p_data[1].hw = hfpll_div; // sourced from "hfpllN"
p_data[2].hw = sec_mux; // sourced from "acpuN_aux"

There's a fw_devlink between kraitcc and gcc already, since you
specify all the clocks (minus hfpll_l2):

https://lore.kernel.org/linux-arm-msm/20260514-expressatt_cpufreq-v1-3-487fd2d78859@gmail.com/

so it must have probed beforehand (unless you disable fw_devlink?)

Can you do `cat /sys/kernel/debug/clk/clk_summary` on a running system?

Konrad
