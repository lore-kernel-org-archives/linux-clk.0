Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515F38757D
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745075; cv=none; b=baKOZAOUBqtgDP/p95USic6eU2F4IIpg5OAxC0vY2oZ9z5qhgKmTwO+uA+u1gviHubugD9XYwfZrWNNcBJiN6q8eGOaTSmpMr3oqWvFoommF6mX8XZSiOlMJzwpudPP019dA/XuWaU3RzMCbYzhYEewg5jJTu9YWipXigeQb44Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745075; c=relaxed/simple;
	bh=l/ExgmgclWBFpJpRtUY/BQJUySzP6ZKB9S56fIbouWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dt1WOQNdRYUayk6xnoaH2LX7BZi7XE2gpnXo9SEDpqbGY/DlURJk2AoYe4bFucyYop1Pj48dsYeixinb/lr0795Sn4OAftG+siCl1VPhTjmmxaH7RivZurX8CZ6hvBb/c8vq9qtmBugBCL66Ztigq/0TpLINxzWExa3do6MkeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CxY+WRml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkx7iYpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CxY+WRml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkx7iYpX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BIeXE1325849
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEmK5a2M9tFkK/HoVIYSexS1
	NneCE018ctH6AmCU/GY=; b=CxY+WRmlcatOuDqsP/X63c0rYu0nF6mkVZZZYv/i
	OL16Nyv6NaqOPkWnCjA4i/yYCchKcqs/5Y71a7a7S4DEhLTQzGBVkwFkO9pypiZY
	KpSsMo6GKJN4nSijNRbJ0FRhPPuZlepKtcY/esjci4ETzTKrZKcF7MWSdrda1Txo
	fT2RR4e6ep3in5w54mdNJLqDKijMD1J6x+G6K/lIhZ/vrgw9AlJqXJR/pnhOMCJf
	iSshbAr5KhCBTFLq5eRzflli+sjyp8Pry+3STIPi0G/iEZfaTca0HQqrUB5PquHi
	AW3PFHxQjKQhRlz4TK+NyIRGBSp4c7i0xAbhaxBefm05Gw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4s6j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:24:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517600719a9so47526571cf.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780745071; x=1781349871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEmK5a2M9tFkK/HoVIYSexS1NneCE018ctH6AmCU/GY=;
        b=gkx7iYpXOndueAkbTAHHe66ScIeOoteFLs9yxQ8j78Ak8Geeg3bumAmIiWkbFBtMHw
         OUwG2kHM8mBaQky511Nbkg6JWclxjF/JRg/KqOnvpxWD+TNRbaiHH2eLR9ghMuzTnzAq
         YShK+QbAmhC06h8ZHmcNDT5dKLSkk2kXlOmfenQJdpOHjzLgbaKHxC7QYAy7LUnEs/84
         WVuX/9O3RdKdJsYNUsxzHCMODIxSv78N+QSEySn4MJxTeJgGeJgApi9EvRiDbpOI7iXE
         VCkXVbDuWvjrnN2Lon9VcKzaqCAGXvRbJGqwVnb8UvUm0xdIiQhsYVur+0aOozmCSMbk
         RmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780745071; x=1781349871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEmK5a2M9tFkK/HoVIYSexS1NneCE018ctH6AmCU/GY=;
        b=RS+kbiEr+wP1VqWLlQF8W5E+QnCcZoCGbaa+N3yy1rJEdEwXqIDBcpM/qiuH2YnrDs
         Rq/qbJXJDtVygl8sxCleCqLw1U10oP/2uIy/HqZwNm0Ya3RG4F35Ihe5ABLH2zRRYdC6
         6fdQYxpeiggP5cfcxV6Xr8bobvrIMc8FiNxDnFluAeIfr7O8ULCfjE1uY7t9iQNmJL/J
         xHJUHqdfFBKNugtLfLy2EBMHHWotcKMHVn2VGkARQGHj9Xro2V3Ree5wBx0eVY1vb0iZ
         WQbna4MokioalH0z1uXQYYZL80brSBXXXOoRWYcZuxU6PEd6GQ/M4iR1HT7OZI0XiS8G
         LAeg==
X-Forwarded-Encrypted: i=1; AFNElJ/p1KRco+8ix43QHdel/aFh9pij5Y8O20qBk6gKXscjvzeGRNPKgWIX0gPiymmP5FrEWJEdyBlOKyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPHipb+MaSmbhV0G5gu4O7USIzDOx7rWrDuSoUOM4w9ei2U8f
	9qK47+o/gz4TNP+ql1YoMxBIMtzhF1rcPWmxGmWcsCGjGCsOJVtHVuTXskWHYwU+snA4VIMYr31
	JyJW6oMGjd6ZY3GD+5rxCpxi7onkFBznkQZGa7rFGFVEd56KiBLxc7rPQj8JJ2Og=
X-Gm-Gg: Acq92OECEW0/RLPfQTU7gX6Vbt9soLrXE2P99bGYE8e+A6FGAgvnAhQK2vL2MoHk3aN
	q4dO+y+/ciRa+YYW87hOH7wVP42cnVXRIsbPmYAnjV6iKjkRJgHnGueX/NOxw8uR5DIRHpayFQn
	3awp02/m003fBhEdCr0jkIzpuJmjJszmpEs0YCzVCunHGcgQCVzFsOPWHtf0+Zyvgx7k/aZoWZq
	EIVHFrVkCXabL6k5UJnvtqSUbsz1Uhz/gFJfxhV8+fhqVwQ6PwrKqMvA/9e6p5NNR8UVrCisoLc
	Y27o1exbfxJDJG6JzFAyLRZe7WN1t/rGpxsv5xiE5mWlvv2twDGUQ1kasSv4D2sf5viyYZHHtmd
	2c3cZDZjo4e+5HyEKjechfUubfpigap873rf+46yG4vA1+es5VlFo6NPlJnOjTW4I1EXOz3o124
	DlRc8AeK+A16+oYdItBY1RFthTH+OMPwiKIT/yB+iEYw9NMw==
X-Received: by 2002:a05:622a:291:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51795bfe545mr105376081cf.56.1780745070704;
        Sat, 06 Jun 2026 04:24:30 -0700 (PDT)
X-Received: by 2002:a05:622a:291:b0:517:61d5:2f7b with SMTP id d75a77b69052e-51795bfe545mr105375931cf.56.1780745070272;
        Sat, 06 Jun 2026 04:24:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac0958b5sm31565461fa.18.2026.06.06.04.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:24:29 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical
 clocks always-on from probe
Message-ID: <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: v5RHjL-Y6S7ViAbJLPyE0_2z86qvX0R8
X-Proofpoint-GUID: v5RHjL-Y6S7ViAbJLPyE0_2z86qvX0R8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMyBTYWx0ZWRfX+Gsh+epogW2O
 26ub7UlPOkEdIKD0GgjCoeqs7llh7LPTS2Ln0dFYdrHxE9lZRMMgPCo6g80fc35IYcmfUFZN1WJ
 y7SLyysemcWpdevIGMamd3YG0OHpnYmRMDbYiQ+A9/RS42/sVJN+A23o5axUvOxi3O8Vaj/E0w1
 54RDpfmuaiAwN0saOSjaUvpEY7gUGOfikKAlOYeIOnZY7ql6EXcYDG8t8RTcHnzGlDNXJt4JbOi
 nAS7oVIuNmg+ZDnUpbX5Jd1yrM3pK/OnV7Azr/T1++/ySYChhSAm5iFNXf4h20eVtYURsKn5ta9
 3WBiOL6apKcwqyvgKdHg4EWUNE9B7wTUDjPb2Iuf5Fw4CzcORg1GTh3msx13PF7XRb7b0AbES56
 5bjqjRIACHnkao5Hy9Pbrq7XrRRxOTSCwKT4uFaJKDDfqoX1RwUGbFZyc94Kv4ROGZT9UgNOG1F
 ZOTBVHBkjJEEEcyQ5dQ==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a24036f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nlFWSUcdM5ibWT9Vx6IA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060113

On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
> Some GCC branch clocks are required to be kept always-on due to the
> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> clocks and use the latest .clk_cbcr convention to keep them enabled from
> probe.

You got the feedback, but it got ignored. There is no explanation about
gcc_gpu_iref_clk and several other clocks becoming always on.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
>  1 file changed, 18 insertions(+), 142 deletions(-)
> 

-- 
With best wishes
Dmitry
