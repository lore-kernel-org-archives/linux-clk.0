Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00A8346AC3
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 04:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262507; cv=none; b=Ige/77F1tEjJ42XnbeJ4wA+a0ujrKOTcw1M+V0qTRlrbLXc3rUKD7lSCefEk56HTzLXf7VrOAKzL/KAWkdMggY6UnchuxDnS2EIYn9ssYGge57/bSlCxA2x9lb6FdSC7icA/ZEPlDec6niiKp2VZeafPTu8ZovnDp6Erfxa+sfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262507; c=relaxed/simple;
	bh=DzhAG2YI9xTMPvrdH20IqVoJTnqArTM+47edfCG6Eiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Td3Fhvnpea41kOHdKhYkDPpfWJRU/nUmzsXosWrjRsu7FyeRvwdIQY/mtoGL4vDMXAA1LFVMUoVkuoAf4i2guRGPguNsCBBMz79wAxQdmxMb6876aQmTL5aw4VTlL6QBSeiGT4ONtfqPyxlKLpF3t1bpXoKymcjYucxBvrCGpI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHoo70F4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P03WZFAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHoo70F4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P03WZFAh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33sHr469532
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 04:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQLxIz1yfdNCzF9ILA/PZfrZCpPFDJPkashwRc6fKKg=; b=cHoo70F4htHOYxxh
	qLR3/559wesM56iddCSDhCyH2xvFN4ntCQ2i1XUCC7+3/P3XNTGICXRDUwLfJzkK
	6VcrqiSPWa1bJP/kQ1MJz4rIPCyze8ltV/Ig5+nT4J+mogHThTQrVJ5AeOr4yD9T
	E1vp2zLbMzFSjxH1rvrEI07CkNeCYxhCfk0MjM1zBEQi9murYmRdQqep9njzdkp6
	3wMG5klKmHNrWS35mjY5WWW/HduGZKMJ8lRk46dWNvzuLRX3YRqSuQgu0+Uc3BqW
	sVCb+LGe71gt+VQb73V5NMlhYEHL+dhvpfSKkLK02zUL6d6ISkURyXjujeOvxD3U
	1hreUg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2tefd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 04:28:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce02cb769so52080965ad.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784262503; x=1784867303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQLxIz1yfdNCzF9ILA/PZfrZCpPFDJPkashwRc6fKKg=;
        b=P03WZFAh8UOI7CN37RdrZ1J6lMxkha3BnMOTq1ilk94PvFDltk6pSmOgLZiyDF39SS
         VQacRSKQzr2FtGZYcHm3PPQNrVAmibIxbzucMs9zgJ7hsxe6QXG5AOP4QWtKcsjHyzqY
         EbhlXPLMGdyvWEALaBDDSWSr+pSXoqPd1y9DWyxZQlDIrnheaXZl5V9MW2CAOSCrwfug
         NMHAk8jtwelN9oSxp/hqoAZlrMYITFXIf6gncc6fe0CMDvmg4KXMBTl6jPmkJAmMlpoM
         KY8vnHqFxSTfZcoHZuFEY/xpDAPW/NlQnqhvg7vXfKd/yrJG4gT7C33rmCFsoYZFvMCn
         bbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784262503; x=1784867303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQLxIz1yfdNCzF9ILA/PZfrZCpPFDJPkashwRc6fKKg=;
        b=fNMeRM+BW9iL84cKhfCcQ6Y2qkaWdu8K+fguKgC6vlfb1e6yQnDHROWNqp8gTYZSdG
         s5to2jnmbMeAff59u3Dchh9UHpcRCafy/57dASowGHZp6d1ChaVxIcGIQ9pMF6eRbhdt
         Gs+J3RUjn8oXohKx3hSGAThnz837wxuRw5SBfjhiy2yItvZpLJDms4qc9Nvwas5qBID3
         ADL9anqDrm8fqR61NP68Pz/4fFmiM5ZALl5vdregOHNMH9X0HXFraoy5ZtpqqI6JXtHO
         sfXl32Pi2VPOkakhvRwop74K6B+BjGpwerC13jgOyOXn5qIYOG23JXCemNlHUIh/SY9U
         vmYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq767Q8MkIjxi0x2+pywQFNG1XZd+qbpyABxfE0ykhPhuA0ShfnWmAtP8ZFiBdnsJTMi0rGWVjFbNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq1TuYN/QIAUM7o3bKweuJdGHAEU8/av9LMpOwBz2VGRg46fgR
	B8NAqYVhecEIaCNAINshqppuk2yplgOTKfDPKfBpjrw7XZALvf5m6Uc7DgSo4byIKaneQFzaECb
	q8GTahwcJgjvgXlOXP7dWcOvax+svipE8NN/eRdFt1P95wERB35gBGRRQBfqcH3I=
X-Gm-Gg: AfdE7clEYbKmhxldR3zdQdCb6xtW/CaVDg7Pwpp15lpEQqCvgC/tInqQgjsyPecfwPQ
	3nhLaWV3PPatoHGckoTHDWY0A4ds2jByAFB4liIf6xkit6W2MR2BZ5bu2baVRxY98yz1Fp1CkkG
	T8x/3xWRj07LopnjBV96pQshePUE9faPSC8n+En8dqNL6RiPJ6ZNkhxiUBDG+KFucsv9lS9dyUQ
	tt/0YnvjR/gXNq2l7J3HJ4JmBVNYR7r1yijlfpl1+fx/LeNK1gVEvKmIQn5w8TwkTKEdvLtJx12
	/cit3yxL49hr/f+PMHptri6sM+UsmGZbJVwGTvf/900ODBSYL7k2j/tXS/04mWlAvRfcFWXH3mt
	4mBa6BZkug02ikmKzYiQHqksN5uI=
X-Received: by 2002:a17:902:ef01:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cf3489181cmr11597075ad.14.1784262503247;
        Thu, 16 Jul 2026 21:28:23 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cf3489181cmr11596865ad.14.1784262502812;
        Thu, 16 Jul 2026 21:28:22 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm887611c88.10.2026.07.16.21.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:28:22 -0700 (PDT)
Message-ID: <37b58fd2-7b4e-44e4-bc40-ce3054e6e89e@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:58:17 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M1f_Fte85FjndO0pSONUaqV5Y1CZAQc2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0MCBTYWx0ZWRfXz+L13UlLnuSy
 XxfC2oWotVFNh69ys99dT3wymu39MwceBSy58RwEw440x509BYh1bIIuMWkvZ9R5AKexfD6WI5P
 ChzvYYmLVMwlzRpPkPlsC/a0WIC0H74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0MCBTYWx0ZWRfXycE+EQ2c6oP1
 n3ge+1wYt15xAtTyw4+CC7fejs0SBklSKa7ICV/46GMoLilYXcI+qMisnx9DK1TX22W6OY0Xlp4
 8WVZq3MZs/888MTw43JXpzLjohcVcC7w+vyP3bgE1RJ4lN+/8X8taSmaczv4TTwmDjcQou9nfn8
 RTGBLt2bTbS2oimlMcJtFRY3HpvQbjKXRZlhyxJ15bpOjCReYncY9UWgsaruF7OFSrrBu5bHYz5
 LhVVyjPRqpDSleFJ9YRaE5A+FeZ5kMxSQHLCpkg+BVot5o0NIU2tZyggUB0p/ETZnUwFThr59/d
 bfwa9+I2tWxQ0nGAJagKrGXkYUEiEnGFYMr6STeSVqnLXOOiUa0EHEp1VI1YWajecj9L6uSSE0u
 Eb9lmMrSZFnRcJtK2j06FhJ6wb39YUgibIBf8LXaJTmT2GPJheQW/QjBSxaO0VXEEcZnmH9z1z3
 UDcWChumv0o4sgCYiiA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59af68 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0WVl2QoOaxImcyzKSnsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: M1f_Fte85FjndO0pSONUaqV5Y1CZAQc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170040



On 7/17/2026 9:33 AM, Imran Shaik wrote:
>  drivers/clk/qcom/gcc-shikra.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> index d5222756f214c356214039f95a93a28fc542801b..f2ab50209e1c037cb84db67951def053880406ff 100644
> --- a/drivers/clk/qcom/gcc-shikra.c
> +++ b/drivers/clk/qcom/gcc-shikra.c
> @@ -1244,6 +1244,8 @@ static struct clk_rcg2 gcc_emac0_ptp_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_emac0_rgmii_clk_src[] = {
> +	F(2500000, P_GPLL0_OUT_AUX2, 10, 1, 12),
> +	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das
