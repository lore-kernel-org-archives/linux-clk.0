Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56FD350A3F
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949952; cv=none; b=Fs5Jaq2RT+YyWofU1YulnFAX7TzxBhQzUcFjhZqNf0nI7cxraPUBQwyJDjAXrXQKFPDOQjwsKkmsSSaX2kUWzOZOGoVCAOgmKwLmwleinfpbK2qIP8wpvi6iYcPikSATE/uEIzvBkp8zFHCK8h62yWK4wfElf05TUEPj48KyNGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949952; c=relaxed/simple;
	bh=8P7e5hNZYHOujkFwsZ5ZAK6asennYcD7TND9Zj3DXsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Or59N7dgiFKIOno+bzsM0rI/OKjXEixc+iI0IOLrPFVyA68y0VCZ6NYWWAzuJ5FPq243woDchp3Po5vAnv+LFNLjxOyaPUnjSrqU6vv70+FwWKCDBK8K1ijf7U+0kxpKB2o1tNBjs7VsWh941A1X3C0j7+Mbm0s6A6xENmZ8NrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZm5F42Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkgmY1r1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZm5F42Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkgmY1r1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6091qSgk3324804
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 09:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaGi9IlbEMfHTeJRe7b7kpx5l6QK4PcdQIDwe0BXtpM=; b=ZZm5F42ZwvR21N10
	O3lZeJyAD703wI8IrSNnHhLd3LpiUTAyRQPWyPxgY0EUUf+RbLTcP0zipTMi5Dmf
	KKA355yB3mJMG7x0dvVwhYTdEF9+3ssGzE5vOljiba5d4RnlQifhCGaWi7dd8DEQ
	ieyCry/jTRSFUePSpNuSQU7yrNiC68quX/qtB9kIlARuqgk3mXSzBE3bLqeBhrQy
	jftUhIxxQVAYzT5GMUWTzpF1d3MZm1lAj44FtinSPWwq1DlKxgvWbt0utSM09rxa
	eZAJPgn7MdIKR+mjIj/2TbOw3t5hPtbv/xAb6YYLM94sU66xMETUjmBL6Tkz9tT9
	ij/Ncg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6h60v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 09:12:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1aba09639so10211381cf.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 01:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949949; x=1768554749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaGi9IlbEMfHTeJRe7b7kpx5l6QK4PcdQIDwe0BXtpM=;
        b=FkgmY1r1E73f8MEGbhzxosbmMmndWJM1PLRUXjl3/XrueYSlfm0qUa+32fztHylG1h
         nlIcmjaPv1m5fQdLS3ckzY9/gkBtAQkfsRaFRoQqEdL0xuARGDaIrgcnE2BqeeeK6E03
         64skzSYVMkwQzq7YTbvU9Xg50B6wDOMYRGWZsLTs8RoOdzMTYDogvX9tf4r8gBYHbl+Q
         tlPZExMbnBrpIzA5QphySVxCIu4qkA62deyIHdY06LDF9uKmDDIr83S5x5XLynOt2h4b
         HP8K+aRis6nnPz2tYdn/s971wK+QOz+J4FMGIbfw7RCK050tZFesV+6ReYyQGL53uq6t
         Husg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949949; x=1768554749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaGi9IlbEMfHTeJRe7b7kpx5l6QK4PcdQIDwe0BXtpM=;
        b=Q8a4IhjFcIu3gxJSobW/rIj9wh62rIwq7rGiWjNliSEb1jkMhZitfTLTed/MIIPO6i
         TvoKVVoedTESef8sfjTfVg5kTovp7R8kD/bfyFj3iVqNVYslBYu0vE0K+u6e9Hp4dkYZ
         YXQufdI/XZhthf9q6hhXG6pl5GTGBn9XDRT/ET2Z8BOTeO/J4w4A9f16I5lnfn7+/u+O
         ukAfMRqnCH2kM2Ax+Qoeegu5spWd8vHU35RB0QT/jt5L6ENNMXV8cTUBD7jIg2W67QyW
         5AzPqUo9HEoJOQHtaBgVPBbVS5JGrVv9KGPyagE3c7Igb6+kUdvaMLMA3Mpn4KzIvKc2
         nTkg==
X-Gm-Message-State: AOJu0Yy4hb5bQlnWeZMof8R5ONO1iGNjrdNMuDbsrMH50SjnYArx1FLL
	XcU9QclEhfPivtQLnoI8yoGoxIiqr46IUjHy1LpTjXn9uTd2mZjUz3BqNvtQ4wyrBMhNicp1WRO
	HKv+zNGCoAFwpUAkzKVLMVwDLRTpr11bmsCShf5Vzaa43mRt0L2FMYN+V1rI9Avo=
X-Gm-Gg: AY/fxX4DadVzOcNlcyIPNY9f+TO2XdBeLCQF5vtZjhJS1eAg9Fil1H1S+w1qIS9dZ8l
	Qww6k8C2HLboq/E9nKOVh5pgX6DfnJfuxpkvW4vl6UuJeigfmlHIY93upTWKtkpvOSiefBFRvtg
	FWPxjlyXkEuObXG4tysYuirKxLqmUkWfgrD+fKI+asK7x7GHSFzXhvhR/G3JkX9174GuOqTiYDa
	Tzvrn7T/xj6YuivS+JZ3e3Ib62gy5S1ML2+HHqO4CwtQEVtfu/4+WpKc+tjJYHPxVRGCuMWwdVm
	ezUKY27m1QkgzOTtH+5WkuVDhu+mxlhtkqpWVTjcz2ADVjy+bLRBKgzevM7Zg1NTyP7dk5MkhnB
	pMVzIRcGc9txbqkLhzJ7aDhHfPuw+XZ9w14WloUDKGjQAL774eECpOD6HBLcLdf2pAHo=
X-Received: by 2002:a05:622a:1a9f:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ffb4a53533mr92196411cf.10.1767949949049;
        Fri, 09 Jan 2026 01:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtbj4FKuVyx1u4/ajD1sK5wvw9cZMiDon0+PCeyeNijYuuoudWuJ2i45bsUb52XtqZVliz9Q==
X-Received: by 2002:a05:622a:1a9f:b0:4ed:7f85:225c with SMTP id d75a77b69052e-4ffb4a53533mr92196221cf.10.1767949948583;
        Fri, 09 Jan 2026 01:12:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118d3sm1071026566b.47.2026.01.09.01.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:12:28 -0800 (PST)
Message-ID: <5421b535-ce65-4f6b-b8fb-977d48b70a76@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/27] clk: qcom: regmap-divider: convert from
 divider_round_rate() to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-16-535a3ed73bf3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfXxWmrgK2gvXZi
 mW+V7SDVRqYI9tIwxaHzBAtYj2rxGd0ecgn0260S95V81WPw11Xlkzv4NtMeiSx6uSCIlQrir7K
 kX7gwsNDSNWxj3bHma2eXR8/p+weloTt5EqSyjJsMBY2AD3/7eTTrMmnYzwhgq6b4A7AMU8PgkO
 TWOu8IGL+qP0Cft80+sAxZRt27QCifH4vYRLvfQwNbshIYDEmA7JBrkhPsWOLe1rwnBv+5UykYo
 n6uoZCgyKF9QquL1WrtQMZFZIu37eCndXDdNuWBi3koWRWuH6sSYMOfan4D8motLuODF+jnF9IZ
 T+ouZGOLPGMXXFMYuRGITgshQDCg31JSBKJbXJEcAWwJq+nVIZvQDlE5ovFzsVePQdUIxW+IPF3
 G8lcs4nWGckY+sxqVVZaa75r7vWgNc0AGyZ6o2j3fZRicZnKzc2b9JYUlPvhuLWMxKvRdiXkeJd
 Rz7q9DhufvrFDm2vjXA==
X-Proofpoint-GUID: jBnTe2SHA4nwikfap0k2MrXCb5GLzCTL
X-Proofpoint-ORIG-GUID: jBnTe2SHA4nwikfap0k2MrXCb5GLzCTL
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960c67e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=MmoDKESpECQAgM94Xi4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 1/8/26 10:16 PM, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
> 
> Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

