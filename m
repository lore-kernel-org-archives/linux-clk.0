Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5539098C
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778058557; cv=none; b=ImL+kVFh2jl7pUdJBSIVlV7o7D4QxJOTJq1mh+jVativOW6+rXoodiECXOylWSnOy6poUfrmfcbaNuLtecjg1GUuenZdcKLfWE9OBVgtotNEc8+p2DaqSw4Y96bEKIfgVEsG5U0Wdh7H+3hLH4rnqGWLIqqTYjkba59B3CYXnGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778058557; c=relaxed/simple;
	bh=M7QugAnyBIj+pMsgaMpxiuwM8+h/OjfhY50NRM/u2V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k46wJTsv4ULYp99YG8SJ4BS+qpWZkz3gDgqwExvjNd4qfR9w7hJ6hz5AvtISEUvbAyJwoMxX0WBXCAELlSgUkpb/1QFg3r9wY9mykJSv7GVHdnKZUkhzwLlVOeyRXMlFW51AdJ2+as2T93rr4bz5tKUTDYdKriVxJNLzSeX6/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQHh5D8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxJyOcoX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQHh5D8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxJyOcoX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6466mcsC912107
	for <linux-clk@vger.kernel.org>; Wed, 6 May 2026 09:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QYN4YHTbAvld9AKdLcRu1XRlvWseqFmomQUeK7fiaw=; b=iQHh5D8i1Htl5v1K
	zc8EC/rwj4IW5rWna26tmQoUV/n8on5fTRnTGnu8UDoVSgE6QiyDmH2BdoZGksRR
	DgAvdQzvARnD2IQRpH4T4AaO/YqjNLjYpOlN08dBq+JUP1t1OxicC6tCjIDDHQnk
	ILVqCJUzXSuplRS/EbGOTpdFT51W9ysr3YWiI49CN1tNTSZ2Onyh6h4Ahqc/l1t4
	kVGqZ6svjpDUl/nEevvLYEywW6BCVr/GINOJ4hqJcQkcYSuMy5q+JFl8z9hRf970
	YkxEoN/X5uPy+gCOY7etj3uhuIq1Qq9xfQDVes++WBaSI79fghK/JXWTKJN/gnLj
	CkxTDw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj7jkxpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 09:09:13 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f6e373ba0so582939e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 02:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778058552; x=1778663352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QYN4YHTbAvld9AKdLcRu1XRlvWseqFmomQUeK7fiaw=;
        b=DxJyOcoXjAptXqHroIsso5/qKG4WPRrDQ/XQY8ixXPCOebwqYFXEZfdnxsuJqaIpsP
         jz/qCQAeQZ5IZBIJah0eArY5t5JsAZwV3nW8z7dqCGUU6oFZ/k4NH7QbugYbLLEpxvCH
         /d7MXrMVa9exUDOOXfs5Z/v8+4L0lchQ3NiFpPRsnucMFd4rCPiyScp/Fcq+KsTBE3/O
         4Yrp6js8kgnmbNkj8PHIEOj+biG2d+xF39VGuEp0iMVwfcksorLvjj75vmnfuzNYhoUD
         WbmFZ2M5i+DCWZp6g2c5mmwiaiTZFGOZnO4TUttf0vxOEm0SRNiSbK5PxsnU0qLgfPZQ
         Q3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058552; x=1778663352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QYN4YHTbAvld9AKdLcRu1XRlvWseqFmomQUeK7fiaw=;
        b=E3lldNLts7LVNBUlB7rAL1Jgp4q4YwLV61VYEVJZYceWk8V7cqqdvpgSpYDVfRw0ll
         9oqIs+AcUceDRtMUrzr/F18foLmXOS5j2XCdlIdkAkFshfzn1MBJunuo+l94emXjvGvQ
         EFjKOpT9LdC+nfE7Y39GEQgRqPSoIdwCuwMcf+ufFe0vR873BErvrqGGkNBjtyd5ZqIT
         Ew+msLc5dWQX4Tb3OEV5Os386irQqjyNsFHGj5L7Q/04q1z85M6aYs+HzLaGp/KJRCta
         9jtmXGH3vNV6GaN2Dh5xYkY1UpmFQGtl6MS7qHYT/1MkyDDm53pBgqOs4lCwkiIFVaUy
         6vVg==
X-Forwarded-Encrypted: i=1; AFNElJ/cdTjQbKWjdFTTrCqA/rsLsie4wXzsVj1fe7Z4ndnq5mJhEPqsAmEhWMcTlyB4HlfcrBd+RzwOGUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7081I8otwEXtkHIEkZLQs11cX2kmdGNvzj9rXVudqCz1862F
	AdkVXwF+A3kMnOj3ITTQYE55gfN3E97gqkTNv1iHOdluNKB0UhpAktwLG0aQDS9TetHpZfh96ss
	LBfS35sqbZMXzC0SzrCvMVu1klJu1+h48cQWnqJIrbMpLM7+vMRjHC5Zu3HDD8wbHpz8aoy0=
X-Gm-Gg: AeBDietCFJuys4y4sjpzAF+kqJ/W5gAzdHfpTh1DVuDGXp0zieVnEZqVk2btLsa0gP4
	1pkWqD7gk1wq0yXO72HwBEXicpP7NbzhPntXH/oBDFQPgXE+xqAN9kiaDsbM+JakXVDDvMTSWJ0
	bZlwHdx9mefxRxO1mdWtPaKm7RrKFnptaQ36bvbdf3QdVzPcrZLeLCZsMlJLNril0VnNR8rB75F
	2IRy31h190grWrPZNbiS9bnwm0GnhuIsHdb8gqhLS+2tOjctCtJ7o3JLojdYtLFzePFG8HrsdKo
	wj2lqpf8BMuGHF1k7KwpohVo1gLIz/m4K/xtKg/Pag/OZMxw8nlHlkLRDpnuM3r8SP8HKX/FvS6
	rnRmY4Pefa8iZBqOuk10YwSwSVWuqV9YuCh0oaqu7ykDKNznCt3OqPCucejVAzaKCazMgu19xor
	x5kzuD8u/Xd8D9JQ==
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr224744e0c.1.1778058552544;
        Wed, 06 May 2026 02:09:12 -0700 (PDT)
X-Received: by 2002:a05:6123:5db:10b0:575:2300:9f54 with SMTP id 71dfb90a1353d-5755b2afe01mr224738e0c.1.1778058552073;
        Wed, 06 May 2026 02:09:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55b17c5e0sm59970666b.11.2026.05.06.02.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:09:11 -0700 (PDT)
Message-ID: <bc1a2a58-de3d-41b2-ae1c-ac72f89dd77b@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:09:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping
 regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Daniel J Blueman <daniel@quora.org>
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA4OCBTYWx0ZWRfX6EEk4cT/k/9J
 jrDuKhrAPHzHCFJxRHlVy4q7AUgWckFvBtfA0KDY/+Nj3n/gFPvFkpchBdsbnZMQLt3pQT/k+r6
 i7XdP0ehz2ZwG1voJb656bcOrrMtGrpQErSEnwPU4Q/IhGZua7nXrEyH/vwv4ric8Vy23C5GcXS
 ozzu1RhzvXNitpK4K0QKSbthZwef/+KRmp1HzASSqLvSLpfc0uzr1PzUODg6sYZ0ClgFYLPc6NE
 hWB4BbEJEzdC1mYL+X6/fEzOAf0jefpOA/ufYebvlzt877z8+axLavtld4ghLPZ2XsVcL1JLOeK
 mRhDwI9WZfKcxeP6D5/U1GmRWJKyRjrDfxKgbv+wuM5Dro5uOnUa/DO7Yk4LC8t4euxD8cRjdMN
 Zz/eQwle/xEu2hdQoS4FiBEtWVPmmGeUaowYzPneAQz8lq80loJJ3kDR1n9SNv6UzOSBAb3Xq5n
 kgcjzAmarmwYU18O1gQ==
X-Proofpoint-GUID: 7GQOVutRptOmtJ9lbFmf8O4T-h7Iymvy
X-Authority-Analysis: v=2.4 cv=FpA1OWrq c=1 sm=1 tr=0 ts=69fb0539 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=5gz2zhOb4yTQFyCjkmAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: 7GQOVutRptOmtJ9lbFmf8O4T-h7Iymvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060088

On 5/5/26 5:29 PM, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
> 
> Reported-by: Daniel J Blueman <daniel@quora.org>
> Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> 
> Not really tested, just idea based on sm8750 and datasheet/manual.

Not a great explanation for a completely different SoC :P 

> 
>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index aa7fd43969f9..575ba90d2070 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -1634,7 +1634,7 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
>  	.reg_bits = 32,
>  	.reg_stride = 4,
>  	.val_bits = 32,
> -	.max_register = 0x11008,
> +	.max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */

There's some trailing registers for debugcc but we normally access those
via devmem anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
