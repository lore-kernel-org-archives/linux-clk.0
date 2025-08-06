Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1628B4EF
	for <linux-clk@vger.kernel.org>; Wed,  6 Aug 2025 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754483738; cv=none; b=nw+t4e44thWKzEhxOVliXoiZr7wXk7pTlShjj3rizZ9twFgPYPbvHe282JI1Y7JakkkC0ErThQ1FebBJM74pmk9Oom4CBe4sKYTaUaXep9Wiwd/tV/ssEPT0JsTo8Gbbn9sN4S0/MjCAiBFcJzmgJXq2KXozlUDOyj1/cTNtakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754483738; c=relaxed/simple;
	bh=BkMg9lrcOwRqh+c2w51M/RlUfMuRGUn2YqW6UrJlJxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUyyHKmMeVW0eOMxO6/k7G152GTLCX9i5nYo78C+jPBVaJpNTLshh/H6GVM7TzCRRdOiYZJ/xyNYjPPglF4OmPko5gDKs63Bmj4bSsv7zt4O2FmXvlC88/Sm2WZn0Qa+bssfljMcdjdjak1Erhujchjbx5cQXcJrwtMBUWpqKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJKFHRdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJKFHRdl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765sD5J003996
	for <linux-clk@vger.kernel.org>; Wed, 6 Aug 2025 12:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cCr//mNBZZadIfbdCckvaMFLb/aTsDPU1FdFZ5M3iO8=; b=UJKFHRdlA6z6/fCV
	EHp7YyvP7We5t5JBS4qZd46IRiJJ8v8m/ob0ghLq8IHYkOO8hDwvLS9ylCn+0ff7
	dpE3CDfwtzR9GdsXl7Ow+I70J6D07diAvACDS0Poz0BoLxpRgBv9D8NiI69XqV9d
	NKHPg8CE7qQz3IIZXdH72vzemq2/VIBUZw80TUimTSVMCsIYIC8/jujT7GPXHB+k
	/Ih3fjEhB/zXaTTP+tJ4prInViN1VDHdI/QZxPsf2KcjAkih8IeAMHcgwVJ7e+ec
	qhL7BfE80OZ8vAM+xtPIbtsxF9tzN/6ej0CKYpyKEHYTq3QruSnD0CY3oQuE4FNb
	x6l2Gw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyctm7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 12:35:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af23fa7c0cso13554321cf.2
        for <linux-clk@vger.kernel.org>; Wed, 06 Aug 2025 05:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754483733; x=1755088533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCr//mNBZZadIfbdCckvaMFLb/aTsDPU1FdFZ5M3iO8=;
        b=egr3q0+MAL+E7etxONZ8TRTdD8tYfUZLstzi7UZIZuog5zL4GjBbQsmAeYQNevoJG3
         6PEBBYduL0ahOfBwunfLSrcO2rye986tBhfNMHY4kLOaoi58ehQww2DLOg/GYLaupVSQ
         Grs+9/hOsrwSvsqWAH2Ee3YAiCmP4FXj2LIu2jbMAzciXab8Yjn0TBNy9GJk9NxWXTgf
         J9H5Y+rN7iTiQKhwL38FtabUIKbOhBW0ToW03mnpC08/ZYGRk1RdQAW35/RU5YD3a/ua
         JgP/5onbdPU0MqoaNaufZD1eSQtNQVisC8Jj7ywPLp6mVb6ZXrI5Yuh2NL8GhiJQbkwS
         +RzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo8Wn/SmFRnFPACbcwDYCzvU0BC1qY3JcIZlpM2k1HZTX+viXb3KIj1oxJ1fNT8utB+IJi4uFOK3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbIpAI7tTPC0OsJRdXLVvU3HPKWenrSCzHYJZuV85AZQjqI0o
	86dTeHBK7AmWl4VarM+BKB2lJ1WpIkiBNDlCCvIgRQG04RGjapsP+2KY01IlBBhQoxEVXfpvkX5
	9m9lHdx8O8CPJ1yOlGy/fbUMNsPlA7HXj+k8pWiTKLnRGed9QDRv43rFnvOsSdMM=
X-Gm-Gg: ASbGncsplNJBE1SknrtE86lETl4WmpogU4+GxSFdPBwjAatDX5KucCjJTBJA7xy57Kr
	ArswIhprCtsB/7Ql15zu0psl7pWgfdaAYlx5qLLwcJYQAoTPj7jBZrYovsQ9toNYZpSgqOK4FuS
	eExMWIdozP4j27o7I9phpmyxCCwfRVKtXV7ovvXpH3PlIHG2MZJqVBcomRdYHTnaY1/JXc1uun6
	UMHAVlU96KSrVhGyeH1LswQdewRcZPdG+w67Fhthkr68QExdjyYIH31dcLXnw/Gk53N72aL9sr5
	9LxyqRaEwVpFql/qNRjXZcNWTva/8ZyGiLG/TmxSrIILTPMrMDoHDosW53V15kQ74w3LGBBMTU/
	V41vYrbUB5pTywLB5Ig==
X-Received: by 2002:ac8:7f89:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b09133fa54mr17986221cf.2.1754483733244;
        Wed, 06 Aug 2025 05:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7d2CqcjDNnmjfaCorK7ggZ1AD3iYaZI4VcHppGy/TET6icunnaQkfyCMwgLQKxMuq3VCiWw==
X-Received: by 2002:ac8:7f89:0:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b09133fa54mr17984941cf.2.1754483730668;
        Wed, 06 Aug 2025 05:35:30 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a396fsm1103435066b.42.2025.08.06.05.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 05:35:29 -0700 (PDT)
Message-ID: <48478a05-59b9-4f2e-9339-255e513a9cb2@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 14:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
References: <20250806112807.2726890-1-quic_varada@quicinc.com>
 <20250806112807.2726890-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806112807.2726890-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uCUwBA8neQUjvtjcFiglcrU_gwfJtNRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX8hrz/ODjBaYo
 QZAu/KaWl327OoM/EUooxS21OqJ4gqVWTjKKGdsyZlYEuze7YKSjemmMeXuxGVgu2KAOnYrAkRZ
 k2kYYHFOJElMf0AP0rBx90QPbcrXhO5Zbn+IsyQ7f4mYRtukQidx6U8QTYAwhHrxeHv2DNB0aef
 fkzYdFUnDIo9Y6FZ5mCMK0twksbcTWr23jfqVuIA5R+HiFe3OqcC2A0rT4ZspjUPWk2TOQAPiTJ
 SAHN8dcIsonIrqKw/FWPxQuyY3QAD2cp4SP8gucOysoFvAkdeZb3FltzxNR0EpZ/DTNSVJhBJ7D
 B/y+cKl3pOBZykLnZX9BMckN3rds/C50wE56jomShMesfw4bEMsLP8B69eebJ46MaihOc47SZoI
 610pkfPz
X-Authority-Analysis: v=2.4 cv=JIo7s9Kb c=1 sm=1 tr=0 ts=68934c16 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=nqClpMi1XL7t9EIYa0wA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uCUwBA8neQUjvtjcFiglcrU_gwfJtNRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_03,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/6/25 1:28 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU and is modeled as an ICC clock.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Removed clock notifier, moved L3 pll to icc-clk, used existing
> alpha pll structure ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +static struct clk_branch apss_silver_core_clk = {
> +	.halt_reg = 0x008c,
> +	.clkr = {
> +		.enable_reg = 0x008c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data) {
> +			.name = "apss_silver_core_clk",
> +			.parent_hws = (const struct clk_hw *[]) {
> +				&apss_silver_clk_src.clkr.hw },

Odd closing bracket placement

[...]

> +static const struct clk_parent_data parents_l3_clk_src[] = {
> +	{ .fw_name = "xo-board-clk" },
> +	{ .fw_name = "clk_ref" },
> +	{ .hw = &ipq5424_l3_pll.clkr.hw },
> +};

One more remnant /\

Konrad
