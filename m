Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E34352F92
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770838514; cv=none; b=BoE1j0BC8m+xyut+nrh+yQAtgd0EFCBdW1YzgA5qiA8e/9UN/owMRRi3cRCbScldqYvqwYYoIKzTxjyfi9csDwjfmhkjUqnTM+2z1llzCJRqluNEORQwDKoWaWQB5gFzo5a/oXQkvV1VmzSEUtnzlzQv2impiZ6wGyC/0QhLibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770838514; c=relaxed/simple;
	bh=BcQUBtC5RaVht9w08zC9w1djQ1okZSAYTrJTdUH5Oak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drjXVKTDaqNgLDC/qgjSlnqtAZ8LxdQ++Z3gGscOMgo/yujoOvjyT8u+Mw939e7mziWzaj8xmoz1YV/oPtWiLbvBrQEIUtL8ogtwrJiTi7geSNmETdLnayL1v0OEkBlhefRK+WQJ2IJKSKmO8JzPgDwrWWU3amWRjGM+i8Jht6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jH7nDTmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMp+aZNh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jH7nDTmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMp+aZNh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BIfRoU2871748
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 19:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/MWaIqBoW7l6xDUumSvFH+oS
	13ASzXNm6j1EShT/Xk4=; b=jH7nDTmwyk0drA0GJFWlLJ4yYgRiwO90r30teZBg
	7uypO/GzJcbJ8nP+EenHUkskWrcXGc1QAEguxy4GTBg3SuBu74pPPHSbEoyCsKEi
	gjpEn3b8jV0z9othIg3C+eabhlXxepXvEKjCJEVzq9wIN8mxoq9ueN+PK6XGewdB
	BKoZGZO2yeivrHoOQ5pc7G9+QjK6ZhUtbzQ3F9g94OnfV+Pobvw8RY0fSyeHGNCD
	orBoFQOfuyvW7lr0kZ2YYNnqmy2GTn4nyiVsAhOX3PtDEXZ+RdFrOvBqNzaTa5JM
	IJ+SBpChbvGB9MToa6RpvMsuh4vvpbxFErKigfXTGmKf2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8nr6dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 19:35:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso2695714785a.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 11:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770838511; x=1771443311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/MWaIqBoW7l6xDUumSvFH+oS13ASzXNm6j1EShT/Xk4=;
        b=EMp+aZNhj0exRO5T9Ufab9OkQ9uUJt9ff5uzkB7ffPPWz4GDj6caFIKagUCn5Flg4W
         OJJjBXUCoFBN0ca0WBUTWvscWZIdlA2kyfoZf6yk4W5hwkyb5Q/PtmzK3htQYKnJkj5o
         T5DZ4+7d/v2e5tQNbjrDU2gxo9AVX67xhbuEscf8A3CIanj4DYIq+qHsZWYnoButV1qW
         vYwvaVKBDS5vPJcgyb4KyjWIOzQRmSjBFm28qnHi8yo4VBpSSxDGygSzYwWcb8H8+OII
         1Npbhyustf/5YEB0ka2QHC/s5pOYey5A81LGiWanv+kosDzHmkG1+eB23fPha0ufNQxD
         cnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770838511; x=1771443311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MWaIqBoW7l6xDUumSvFH+oS13ASzXNm6j1EShT/Xk4=;
        b=K6O8yYfa2o0gboXG7+pxaegtYyRQ2mf6nDu0S9dJTSbuSPLP2K/UHMSXll1nceJHCL
         GroLXXck470tYqHQeHrfq6sXeKmJc5xreWNRmnxcupCCWf3m4brfBJs6FjlrlFDjQJiQ
         0R/ADtwghprW7jwdIrVuw1z6VX7Qk0SWdaDCzDPuSvErFxVmHqc2Rrb2MNUgaJGXflKC
         5Fhmw0XKYyAKa4eNcCUws9LNDLaQ3Ix3umh3Hp9FOph1PTypR8VE5Jyfdd0DR492t04X
         DO9Pt1iMd96lDhxPj9VXJBrTs0ASsNfVTDH2dXRJRFeAtqmyyeS1TChr/6ZrHjH2BB4O
         tkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBjE1EDfQJvXsukofsR5SLcbYf+kI1Fv3+Mu3M4+azayP10wES7TUN1sE6CK1bkbpt1gRHEsVgqoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNOB8nZLDHRkC/Rby8LFaSme2e0jHv0ebJDwOBlW++KDv38cv
	hqSDfOuLcJDvv+qMaYR3/r8MR0KJgeBapGrxHn9YrdtLeD79ndbw7gyIAszvtPpm7B+iRg8SBgN
	8uuvGL/z3Dh6N93LcNKGuGuJ39AaCJoY6T+niyAJucP/nTtHrBLCzE6T5ScQ7avo=
X-Gm-Gg: AZuq6aJVHJsXsDGymQ9LonMBQnqf0jhM+1sZ2ZUkVONZZT25r/hi++B1p0AAZfmiYy8
	FzAB/QPkofj4ZChJGd3tBPTQIYVqmz5swJJZIF85/KUdOQ4tmuZis+1s7FxRTZp5c7q1sJS1keQ
	fNR+n+6ApxkfgxvR8fTvPfHZQs9dbHjkRuRC9I/DYrsoED8LG2UVjfkcz6ZFa4OR31+3CAMIyw+
	7eQWZ+q/AurTEe5eqnmiIOFhdkpjXWhncq9LwqhQHkPqkY8EikrEHBGoYzeKJGtdwPE+2fasyE8
	okW/sEAYS1EEk1f8vdNFwbEV7K84snDw0slo9ZnLMgPbMHUNigcF1xhQJxZbXPi2pmNU2moYBxm
	YUVjxDMXkWmlN2znX3vOc/XS32Hx3UyS6CegkBIsuQiP/AFXhm5QrnUzuS+uFCmGP+buU2iyXjp
	y5EsYxkPq2x0q/e+FCRY0ma9o+BVzkDbv/3vc=
X-Received: by 2002:a05:620a:4407:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cb33118c00mr48388685a.53.1770838511375;
        Wed, 11 Feb 2026 11:35:11 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8cb33118c00mr48383085a.53.1770838510850;
        Wed, 11 Feb 2026 11:35:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387069067a1sm4089271fa.34.2026.02.11.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:35:10 -0800 (PST)
Date: Wed, 11 Feb 2026 21:35:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
Message-ID: <pzffmjl7crico34lt5grelvothuukv55czkgpjupeiaauqecnr@ivtu5may5nmi>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE1MSBTYWx0ZWRfXz+lwNqIKRMCR
 wZ+9PAgs7DrmUJDxtAUBLWgj552t1+Rd71gFJCUqMIXmHxYpkpBchq1tLrEYBXuE4G8mXX0/lkJ
 2glBSij19DISej548zvaVMHZ8S/rT356hMU+NGEm7LPzHpJ5ZrmyxruttI/lv98+pl8bDEMDtFn
 onenxBNk2DN74Y8SDnwXxLwbEjk9J/bvJlkkdwjhwCypIHcxpc1omISjiOeEHDN/OzMM6JH3Udk
 vtKnOfeLO7tNZeaKc278ZBwDAaIiMfXeV+GREnCAqTgm/SAdu/uc8ilN5tjdI1dt1vZKABakoeo
 PNuuiRtfxGU+UaDMUMDYZnLv/F3jRRUf6Su7doOvhIErjYEc/8LrWJ0PpCMrH9b+XlSg98eHrkl
 pbigifO7jbD9xN8KOtTznBrsY2a2AkUZl7hwLJZr2UNPXgfuIGQ7m+G1UEMy4lfFTAU42HxR0Me
 QzzjxA5/YhzTwnAw9aw==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698cd9ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=liEOAQfpDFVzjJCTmxkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QqbkfOOB3L7jp_6IIeODGYBnn32tVJfO
X-Proofpoint-ORIG-GUID: QqbkfOOB3L7jp_6IIeODGYBnn32tVJfO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110151

On Wed, Feb 11, 2026 at 11:52:06PM +0530, Taniya Das wrote:
> The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
> Update the divider value to generate the correct output frequency.
> 
> Fixes: 874bc7be1e08 ("clk: qcom: rpmh: Add support for X1E80100 rpmh clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
