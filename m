Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64C305666
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100741; cv=none; b=ukjfYk4l3Ar+GJH7K425kbyz2k9V32KDbQMc5lmx+1arn0w2aDXp92H7IxfNxiQPNLpbKX5H2XjCYQO7pG61mPFqLA8Rm90LmP2N1Lm2dlCZvBlo87NwZYezgulYGQJf2WArRfkZ834KJhs4sVsMnsfyltvhQGo6bwEwDx6sHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100741; c=relaxed/simple;
	bh=Tt+268agdLGbBViTz+33MlSnJstp1KhOV18oFoixlbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mm+UzGBACSx3POyVHM+1PBNjeaEPoTs7Kjb5NT5vQt+gVDERjWc/Ru8JbvjYcOsd6u7+9CWFPyfg7Xw2w24Vo123WmKfZA2c/UxD4comKKdMalHCUr6Na5Sxqb5EosszD5s+RaqS8HrwH9ekAoRft+Cy9ITtvb4yjO5DlhDq5hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMzBswL4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xs2IT+Nz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMzBswL4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xs2IT+Nz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4MWuS3010483
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=; b=EMzBswL4pT0gHZ3G
	yLsKCVrdyS5CuEACiZbnBgeqlpUWbYbL5Pq6UsWlpzYGF1yQRyeHwJ4n7Ts2+KUX
	H13ngIXcHJZ5ZahcNXKg/U5tbnkdtwZNb5u7Ve0+vd0zDpkSCsDzaECX81OWs0D9
	ILtUmUcNPtnMvXPmo1VGWEQMJ6lb3KlBw0/eyKBv5SvouOhpc+UqWMcMUuIu4wYB
	ERkMyTPDxxF+U/K/S3rSuE61NybMSDP8Nag9JjgsYj3dxjJL+myTeSUpp73Em52I
	DQkJD9Aye9YE2KkBvwUuRQaaDXwpSMSizc200V0xcZUmgwCBNhJEYlTeqVirjZOS
	Glnvrg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwkwbdqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 04:25:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8663802b58fso508460b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 21:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100737; x=1789705537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=;
        b=Xs2IT+NzJlJ2go+o/FPpRT6rt4rSjWl2Uylj8mcizaZZtqwTyaCLcB/BGmHAEZTHQ/
         jnnAdHaacS17NrDaa7uyR2TevkYSo8pEvAqWegkjuWcmtYi7XdwWVMUN2KW7z+U76JpT
         vGNs6f8tzh3613KCCdrL68RJShK95RxtTyqCJ6lyPrBY0eDNJ5g7k5p5rE7TRleYtKC3
         Nmk/Q2Tn9GA+eFS/ZZVz7DfbTTzfHeFXGjOxYyh/T6JoECzts/8kFHnLM/NCQlgJM9X+
         SHUmwbdGCE0u88GFMKU8rZ7Ls6JtxD89TWEzoU5pHZ95boJTUYbYG48C86J0Mu0meM1N
         7Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100737; x=1789705537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXNiHzXDwaRs2MPi2nltVM1qJwluQ7UvnEYAqxcDoJE=;
        b=hNqObJ3EOwTPO4m6PwNROFPNcEpPsPjINI4KhXmdB8i2ONdUu9s5OKYDGq+MGWWadR
         yauMBQ08ZZ/VidrFfeUgT5ApCSnZThS+ctJPED5+FBF7F4OSngeJwTP90Lyd1ds4Iook
         WgqIOtdniazE5qLiK76rQW7pXDCUFIfxAjkv7veCMn/sfOq0C7NnTEKy/7TSsJRo36uZ
         vLARwChMAFDQ3Bm4yHyAgSySgZZzHeb5zg/F1mQsbYQH1sKQRBDlXLpk8el0kdF1X+Br
         5aC4udiV9Kc1l4ErU0oOPw6Jd+pYL9fUniCjjEDcRFGykGQnScOZ4xbrbHUq2JtzNWR0
         roEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwko10yVI79o9fHf90/dxdtXEi0/0+NVb9Icmgye8SJ82nIOoroBHHNGYovS0IgrlWyAnAjBz80Zo=@vger.kernel.org
X-Gm-Message-State: AFuF++n5s9BDN1nS12sl6vNqPtNWGTwEa+KVssufA36XkXp5TrX+AU/N
	R6U/TGiOwKRKMZ6O/asCXeKItE0twhK8cuI/hknfF2nR6r2CwmNvNVsXzq+rUwdO8+Ef3qhZ7xj
	Q1orZAq3jdpPB6fqjTOo6JXpGeELu2lDhzHtGHa4gibNgudLxVBkwzz5PZQdCeRw=
X-Gm-Gg: AYBFou09bgAwo5Rdi7i6zWsB/z3xR/aEZ8w1mT8ABLKqQVu7D09YwSRaem1ItneFkxD
	NO6DeYs7FXL/7tQpn/hxNAxR2HmVkF5VOC+UWH6g3c4KTP+9u+opdKa4pwLnsm1p59eLjzPxK8A
	y0GZjBUW2tMgp8ACDhVPwymgRhYpCBWZA5M9tD6rjgL1sx7kdIw//V7kNWGY57+B+trVejw2kfq
	J4xUaM0EOzhqSSXINVN6Lj8JpCObyBX2m8jRcDjejKThY2nAbpBP8UuZyO7B/1mECjZZnSc3M4Q
	BXrkid85H3bDUKVU1eAJOouc4uhPlanSclI27y71MAEON2InLpbX4mTY9840qOyS8Ixfz2SwS36
	L31+s5TRe7sdUgAHpOy90/1Jsbhs=
X-Received: by 2002:a05:6a21:684:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3daed28db48mr4941939637.7.1789100737683;
        Thu, 10 Sep 2026 21:25:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:684:b0:3da:7154:2ebc with SMTP id adf61e73a8af0-3daed28db48mr4941858637.7.1789100737020;
        Thu, 10 Sep 2026 21:25:37 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm2689172eec.1.2026.09.10.21.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:25:36 -0700 (PDT)
Message-ID: <3d8a5b6a-7393-4d9c-bff3-559e5c870011@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:55:29 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for the camera clock
 controller (CAMCC) on Hawi
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-2-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EZNd0/mC c=1 sm=1 tr=0 ts=6aa382c2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=B4ecjq2AI764zdm5JScA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfXxnRwtSCw6Q9H
 3KwK75iRfgIhocJ6bDgQ1zcwCzIoxt6sN6oSE61OR3pL9bTqq7ZVu0krou3sYyooScDhqD2qp0i
 ukFnOSMoQLe/lPWrOcfJUk5VeC4B2v0=
X-Proofpoint-ORIG-GUID: Sjlsb9DVFTTwetn7qlAc1G994V-mQ9_b
X-Proofpoint-GUID: Sjlsb9DVFTTwetn7qlAc1G994V-mQ9_b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX6NWeoEsA/MEw
 AyZDUw4VaAEqq81TIclPUNRPv/HE6SNjvLHgQJ+2+oQ9HN+8POywuFoqMWUGBtyAhfTvlxi8f6l
 abbDEuDNhwjXrs5v14R0DxpHMnbpu647ilTzuXxAiJmv7uLPegV2TvNK3YckhVVgXJcI3s8XdM/
 Yf50FTdyN4ZQ5aJTh/m4soJj79aCN/gwLqTNRgdbZHtGOji5EyKyfHEs+4LMNZ5JoQtwFagaiQD
 6TKNnwheZklSvY7syuc9mvzSDAV4NwBhaltxcs9vSL1PgIEmjs8SBFyYxGpTxj5HLg6Q+YRAgDN
 aS/xWNUUSO0bx6X/UtG3aPWxLPG80I1XNPyQL1zYaHSRO9wYypfaMVKAcUL7rWXjy/CHbgJPF1Y
 HE4ZMOxwLASkoWrhp5xOsVrvatv37Ty7OPGuRojoLapPNaDWlnQP9+W0tjasF7TqL2E0ywtk0QA
 VsCfCQ5ASFjCxanZowA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110057



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> +static struct gdsc cam_cc_titan_top_cx_gdsc = {
> +	.gdscr = 0x21388,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_cx_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +

I think we need to add, similar to downstream requirements.
Please check 'drivers/clk/qcom/camcc-milos.c' for example.

        .needs_icc = true,
        .icc_path_index = DT_ICC_TOP_GDSC,

> +static struct gdsc cam_cc_titan_top_gdsc = {
> +	.gdscr = 0x21330,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "cam_cc_titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +	.parent = &cam_cc_titan_top_cx_gdsc.pd,
> +};

Here too.

-- 
Thanks,
Taniya Das

