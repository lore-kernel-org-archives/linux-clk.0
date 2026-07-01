Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10225410D26
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902269; cv=none; b=boG7Kxd0TjOTCild3cr8o3obqxk6aTXh22hukLhuxgSO6/lcGpTCsIVNJz8BJ32w6SelGj2F916w4EVQFWSnW39RdvZ+2me73ZNTFFHfze90X63rFJCB95XArgfInhkzuN4EwaUSKWbaCF2ScwzBOqx86uAKux0VMrs7EIax+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902269; c=relaxed/simple;
	bh=ejwOhhwHvXS9SS9nYbv3+/nrz7n/7JNkl1mvYN4B3mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aD1YUX1AjjytvRD4HecgH0hQwmS0Xc+Q9nc6bY3Fi+5O1iJCl/+b9ZXEuyQjd7PRLm3cAD65p5xh905mnB8YfnSh1cMUNlI7PGae2aBfu8WExghc9cZ2vdmiGTLC80YDmEyrIZPcsC1y7FgYgg3d2a1Q6/iNis4uJHMCAcjua8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWxfNf3L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=irQfrHWB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWxfNf3L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="irQfrHWB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8dXj761882
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 10:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ExZyuTwYEfnQAUZdIX348PgWW1Gmm5HzulGwFsDv+I=; b=FWxfNf3LAjBw/FfG
	/sLpiWRxB9zLupTXHD+TCnxI5JOrbWHgiqfmgXyiLax9oTr2bP9mou9PjPiMuYAV
	/0BAfKdhsMWPol26BfMcMlWcRo7dt1KFR/RJp2X7F4Q1rI9sJGWU0DJ7DjuLpjLg
	jgzUk71pRYks3TDWkZbXheW0TU2/qRN+gOoz9FtoQbEHJxDbZ+Ygav1t6Y5R2i/d
	5id+oWTfDQ/phSe70fHEpFkxnLOu0wh1u8CdvTbxENhQTMuNCrLl0pFGWgyvcaBU
	7lNonCQHypbV3TmCG2ENqgNpY1mEqNfZQR1ZHuYeMtk5NUD+NSI/NQvPzk406etd
	x+dodQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3k9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 10:37:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c298a1b20so288451cf.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902266; x=1783507066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ExZyuTwYEfnQAUZdIX348PgWW1Gmm5HzulGwFsDv+I=;
        b=irQfrHWBtO/Z7JIYhVZP21YdVVR4Qxh19hJ516Twp2mjzvjWwVgvZsqA7y2tfZWAXC
         sR4OigAmUyOiF9S4xvuUUtZT0xI9k0NDa5g53G+tfEBnCM0afo2WjU1mCbLmcOBaPXCg
         Bk+LH9OfqYe8ubaT0Uhzvb6biLd76qj8EjjmNl5EiA+2rudIUaaRhf7XY9XnKsNxVvnn
         xSPoSjU4DxlQ0VEBywYMtRvBGdpPQTd6fZirLiR2NeVjll98USovRoGF2tlbLAGhwyER
         cFfubIS5Lo+1QAclZuIbeF961SzS424Lr9GRMyciwUCj/IPvnzFkleO7DailZ8Gfir2x
         t6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902266; x=1783507066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ExZyuTwYEfnQAUZdIX348PgWW1Gmm5HzulGwFsDv+I=;
        b=AXSQleDmFD9DDJZGJwETvUrdSuSkSyuz8AyoNbPURCGq8eple/KVDTEsl4lzc9+yGT
         e0XKdDot2cglw+U/rsdyaqSe7GK7GOcUER4AIQox0taFfLydKrgK2ozaJS/pupvmGniY
         qz1NBnpqz4XU/MjY5Mvu2PmuxBs89Xpfd9RuWe2F8nq1gbn8j3u0McHsXUMW+VCybS8d
         rNJTvLQvoGaYQ0TfYnMZy+1bdY8p+XfrV787of2jbchhu8HAxP3WuZ7XxAiY2qDv7k2k
         gSIAfvU5vNsRXh6/DtPA6smnBmu30RKSaQ3vbUHu5liiIoSFjLYIcWPkimtWVP2RfLJU
         rcwA==
X-Forwarded-Encrypted: i=1; AFNElJ9wv0YVFSN2+12yoxF82Ab0d8jB/GChwyN5R9T9bb+yf3fwQZ30Ka3Xtkr5Qp0VvoH4uDzqxcg8DoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDPPlSKY4vE9V6KmFCHuHn7DrU0nkIEuMzl7N5T2nULSkWglq
	25SiKhdbi2/rg32yi7IAIJ4ImskDLp1sCva0GGXgKGC8moRzyDvQVO5oxqYuILr/b+RfxOYt0HU
	0fVmU8PTd7gVHMgsBJOAW1rzMewJi0WHMV6zFA3AcEdfQKEQr6JgCSajcurTtmaAtTA4hstc=
X-Gm-Gg: AfdE7ck/wzBUNu8XfDr8i5UcRu8nuu+BlNFch/3XPqgAbouM2SukYz35csXmxpVC0o0
	HBdXOfMiVBxniTTae4djvobhtCgq6OT3/v/x871WUxPAlVH5wlnME6rpgDIOIfx/eMZNeIUsoJ3
	NbspkvxJBtZJ5at3LSAQq09qCltSaZSB2MBBQfRvSyc5nHd8NUE8mEWLxcjAcCj82pP3AJmeGex
	JHrbNfWy8vKzj1eZhjU852oBBQQMh3F8b1gMn9omUGC3rpf4cOaF9IFaqS16E3VGcqPXRgMXbTe
	+BozFTgEx7q19ucle0XueywldcAnznh44zoPQX/FP84wpGgxAvQ99763Bb432dWfp3cU1Cm73Wc
	O2hQSLSYR+jGeW/nssJG5usbx56NzIfTMUGg=
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr7134641cf.3.1782902266010;
        Wed, 01 Jul 2026 03:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:a85:bf91 with SMTP id d75a77b69052e-51c26a76bc9mr7134521cf.3.1782902265603;
        Wed, 01 Jul 2026 03:37:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6a400sm253530066b.20.2026.07.01.03.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 03:37:44 -0700 (PDT)
Message-ID: <fb5262dd-8593-4874-99ad-6190f952b7b1@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 12:37:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic
 allocation failure
To: Dan Carpenter <error27@gmail.com>
Cc: Vladimir Zapolskiy <vz@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260629162127.3910603-1-vz@kernel.org>
 <39032914-3a66-43d9-885f-55f5d60da047@oss.qualcomm.com>
 <akTldJur7GEgSkDD@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akTldJur7GEgSkDD@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44edfb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffUELUsPIbkk3n1AmDcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DdEubo1lg6TTGSXUW6DbJVEbo9Wx5IFT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX5y9CY0SSwDYg
 anHEu6q3/E1zk2CZpOLzpaEGWg5H7skHCb9G34/1KZAlMAYVokK7Frb8UJAYlbkAQgbzsMy6k5e
 Qu7o+OUU6i6pPradlHxrn+XT9eo2baA=
X-Proofpoint-GUID: DdEubo1lg6TTGSXUW6DbJVEbo9Wx5IFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX7yuNAsXGhsJF
 E0cJijMwY+MMKLIPKl7lLhUg3a748VfzHJp87JuilKK29H0XOre6UDjAS60GLxOC0r+5GK0A7X4
 H8CLwOsneBEG/AwK8t8G3yIzKotvLKr1SW9jcLKN1bxzVyLzCseCL3T44ZpM/W4OJxHfW3hSWYZ
 1A4xAGy4X1fmRuQp9YiVeXOGHXPWf00MlAL9Js/mRfNHkf50o0J4X9R/CuoC4IPklBmszFQImUd
 o8L58GDECaVREzTvdCRdP4r2xXhisHR62jpc0IuoDKu05E2UPGfDX5/tzXM0sM8VaKTn0v9uIK2
 MSN+O9MWRgQxffyL53V3EELQ7sxL7boHBC+h0mgt/HfSS7rJReKqrTpA+a88HGxoCKP3A0vRApo
 NYf+1lapGJC1exDuDiavscaDRA+iNtVYy/+U3ShaKpsjdbLvBrjHZQHid8NcX601KE5vcJ34Ok+
 VdLlMz3Ii7zrzzXehmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

On 7/1/26 12:01 PM, Dan Carpenter wrote:
> On Tue, Jun 30, 2026 at 10:50:13AM +0200, Konrad Dybcio wrote:
>> On 6/29/26 6:21 PM, Vladimir Zapolskiy wrote:
>>> If a dynamic memory allocation fails, the returned error code in clock
>>> controller driver probe functions on a few legacy platforms should be
>>> set to -ENOMEM instead of -EINVAL.
>>>
>>> Fixes: ee15faffef11 ("clk: qcom: common: Add API to register board clocks backwards compatibly")
>>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>>> ---
>>
>> Hm, I'dve assumed that static checkers would be able to find this pattern
>>
>> +Dan do you still work on smatch nowadays? It doesn't seem to
>> catch this one, but I think it'd be valuable to look for this pattern
>> - AFAICS it only flags returning -1 instead of -ENOMEM but I can't
>> seem to trigger it with a manual edit to this file and the following
>> args:
>>
>> -p=kernel --pedantic --two-passes --assume-loops
>>
>>
>> For the patch
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I'm re-working a bunch of Smatch internals right now.  I've
> fixed the -1 vs -ENOMEM warning, but it's affected by the re-work
> so it's going to be a while before it hits mainline.
> 
> I can create a warning for returning -EINVAL or other error
> codes instead of -ENOMEM.

Amazing, thank you!

Konrad
