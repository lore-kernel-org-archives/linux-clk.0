Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817121C18B
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729192280; cv=none; b=shxJrZULft7SUgJf1pMln4CUXhJ7ZIuxrvPEU0N5wCCEBB+lv3wscJ/T5YdLUa4iOJ2rkvo3o7nIMH+fjqc98xBz3vemRdyCxzg4rp+7j9W1QyjQ61aYFAOKh328v5nRPct0jBp7LogwnlUiIC7R/FidzhlC9XrfoiLUbn7zjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729192280; c=relaxed/simple;
	bh=v8Avf/NnuFpi/P6Ct8b/Z7JTnVtN3W+381UpOAK9q+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNrmoGalCPzbORbqL6aA8+8mdxn2VPNG49C0SZ3FGLxJjKRtmOREZ1WmihS6ubeFam1QJlCA5zwOo6K/WCftQwwjS5BdH2WVY5XlaXnQyLNyFh+ygYkkNOVkQmJMAIqhIxurLg8FPaygRG9q3Sh0gSGow7F/K9weP0LJDpyJoow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5X3ORMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5X3ORMk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HI1Eqi001662
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz0ZnAe11pZokPDhFpVE6U0qSp4/P5YMh+MPxjixj3s=; b=k5X3ORMkj/+oxak8
	uiANbnoJlZRbpIgNtSx1qujwTcU/JN0ZlcU2fGQ6imcTeGUqo/2NZ9a0Lo6/6MOf
	nbaF08rpjk9Uxi1V+FL78DBtEx0D8uPonK274J9PxXY2jq23OO0qgvm37U7HWI0H
	Qtb/dYIv3K+ubiVUc0VjAzoAiavtjUeHKH3eBjBq0AFwlPQzmFsnbFbSYzYEmxCR
	ts9Q2x97mNQeE1J5KKpy4FIAt5b6WnesvltOXGz7MyThz0AuMoOyyWw3YqDf0wht
	ho05nRwA0xTplaxmMTU+Cz3/aN8r/PQC9ylUPWiXpe5DGMRBitIBcIuTJmjZsVWP
	Cdbz4Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5bq9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 19:11:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbe944435fso2253336d6.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 12:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729192272; x=1729797072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hz0ZnAe11pZokPDhFpVE6U0qSp4/P5YMh+MPxjixj3s=;
        b=CCnlQ2KFl80UGKOm3+Z1sl6FrPU4mhC1n8qQiwhSncW50D0pqIbqXmhVSdzU0EUaFC
         OVG0+BOEYUiKLsx7F/euVe8HZ6EiaovdERj8eSHp/Ibb0nDci5TJiTh52HswWhRtYSbH
         4FyLOkcwnUErQ6jzCEUcu2PWWaiUqP3/sz1SbAS9bkhroTOxFj7kjk2tHLSJd5tarrjY
         KXkURkoZxNZYUhEr2tJla68J/Xv0bmGG5IpvdEdqbpnKcVDDepUSGfSuM3OIliclwIEO
         gezz8/En/WRkkGGSPDt/U9NXlnuHpnQGQj+5G9md7qlNZxCj0SPE6tMn2qeP2zw+npbt
         N99w==
X-Forwarded-Encrypted: i=1; AJvYcCUkaNmF65XY/PfePj8CoCNw8UZSYYO/e9iuf1zp0UoUPYdhutdHNb5LQEl9nuW2GPf8DUn/tAMaJq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Mn2UkkgRHfCNwe2uiLrJFyY+QymhaVOCfAoYNBQ53yScQDNy
	58ta4W2B5bwItE4Yrw3/XQxxn0kO9tM2bFFN5EiSEuULqKIXE9gvzx2c8kAsSYeo3phnjnkWPmc
	FqaFUawFvQGHduzToOdbfHVv+SxxUVK7lZ1WeTUbqYnDnvU/UkdJCoG7g9eTltxubewc=
X-Received: by 2002:a05:6214:1304:b0:6cb:38bf:40b7 with SMTP id 6a1803df08f44-6cc37a3155dmr27106886d6.2.1729192272269;
        Thu, 17 Oct 2024 12:11:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwq4tqffDANVWUds9nyhXoagPQKQd5WCsDNUqDF5cZJEeTl0EOL2AZl9FT/AkJ44UU3VpNA==
X-Received: by 2002:a05:6214:1304:b0:6cb:38bf:40b7 with SMTP id 6a1803df08f44-6cc37a3155dmr27106696d6.2.1729192271847;
        Thu, 17 Oct 2024 12:11:11 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d4d6324sm3026405a12.14.2024.10.17.12.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 12:11:11 -0700 (PDT)
Message-ID: <a2f6308c-9eb8-4608-bd5a-a5deaf9a987a@oss.qualcomm.com>
Date: Thu, 17 Oct 2024 21:11:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] clk: qcom: rpmh: add support for SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-10-f75e740f0a8d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241017-sar2130p-clocks-v1-10-f75e740f0a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -MCEsKyjYkNhWpEAlzZT5FGjqGFpu3Nx
X-Proofpoint-ORIG-GUID: -MCEsKyjYkNhWpEAlzZT5FGjqGFpu3Nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170128

On 17.10.2024 6:57 PM, Dmitry Baryshkov wrote:
> Define clocks as supported by the RPMh on the SAR2130P platform. It
> seems that on this platform RPMh models only CXO clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 4acde937114af3d7fdc15f3d125a72d42d0fde21..8cb15430d0171a8ed6b05e51d1901af63a4564c4 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -389,6 +389,16 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
>  DEFINE_CLK_RPMH_BCM(pka, "PKA0");
>  DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
>  
> +static struct clk_hw *sar2130p_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sar2130p = {
> +	.clks = sar2130p_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sar2130p_rpmh_clocks),
> +};

This is identical to the QDU1000 setup. Perhaps you can rename it to
something generic (bi_tcxo_div1_clocks[]) and reference it in both
compatible strings (as the compatibility seems rather incidental)

Konrad
