Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00D82EF66E
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287987; cv=none; b=nNyYl5oOktfoQn6ePGfAj3eAmtqogjw0YhlUQUhRHMMcKbTGANDXS/rQ1u0VtaWhDeQd8QH3jqtzNu/i3u6m5xHzgKjfgfxIP6znFY+YA90V6XJODBBXmA4HEHpkz5hHZo0rczNWDscW3/MhQpEjWX/NNthTbfIMss8T0Nssntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287987; c=relaxed/simple;
	bh=rUowSfAed8YTJsnO9Fsdf0eOpSmsCNvNEVmEPmhva/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uBAQHh4WnAf9e8RO6vWaHCaz9u08bChlmVhQiCfDJ+4tM+tvyanrIlGJM0JDBwAxyES5inQFuORTwLp3E7dC330SqjmyUDX5ED90WbNpWW9jHltsRHEp++zHsrAG93Ssy8mMEHuk9fK8U6kWOEQnUYccXKx3WahEjmQdqzSQEJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuWkBmsE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6fMOl/C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuWkBmsE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6fMOl/C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6155qM5D4166394
	for <linux-clk@vger.kernel.org>; Thu, 5 Feb 2026 10:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HI7oLWxgt+tPk2t4ik8yF6dACaxFlG5oAIq00+Clsc0=; b=XuWkBmsEiBo6bfu7
	uYFonowbo58uEsBPhms0BTm6u2PbZOqBmI/9+VBXOP4JSYoGNV0UWrwpbT9x4tFN
	+VoR4xDKbWZk5EoMWCURppTly+XcjCX5m0tFj5BW5emQHCN4e7NSZWqxyww5+IFM
	Sg5zQDst7OFgqAoyz8rnYnjHcYu+IsptLE04le5T7K9yj83T/nSQmm4urs/Y/gsv
	vdfuEqjIUuibREwGWDAZgFJO8jTGh2RMrMFDMuBlK16Q7oK+d3XUm9rfYQrpFp/P
	VNLHHBluUTHyUeaLSniRzSCaF/aCS1tumOmgX0VVc66yLKwawRXMYX+2ZbfnhufI
	Rzp67A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4neg8uxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 10:39:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a8c54bbe46so18991235ad.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 02:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770287986; x=1770892786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HI7oLWxgt+tPk2t4ik8yF6dACaxFlG5oAIq00+Clsc0=;
        b=C6fMOl/CL5BmWWUcC5nPyXazGrJ9oAN7kJ4OJptxWSuKLG0yUX6OPXHE2455Pv16xB
         i2zw7XyORwf5JwXRohwOGMUADIb2OfknGAcHK5iXVU2MvK+vFfe4x6zp2tXxTE+DMdEM
         3Av1AOLyfgb/yC4d6/cHGKERs8cCiKAPtAD3YG0EqUcf+EKWVLew1XVlatCeRdb3vS0I
         JOHgIr77ZdaUk11SkIRa/UD+Iog9c+cLZ73te3MLTQynTJHR1SRC+D3KtTo2cCngpNh1
         kbkCC6tN37N1S5xafciUYxu6GtI1BkNWRbPARXBmaoC7WSbqPGr0IOuaoft1zZ+T8dK4
         UmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770287986; x=1770892786;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HI7oLWxgt+tPk2t4ik8yF6dACaxFlG5oAIq00+Clsc0=;
        b=p7PbHcLEW55qFTi6ol8M1WOQLHWnvUDseUW6NT4cGJ27gLlLK0XzsB8RGbrn/okiU4
         qVrvyrYfuetjYfzxOF6RyWjmOhLIJTaLKnqGrP3jlmf4rRJLtaB3WnBkdYifIBi7jXNH
         2ONGlujDfs6Gnd+cAC97cyEa6y+Nku95PawVFNmuwVlkbIyEJdBrfZH0Hz7evWUAMq+k
         OG0j4kepOmtffN1jAGXlE72XZwvHIQsCwWyodFZ69thJ2xrEdY2fkdgbPdkUggSOkB0O
         ZtJ4T6r6QmksRHKO9nsPZoyzQCXsWnIQiSbTCUXIxRveaaFEBxw1U2wPyO3q2/Bn0zLv
         lazQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZmjSsOzYGnNpPZy1eIU5PKe/xB6C19KqP3aanoBdb+IPowZKPjwaIiJ6VfnMIcSxSj5IoUe8Ods4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFoG4dpb5H2dywW8wIwbWhSQa01ULniDvpUgAFGP4l2aOTjNkb
	GPmpjUjWe6RpyVYoj4ToKL8cLWD79KSm47y/2xLF7DrY166VdqLyLD77hPQDWwEmURG7nSjy6W+
	1jVnconoi+B8IXZOTe5Gh5oDNh1fCqKjCnNk9/nsH+R9sdb3IqDzXx5nJv50AGcs=
X-Gm-Gg: AZuq6aLIBvNP8pykPNm5VyOZJt7Ybd/7ERYdkudtbZEDUnwUp1van6hzzyvGriqhaV7
	k+O5IWaQ95wiR8fknlemjA8e1GFJxdMbipQ+FeyrXu0GX2Z0w2/EMEQADYspvlYek6e6C0P/SjQ
	syxV1bGI4FHRLB3cPEDfjYwla6ZedHAdFLONcgqeHwGDVI5FAZXUNFVSWdkCFTALM5SePqGt06h
	N2ny5QFI4BxWIcaNdACpMzaMi5rp6k9R05mlomZpaWFJiXmT0K2KPJIJzDTjPcNvSkTOBXSu3vQ
	qczB4dhAcufoU/I+w9QrKvmxzIa1MZp2HAHdntjHbdZApc8LtPmDOOa1Tj1CWOh0mUw7FYEql+1
	QLciic7DexYAkEefWuM75I+hN/Kmt88y/Z49hqi24BOCr
X-Received: by 2002:a17:903:3d05:b0:2a9:484c:ff1c with SMTP id d9443c01a7336-2a9484d048emr7536845ad.54.1770287985631;
        Thu, 05 Feb 2026 02:39:45 -0800 (PST)
X-Received: by 2002:a17:903:3d05:b0:2a9:484c:ff1c with SMTP id d9443c01a7336-2a9484d048emr7536605ad.54.1770287985153;
        Thu, 05 Feb 2026 02:39:45 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9338a1309sm49609575ad.37.2026.02.05.02.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 02:39:44 -0800 (PST)
Message-ID: <2740739c-b0db-7248-f9ba-e1a7dd69a5a2@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 16:09:35 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/7] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
 <20260204-iris-venus-fix-sm8250-v3-3-70fa68e57f96@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260204-iris-venus-fix-sm8250-v3-3-70fa68e57f96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA3NyBTYWx0ZWRfX2MIWsXAHS8ve
 +BD+i0PNIovCE/ByH1SdPxo8GT9n8FuXpEH3lVoSy4f00YJ9I7YZfYm6XbrpHLi2wDKYj/PEvRN
 7jMbKDoPpj0jD+UfPMORvHCB0NymxTrbqaLB4p6F0TCGnWn+0fup+eQ5nzMyr+Ck1Mq8qzusUdM
 yKTNzJUdrqRNXCjepysSfsXJ54mueMDq0PGMKMMqX5UsJd7byLmpUslHDXafTgQFJXNkhSiDFp6
 2LUpm/F6W1UDHUvLd4FGSNXUhxGSvhrxiRVqA96tPLv+LCckzMV07HBxH847RzkmddBAB7Rukjr
 222z4M6V+DM3szALjLKWAq/dwyi0hmmPYSZE4sgyg98W0xA8xGeYbBwTI7U/L7k2CgXL9zAUYGg
 uoAjPQCa76ae6jt8/NznNHJpgFvOazKgXVLlHh3VWeJ2qoxSa+AOGTuVzDrNkSRVwfSH/M/8Tuu
 xa+SYKHUBF2IJV+4siw==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=69847372 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: DzEzMU9r8tgqjRp41wjfSh9hfO_-LYO2
X-Proofpoint-GUID: DzEzMU9r8tgqjRp41wjfSh9hfO_-LYO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050077



On 2/4/2026 6:29 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL is powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..aa71f7f53ee3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  
>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
>  	{IRIS_AXI_CLK,  "iface"        },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b612ad37e4f..74ec81e3d622 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>  		return ret;
>  
>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {

A query here, is it okay to have compatible based checks in driver?

I don't have the links but I remember receiving negative feedback on having
such compatible based checks.

Thanks,
Dikshita
> +		iris_opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> +						 &core->opp_pmdomain_tbl);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 
