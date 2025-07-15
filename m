Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687762D12E4
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570334; cv=none; b=qsGZ1AmL9pqW6jpgbe2izjTS/9G4Tu+2R1of4Gu5PrPNA5ZQSOffE020FASmqs+fOcqgJMEOX4Jp9kiGfwdGVrnV/3PE3fIdRwNYGjAlLAc3+5u+aDrOoyvZVOWJTQz7uC/hpT1ZmULBkQO/4DMlt7YgaWEBE7mocOobwyYexLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570334; c=relaxed/simple;
	bh=5LBGdyccFs9/kSMj7gqptZEBRHBs0pXT46lCaRpnEU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DzfBFdpvCW+ZelcBnsXrcth8qY4R9BOtKpFtAdqaVNkfAQ7urOYQUv5mI3aLy4UoaxTrcokO0QlAiAUEz6UycLOrPCYIxGGg63hQjJmvJYoAJGuNkfE1MyOjf+V7tY7P0ZgZvv4BfnpTy2XbENKgM5s8JUD0xevlfyDfHtru9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHFOz9AI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHFOz9AI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7IMwU004487
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 09:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X81G8SbDQbSTnHA7Tq+qXCtSDHk+zyIFbzLI6vGMtbM=; b=oHFOz9AIM1QxzQ33
	ewK8BgVpjT41RVa6X5zFWaAwDO/Rjs/49yTkz4ZQNeGfIiYy19HRhgepfbXMGSjb
	NdRwV614x4I6+6FFV9v/8IfioYfJpWknS9PCpZwpgEylpHvCjBhigXd1ztrFdD4T
	KCEjKseMYNzvFjQl+aTv814m+5gmfTy2Ew0ZlsuQlk9QeaX7k+Phu/pUxub24vTk
	RYhGWXdtjt/IOirpLCjmU9JX6O/QLwJsQWkbODs6MgaK2m/D+xBimXvcfdjYlvuQ
	VAwbmaqHMafDZ9GS2jCSCrbH9okOP7lu8A4vRDRt6tLI5s4ARglxlLXw0HhV/wLk
	wRwtKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu87g9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 09:05:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ab77393308so6571241cf.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 02:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570316; x=1753175116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X81G8SbDQbSTnHA7Tq+qXCtSDHk+zyIFbzLI6vGMtbM=;
        b=moR/3CLXIyRD0E/r11OycQlveD6sTT0oYp46ZZ0WyhyjwGvgJiAlgB20Gsxw1LNfJu
         ftfXe41yXvQcHoJD3J5+8WaSPUCloK/UmNdT7FpMf+HPTm4Gf4LqNgK8ck0Pxqk+rzdQ
         DmmQ5UboSbEFUUHh6X/Y/yj8NfhZozxMoa7Y5hlfqIIs7/Uh/oNY1H8KR8YcN55YRrdx
         ewz6Dtgn35bTchC3Va3SCiKBf+Bycq0LZ6uSWO5qC8nb9wp3rOX8enaTtJVaG5/xmeSl
         4xc3KSwcMpRe1t1oG7/fMhpTmwd61XDZz8IYqcZZMRB3Wxhm2Jc9YjIP2MqgYH0EYPRV
         pIMA==
X-Forwarded-Encrypted: i=1; AJvYcCW+GkZvLLHT3aZfF47aRc7RO3mEGkc+Z/wC8Mu2EBRQ04ojmdg7ClkprSgoWY/pgtJPcJvJyzJucYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn8nWCMTksA/uIQFhenqxjglYMwajvGhQF+acEWqkAgKN3mQqe
	1oyWyLfpJkxcI5m1frTalyKjv4qwID6WHf7nALiuBreQPcBuMhBQm//HU42pdwMRB6GFvYLnzqi
	h+MJ4Z6mISFyAAp990X4O6Ujy3OFYd0KIDE1DDpgd3mshk1xe1rAtRb7IgodZZsI=
X-Gm-Gg: ASbGncuG6WKTnVdtRUsINYRs6GuE3snuvSAGjJATAZzTmz2SIjw80mYP0i9E3ijWOBb
	2WCII4Qtj2YCHpTiTkGtouGMaiwer4BBcx82tSuM1nFR+MNIFwFimpViLVU4Ck5cOgtlAiuu4Hp
	SinWgrTLjH16BZUTo3BuuL2BbS3BBjWJ9yZ0+5xby0xj/bTXMXwxgT6H9Kqzue2NHGEABU7YCtC
	FWwAL2NSL9pqxgRJjKXkdZdLlkWND04A8oPOLPbe8CEQ51us2xp3As1dgrFwYD1p5DmLZRdPVp4
	5vxPb8TNs3IFRrU3PpF/tyq0k6vItgLjaMawkUM72ysJ/T2X0Y0IJ1Mj/wdkUqUz12NH0GbsFqg
	Dzg5VwOa75TKdA8zqy46x
X-Received: by 2002:a05:622a:1104:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4ab86ddc86cmr4932681cf.1.1752570315556;
        Tue, 15 Jul 2025 02:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYFCf9iDFpvwNaUhwvFmnJFfLgW9Y1m4vlzwNzKWO0OxKFu/BJa6T2F1S9r+efZbKvvtpAg==
X-Received: by 2002:a05:622a:1104:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4ab86ddc86cmr4932471cf.1.1752570315140;
        Tue, 15 Jul 2025 02:05:15 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612067f7ca6sm4743760a12.55.2025.07.15.02.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:05:14 -0700 (PDT)
Message-ID: <03242c48-beb9-4ec1-8659-0cb8db9ef37d@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715-sm7635-clocks-v3-0-18f9faac4984@fairphone.com>
 <20250715-sm7635-clocks-v3-1-18f9faac4984@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250715-sm7635-clocks-v3-1-18f9faac4984@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4MiBTYWx0ZWRfX28ND1g7Syvaz
 XTfRpP+gmxL66NCsGNP93Y3RNBhVmcfPW/gcIsf9YwgA0jlKIuM8rGxVttNeMZnNW0X5Y1pGBnj
 e6b43GNr0RSpCizs/v8PL4rDqXEGbRk/DhJZlhcOVlJlRCH8PX8tVbQnmG6PodkSe9XBclc7mIQ
 G1LkgXuCcn+ocLAS0IjS/3i0NmWIpWnLACBbzBdkF9jaRc18WpcfhHfjsTDYp+k1ZkBZyfqe/Mh
 ayhoNJ5+V1jQs+N48upCHlAfgUtluducYKgBV+ZH9WLkWLrh/yOTJp2w89uxJDsWeiKPVraQXdr
 BWLG/8dLso1gLLf5GdqWcix8lFhwyUocK0Irfij0TgeEJofjVoqy9Z6/FHWr1jiUQ8lfP/0/IRN
 AlhbEa8zHtcJSoBzEVEvHmKBAYB1AVFRzvn5Xz04hzHc0lHCYICealvy0wHAi2dtUyTFwY6i
X-Proofpoint-ORIG-GUID: 2FeQeTCPO-kAkY1LRVAKMuJ_gkdlFSmI
X-Proofpoint-GUID: 2FeQeTCPO-kAkY1LRVAKMuJ_gkdlFSmI
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687619da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fWT5Z53OPIsgueDaOEIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150082

On 7/15/25 9:19 AM, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/common.c | 10 ++++++++++
>  drivers/clk/qcom/common.h |  2 ++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b3838d885db25f183979576e5c685c07dc6a7049..37c3008e6c1be1f083d0093d2659e31dd7978497 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -390,6 +390,16 @@ int qcom_cc_really_probe(struct device *dev,
>  			goto put_rpm;
>  	}
>  
> +	if (desc->driver_data &&
> +	    desc->driver_data->dfs_rcgs &&
> +	    desc->driver_data->num_dfs_rcgs) {

I suppose the last check isn't strictly necessary but it makes
sense to the reader so I'm not asking for a resend because of
that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

> +		ret = qcom_cc_register_rcg_dfs(regmap,
> +					       desc->driver_data->dfs_rcgs,
> +					       desc->driver_data->num_dfs_rcgs);
> +		if (ret)
> +			goto put_rpm;
> +	}
> +
>  	cc->rclks = rclks;
>  	cc->num_rclks = num_clks;
>  
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..953c91f7b14502546d8ade0dccc4790fcbb53ddb 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -30,6 +30,8 @@ struct qcom_cc_driver_data {
>  	size_t num_alpha_plls;
>  	u32 *clk_cbcrs;
>  	size_t num_clk_cbcrs;
> +	const struct clk_rcg_dfs_data *dfs_rcgs;
> +	size_t num_dfs_rcgs;
>  	void (*clk_regs_configure)(struct device *dev, struct regmap *regmap);
>  };
>  
> 
