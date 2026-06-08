Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0043B14BD
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907900; cv=none; b=AvqqS+81GkfGdG40WiJX/4zdTF+T0X7Lj4etjIFmJ2PTe1e8eXH1I7toU1v6BEKxM5IQWjnB+0QuomnheFZsaYKwQpxkuSyTzINBYv6d94g7poEI55ZHmEfF0DeCCw12nPZ2/yw2tbBIh3xb84k/Tj2emQDrKba1CN8p7khkLmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907900; c=relaxed/simple;
	bh=uGMS5nj9pV520UNC0QBWOm1DjLUZRy/yR1ldZV5zuMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6gNENEKcXq1pHC1mz09yEEWWzZhnE76+1Pf2bPgH9RsI1T14v491iY46TP7RKjCsdBwHmTb6uukF9H3MQ8jqQeEyofaC9h8jo4cLKG05BFtzcbgqHnBWJ+eYyy1IMfdOhTgx8zQQVBw4d+cIs+sHpW5v0w6yCLQzMzJKxLxD0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omQlZx5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MggCa+Lc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omQlZx5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MggCa+Lc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PkQL2733110
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 08:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkqSyrIYraoXJ1SkUGLDqUFNi9bzRAtX6dVnUv/1FcU=; b=omQlZx5FrLncfCfv
	cWALk+569ybUS4QZjJsTMPFOBPw/2gNlcucbo3tgMPPPO7ORyZON1QRr8uCzI33Q
	gM+cjS+b45hmAEkn10wxIV/QY3bx2VqNDe4gCz1OcEl2B3LCvooj9UQyWd1rKxKN
	RqstLmDL9LfDOn9EOyd7q00i/YwPZ2S7pAHfQ0xAzlRWfZ/gSnr4UuGvlKp9l4jO
	k/KlRjVn/bdV17oX4z+gIBH/2oXJmZ7N9taTnTpLmRyPHMmmvPkCug5Efw+/SPEk
	0LLSUasodXb1mygirbImUUZWF2bTFpAnzdrIT4aUHPfPQdWimOdpH8/a2YJU/VQR
	nagDUw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6y6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 08:38:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5178a632a12so11548021cf.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 01:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780907897; x=1781512697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RkqSyrIYraoXJ1SkUGLDqUFNi9bzRAtX6dVnUv/1FcU=;
        b=MggCa+LcV4qAjizgdl17IMNm60VWX4HmHjyefI8i/I1EDEHVf0ivU3JLPpRqd4FmSx
         nprTqMCk6ZMWirc+vQnOG8puyb5k6gau1Bcc0nrcCmZB43EHtSo1IcBMF3vLJPXBCZnU
         7bfrq6HIUCksq0NYIDUklwWhCrnteoB8um6G3FTt1g+jgRg969E4S+4sgVCxX+VANaSx
         QZ/CU5mOLpp7VejzZNXfxD6v8CVC7nA/5ESED6Z2mpIvhgQuMz219s2dlI8Ky7pK7bdC
         EbwDyK5yg77grYWat2hBpCzuGpMpY9gBTnFeUbGajb/ziluOMkMBry13p3wdpzN7lJBq
         sMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780907897; x=1781512697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkqSyrIYraoXJ1SkUGLDqUFNi9bzRAtX6dVnUv/1FcU=;
        b=mcTHyTV7zMAMkhc2S/cLRJWIb0mY/cniXYIg6BzQjq8Eadebccqs/sBRibQm3fd+Zn
         YNHJPNVIaOj2A4HQ7Jpg9H3m/ty5RPVmAMU4hNEEBCZbMoXSRCwsg2Ad++08Ity98wLh
         RUFX7mQxBJJtrgPf6Q/kbXQSN9woSoBBrB9Ig+SD+Q/55zjkydhX7r/0PK6cB8DdIamZ
         BAECHXHW6wjcQQaL13223h1yFqdn91afecXGPqY233We19CJjvPLsyGDi7ijG/W+Een2
         rjke4VmEnC9dBqPkkSSCPBTUOsq305+/804f+aJN8IuS2Rs8CWGExuk7MT80OTjBhYkY
         kuKA==
X-Forwarded-Encrypted: i=1; AFNElJ/PRTXg4EGDIlL6KKEvZlag2wP08rtt31NPHO69Qux9OwYx1F0Vxy9OBrlZeJfhB5HznqYTwtUky/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3Wi8fhy1hfHTCoKKhgvCHS/xwqo59u24znRH814r/xN7xq8l
	Ul8z+dUrB9FD1f5WrNq2lQnlGdlLvZH5K3ZG76IeIUZgQcMcBqtmDy8tAAaZPMfVYCqX1qhOV1d
	y5PV8iu6V7sbvvaQEb8GtlABSuxkR/RzR8TvKeVFfQWv+nv1KD8qc1g6aPQphM3U=
X-Gm-Gg: Acq92OELyKuZuvSDnd8fmU3nU70IlmiQJofRboKbgwOGJddRI5tEw66bn5uk5m5bHOZ
	88PJF3rnMlsGWFBN3K4YIkeeLZ/igzhS8raNFeqilbUAmsDVr0AVmbpO0wS3m+jJnE3YEeGvidU
	W1nBY8iBkPJcpLhXC3lAfKi7U/GRU4d2TweC3BZw82LdJdsChUkZ06hbMjlxS6P1dCwYeWsfO5A
	v6fbILMKl/ds5SndHQ+DsOUAdwdg5LmFeDmrY7PP1E/iqM1StUK5MpTjsEPIOVr2DQ6boT5bjcV
	DDE2HFTLQKzZgOjwJM+1AVt2QC8Y+5lI9ZJXIEi1yVpe/9Bq5AsZ1J14YPABk3DH7kOgcWTDNd7
	+HYt8uzl7VdCyatManrfFvCu+GF2z7P+i0ROziqJVcGUhks/0QmVhangX
X-Received: by 2002:ac8:7f4d:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517959fed19mr128565231cf.1.1780907896962;
        Mon, 08 Jun 2026 01:38:16 -0700 (PDT)
X-Received: by 2002:ac8:7f4d:0:b0:517:5e32:f3c2 with SMTP id d75a77b69052e-517959fed19mr128565091cf.1.1780907896569;
        Mon, 08 Jun 2026 01:38:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054dfe3aesm831911966b.37.2026.06.08.01.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 01:38:15 -0700 (PDT)
Message-ID: <2982f74d-85ba-4bb0-b99e-75f58eeed349@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:38:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: a53: Corrected frequency multiplier for
 1152MHz
To: Phillip Varney <pbvarney@protonmail.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc: bmasney@redhat.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260605005502.313928-1-pbvarney@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605005502.313928-1-pbvarney@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a267f79 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=NvhBEFXZ57lHVK1JQL0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: WNdMZ6ufbnVlTKVTI02jG1CKjGjAGKXp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3OSBTYWx0ZWRfX9e2GHseRQnvK
 GbMg80Y4WAFonQh2sE3+aIh8fX6PaJFejFUQ+Tydw0tdXgEDSAywvu9NWUdMJTjhbrQ+zzWfYMP
 MJLegkBJYInzsSl0VWXOr/BUHQtFCNhYGK4D87TdDJ/tA5ELodSlPHPjflo3bcIvhyGH8I4ECtD
 n8TyYnXECRdE19K6YqFW78wIb/VBOhAdCQVN9eGwBcHv2w/X1y/OmwrLQ5bQ3dlDql1/UrrQD5j
 nMA9VuuqtkeKsWVn+pWmPQZnZhcHRwRXToK2DSwqaIPIEbyLQ7i1wbjfBIYgBprV4T9ZarYVdA3
 7tdAQDfgG2tsYb06MZ88ICM8EwOcRQL8aDdQsL5huXJ+Ha9j54FQQuu1WNsEalo5YuLtEgy89Io
 1AgfLtB7L2+BSzF5iYR2IRX1LlUUGcYDF4Ub2d0LY1KxgvxzB8uTklT71lnA2PSDRza5L6kiEOw
 UMfApuEvl4W/ZGee5Ow==
X-Proofpoint-GUID: WNdMZ6ufbnVlTKVTI02jG1CKjGjAGKXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080079

On 6/5/26 2:55 AM, Phillip Varney wrote:
> The 1152MHz frequency entry for the a53 currently selects a multiplier of 62, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1152MHz.
> 
> Signed-off-by: Phillip Varney <pbvarney@protonmail.com>
> ---
>  drivers/clk/qcom/a53-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 724a642311e5..0549b214fcfc 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -20,7 +20,7 @@
>  static const struct pll_freq_tbl a53pll_freq[] = {
>  	{  998400000, 52, 0x0, 0x1, 0 },
>  	{ 1094400000, 57, 0x0, 0x1, 0 },
> -	{ 1152000000, 62, 0x0, 0x1, 0 },
> +	{ 1152000000, 60, 0x0, 0x1, 0 },
>  	{ 1209600000, 63, 0x0, 0x1, 0 },
>  	{ 1248000000, 65, 0x0, 0x1, 0 },
>  	{ 1363200000, 71, 0x0, 0x1, 0 },

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

what's more is that msm-3.10 also has this entry:

F_APCS_PLL(1190400000, 62, 0x0, 0x1, 0x0, 0x0, 0x0),

which seems not to have been used in the cpufreq map (but exists
in the clock driver)

Konrad
