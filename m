Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891432AD2E
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926845; cv=none; b=IOv7Xj5lLdwaO40YUgWsQT6J8m6nkXEVnNvf2jb5z6CxIjzyaneKmTv1J0uYWj5sgEvPp5nyYWLGIfHqGXwAqpQWWT1MBwG9JFVBLc/0KkUqk9n3M0O/iaPThW0RC/lnoAtpTmZTOfvVIWZqcg6MqajXuD7CC4PKwBx6heAgAss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926845; c=relaxed/simple;
	bh=uRNyXz3UWPZ9rXTyVqBEU1sjGXfpOGxULryAgGmxECI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LozrUcxapQX1sa7wtBXebG1N02C19ooghZDJO2zTsUn+ANyV+eSyySaYWTtDeHbsEcqXFTeBktHLKdBkR1K9v1DRIHftGD0cSOm0v5z5ELMqLT9OQk4J9zB0BBETrz/uNmTnxfcAtunxjKiqc279kGFtDgkp4T6F5OjryUfKBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA3BqxKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VA2lRW41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA3BqxKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VA2lRW41"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758dZRF1713221
	for <linux-clk@vger.kernel.org>; Wed, 5 Aug 2026 10:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o5aTDHPkSlm/IBdTwZ9yGUMNn9+nrr9o1NxOD+9vbWA=; b=VA3BqxKikmKPasp2
	M/t/8sEydH8FRLPuZfTdlERMXbnGkIyQgO5tAAMvO/7j6MEB5qFe0qBnk0RLQnLY
	t5FTDQImxizHGEThgVRSz3LqHX+VfO8+jObsMS7QqUJ999QGqzIacQ+f36NtRw3S
	ePRPznDmvL1r1YJNQZzpgtdDQwhHr0t+WVgcAA4sdwil4d1HKjvx00HXp4d6DtLC
	IUyIx4XzbEu30oUz5YqsrTRfBWEg3vJsJEoEg3a0CJGZeEKwmjtL6TOeBjAhlJus
	vXaDS2t723JqzM2ToUY7aevTUR3kmpWqOrHX2bu9cXUG0mVg7DukUGrfxYsnoVm/
	6wzfIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqsqqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 10:47:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1358126a91.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785926843; x=1786531643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5aTDHPkSlm/IBdTwZ9yGUMNn9+nrr9o1NxOD+9vbWA=;
        b=VA2lRW41MAnK4tmp+G0FxJZbw5tSgPd/WLv+Js7sOfoTiMFcFUcMPZFuyYCjK9WCUu
         XoC6NycDtnD0a5s9kpiSI9iPwqofSNcY9vMnCH6TLgG31ILczitjNhPldetZyRLEWrBT
         Yhp1o6thCawAdWQWxpU/JecI5IFACwkLu1zcadOKYdQvlS1cAEP2yc6BkTvX0tEjxDIi
         TdF464aMW6ae4WqajvfvslINn06Pbp4bQt9vIGY1ZFXlDS7/9WRiuSlb1O5btvFAzzyA
         LhINbuio5L1LmkiVtLkZCM8Gj9wcqMCYUsZW5Beq+8q3fwm4wY3ucmydg87ra0wlCSVL
         SW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926843; x=1786531643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o5aTDHPkSlm/IBdTwZ9yGUMNn9+nrr9o1NxOD+9vbWA=;
        b=ay0Y2kGThYRKfZu99oe3ZenpzdhVpy0eqoTjQ7M4FGymQYO1N/Rv/mo51lMTjj4v+y
         Y+BAow+sKcuE5vQ9yXc+1PXO0RToAYYCwgzRioKMOdyCIg24N9H765edbt4QREKPGkCr
         2amI0FhougsuJ2kIAZFFUK3KAun5T1tTBFmu7j1oVzzYNNGUg7xA68mJIeMMPEL6lYTk
         8QRlAiXbj07DTvHu8ThQohZRgch0RqFtkLxrcsqoo6Y2eOhXw3JKC5V1vuBrvdV5l2wy
         R3TqnPBn1bhZs2+2u5u5cP5ZMy2LsCwMk33QPCvgbJyXwprruCvJHzjRU/hJ7tRymFfS
         m0Rw==
X-Forwarded-Encrypted: i=1; AHgh+RpOVBqFtBsm4/u54+yqiYh0WnffsnpFA+qE94uvjS4Q/8bew8FSKJ/iM8eCQgbBr1lKy7ZFH7cuGLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgOYzfjdFvXctZpbLJiSdBygf6xfhSA2vOZIHka90lvxZVPej+
	l+pRu9LbKLPI7QkEKKVYpCox+Wya9+v0JVbQM7h3LDsR9uigRkVVl85DyZdchOxWEJ2yK3Kdt0I
	NZoAtDizRGbH5w7BWojiDqVBavPAgIa7etEamcJcJq6rlUwbupxstP7GvO6KFWFE=
X-Gm-Gg: AR+sD11X8Du9f1VwWCKOxxEwCOPoKTRknPXdKBt703kHCEvLPh3NRHxnQUVrhZMAcIG
	jnOIj2D+SGVL+hN283jbIqams5MvGVbZZj5r4iwpRqPd0ojjeUFyv2Kwz/dtTMYC3NBBIdlHBEA
	+gL4NYFN0gxMVtO9CrICfwEhuSmjdQ2T6cmXZDnvg3vKQ4fNlt26wsPsDSYZTE8dIfOP7OaTUgw
	xYL+QzAF7FBnPY1kHen7KJJyJS++9GyBh13gakMif2jEe6nswEMkFWK3gKyKxYp6DoovmjMYm/x
	oFKJRjlG/xzcx/6p3Ru4HeRsOOk1kynZvwxo0xsZmYwg8dgNx4CLfMdsZREluMyOYDwb9kUlEyu
	TFPk6/jdK03CGFEC/BE1z48svzJMRoPEc
X-Received: by 2002:a05:6a20:734c:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3cb85e6c92emr6221570637.23.1785926843128;
        Wed, 05 Aug 2026 03:47:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:734c:b0:3b4:8ba9:4d8e with SMTP id adf61e73a8af0-3cb85e6c92emr6221525637.23.1785926842707;
        Wed, 05 Aug 2026 03:47:22 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708bfae6sm1270919a12.20.2026.08.05.03.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:47:22 -0700 (PDT)
Message-ID: <6166c963-e9e7-4442-ad84-976d389b4663@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 16:17:17 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gpucc-glymur: Mark the GPU CX GDSC as
 votable
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
 <20260801-kaanapali-gpu-voteable-v1-1-fe804d24d2e9@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-1-fe804d24d2e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kTy_tZ9b4OITBgltVAu-xcJ7kG6o_qsa
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a7314bb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GvobxVZ8zsqbnvUxSbkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: kTy_tZ9b4OITBgltVAu-xcJ7kG6o_qsa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfXy4hqvz2CDJnw
 GL1ovjOKK2LFu6hX9CptHLjRr1FAgUSwhw3fmgKe2528XubR6c75qslh0y3rouEwghFauuJ/nR5
 dDxyc8WmF6C+m+mLTVg7kHBQ+cYYapI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4NiBTYWx0ZWRfX6pcWrnFnTQMF
 E+lmHKo5LgkIB2ppbzL1ujGrqMcZ7w7AgtNzdJ++wpN5abNh8jdugAQ8A4AWZwEEs7GcW0VdXQw
 OYjkA/Xlm/YA1+zKy1cADlCpSoHylir8hhsThhZvBlDMeWC8oYCixEdPWkwAXcWpBF6neltlPRL
 ESOSEK+WPuHGL54iMJ1c9M6MZ9a5nDxhzfQndOCjfN0pkMksH1iJV5t3r5XoSzbod8PqO7j23OL
 +u3L78r8w4+MQmhcwaSPLCUd0GNq2cPUU7MRsVCxQLcV4oy0g+ktR2jkif10BoHwQhwNnF6IJ2a
 66OW4wcvqr8nf42ZWPr2JquYFfrH6wlkOz4LfOHukeXFT4NBHq05R6pdxbvQ+5C+bAnLemoBs5Y
 UdprrqJHqqF4dONAAUGxU8Cv32ONanrbt5NTMnxH+e6Da7G8HBaqXnyCbC04Htmzi5zWGHDEPOQ
 1l6kpxcHO9vdiMDHnrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050086



On 8/1/2026 11:01 PM, Taniya Das wrote:
> The GPU CX GDSC on Glymur is a votable power domain and hence should
> not be polled for power-off status during GDSC disable. Also, its
> power-on status should be read from the GDS hardware control register.
> 
> Accommodate this by removing POLL_CFG_GDSCR and adding the VOTABLE
> flag for the GPU CX GDSC, similar to other platforms (e.g. SM8750 and
> Milos).
> 

Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh

