Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4A218592
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323308; cv=none; b=PchelSikcNLqT2GoDtAzHiJxROh/cjmd0Jctm2AbVjy08/jkipypjFk0NBHlEgvJAj6Lxs/Dfix9mBP8JPsU8VHtvkZ9vuv6cSCXd6qkeD2BtlKIAhWe5POxfKB7sjQ0bdIvwWZ6pDi1nsZEmqZTJSes4L6hFjU18qDsz+utGbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323308; c=relaxed/simple;
	bh=PiE+MH1cFiOpy6aub2DtWFiJcuOCWUKrQxaljJ2s49Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nP0K/+5DgmHww59FlObW2GG3wCvKwmTXm2y9RUBFxaI6UH/hJQFEgA7USHoClqLwqjpEGxL+NWG4pb0BUGLGdFWCOFaEK8PPz0DEMhV5g1HtXaYxQbDBBSqWcQh+TPtY/AxkOK1uAYp1eSRAFTjYPW26EuC3DPg4M50mVUrl0tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRTIPliF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRTIPliF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDjJ007850
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yB/XQGZjAJwAICW4F7u+rn/T60dhMBEFnCYzfHzDX4=; b=QRTIPliFhSzpIgiw
	pgvEdtyT0EHBMG7dH+tDDmMdDHsD7n4u/QzeFYejwXxcFPo25g7APjxPWgYMfwCe
	LXMFPkqPDjvLT1c3Y9hjWfkheeOFDJ2Wp5OzhSu5EY/fNKkkBM+sW+V7AtKEc2L0
	yI0gouRmgTL1xl/owD9FEWLEfdBQdk9SUhhUidAnhRtqIiW0bgNQD0zx5m1guU7g
	bzGP5cljNX2dwsphn7r9OgWRYReL5jbNXqgYHubaGd9gkJF5vlkOD4RHWXUpI+Hw
	uPZ2VobrBtFCjJ4Jf9I9wlmJbaGXAX/zVzRV8UKKkwZKB7LU3jhrtd/FdvTdfXfs
	An03yw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxnnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:35:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f5466289bdso1106636d6.1
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323304; x=1747928104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yB/XQGZjAJwAICW4F7u+rn/T60dhMBEFnCYzfHzDX4=;
        b=Ivw53Nnq28vzqZxlRTFdtonTZ0yg1i9B6y2VWuZiPQmqm2m0ic/kNySsin6kDuOAbZ
         Oserdhf2BuajrSoqzPRI7/ZpPjYh4tgc3HpI/aH40B2bDstWiDYmouvZKRiis0sGDd2y
         ZeeO/K6NDxS+qP7IhhL47fU7d2LbHfp4BehSAX5W+TUQ1KhBIi/P1vC6w1q52NhlXTLD
         28Lv/Sn4w3LLHpzPgePh42F36CmKj3TXgGyBS084NFBPV9rohmAU7wJj/934wztEPODm
         yrzKNMlIRmOw57Aa9eewWBDm/z9QUv6mHMSbwDgXiBoD04CDyvQ+0z2oY3mHHa8qxE67
         OUJg==
X-Forwarded-Encrypted: i=1; AJvYcCWM9CaRdCP4Byi7DvwXkxp4Qi2etXfkiwXIbWG+EQDuGMHvSeS36bpkUXKLKRidUQUT1SaeJCXpl2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBtCI8YFHEKR7cCemwfQ5D7uhzi6NsHDNrNPdFN+QqLsmvW18
	j6k0/LaprMoq4SAL0i+dJFj8NpZth4WltVKixT0iMWQzWLGLDe4zuP60QUnBkd/uE9aVNa1E3TH
	h+ye4MVI2XDAGy/eCkG9zaor3ryRIv8026cpWGnyypvxI42VCySODgNgawxx7G2U=
X-Gm-Gg: ASbGncvHiMloo2h+zgakiiKE7sKH75/lwCD4wDIPagyja2slhLBPk/l036gsUh9e6Gr
	L42wYT0Wdu1NHiSTR9ulxUbA8OsAmCJ/oSlxXL2/wEQZCrBotM3/UFyOOXJMCRJDF1zGkvpepkf
	hN4udXLyOCW2riXFguPo6t91+d6R2JDbKGfd1raXQTW8BcTWueLJPZWfypi5l9BZrsZ5J/TUv9L
	h7pxIjwzufOo3eXw4HIBiSjPvs8QHA7WZ8LAYk8tt6CysvF/TekrQluL4lCYc6qT2AkoSWGFgPm
	lEzkO6/3MANYyev8/ltyjHsijXZlX1zOPN8uANk4TcbDHITIpK76KpuNLTHe0g9U0g==
X-Received: by 2002:a05:6214:2403:b0:6f6:e6d1:40d8 with SMTP id 6a1803df08f44-6f8b08c7856mr1053786d6.11.1747323304327;
        Thu, 15 May 2025 08:35:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5GtBANepnczey5ulcTX+FlLpeblm1J2dmWkv5sgN3i5CFmiKb8SQIzrnodlg/LcQE6qf1Ww==
X-Received: by 2002:a05:6214:2403:b0:6f6:e6d1:40d8 with SMTP id 6a1803df08f44-6f8b08c7856mr1053466d6.11.1747323303917;
        Thu, 15 May 2025 08:35:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e637dsm6880a12.43.2025.05.15.08.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:35:03 -0700 (PDT)
Message-ID: <2a49a457-9b6a-481b-9b04-c9747ac67003@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in camcc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KMcfRxPggbLJxk9WMDyxJ-Da7iJFUb9U
X-Proofpoint-ORIG-GUID: KMcfRxPggbLJxk9WMDyxJ-Da7iJFUb9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NCBTYWx0ZWRfX9Fd59pTLt8tW
 BrKbiouPx+uq/nLn8rifAv+XagFcOv9o/B6V+N7gO5lSLir3iGHGLVWaWvztTBV29iFxVYYloCF
 w99aypevFdDZi8bRu/OUZq1nBMbFWTz2XGayV9LTAGP7Udy+FZtPQEaR4++gw/hBBDmCQFdcpt9
 ZNRMFEkV6zvoxUtsgqJqNi4VH39TUPCQYyZyPzINu/lj7axF14yUuku/nUnXgQm3ZAyrYon1CxC
 Qwe0x32uIqzMkkohVBAx9ePt8Xk+JknjURD1ADKmlS+xkBsSrvwkDkruBV24Ll9qWD6T9CXIif4
 89Kfe9QELILNOrpCFoFx/ddj4s7XxjDKRootiCYXKligKD2a7523D+1yOL+UAe2BZ6xGroilkiT
 OuQhlSTu4WsKBUZ8H/5iojxWOwZCochSF6AWree943I9lfmkwCjNejGPBKcgBgGH5GOHVncB
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682609a9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=9YvV8F1douotiZniFPIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=632 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150154

On 5/14/25 9:09 PM, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.
> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
