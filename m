Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8729D26E
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241823; cv=none; b=Jc+LBmThVYxV501FLVlkQhyNQlkdIaYTBhJA4UCkHeXby3+q00JuTthdmRCNGj5h3ppBXaJLqDNrCbw54wShHY2Rl9VZpdLsLB0/lILG8CRVEQlb25WpHyhAScogqsHaWIqp8TUTZoh+jKZkNhExow7SGBGBuH2VCYL0KtBV3fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241823; c=relaxed/simple;
	bh=6wDGojsAdut4A5NmPLDITN8to0kwBKtdzXHZOpQJPNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cyEhnSHihjcHkQt6+q3GIoe7XEOaljzMxV2t/X3x8Ef6C2rBL7OWHY4S3hE60IEOxPZvUol4tDjzX5HDhjhiyxxKWjPJz1sk/bUk4c4pGB1FosAYmaHLPPhtHS/UlOCJeDZDCMavaEAUt6lGguR0Uu3OKJk77LfI0fJ1lTlG4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YM5YjciN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJOcUvMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YM5YjciN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJOcUvMb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MMv1MC2062748
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	svL94WkWhXuPQIoF5tegtkrM8CC32bZrLcQvS4N+uWQ=; b=YM5YjciNbAXslme8
	B1sOI0Q0YItGUPPAfFXvDlHalQRTTH7MjRcYk96OlVAunGEI4jrYbZnC33zkaNlT
	yh/NFVKnFdvetjAJA98zl3L+2CguTKiWUmOG9G/tIk8ZKIFt30VvIhS0vPTbHURX
	CM4XpB0K2X69/qGzvTnf0OByFTc4a1IgnV2x36BJCCNkBnZmCphPU1jcsAWvG4y0
	7HmMdlF42s1yqxik+zjA3Fk+wLVRY7MN4M3V1eTpNzQ1tuZ7mAThrt2N2y2T2qQN
	eFCQmOakyBP/VaOtqIN68v4Qcykph0+FP1MUYkOXDIJHXLhGmV9XM20lHcCDE8Bq
	Ra3cxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kdubrrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:57:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b06c242a34so272436555ad.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 21:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774241820; x=1774846620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svL94WkWhXuPQIoF5tegtkrM8CC32bZrLcQvS4N+uWQ=;
        b=JJOcUvMb6CmiIrIZqz8NdgjhqzBQHkJ4X9XlH5FUw9ujXrrA0TyZ0D1nZm7BFkU+PY
         zaXqFaS4Od2DkEW3BcgjhnASReCHIMgaYHEM2o6Db7nH22v/LXSJWjP1gIaUP3rMgtj2
         JIYDw6elmxWHDUHOkIlIy36a7eyXwxe+1eQeF+WWzh0lUKZyYblulYSqa0vmyb+PdVve
         qxc5E79Oa9Ghoh34M623rYEn7Xl8V+GezPrPuXEFF8hYJ5JRgAGwZJo0qDYsrufPPUEW
         X4nw+HXtjyWsRXnEvcCqVnhh34+zauSYJ8tAtcoIVwXD3mm1QpHvINZp1V+yM/+GBeuB
         lPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774241820; x=1774846620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svL94WkWhXuPQIoF5tegtkrM8CC32bZrLcQvS4N+uWQ=;
        b=sHClIMGZ3Bs1v+fwu2f/nV1UykwNAQlEuU66Kmh5COsTUHlz8CQZFJzM22PHWh0rAF
         PWBZfq2ZsKUGK0nN8jiRj46IZk+2vi+0NoPMF7oMoKb42KyOY8xlJSxi5R+zzIUrq9m4
         iTh4x9YVAb9x0TcknXSKQuBAN1VJD8605NGcLf40DMWhRiNkVg8TroDrB8kzGQoT16gG
         smiHSLxTH+PbIEdLmytLk7v3D6L+g3LI8rXl+lZHlOFSWNFykOUh1GQ98S0vNamkq/Nt
         SzXuYEMY8qXV2MyKx9MURBYTqY53lUgHQVrj41Cs2AcpI88G0SQiZb1JoKRZzEhqjJaD
         zmZg==
X-Forwarded-Encrypted: i=1; AJvYcCV/gjesPcuR1sXem/zOtPPRTWuvpwl9y2rLRMQ9P6xcqcAoUAienZAONlmUi+Mv8TVKcTDO6Xu/sus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KLwSjyH8Um3cYPaZN2Czy36YUAyCEDQVCmlY7MSSJJwX6LRK
	cT5ef3U3cKzZ47B2+FGsgk+pS+Z19DtJUfglwHcps8h0x1axD//A3qHHoHacd8m4zPN7hTL1EpJ
	StYWdrS9oAiCzdwJL6lloZaBCxttLdeGPFm21fRJBNYcaDx+9TOeaRrzmNH4+jFs=
X-Gm-Gg: ATEYQzx0CV073MZyB9/71oAN8mNq/4IcTAnfHlka5SY3Sp/RNP131dDpMgC/qZYDerB
	nrupLBWETWqn59XAxsqA0HzoeUEbANQkadG/OwrsmOQ12d3nfe8k0qK2QZM3pQZrFg0O8r0ecXT
	v996lSq2vRFfiOKFG4V8/iApr27cKNBbwdhNsYhTJtJeZljguH1DS6H3yUf2Xv01/PpCUSubR0L
	hv29Cpfi/z/EDD07eZUwgH1csXeg3AbtIoybp4GfoyVoBuOx+aOML9jhu8k93izQEUUwSYmegdY
	PHBTbBKAnS3anI7rrEjN1TIZxfps1Z3JclhaCT9UBRnX/YLBa91qWgjVgihzPRzVXZzogxAtWp5
	BbDvMmYrn8O9eFkIl08jq/jCwHFO1WnuyYHflGN/h9IiC+CHYFGXsyg==
X-Received: by 2002:a17:903:1c3:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b091e6c1a3mr48097305ad.51.1774241819709;
        Sun, 22 Mar 2026 21:56:59 -0700 (PDT)
X-Received: by 2002:a17:903:1c3:b0:2b0:91e6:bc16 with SMTP id d9443c01a7336-2b091e6c1a3mr48097075ad.51.1774241819250;
        Sun, 22 Mar 2026 21:56:59 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c56bsm127732255ad.57.2026.03.22.21.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:56:58 -0700 (PDT)
Message-ID: <388c4c45-2338-4520-abf6-6a15aeb5db42@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:26:53 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
 <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <gvj7tsivu6w2fzfcus6oi3pwc7jcfqdrx62uuzny674mj5ftus@dpnn4pzizbqc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzNSBTYWx0ZWRfXxU06gMTJGJ1l
 C05RVsEae/bl6HqKXWGuU0WHU25V1UAUwhWgj7T3NpACYo8JAsU0Nzd6lI/wm3BR9PvAcawL6jX
 oYoyJVHvjeQWfO02qPW6o1UmolUGjkEd8XXgSBu3yOT/XDXYu55GCDGd+b+jxx1Rt9SesWDsABP
 Smm0elyg9MmzsQlHfo5Z9ozJkmqUuqlEOI01Eo4Q7Q/tpUCoA7lXAGoL94OcxUASwv5ke1ej14i
 dMF+a2DdhrWOzAyMLSXudm22P43DKCFvnVY7AelI/kpGBu3JqXRjHbzVbcW6oduV3J0U7weU3OC
 9c4cD6ombzL9V0byNWTitb1Gua+NW9G0T7hdISU2aCg0dN2oGbuaay+4iu7t824oRLx0mYf7eaF
 ZYyw0kTK92MI74OcOh2fOPk6RIjFHxFGjcXu4TJSjtMw1cne3ypFMFkV/Y0CehZVsS5kWJwHHZp
 2JUZlFmEdaA408I4K6g==
X-Proofpoint-ORIG-GUID: ybJZ1lFECvO5ZXwf46k-G1k5cGmd_KAN
X-Authority-Analysis: v=2.4 cv=Q4DfIo2a c=1 sm=1 tr=0 ts=69c0c81c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=F-3G6NKJkSEc1uAqM64A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ybJZ1lFECvO5ZXwf46k-G1k5cGmd_KAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230035



On 3/16/2026 6:26 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 04:38:21PM +0530, Jagadeesh Kona wrote:
>> Keep GCC USB QTB clock always ON which is required for SMMU
>> invalidation on X1E80100 platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-x1e80100.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
>> index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
>> --- a/drivers/clk/qcom/gcc-x1e80100.c
>> +++ b/drivers/clk/qcom/gcc-x1e80100.c
>> @@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
>>  	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
>>  	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
>>  	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
> 
> Is it used during all SMMU invalidations or only for those related to
> the USB controller?
> 

Yes, it is required for all SMMU invalidations.

Thanks,
Jagadeesh

>>  
>>  	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
>>  	regmap_write(regmap, 0x52224, 0x0);
>>
>> ---
>> base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
>> change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
>>
>> Best regards,
>> -- 
>> Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>>
> 

