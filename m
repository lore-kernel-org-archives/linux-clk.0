Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDA3C09E9
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329184; cv=none; b=KisWf4G7Y4k4/EuSwtm5mK8XeQ8duntYbCzCoQvr9MH40XyG7iB1xW4G4TCsOdKqZW+eO8K5fG8ygLGUYC2rd4jbWFW07EOH7bwS+aBAnUSzioZYWqhlA1d6ZyQNtW8Gry6lxmT2lJxQE3HyFh2kpUOf/ZgzjUbBmGD7noulBws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329184; c=relaxed/simple;
	bh=X10fgcE/VdvZBiLYK96ZfvDAsItFNmfond2stuPddA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qe5cxVQ/LnLN+g/p8V6y8FUYUz3mKP2VnkSOEsTUqFoq6S8JORKSk5DcBQQdv5J7QY3ZjuHe91o+R2f6uFiFmmlg9t5hWOKGVKKQhdD0NYqXlhvTJ3A2/YSiIO4QgmMJF51xTZKLlI4WLos2ht04PLuWQCWwbhYf3EVmhugDhdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N71lhcbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V1IPRsxu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N71lhcbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V1IPRsxu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmC072645497
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=; b=N71lhcbr5rc5+Ma7
	v7CHr5pI0zWKHpS5WKfVzmaKWSDa0qPLNneY6rafufgyARMVgi9FcrqVaWYBBHrY
	COagBa67FingibI8pSKl3ZwRQA9CnJ5QMJBs6Z4TjfF2GhOwIr2vp3P1uMeIIG4t
	qmYRQR3ydxJpNjiwhamZ4GfR6vuUGjPkmNG/wjhw7aue4GfQo+tL4uDY2pkovlLi
	+dcVHB5V7ynk77UYXI9igboWYJBlMlZ7vZXn8ML+KVjbaIDJLqogTXzyrh2tERZe
	Q6CfduM2rbDDPPMwB9E36inNdUhnSpN0Zzd50lct6zIe71nJpniAs06X+P+IOYuD
	gULumQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecbatxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:19:38 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4488f192768so1702225fac.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329178; x=1787933978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=V1IPRsxuDG6rg7FbMrCs755o/yJHxniVx8t3O/XDpKeH4JHqh1Ejeb54QKZEzfxhOZ
         D4RY9/mo5xct8nyGObaLIoZ+0V7t/vcTnzrHpjTQ3ccBZ7tqbcfS1lAXhUK+yR+8ShQc
         bRKNg1rGygzqSjmoPFo5enrWMg/tvvVdLSbuJv894LBcpbGV2wfmBnelUHzNzjOoLV8d
         N/xW0oNLqVVMi+eVmy5Dj6fAZ6BIsDVgq6QTJRFG2Ek4sDf8emYqY5Sy/z8+ALYrTRd0
         aF3qqjks6zjWzbAjPeetunghHd/HnjMrh5OHsa+VqQC6SM1ZPpdo1YmNkQi9fgjjBX6o
         ad5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329178; x=1787933978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEYvpnAfzkeKW0yeKy1jpo0v3pAYiHrS+jiYSV5Tvjw=;
        b=S/2n329oCnjLF47k8fMh33DLNbb0eZRbjuhNcBLuINKwMAhWjMx4UiJ4Nwe2DzJLuF
         yKN/tcS16UX151+kw2YqX8vyUOkiXFcriYqE+INAjFRcOO/jY2bjeEF7R/tRiNaIC76X
         ToK5AytfwJTKHloPgM6N8P7Di4EVi2fV5/5Z/LV79MwfOSS+Adi4WXvBUoi9eMQ0vet7
         jGe84JlvUlvp+6KUT4F9EaEeE80Lha/7m+njJhIjC8qb+n5ncO/37iufAi2uZ5r4SMaS
         KlS6Zhq35/m4fMz8m5YWwP6QLZGHYwRu6swWi7EiK7wsiIukORWOhV4Hz+T/D6BKSWWk
         jMrA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw4gRMpVYzldqF8zMYvLvjRsoLqzDAfijrSAszUocB8vA8w9SS8MOLz0HC2jcB6pfX0+QOc2t0Rfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCtj6o8xe+0k1Yavon/M4JyfBsw58jUbNKIlpa8PHB2B2wJdQX
	TSANSLKNIf26yV4Zp/UY7/vFdyeWkU9/+k23PYrG52SzKO8lPZKjmHq0oOW+OHjhV1fbka6u3c/
	DhvDJ5emxKA9bKfeHecqwwxYcMmpc5mb9NrZYwEQFccLl8+ia3ng73kljl5ywCh4=
X-Gm-Gg: AR+sD111jDDpa0BTyyHw85NNnfkpscv96zGmfsPWh7XC9hM0UuxHvnSINMqRjhQV4nd
	rXsmuldWX6yzP2pw1RLCwkUiAsNflr46uGvT7U/pO1hPa7Pzyi+qqaAiMW0Wt6B0z/dgA7GDrmp
	MkxiNJyA6+OSFVl96DUN0cwmQunLMBnGZilIULAQBlbFKQvfSUlZ7mn6YMhoYi/Co2w/jbFWMCy
	zF2zWTTeBDa9heEfsyN5L6qb0ZprtM/9cutO4vUS/0FluhtAyrIXGZh6Mj9DtLtkLYsvYIkdz9K
	j+RdMtRKXdIXelC87dnGi+BEcOigIB5xVlWno+fA5w6pf4IRnrhpepMv709EO6XjeLY/QCGiK4p
	waCv2nc7Gjwfyc7B0DuxUG08q3JDKkTpI
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606902eaf.24.1787329178071;
        Fri, 21 Aug 2026 09:19:38 -0700 (PDT)
X-Received: by 2002:a05:6820:308d:b0:6b1:681f:81a1 with SMTP id 006d021491bc7-6b1681f9275mr1606821eaf.24.1787329177641;
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632a6c360asm4738369fac.5.2026.08.21.09.19.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:19:37 -0700 (PDT)
Message-ID: <c82359a1-6b64-468d-9823-a196f291df0c@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:49:26 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
 <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
 <4e7a398b-e75c-4dca-8380-440ca7cb22c6@oss.qualcomm.com>
 <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <f7386ff7-9700-4a19-bde4-df4460ec6963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX8v/9E5PqdCwo
 KigUCGGmAUABhqIsubh2Rl1oHnnk1/ImkU8jXMufsnMwcYU3PQVREBGwNKJLQf3n3F4zFE0Hb+s
 co0NKNxt9suoRm7IWX/kak7CztOdvo9Gtvepsnb0YEK0qtYa40VO1fRN05N8xvf6NBS7+WhOrVd
 8BF1+g2AcUTw5gUJDPL4atu4IZ3Sc1kUD9qGaW7Mhy/WhqdMjnixIb5qn9Uhw4BjlGw02VI8pDL
 55WKAYAunbt+RbvLq5XSh/NdtyxLCpOglUddeybAvF/m2c/7ZCVfO6pcdcCU9I7FI3eAQrwsLhw
 CBpbjZl6wn5sY9yJq6Pj5/sgW0WT8kiQ+QtloYpIc+v5lt1fn2dSdeJMX5D8oZCw05EauAZogl6
 m5yoryowdIOWu8ShUIfd17noz3hTldEl01LtXGFqP9VOrzlX2w+yc9CrUxnm7q1ZYRlmSts6lPW
 2pfi2DrsncroLaa4/Pg==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a887a9a cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=A1cAmru4g_ti7Hb5znAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: _BdOjSgv8xx-EsIiOeMTOT8q9-q3U7Lg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfXy5+2Lk5BqPMm
 o8D+HygdHC/fwU8YUOil7cfe6N5ZilDNQVLGC8iNev1w6eHkcL8LirD0bNtqDhHLTglFmwUuyt8
 Kjsyq5b2EE7re1HlUCWqJCqOoZ9yJ3g=
X-Proofpoint-ORIG-GUID: _BdOjSgv8xx-EsIiOeMTOT8q9-q3U7Lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210127


On 8/17/2026 8:55 PM, Konrad Dybcio wrote:
> On 8/17/26 3:42 PM, Hardeep Sharma wrote:
>> On 8/17/2026 6:54 PM, Konrad Dybcio wrote:
>>> On 8/14/26 9:31 AM, Hardeep Sharma wrote:
>>>> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
>>>> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
>>>> interface through the common pinctrl-msm driver.
>>>>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +    [65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>>> +    [66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
>>> Function3 can't be selected because of repeating names
>>>
>>> In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
>>> Perhaps there was a longer name that got truncated?
>>>
>>> Konrad
>> Thanks Konrad for review.
>>
>> It's a real qdss_cti_trig1 line - the in/out
>> mirror partner of funcsel 2:
>>
>>     GPIO65: fsel2 = qdss_cti_trig1_in_mirb, fsel3 = qdss_cti_trig1_out_mire
>>     GPIO66: fsel2 = qdss_cti_trig1_out_mirb, fsel3 = qdss_cti_trig1_in_mire
>>
>> Both map to the same name because the driver uses one coarse
>> "qdss_cti_trig1" for the in/out mirror variants.
> But these are physically separate functions, even if the mirror feature
> makes them seemingly one and the same
>
>> Listing the function on both funcsels is the normal sdx convention for
>> these mirror pairs - the in-tree drivers do it, including the same pins
>> on sdx65:
>>
>>     - sdx55 [16][17][22][23][54][55][94][95] → in pinctrl-sdx55.c, pins
>> 16, 17, 22, 23, 54, 55, 94, 95 each repeat qdss_cti at two funcsels.
>>     - sdx65 [65]/[66] → in pinctrl-sdx65.c, pins 65 and 66 do it —
>>     - sdx75 [16][52][53][56][57][78][79] → in pinctrl-sdx75.c, those pins
>> do it.
>>
>> Only funcsel 2
>> is selectable from DT (first-match), which is expected and matches those
>> drivers.
> As you described it, you found a bug (FSEL3 is not selectable), please
> fix it in all the instances you've mentioned.
>
> Konrad

Thanks for review.

Corrected in v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

