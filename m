Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136203BED2D
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605318; cv=none; b=VnrFoxmXe7Y0LpyUwMnSFSfG6C9EVNnlx5nR6A1oYJAnnmlTZUj0kwR4WoQoDl0AJs+Nd0PYlit0/+v7E/vDNq/iOK2YM7dRHPaOekdl1EE235FrXVJNI8fRgLQ9PTKM5ZksmDqpmxec2uFzW3z7VNOh8GImIpr4EP4KjCnXKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605318; c=relaxed/simple;
	bh=hzS+BYiiI3Hmw3JC2h6bqzssr7Mj885Xf1Qzyl2Rjwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nh3ZQjUU+7yvrEt8nHETHjGWkyPmDOABIdd8pbsEZLbB3QsHdl9SzgdxjJoI/enGHlOtgPRV2QtFLHt5r6DdSxYN/B801C2uvp593ZRNEG9FC7+ax/lV1J8ElOspxuO+qYTFa1lY8Brghb2mOi96WdtsHHapZs2rK1zbPAMUHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCo2zKc5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdrQDARF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCo2zKc5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdrQDARF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vslf1226370
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=; b=OCo2zKc51yBxPT4Z
	p5tn9v4qXPdisYf82D+QrvR2/pfyNMkq9NrDgl0+ta53Pc8oqJPwGcCjSsGqaTDw
	yU8UKzeTX7uQ182a0ebasKTF42lTXHqhwpB7ZrzxJH0HJKF/dbGhdHLpexhP1FF3
	iZl42CUNqNicLPU+h4RuE/1V0YFZuf04l2u7hMPlY1ksxv64Se0R3R/T420G4CUS
	vzueMU/T4ESkYMnxHNVwRZYlkVg2A/cXbGPuCSXHKHq/oOnXYnj89sK2ZV7SxQJq
	uRcDVzjky6VYOAfBqfIGxjxeDzbhSaFqPLINGgo33p7nHYrtKaLRkX3u5vA16bNP
	+YTMFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1b10c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 09:55:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b9074bd42so6089401cf.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774605315; x=1775210115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=;
        b=jdrQDARFFrClgjaMB7vewGV7KT+2ziT0xXZMuwLUzpqmNmFcXZ+VdefBDASBHwVYhX
         1zccsIj2tZxiyh8EnQjPIbegmQUIMOlfD4m5u+mac6Naxuw1bmn6EypnwMjUOc4xOJSm
         VsieWoQp8OIKzEQgrE7lwcwNhnODs6f9BbIo1mZI8zibnteZK6oYPXrClFTohrUNpy5l
         +o5csGcns7JlYawe9Tz30Y4GrfVWj/Zoa/syzNdu7ItgApjHurKVooaxYB7YIrtP7/ro
         QUMXL9rvCz4k9zx3z6n63WDkiEUnAKZ6pC/vTkVWiF94FcNZYQK2H0KVuF+cDW1x3wnc
         rHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605315; x=1775210115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxpBU7AuYdojfPOBeVct3hQvdxemze4lp9YTaAIaxhU=;
        b=UEEcoVVjxQnqXvmgMMXEt/NfF6XwYR6jTAKrKrB0kD8B/TTwOp5ZJIHxKTB24aCe8X
         BtFJ/yyyDfKn9Y0qkViqW9RllsvEejR3NJszscPlaV7waYFAhNK4s35ZEtwfUi6lC8bA
         i847jKHoFOJrVxAMCnfCg7AZW7L4Qf5YBnqLar/cXjObONTi8CWcriwLt0flagYkveDB
         ySpAsNW31/DsBfEPgnOrUBekZQUNmlntWXsYzOg3KzWE7+hQ/04aae9zUxjo/MI9sIFQ
         +tOSyM1D+hec0f4CPlx9j+5vbS8gHJ2Mv5XL0iYSSo2wlTsp23IyWYKwQt3TnY4TugDN
         bJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCOwvEDvLRXAFeflLmYPDHikc1r42TFA2orVzmyk+L+Xd3W0fgOu8KZigLrAdmCBJcC6LKkSN+4qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cf7Dag4+3SJcXN4LbWe5qqUVoFemFRDrPQS3A1FOUJFJO7S5
	2ji6kgaK9SryuWug9XV+aXmSoQtTFeUOFwX0GZVoQy0ok95qQ3v18tll5BL5pCX8QnD75w0Jocq
	8B/Xp9XdypHtaSfOuiVj7CIbhl2k8fWH9y3x72RJ3G452jG5qXfpjrMUUttiKZyg=
X-Gm-Gg: ATEYQzz/FWAlFK9q2AWvoySMOOlb4ZdM3rvUgNCYwga/MgRgsF2wQzp6JMEX6TT+Wn+
	FSWSlp1arQbz1XXyfQR/PyHHIgXjXm45tPJyL5XGebvelznBrtBnr8rXrM3ORhsFmW85avncTJq
	cGQmMqwgBqt4K0AuHa5mNMo6DRLjv6k0lCk5vOfRT0wV4xtzKKrMrxVzpKrDwECE7J54iKOoYS4
	QT0uWpaTirfgrlAEIC0l9th83aH0nfseo58imxm40mgJsJ1foYhFg/WE7PQOEaXc6fh0cTJUwed
	UJfqcZUG0mTBBA7Iq//msvaGrTUL/nu+fk+IN5C3qfbXbL0waaIrycwmJZegtJEPyDHi4Wk0MB0
	W5SkrZMGo1tYj9pj4gOAUTjiMPfvF/AMaj9bmglkTuOMgISXd+9PN1dKHXMyaChNKAIxr/fLp5p
	Pi0x8=
X-Received: by 2002:ac8:57d1:0:b0:509:1bdf:e97d with SMTP id d75a77b69052e-50ba3903e2amr17193271cf.4.1774605315566;
        Fri, 27 Mar 2026 02:55:15 -0700 (PDT)
X-Received: by 2002:ac8:57d1:0:b0:509:1bdf:e97d with SMTP id d75a77b69052e-50ba3903e2amr17193041cf.4.1774605315069;
        Fri, 27 Mar 2026 02:55:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef450sm232701866b.47.2026.03.27.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:55:14 -0700 (PDT)
Message-ID: <b40cc518-f74e-4b5f-ad22-f77600fb49b9@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:55:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260326182821.8332-1-nathbappai@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260326182821.8332-1-nathbappai@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MiBTYWx0ZWRfX/QLt5pSyXX/e
 B0c2sjlwqTNPg3TdZkM0N37diAfeLl09SlOrutrKFocqv6HtT/6JfeSLX7v8S4lCIUhaX/M9ESC
 S0JrJoSbMP3tTLVOA1jd/ylqsPTPJ1YAP7Euf90oGaYHPY3AZ8i1LeOP1ngfpOh8G+YbtMJqdeo
 sPaXQGIYKMXuMQkpgPfbuiL09it4Pqxw64JI4OZ+gOW8QSp9VtJstAOehhJjX0QspRTvL+GibUD
 lzybGRTtZq4L6bYzK5Jw7GhNRvATzlNBL/DMNwzOiNlIQ1gJ2QFh3pb24SKy8LPIOP/c/jjm2cQ
 7JIR0Hn+hnMUyWEUIrR9/V708HH+6g68QE2BzNCERreX0KPF/WyFHS9frb2v7gxI9WB4re1xWNj
 WnUGn8GS1Hdljm9BPj58WlV0aIaS2H6tnPh66HNwpPYCh1t8oCwJpfLa/rUYvWygDYGCTxajrjr
 62LW+pt3XMdNzI/V8BA==
X-Proofpoint-GUID: 7l6Q-HrYa5czSFclhjNEkul8AknVqGhJ
X-Proofpoint-ORIG-GUID: 7l6Q-HrYa5czSFclhjNEkul8AknVqGhJ
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c65404 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Oc_gNG4ld6zQFinn-iAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270072

On 3/26/26 7:28 PM, Biswapriyo Nath wrote:
> On Thu, 26 Mar 2026 10:41:03 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
>>> Plug in USB-C related bits and pieces to enable USB role switching.
>>> Also, remove dr_mode to enable OTG capability.
>>>
>>> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
>>> ---
>>
>> I'm not sure what this is going to do for other 6125 devices
>> that don't have the Type-C infra wired up.. Does just applying
>> this commit alone keep peripheral mode working on your phone?
>>
>> Konrad
>>
> 
> Yes, I have verified that USB peripheral mode is working with this
> patch only by using USB network[1].

Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
