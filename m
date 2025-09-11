Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB92DF12C
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588947; cv=none; b=sHsRDgDmShIRgo8GIA6re79JyP46fEJeKWcob74kU8uanVGl29nVR6mHLwBCaewkTb63o3VHwQ/6sQx7zPiFL3MUHNYT9iZBXZD38+9zFlLrIAHcCabszMAh/3A2FcqtKReyH/CJYxIjQKinvco+WaclkSI5yb6LjiYsLXsRBIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588947; c=relaxed/simple;
	bh=6PtazfSv0JtU4MGfn7twfC4d1Ubz4rEjp+ULwoKKs5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnFtefcZLtS5tTjqOSVX/mTlGXkEpwcxpXLpMkpv25rsQmyvwXef9KCCkxXMd8txsvs/6r6LFz+CXhzwPQx2HvsNSv+xjoX7K+EfldUJAtdT+ryhIpAyZBiBuuQ+QPb6MGkjO5l9TxkqO+tTKcp9zBWkTFDGdknaibu4cWvpqWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnd4J4Js; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnd4J4Js"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB0UgS003626
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qX5/kpkNqr6r8YgzRUeItHTqrwa2HlZuGNojlEyQ31o=; b=mnd4J4Js+TZtJlln
	zI5TVRWqkd4apAcebF+Ld1KMoZwWra0zVW0noP6pUJXXug7KMclyLVeFVp8r6otO
	Ab3EPTJgZWKzmv2xZZM/TYGMaVGfaeU+BnIaoBNcFgHI8vCpZOEthpXWEG+R6BxJ
	4sF4wDNPBOlJRy6DCufB/HVHhXAS3SwWqFqGPExbLaGEGnndH7rD4Ha+GvjmseYq
	llAO3KD19G7RwhuX/F+1QAmzcnQvIP3Vl8FNR39F6InihY0T/0Fk6jIcXrT6WqBF
	nnNNDzQvWI1gocpKPlLAyL5OYQw/RtLsxE3WF+RC90SZSaV3gq2AGJdo0/Dj4E2c
	K5jhVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsfggq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:09:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458345f5dso8262725ad.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 04:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588943; x=1758193743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qX5/kpkNqr6r8YgzRUeItHTqrwa2HlZuGNojlEyQ31o=;
        b=ioxkooXohhlDD5fNcQdh9jzxa8tZxVgEFUUDnXSNtjrwNuvvCLLz0bVfe0E1xYsWnf
         AIM8v2iztWGV8soY1Mnu9hVfDoTxSbpzDj9lF/pAOpHq5NqKBvUQN9V5eJ7WWuju/IZn
         VO6SmD48BEFqKvtepmta7dceK1+konMfLS12cHIsEQmyZPDuhmGNHxK2YJXXdBJul4os
         IRhiyGxpErEpKZdWTWLdI3o7ujrAsPRe65OKzQmRhymu65raPgYZb33FZGbGljiGF/Dc
         dFgDS/nxob91z82vjx5r4KmupxGdpXkRTDxrzynfGb9/iQefR+0sHEDptp3/b/r01CTx
         1eRA==
X-Forwarded-Encrypted: i=1; AJvYcCUS/WrYSg2+Irz+foMbDG9YuKzeoN70ZvAUKUAsCTAth8vFsshxf3LU1vhBLPs88K2kIx9cTL9wQrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08Mr3nysGFamw3QnpihBiFP2Vl6cHoJ8agklkZ346d8uuHsZO
	oqkiuMZMqjQ0WIny9gsmy8NqHMp0JhImDbfexzkev/iAFQQLfHzej7DdoS5dWTUlz0CcFBR7JAY
	e549p1r/G9e2x5tuROH/oUqZVPK75OCA8Yx1X0s574T5Rgzg7jXDj95jY+PDVXsM=
X-Gm-Gg: ASbGnctYwOfDYLo+Fs7tn0hIGC4Ax59VagdBDI0Iyley5iCfs1aATL80UjhmqUN3BMQ
	spQDrsVkOmHvjO7IqBRgQV7T4eqB9kFg30yG5kd4tUBXlEGSE+Q3xw1Q1x5vbqzCAwN1KccQSnh
	yrRATvKY09uE3nUiTGtrcPI4RNryL4ypbIVY7HWDu113tM9ReEw/wr8qerujwIYghdnf9p0BkhB
	YMz9IX4i01jYz6wT8dF8/kFEeou50+qHS0gKhdS6m9llnEIoyAQpj2t1lFCw3U/SNXYBepIbWgr
	x9BRSR3TYl531XNgGJmXFPZjcymKTzS8c87jY+Z0AcaHJPKrpdmaUGQSGeIoLfrUo1gp2Ro=
X-Received: by 2002:a17:902:f550:b0:24c:be1f:c204 with SMTP id d9443c01a7336-2516f04e1a7mr213003115ad.22.1757588943582;
        Thu, 11 Sep 2025 04:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/yEiu08IqnfwVqXB0YZWENFFoz1mw6AI/afPUVw0Sc9Smj3Kv0QypfNOVTO3vH4qgyrKoqA==
X-Received: by 2002:a17:902:f550:b0:24c:be1f:c204 with SMTP id d9443c01a7336-2516f04e1a7mr213002925ad.22.1757588943112;
        Thu, 11 Sep 2025 04:09:03 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6ae8sm16362305ad.15.2025.09.11.04.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:02 -0700 (PDT)
Message-ID: <10c0d04b-2c8c-4cf4-bb99-acf74f420341@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:38:51 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eGYDUErF20MyWTs2JdUw7HQjr8nNkPXy
X-Proofpoint-GUID: eGYDUErF20MyWTs2JdUw7HQjr8nNkPXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX325Q7S/OhSbC
 YvpvDfdpjztiRtQNT+SE8lFhplU35UAQxvvG4WAuFrR/JP4MpFE870atcJdJgqcTlG9VpjPmCeB
 MiUFxqzA+yxMQH/M6tPWN4f2xt4EuWKXnDceUVBdVt5bmAE/ZXKVNkc99vIpEM6fBFAT3zS++Au
 cfjV4v9G0OCeBuzJBa0anDqi/5nFXjdIVjW6OLPVLHRCJUyc9q6bLGr3SGxuQav7Lz7WzAoc6BC
 PWseHVHyxeLsTwVGt6ehKjfUA2ULbYoBD63NnC26x8w5PJXL3MJmApMNVUwCy7X7ZUMjSYdLc8z
 IaSewu0aWK6CHj2TJss5qUDV8o7nr5XvhmQjtyj48Ekln4sJzRc821GudYKdyiTWLfarh9/D/HN
 0BokVxze
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2add0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8550 camera clock controller to enforce a correct
> sequence of enabling and disabling power domains by the consumers.
> 
> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
