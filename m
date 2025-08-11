Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4259B2797B1
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908446; cv=none; b=f8IyFi4K42g+ZSOHX6zlv0+x6FNhDmsp2+OAK3BHAcqWfhGy/juvpFh4briu6qoY2ePW8TnEwK6yBvRO4jvEMeOoWPdx3F6mIyvYTik7mduzFmrJ9syjwWk+oQuFLQoOpefEb1NwM781OBunyb203j8vCIQ/HnpXpG+hKoM8fQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908446; c=relaxed/simple;
	bh=n6bYWBbuvYgd7Of4AkNGNr2HVdrMAtKaVoR0TN1D2LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RynPb9RzYDWXeuVlIkSNGSDuZNnBCqijy3M+RXkHrp1SV2B6YBntRbkgeKL1445N4QLk8KfoZdMa2i5wFWDk5IbwjpLwyWisDbFu2SMG9gS1q3kkyLN8nNtSy4aMfOZzQ/YD88dH62pBzcyqptL70W4fe76Dy9TifjCz1JQBJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muJKlt2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muJKlt2Q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dDiI000685
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=; b=muJKlt2QHD30b0PW
	KCf4MMfDmKz/Chb2p8V2b1lzpymdYwgT5IafpJ8GsAtII2dqKbGBQ2V75pI5FEuA
	6gTh7QPlryeJRU5t1F0EDOoeZnG0+tsbNzZlrfbzoioXA3mBaHW49S/lSgCfqRFo
	9d3ac/8ptkZ4+Bfdr4OMEb81n3U+eyKPRYj2BvyF77YDfIJ9DowsHzMu8ZEYbHeJ
	HPWS+xpa7XOsdYt6MAcAEtut6r/+tvsHpe2KNqpvB8OVFhxwnxWKAjXrFrq8qo5a
	ZOrHnnQTio8fCBfr2yj5ItOMkO3olR0aNOXQ9e/XFBOXwWtyTInSVOOecJQ8AN5C
	/wkNxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9kyjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:34:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-707641946ecso10704786d6.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908443; x=1755513243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsD7GGJiNnfcvjretasZ/pNIYgJDbc71adqR86O7WrU=;
        b=eyoyf1mByVOo0aqNS01CsHsL4TrjEv7e8ppXt8X7k0eHJTbCoQQsqkdgZoe7GwqC+E
         o6Cj+26MgzimkaCCpJwzJeDh72+0jhW3NSqD28IhDtQxfg9/YaRLRqdvy3xMp5cFQiQD
         iE5RRtqPB9g+fUd+rHViyZ0WPwCNuIK6apSFqZmDzYL6xR7LRG3iKrgPToTraK+chNmq
         kZ+/fSaPPg/ltuJuQa5tXJmS+Vf3wOb5eoY3pRUiNS5oouk8XZU9+9QVMuNQWF8o56Ik
         bm3ak+fRTwp9V83tAlAh/LhD5n4R1RQAEveTsCIApLoJddXsVnjikF5sTZtD++FLehRE
         i74w==
X-Gm-Message-State: AOJu0YwvEPUPS/NQLpjslWitqBJZINHDDPmY+n3B4OJ7klzIEcBMwBvC
	00HzwEaPps4x1HCydu1Xg04cX+kte5CaDjBgAKR7T7DWP04YGKxWGfmhz7POa4UhUthtnplIJ+q
	9fe7N31L6hrYQnlvfpgIchRClvh2q9zFB1yg+OfBONRIIsrRW4eGK1SY9KXsBE64=
X-Gm-Gg: ASbGncs1hze2jteQqKenNaFl/MULHtvows+SAPluNjMyDmxBE3tFRFYyVcp2RZ+D/Ew
	csIZrzZZ2/dDoIjS/1cWsT0/OmhXEn4L4PmZ6kBS3LJhOnQLNL5GDqSEe0hDkHYjmGLL9mkcstK
	ya9UA5UZ4v46kZrXnwMX3GYDa3bBlKsY1yk7LGt6E25+vUjyZpMViMGT4ikm2/u7Axrb9dUC6Jq
	1atDltq8uvTt+RhMoYQF6dVNXNKNsZKZBDfc4W+DspmwzxlrDaijjUI1d40INyNnFHZ0Rz+6jdh
	6fNVnQBMqMITH/4u83JLjkv7A6TmEXUeP8HXZlZaD6M+SAKEBYxd/ath42sB/8OxPvgcTuGsX1j
	fkwvLLmrxNDhAYDrS4g==
X-Received: by 2002:a05:6214:2608:b0:709:23f0:f50 with SMTP id 6a1803df08f44-709b094cbe7mr53402256d6.8.1754908443215;
        Mon, 11 Aug 2025 03:34:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpXju1O/sKkYY/b3BkoXU3yRD84XzBcfZoJ/QUx+rjP0trH4Je3JcbjdMDL95C2fO2CoviQQ==
X-Received: by 2002:a05:6214:2608:b0:709:23f0:f50 with SMTP id 6a1803df08f44-709b094cbe7mr53401926d6.8.1754908442594;
        Mon, 11 Aug 2025 03:34:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8eff60esm18546387a12.13.2025.08.11.03.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:34:02 -0700 (PDT)
Message-ID: <0a3698bd-01bf-4882-b41c-426bca328e40@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:33:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IljmdKU56yzks3RvOZZ8wyYEbPg8TkN1
X-Proofpoint-ORIG-GUID: IljmdKU56yzks3RvOZZ8wyYEbPg8TkN1
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c71c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=aS93HcZ8ji4XsMPHnqgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfXzmIl7cQTf5y6
 GQ45vRvsuGVmmj6pe0FXpHNI9nd8JIAGZ56VuhILh2VvPeD4n/mnTpSpii/OnPAiwmGVvBQWZgF
 MB22PwMFhzCrc6C0O5aGFBuoOyiTR3MR7r9ZYI+dLM/JaCVqiXWEvRmiuSlNzXWD7Rwmo/hJwGh
 8CbiKIdb3D6B/72VfQFMKCazpyUP99svKYWU0sFHccSzeiiaFKSGpPRp0jfIgB1hoDQKWUMxV8I
 JYzB6ubvpL+cz9s93wfQYOrFlP+sOmo+ZZCqX1DHbI7dgm5LyDUxZ2mOpYsm2TX4rDtzPqfSbOj
 b1lDePPmAWwGPlmI+bekCflaMX4euzbB5EGJ3Cjtc006MPI6dsryclslzD1mga0P4TwHC9csZxI
 dC2hLqNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On 8/11/25 12:57 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
