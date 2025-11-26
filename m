Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131CF218821
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 07:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764142960; cv=none; b=kLObn6M6mQcOYjAldqbs2csxis/43NbveLczs0k26A1Ridva9axDwdyuvUVCljaRPFNG/0x/N5iaq9CVPNec9AyTi1+MvS3eF1AX0f+d/nPUF9m8CiV3zYPwTkuR8JwB/PkHJNL7RgwXtN+7DRy1TDgN85z88AGsLjm117tcNVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764142960; c=relaxed/simple;
	bh=gj67tU7fCgd4qMli9x5qk42NWTlcPG3BdVQG8dfKkDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9A5DilaBlN5qUhCezXWiTbMrQBRsy2qsoakZKPRB0pysK9pYkDmKedPiDjT3QaB2QSac18k2l7N7erBoBygN6/j8wdgSy9UVg6zqT90oziq7hhhZQaCLXeaX8/yH02kRGyTYU+KTW5QaI0yEXEhhX+NQwV+aB3whCQrA+X/jDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNZzUL+E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBAEigi7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNZzUL+E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBAEigi7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNMNbD4048890
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7s66tWLAOdIGl88Krxo+sxqm
	YAV4Fj6MYm7lnan6hT4=; b=SNZzUL+EmsyB2HI0CkDfucjphKmkqVqpA44lMNvJ
	72gpb3ivf7sx1YH1+GgYkTBbLhrVica+cdXd1s0dFw+ruihvm3zOsbqKYfJIQIqw
	zYNrbPGX2F1Rd8v4+pcXOrggYf2MvbClYv2+cPXZnv+RzQWcOE5kG1kBQVjZ6OL9
	+ot6Wbv4RiN74FxzH+Ugvi0pqn02vXjcsJwIZVvTNpr1IKQkyhAFbZkngKF66ZzX
	ZG9q32MWckZqqh0IbVNTfwSnxfVwM3pt72FyojRkmDQ0C4EzmghNRF/0Ka7jqaPs
	lRH70SF0ih04rwSnJEJOAqC2UffaqGL86GnHU5ysjeyOEw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nh38h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 26 Nov 2025 07:42:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8805054afa1so146787796d6.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764142956; x=1764747756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7s66tWLAOdIGl88Krxo+sxqmYAV4Fj6MYm7lnan6hT4=;
        b=KBAEigi73r5cSx9zWQIPRifTUpzyufpky7jDL51JNOOH3akn29sJSmYH+zv3TYNE40
         buYjOCJBSUE+C8E4EYt7dJpd2hXjigRaKyujjJ6KnzEoK9p5Z3+KbfelDlkUFlMhFsAX
         BI7AUdng6YqPw6rTly/IYGwPnWXoPuNOCu+g3nu7YrM43t0vErzfp0cdpheRqktKF7ap
         bnal9/8LEtSA+nfcN3GuxjGZwFJVWWzbMDhQLStJQeZfQk/d+hqsgmIY53EojUO7wZUJ
         NHNOva9c2/ifK6owodDEEPPoBP50Zd8GZFV2kuOiV5hUuO+gFePtviXehfHsYdOEioiN
         XjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764142956; x=1764747756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7s66tWLAOdIGl88Krxo+sxqmYAV4Fj6MYm7lnan6hT4=;
        b=ru1qODzdqR2XxM7kElwmUms44B/OoYaY1JW/4BSD26m1p2OTUtO/qhKgGS7d2p17nR
         E2HQo6vLQlOqsqAwJZpAkTVan8CjCSuEA4PxSBNGHZ/NKdDRHnQlPpHdCd8pVUNzRQDU
         YGzR3O2G/8QapKK48GjcABfDGCuZPFGf5uADiO1tSRJbSZH4czQlqHY27zJuGQbwD8td
         J9Pf4OMCV6QVQQPA6ghmstMY7eowKIaEBkCHoKux/51jn9PNcWdm6yZAtwUVeUjR/BNf
         UtR9o71Pc2zp7q5QkRPGwbIObw/P03wy1b19OZFYPnOBoA1+iQpufIKepPu/15fCGhCK
         K4bw==
X-Forwarded-Encrypted: i=1; AJvYcCWQI+RODxt5R13KRFAUb8Tqw9wHs0cPTZvE3MAI2zHqQcOZOaK8E8xgkHNpPH/m8Yd63AbrFnJnJgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8F92TqGb012764l5xKlTQnMXbldIa2SHTnM44xypmR0p1dEIW
	flNpkwQkXxOgrXU48TaE3l0lvivzwmKVHOS9iqFjec1SBlfpZTALqhjcFlas4sHtc9xC9pzE3M3
	fx4qpbT2RDkkodnbmf0LSDiCc4dFmpXz6/8euWy8AVZEZLYCpx05pVkQEEip02gU=
X-Gm-Gg: ASbGncu877vd+R7cbNajdWKNtfl9V4FIQKxm49CURTqePMwg6XTjIqJ792HeWJkCWep
	Pr3YYpBkSbL48pKQ8vVI/0tjDKBuL+0058J1Jvn0Y6AssOOFmkJ5yha012wAEw0PR0fe1PL4qxf
	OLHITfmV4bw+G/oslYoSCyV8iDYIgEVVUnkXMq51DQnYdlSi8afWWNFAGm04AUahryVMPIEndlp
	1qspQBZZIdf9h52KR3GgG+yVGq0eBujmjfgzfXJs8N7qPE7XHDpKuDUJMEQtWYv1GQqULot4lyr
	ZKjpqzeiCvXLT/4OmI2hvaEYzraMR4pbyUh8zaBv7/dS+RR3ii/04fIMANBHrotZjwuAyBVxkJN
	uodMdsp5XVU9E77LWJP8VZwGRs2OATo3E64v/X+2Aq4baSFmF/V9PBJPiuMP6EIM78cCePzLNsv
	R9JZjm10oLKKXJQzRjsE8gyhk=
X-Received: by 2002:ad4:5bc7:0:b0:81b:bf92:8df9 with SMTP id 6a1803df08f44-8847c525a91mr259026056d6.43.1764142956229;
        Tue, 25 Nov 2025 23:42:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZMVHggZd+jKgb8/wJ+L2+9g5fNlc+Zq2G0W23ZV8O5OiP4l9vmjzhIAMKsJGh17k49EVPog==
X-Received: by 2002:ad4:5bc7:0:b0:81b:bf92:8df9 with SMTP id 6a1803df08f44-8847c525a91mr259025766d6.43.1764142955730;
        Tue, 25 Nov 2025 23:42:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5c42sm5651468e87.82.2025.11.25.23.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:42:35 -0800 (PST)
Date: Wed, 26 Nov 2025 09:42:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <vh5fjylsjxahu7fzczssobe5xomagia5pehcn7e4wrpcnkp54u@fwiwmq2q6ob4>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926af6d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6P0SHjgeIOX3w0gCKs8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: bDBIQVCU4jpoRJXkkV3r-G7XHyy-jrdl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2MSBTYWx0ZWRfX9TkPFmljcHnR
 J1oe4qYkM0CIVm17zmQguOJWespTImgifKks6Kvmdc6TtYvJ9qdbI9+9ewZQFqxrGOgV5DMFfTG
 xZWldvRPdkBdetmjzcnkCGyUEGCx04+wPD9s2qX3vvejMyA6MZMmQrNHi4Mgl9Vcw2cpe6jvEdz
 RF6mZNfGKmjIjJBuhsVPP8o6VwV1vE1sV3ddOmGeB3j5M6jeWqCxcszW6c2bcrpPToUMNHVsa39
 +lSDITmWj/O1cXL6aXqt3pFvvAGUAi41V+kPX3wIGy5/ruT+6/AtduoeMCT3PRIfkyYfC8r5B4k
 7ZbmZfHHi72+sm8rZiQ0ogQdZKg/9PY/nc5f8WTAcpLluiPQzipNF8QmV76flFHaWmdZ68bGt4H
 j5sNaLlOyaBE57kI1ChqYzeRTYOjrQ==
X-Proofpoint-ORIG-GUID: bDBIQVCU4jpoRJXkkV3r-G7XHyy-jrdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260061

On Wed, Nov 26, 2025 at 09:45:50AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
