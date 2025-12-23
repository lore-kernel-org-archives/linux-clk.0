Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16D2325701
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486927; cv=none; b=ng9N5xZOC6nEyDgVi2CQ1WW3GRG8IVQWG1WTJkT+nLbYBF71b6yrtUMA5B0/UCOXVe4JX6YRbA+arn49yVvb9H8t6P6V69ivdV5RCvtLHdmB0MjA63HhCcNiZfUZUMQR0RvWEl8P+tvrK91ALdSFhE41q+x8RZmMgmd90m4NPWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486927; c=relaxed/simple;
	bh=lJIY32/GCIbR0U34vNiVLDJMSF1KbysHIJK8Sy5uI9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvjaqf9DwP9VdoZNYv5WqTxFnLGICPj/sfnsMVNjW8ACzrhnhGnRd5mgbB9td0r/pTrcJS/kwMqmWqldAVoO0Kg+JZji2tD4uf4BRPRJEg6eZthWYymPk3mNQmXcKkG7y5oWzzziCFhxlqGIm4AcJhBnybltrXD+Cbw3YZXeIXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNySYuO1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHW3alA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNySYuO1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHW3alA7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAd5E01530059
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PEgKfhh5qrLWDgrIDZnIaTob4BBIB7qhzkwcfeSnCSk=; b=KNySYuO17iEwVQjh
	iHbUHlQDSdr5Pygt68Scl4tv6ZF5s+lOLXN+ipJssmvbD729U1iCtXa93IST5VO+
	nBT4KX1HciSVgbPQOLwe+OiZVA3JElipp7GVlSd5YwohTuRzFtuGgitJ6YBUSoul
	L/G5xUGu9beJBoSgqPPB3XIGu++UNiYbwtmCizg2v/sRL2R0/B39hbpEo6Q2qkcV
	hWcs2T8KwJslmBGeuZ3ni8X4SLHn/GQrR497aPnTU3ZzfMNPJ5bCqBEuj24v92o7
	pSvqwpHbffhSnhjdyW45U+hxwV3Ux5uGuiR3xItlZMFlfmMJtVnzCkcoAa0sZmVa
	gq/vAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3mgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 10:48:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f8e6a5de4so67393255ad.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Dec 2025 02:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766486924; x=1767091724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEgKfhh5qrLWDgrIDZnIaTob4BBIB7qhzkwcfeSnCSk=;
        b=jHW3alA7SDf6ATntUCU0mkIky0Qxpq4hmraMVK6k1NyMy3gYRqlRl4fQ1uOFDkcHI3
         XQMmYC9ulykqs9DvsB67yQvrLRWR1DjuHBx7NoPVdTeiFz3dpreHIIKd7UUrATqS+1v9
         6mbtlmkE0/NOjr+QY3hS/Had08/9twFhRiA6cK0b9xFqZ5QsjmwWNPCwEIXcV32VmBeu
         WITJW+LIFBNwxpzwno+Y/u3hMaaUYXHUb0EmzkkVpMDl60srmnM7Vl1T4aexXAYQSbdX
         rC//NF/OVF+JpqgcXIeS4deThqdPWUOSF7+C7QvVgqudaP09UJr2J2Ddlhmtp46X4l/N
         VJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766486924; x=1767091724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEgKfhh5qrLWDgrIDZnIaTob4BBIB7qhzkwcfeSnCSk=;
        b=F80pIZGrGANpq7J3DbMUuM6IHC77fE04cYnIA0LIjwxRDu9xDICWbGVK1o7qFEK6Q4
         zksrYUNH98UJjpfK44O/MzFa9DmWvQNyqQ5dAcklfsV9n+6WXmhYt5hGl5TisZ7Bz/wp
         VLOL7lQrw730xxYuEfTOzusIxRWO7pMkUkO6V0swVixptlAKV5RlsoF1yGevv8wWXFs4
         vSj5NDBcrdUGBmlL7AZMGVoaobNugV551Xsg04OhY88vfI7YDGCL+UB9OfB99dfqDBrJ
         Pxh2pr/hJj3iS0SWpFm21HPEX/EYSfLMCV533IzmHOniUmz1K0bSrKqEjfa/UQlpt2YO
         0J6A==
X-Forwarded-Encrypted: i=1; AJvYcCVBTBraWR9x0ZHUBIlWBVNbONotVqWL7s9tZ29mMwBX139U1Af8+tIDSjULZm+YIt8WcXTrMb76Ns4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8DM2DaZ5s9GnFUcUQm1sWMb9zj4ZGL2bQA4EyxXwFzFmW/DyE
	kfBWyqjPfSrRASUctqKKS8uBZWlRK3QanJfkVPdJMVnQHREjGzD1OFDJCSNzLwJc2Al4WpiIi5V
	dyuuol6sQ8Y68I58pgg7QebHLtgl7SpUqPpgmgr1BEurqWBKksPRZVWtvKB2Hr3I=
X-Gm-Gg: AY/fxX63zYPCPrX+YWqynMHlaMZ5uhhFgFODneC6j81Pq9maouwoaIzr9kbdPIAvpvz
	m3vY1eHhaxoIkkKt23PsU5fHy9TXNQ9ejlOpkIfAH8PM3vpZiApbAY4b1slJQXPsT837KZgKQZs
	IvagExOEUC9Fxe0/gUpUK/e7DD8ZqP31CED/JCwCHoAklxxg9R/NW9kLTm7cEJkuqTX/Llfs/3/
	PE5FFF5nrbqaJmy6SIW5V7tgrs6V2qIJUQnbi5YMqdhTlA5pOfgk90TYRynqZY6MyD7wt9I9/Z5
	IK67blhEdWRxJ1KgcLj8JMq9F1QNj1Sr2O3upjLdIUrI6pqGiorWsZMgLNVk60+rAUI4bP9tBl9
	fVTC7FS6m2kjHm87rRbtH96+RGswxl1b2x7ouFw==
X-Received: by 2002:a17:903:38c3:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2a2f2836764mr139761225ad.29.1766486923968;
        Tue, 23 Dec 2025 02:48:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGKGRq2ffp7hGOh+N5A3dzp/NoIb6jP9M8gUpRTD+0+rRLBvYqvrBUqBrw6Oxlq1LRAApRRw==
X-Received: by 2002:a17:903:38c3:b0:269:82a5:f9e9 with SMTP id d9443c01a7336-2a2f2836764mr139760985ad.29.1766486923433;
        Tue, 23 Dec 2025 02:48:43 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b22536esm13253932b3a.23.2025.12.23.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 02:48:43 -0800 (PST)
Message-ID: <fa75d5b1-e805-4d3f-9b6c-a21358d3d4b8@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:18:20 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: compute 2d using duty fraction directly
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251222-duty_cycle_precision-v1-1-b0da8e9fdab7@oss.qualcomm.com>
 <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <emy273nvnbzznvufe6fmbysrln6d7lm4xi5rwsuwnj4kjlalvx@7j4dxyd2f25l>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a738c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=MOVBJHszn32KNyIy_nMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j1BMEJButj6b5BAocVWN-Yfwxf0IeAho
X-Proofpoint-GUID: j1BMEJButj6b5BAocVWN-Yfwxf0IeAho
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4NiBTYWx0ZWRfX6NrEdSNc2AcO
 6AwkacM/QcuHMHHduOAJyMXHzX1TrMvoi52UNbtqKXS8w29TQ+bixRvLY821zp7LBY5TzZ2z9De
 hAHmrdhW0tNgp/CrXvGVuFizZFG2IY8h1mo+eYVsImwcsO37gsuuutJZkCu9KogE4MmAWngEU+A
 hSGhsjCwzVQVcF7CxDxPL3OlbOQg6Qrifj+GfSQ5CWmAAYx5XI1uF8Lvl7Z4UXCwOdjpsLeOxvq
 faWq97x21NkrTA9N2zpVpTqkL+kJ/6/e/2wnsaWL4/sEnhlaoY4KsJosCPWZCZC8+nj5H9ndH2b
 VOOVFe9a4zd+s6BgSls5bvMajdkA4H//CmSUNZI+xktRfrqQDiJZNMtf9oBtvso4KQAuTHvR1fZ
 Mf4CfJEIRiNP9JXiJtybXQaKqTIIB7oWLebWTiRrmjCKYNqoPpwno72KQTFKZYlkiRj28jRX2Td
 Fnxgcw2NOWH22/f87mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230086



On 12/23/2025 12:39 AM, Bjorn Andersson wrote:
> On Mon, Dec 22, 2025 at 10:38:14PM +0530, Taniya Das wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Please use oss.qualcomm.com.
> 

My bad, will update it.

>>
>> The duty-cycle calculation in clk_rcg2_set_duty_cycle() currently
>> derives an intermediate percentage `duty_per = (num * 100) / den` and
>> then computes:
>>
>>     d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>>
>> This introduces integer truncation at the percentage step (division by
>> `den`) and a redundant scaling by 100, which can reduce precision for
>> large `den` and skew the final rounding.
>>
>> Compute `2d` directly from the duty fraction to preserve precision and
>> avoid the unnecessary scaling:
>>
>>     d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
>>
>> This keeps the intended formula `d ≈ n * 2 * (num/den)` while performing
>> a single, final rounded division, improving accuracy especially for small
>> duty cycles or large denominators. It also removes the unused `duty_per`
>> variable, simplifying the code.
>>
>> There is no functional changes beyond improved numerical accuracy.
>>
>> Fixes: 7f891faf596ed ("clk: qcom: clk-rcg2: Add support for duty-cycle for RCG")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-rcg2.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
>> index e18cb8807d73534c6437c08aeb524353a2eab06f..2838d4cb2d58ea1e351d6a5599045c72f4dc3801 100644
>> --- a/drivers/clk/qcom/clk-rcg2.c
>> +++ b/drivers/clk/qcom/clk-rcg2.c
>> @@ -755,7 +755,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>  static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>  {
>>  	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
>> -	u32 notn_m, n, m, d, not2d, mask, duty_per, cfg;
>> +	u32 notn_m, n, m, d, not2d, mask, cfg;
>>  	int ret;
>>  
>>  	/* Duty-cycle cannot be modified for non-MND RCGs */
>> @@ -774,10 +774,8 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *duty)
>>  
>>  	n = (~(notn_m) + m) & mask;
>>  
>> -	duty_per = (duty->num * 100) / duty->den;
>> -
>>  	/* Calculate 2d value */
>> -	d = DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
>> +	d = DIV_ROUND_CLOSEST(n * duty->num * 2, duty->den);
> 
> This looks better/cleaner. But for my understanding, can you share some
> example numbers that shows the problem?
> 

Sure Bjorn, will share the examples.

> Regards,
> Bjorn
> 
>>  
>>  	/*
>>  	 * Check bit widths of 2d. If D is too big reduce duty cycle.
>>
>> ---
>> base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
>> change-id: 20251222-duty_cycle_precision-796542baecab
>>
>> Best regards,
>> -- 
>> Taniya Das <taniya.das@oss.qualcomm.com>
>>

-- 
Thanks,
Taniya Das

