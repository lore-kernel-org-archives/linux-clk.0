Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371B293C42
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 05:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848316; cv=none; b=oejrcP7vnZaXCeSOGd27+wLzVCTUhvKrvF6PxYLHf6oHC/u61CiR/DLwd+yB88EOkDnUnPHWxBDUm3jyU8AdSq2DKoy1AtKemsMSxlfcBdfEzLtFiyye+D0CYYboIPTJAzY5f61zFXmZjShmKBnZQ3zB8/ShQMFG1h2p3VKc8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848316; c=relaxed/simple;
	bh=D3lO0lhg5hTvmGKJ2ae0KlsLLu8OpKls2Vh506RLu80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqLUlLSBAMqXE94fH5EFgGZMzR9Inu3Yw0izBe2joUHeRFFxdHkA4GKjyzXW2ANJKo0ZUTvKCvjcbmqevjiYsE8TwFFf9CFL08FmyvwgW6CWqgczpX7SyZ/cMR77ciqBxh9LFYws3iJDvysIjJuDF/pr+XjFXRDpgFPt4cRklSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jk2MjDRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqOGOFr7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jk2MjDRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqOGOFr7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TH02pc2525265
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 05:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=; b=jk2MjDRJU8RmKdg8
	w/RB3dFeD7f0NRQSpbnWEdTb9j6GXYDMIc3qGNdzN1zA8OnLf59nAAmB1lOeU5B4
	B9gsSdsj8soa1JH9pvVgGQ32Dc7eDyY99/uL5QryRwBGUxnwY0aMhXd0uqWuyLIA
	OYc4qzLzBgpkdKaCD/L5hQ+lMjeMQUG60ALhVbPW3SWoJQtsL8fFXhyfpIy6AEAu
	Tt/gOKaDOOFmjNrv3xVgLeuG1Dr8AjrP4Bsb6kJ47ibPsQo3oUKqsxZbQG+kgs2Z
	STMQkyQKYNrRATfYk9DOjG9nMWvvnZ+rfuSodfcKWmmwRrebaqAl4nJxNRzXQAzb
	b5TBRw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmjksg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 05:25:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35449510446so4578835a91.0
        for <linux-clk@vger.kernel.org>; Sun, 29 Mar 2026 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848313; x=1775453113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=;
        b=CqOGOFr7CLQohgEWMz7GFoCw+mFO+rATtzxbfPNE6vSeWSngULiUAQBLnxwpCNQQlk
         68E2rKstMA1+RF3pWXHCo7cgKb4bY0JC2/pBTb3km8kCu27JvMguEXb6l8TW2b/3i1CI
         84FbVOpZtRO0gzsScrDW/TgOOOujzM9PC+qIsQLCNL3hRtz5IU3oUTx9qEvisjDGA3vM
         1retOuriDMTb3ubgCEp2PDcU7yJ2JLYyQNr9jmLdmmq9gOqO8ufD5vSg3/GItJqPCNvb
         LOxtGgHUuR6Q8NG+nJo4pEUcfqKOgJzqgqbVC8g3xBEZ6wNAcRk0CV2AYPMuxFKbkoKk
         9CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848313; x=1775453113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=;
        b=CG27KZPozTUuIkfSFGdKdEPzNUehVVQCHXw4GKKyGgaG4Z70FhTPh0NPVIOZp7HaGQ
         pawsqaFYxdThoG/y7cHx5q651vn8jRDSnyp6x9zQZvYLpdG8qkU9wkxoZ+D1+WrTnhCH
         FEER87PO+8Flsr71IhEcspAgQeSC7SPZ9dJ07sJ5OhVuOJ96ZQ4c+IlGQ1UkBgmUkux3
         R1I9yI0sXsdGjUYV9yrIBczHct9fM0pEb7S4qPP/RsdYoEgxYBNbWZGKHuftKXXPnoNv
         d7EHnTjwoltERY6AWzMR2uVgDEeSEnREyqHicKVDoGzFzjHiRaWg+YBd0d3QPHD4GRbF
         ZilQ==
X-Forwarded-Encrypted: i=1; AJvYcCULXIZKqkWCYRb6WWLNriMWqnj7zV3aSPaOcqsQRxS6bdu8Nqedsnp+ic38gt6skkWAJ0/W3cAIkYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdFUpzn7Ssvfkctvg3Im8SALE2ty8qp3T5sKpfNAutpuB3sGbH
	unjA/7OdtcwGgaPBwqkuEIhVHjqgKedEFCrXPGYHYvMwnGtJ4Xm8WZjLkmY5Ymq4VHKN5/p/sUQ
	vMCRK8f/dX8AWB7iY5dK969tOplus5Nx/faZb4NgD0o3xg8MJL3NP2zWywNymPD4=
X-Gm-Gg: ATEYQzxiXJ7RB5fKhVOcKoWTCiCDBR2n9NpdeYnKq3YYJ2AquZuu9iezJj/MHrgUvlX
	qJfO5CwDQJfZsMfUW+m4u+Lh62KkTiJ/6hufNcmJvpCA7QWEZ2BEMh2whp5CpQ2k/RS7tAuYIaj
	fqs5eMKHttcabD4mCRzmdP2wT452ObvN5xd6tRYY9h2sdbAs8YiJ3e9fsNxptWENVxTo2rZT7xs
	PFA5Tf3P0sWTiLwDqWLWT3C2dWcUFEdIEojRvB/tD3L+SivVHH87Vm0uLNtyo+dq8JIQSGcbX1b
	MoF76Be3ZXcK2QWKa6Vpt8Ko7Zvst0yVMCBiEdeE5bDUCnzlmYrF0kBembOUB6o/sVU2aGD1TGJ
	4Twv91NbFbHjAy22S0s4P11WTNTn6NtCGReM/pIa/ONGVN0njxDEgvg==
X-Received: by 2002:a17:90b:3d86:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35db00a416amr378968a91.22.1774848312868;
        Sun, 29 Mar 2026 22:25:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3d86:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35db00a416amr378917a91.22.1774848312353;
        Sun, 29 Mar 2026 22:25:12 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm6892152a91.17.2026.03.29.22.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:25:11 -0700 (PDT)
Message-ID: <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:02 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
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
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzOSBTYWx0ZWRfXysbZzrqRbPPj
 r2UJGAcA4/9EW/yC2C5U/xRkty57ccTpN2d0U1yV0osobAMb6ZyTQs+IkEZlpMK+Qa3+XPvx++N
 c6hAsIM6Z/H7nZD1HCi7Kwdz3eNdhnYd/B9NBy8xJuQbk/T1oitiGKbppfDzZJZN/KreWp1Nh4m
 7ogWRT4YMXCkmr1IJkaclFuRcRjy2gmQWKLfCWbcIrk4S32ZK3uaeGiOvgHCMa5cNaNQlhYAxL+
 KEymWanUrv8WOvUs6E2iDS6/aeLhO1t1Yz6axIL7NflLKMaz4xYqjxC5hwa1WdLSe+tR6IvnAb5
 BBv+jNczK/dza/QbuHGyBoeHzDdDZIDsVc/nOaDLnLg+D7YOF1Wg/A2wGLYg3vamnpjZXF0WD6U
 ebxABpEg9kbrvGpRRZamdt+qbXaBdIqqMMmTbbmccAu9U6R/OqzJ/lLipEErN8zStHimpoyo3lr
 dSgu2PcRsq8t9ctep8g==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca0939 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: Fps8lmxY-opzU2tq3Mlyg5AaCWfh-sm_
X-Proofpoint-GUID: Fps8lmxY-opzU2tq3Mlyg5AaCWfh-sm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300039



On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
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
> +		iris_opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> +						 &core->opp_pmdomain_tbl);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 

Hitting below compilation error on latest kernel

drivers/media/platform/qcom/iris/iris_probe.c: In function
‘iris_init_power_domains’:
drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
read-only member ‘num_pd_names’
   71 |                 iris_opp_pd_data.num_pd_names--;

Could you please check and fix.

Thanks,
Dikshita
