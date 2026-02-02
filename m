Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E04357A52
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026698; cv=none; b=lQtQWN2HOHOnrspahFuVWcVYDmXID2Y6Sq22f0vUPlbk/40NrF7kbe7CL5J9+Vi1t0+Akh0P90nRdqN2vGST0anJpaLIguGybkenVX8MAIkjuLnWcYYBMs//x8+Anr2uuvauZnfX1V8HAzjvgCF9kjFMzLbriQsEgelY9WJFKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026698; c=relaxed/simple;
	bh=m+Pz+g1MKmpagp4K1y973dUYQLdMnLtzIyPiHxKzHnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnOYmvTAx1jwvJK0Gl+BKcvaqO8rnI5ugU+2o8q+8/vfls8Yr+wunEiLLDupEU8hfyJD/8R3GXiXWUylUbI0kgJsbpCoRb9lvp8KyLmFEaAlo3hZ/tV9k42t4HSeEpT1eSKZ9IL5hbAtpsHHHjj6VbsU4jpmezBuObCi7/4vRaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SUloUebv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LG31Mx1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SUloUebv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LG31Mx1M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6128DXHA719499
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PU4kYGujVwJTzzKhrRzpqzSA4ZPHoHG0oriVI8+8rHo=; b=SUloUebv3I3Nsc6s
	rHuIEYafxQ8lN8YW90y1h3SSvFu0Hjm1mB2v1KP0FZYo6lkyeVFtjkSHwWebo+QW
	HFo7L4nDR2TJgpG3QqIt6SqnhzAZaKsfjYvCuUP6E0q/sVob3W8E1poHt5BAXGfI
	YvI5ViNJbjENJ/bWNhSXpqB0/UDepajHdQCI79br7TMDhd5V3/8K2oaUNeYgdlVy
	0NwESNEBCTjUnEJZtLXJJRsEHkcfNcsRTm7MSnori6KrusBjTlLZp7msy7w4BSPQ
	x9xGZGIjXachV7vMFJ71rjW3fN9vYWpZz2IH6LSQ2BSmuqw5g0H61EFdP5UcR0nt
	1JuuPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arecx9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:04:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so111884385a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026696; x=1770631496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PU4kYGujVwJTzzKhrRzpqzSA4ZPHoHG0oriVI8+8rHo=;
        b=LG31Mx1MYTQUNZgdCzr3+jqvI1iypNSn38GobdyTACSf3kvXHZGB3dlbDoFwmXdsrw
         OZYwWDUB45YNJ9+MDf4H1n7gXnU8JnOqYQ6mTvr4RvmBwRUCqIjnCmV/MMxIV/+fskdP
         J45dZi/e2D62YPLyzRjginUtQ1kS68XBvgtzspEakxCeIINe51eeXRKz0+MAdc+DIz+k
         88Ors8gpa87io5szhEzPuwg6Svi5CON3hdCpe7Hh/gGZK5W9Jj7MFgOcfiw7Z53BQlts
         62mLeAUk7d1/F8BUccnRfcBBoRwMn1hWRwKgm5V5mrYN/XI24zodP4RBH61Q+zcpph2Y
         A+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026696; x=1770631496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PU4kYGujVwJTzzKhrRzpqzSA4ZPHoHG0oriVI8+8rHo=;
        b=hc2bNorl3W8hNZmxURxLtJQ2H+mh7gkercp4ZVCbT/dWdwhfMIemy7NqMeUD6lPWKw
         HNdg/Sl9Za7PhpZYlqCnZn9Jy4qe+q1a3Tv3/NVLyy1/0+MkDwe43xHhr58TiC79bHJB
         kwz/7B0vRTs22js1HDwbHcvWO2N3tFWtrqTFGJi0NeVboq/4fpp2D021yvZPhYIWxaXO
         g/BHtBAudf3BaUKWib1GRGBZlTkWbgmmOFGhLp93cBKl1Rmxg37NB+VXb0xb8toX0zer
         l3n26YcxV6FWPCq0iQbUSS2PCFK8x3ukt3L3LGjvCBdmAA0asJM0+ChyBfmheNyG06nL
         xmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa6YpQyz58i53nDCwpTKoMSIBGmkSMsEqMpWTsywRrrP3d5sDfCDpQzebZ9uVAVp/m1paBQNtUMtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn9LlRK07L2REaBpOnF3y5nhG0cT7Aq5+YiMARy+E+2++Z5FO0
	SXtL8VJ062936bp6nDgrg/n0mjAAaZY7mDaVKkrwrqDcnfj7QUP09etg6D7tvSkEy9/rP9FIDfz
	LBOpPGZmdZhYvPqyxt0BmCchmeDZGn4Pdk7zPPAs0dzvFGUOXY48HBUG5/ikb6jE=
X-Gm-Gg: AZuq6aKSD5Xys6IrIe/y4Ed8dz4dDIfO+Ly0M2wK62cIjcqz2hCuUY3OQY7BCOulPBK
	bq3q5aYLpLkZIZ7rXNz7qvDbn7S5zgm14WvgeEOtYKPQftYdvw2ei0Rh1lKckXS2igjDFYG838G
	dmE3wKerxHkntJ1ORAjCxFGHenzVUP63g1TSFFoI+Lg2IBKHgBsw1LavnkcqPC3d3rm4DkBSjvq
	fGwkr/2jZSSg1QskwKLQWmVFDXvLkNBdVB2Fgd3Pn/Z2TpUaIV3xrNw0kh0/boRntcBYmt5wjcu
	DaClo/0YCIeKONcAzomIgCVkPJadl6+0GNULmIJSxYoBkV6Pp610f1W8psVihFZK92dxHSXQu/P
	MwQAVNdjlv6Zrc4lwxxaa1ACsxoxsK21KC+r7u9YBs/PIECTvebnjA3nOZmJsaykvs1M=
X-Received: by 2002:a05:620a:4506:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c9eb27a8camr1050101785a.3.1770026695502;
        Mon, 02 Feb 2026 02:04:55 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8c9eb27a8camr1050098485a.3.1770026695052;
        Mon, 02 Feb 2026 02:04:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm854116366b.67.2026.02.02.02.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:04:54 -0800 (PST)
Message-ID: <354670c7-2845-4786-aed9-40b08020c19e@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:04:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
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
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=698076c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rhtRbuhOeWVFly8G_7UA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: CbD6lhsDjtWtoL_Ihitov9eGDjI9Xg45
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfXzqe/brVvd5pQ
 1S3Dw93Ct54fJDGj3V6NvchUAyrCZh7AibWp+dXCPMdf2y8IqQM2x4//wrk58IjQ5NQoNAHueNu
 vQeGLG5GFjey9d08Lu+yORJfaVJPJdpWA+OiqWKJ/FDX11RzMt8CyfKX/fliJFu/I4ao/0JLO2t
 fHNIu4SKYvCmVNVAJ8Uqml3B8eB0rEa43Mb77UNzNqXS4IgEXsHn1dQ8LRx5azJAtheSBQYT62k
 OltHaTL6JzjR93vqzzC6N2ids0jGrALR0ka+DGWORuJnvhoKvC0qqwSKUAAZn71jZ39QGkvaZBr
 yFPK5YMqPyaLKi7Req0bOrHN8O7sd6rH1WW3V2GQLLFOHVoL/P1mYoTt+6ffEpdzD07UjjmNl3u
 DDBjqCuqsyIjWnrMDTXN3gvjuvSyab5UCwy+S2EXkqc7FvGfcJzJTImFn7sK83Quy8LaKwkIqEv
 2YMKnQyBxQGHYVwB3eA==
X-Proofpoint-ORIG-GUID: CbD6lhsDjtWtoL_Ihitov9eGDjI9Xg45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020085

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> The OPP table for the Iris core is wrong, it copies the VDD table from
> the downstream kernel, but that table is written for the
> video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
> rate setting (which is clk_src divided by 3). Specify correct
> frequencies in the OPP table.
> 
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I guess 'reported' is more fitting for this series

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
