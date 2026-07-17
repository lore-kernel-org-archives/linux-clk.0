Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A0F3E95BF
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283106; cv=none; b=IVZE5tjnsqo4/qLlrReL5s0wwcQCT5anqW4fCSU607J2bVRdl2vQY/bThN0iw8fZyZ31IZgW323gW0w22ydLDDGOJWG0+zM2m6yBCJrLYOd+8FsMiZIOlhshzbQZhHFBtmVpVPmiXLigFboeh2KzLrif5igMeq3MzRx3AoX2n+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283106; c=relaxed/simple;
	bh=L/O1iAq6+atDhuVBjxvUN1vUvgMn7GUQFHZhyFnCgEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGh6iiK4XBgKK9hA0cma/E2XwYbcXGP5W/1Qbp30Hs43VcPcXY3IsOzVEY0/moRHGMShKkeisNp112lLxyxVuZz1eqtcTZi1WKePi9Pt1vWLdOqNUHwRzkueuGFTWjuGKGdPvbklI4rYzxrbh3cll+V8ZXFxaXDS8GaheeAi5rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHdtxi27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfFQtuNQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHdtxi27";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfFQtuNQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRDV794310
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 10:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6NcGdJD2SJbC+6pbz4eT093TTMm6bTq2YROpOJJcrc=; b=ZHdtxi27ytVvjJB5
	MJXMJoC9oIP+eK/dNfbiVEWyhsgduyq5QYO00PfHTLRCWR6Rl6sxdghvc9He/XE7
	lTuLWUuQvlYUTEo788TEWmG4eV9FHH4PJ1KaKETz2meOeo/9O1HJ4PDjCOQc6Itu
	0ZMVAWkspeoqz0JliDadxKDQKmTUAklPLmIg+ABTK+eQpXP7b/wDlbP67lKOXZJi
	fwQjxS5Lj6JqBSWzJMY+4arjddUDDBzqDyFPyIHVpXaa2mxbd3Us2oShxuQ+qjxF
	BLPefinXXfZl6o8v0IxVNnAX9IQBIv6kj+tfN6hnc4y9F8RTC5fIj/Azc04FYN0r
	lgn6Pw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8k817-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 10:11:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9d953b71so8803051cf.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 03:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784283103; x=1784887903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6NcGdJD2SJbC+6pbz4eT093TTMm6bTq2YROpOJJcrc=;
        b=hfFQtuNQYWsPK+KB94k+60J5jY5Z9/l+a359qJKY3VP0bgV8RgYBu1TcCrc0rrSk+u
         9Malm4V+cSAdTDziIYssLKjKWbWkqlWEqFm1g5dXpBXwHjlJoulzw+TbT/VBoWq+d2fM
         TTYPIvo1ykda3YhT6Yz4Ej8bR/okUDRjpdxenjPSTCBOkGnsiO6Noeo7Wysq3DiyHBve
         pLZfimOzEsUCImAVsUM8G9A0G0FthIrLy9zTKU5kSueH7nTPdJoCvy9GI2YD+O0T19T4
         NXnfIm1/OpI9YVfIg/o7+8FlLF11OT3gKAuNAMYwrWxRVXRLWkncUzThXgR0ykvduOHb
         9sfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283103; x=1784887903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o6NcGdJD2SJbC+6pbz4eT093TTMm6bTq2YROpOJJcrc=;
        b=S3XunAmj54xESylTMS/E1vDbCan4qR1lLVOEWaSjXFs9cqC5Dc1OFEgjt12hlZftxg
         eiBA+cbChCeLcKzO9i92fEj2pE8RQ06v0g5gb3SaEDaJ6keNttY6fTz8p+tpxvR6uMed
         wLWp3NYXftbOrPZOAXXhg91VHyvYxsLUg5SMbChV0eNxPW8sOnsQYE7jB/MbZw1iAPiR
         4knYO8RqnuMPVuYOvR4+/sP65Qfi/U2PkNu+fQvHnJSbPsNhntCfs7IJY4pEWYOTzbc5
         VnC/MdcJa0KwhYbf35qcsz0+/AZ8t/P6qlkNt+rg0WIsu8obqc1Ok3jFRk5QIAlHP94y
         xPlw==
X-Forwarded-Encrypted: i=1; AHgh+Rryw52JRMfUCor0wkEr6wsNOpiiVZQRhQlOvT4R0ErCftBg2zOjaOC3hMupGQRbGU6lbCC4+vcgg+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QzScMMaG84waPZJ1Kjp8AX5ughasK7hb3XFc8tVzw5T+JkUb
	XxheK6ldzNIAAx+ziULRI6EQO7zRXnjGHSHfqN7K6mIwqadwhue57sm0zb3az87FlXh1kC1KMn6
	hvGazUhwXW4tYOp56MF75l2xLizUSqKuwF/KLo2Sa0G2OhKY7AT4uCCAc8sBG4VU=
X-Gm-Gg: AfdE7cnDozaxlb17ot2FUdrnzw8i3cJ//3/NQOtfe5rREsYrxrraLOtzNK5b0vVu6RE
	IrNNMKGkxnbcGg+tFY/3jf7ZoNN+CvPlHJT/dRa0+ZgGt7D6QmMo3THqmjVf7i/kv5sLpZ3aV5B
	KQ3u5oOa1rlFWEh3jkSYy2O/LOMeBNZv9D4I5wno6y3C8VjRjIhnN4xEP7bnAq2Xf/LNNcWxdF9
	ZQDPgRcGbI8bwnlAtvDVZ20ef71KsE2wzS0v4kNdxYQl6fP2Zt0NZYMiGc3Euf3zkyGLZ0zxKux
	5GQtHk5vcAm7uolvJzwJcmjpKZ0I2C+FSmeM5q8+Hdkr8TL40l5DH/iM6+4gAZcagaX7eccxYxJ
	IQAJWlJIWyZ/et7K/SQN0BOiT
X-Received: by 2002:a05:622a:1901:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-5213e084841mr13148201cf.6.1784283103247;
        Fri, 17 Jul 2026 03:11:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1901:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-5213e084841mr13147971cf.6.1784283102812;
        Fri, 17 Jul 2026 03:11:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50b72sm51742466b.48.2026.07.17.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:11:41 -0700 (PDT)
Message-ID: <bd067052-ea72-41f4-a665-2f54242d12a6@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 12:11:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
 <20260713-maili_initial_clock-v2-4-79548f0bb58f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-4-79548f0bb58f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bOOWtjIgGjWFrxIthW-hJQjwS8nLme_2
X-Proofpoint-ORIG-GUID: bOOWtjIgGjWFrxIthW-hJQjwS8nLme_2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEwMSBTYWx0ZWRfX4Dlv5vZbKnPz
 MUxJajprh7zIdyVUgLVKJbOZWjrNjJ6/nTNLuLtqWWRhIAFLnwRmmVQn0R6SMaF1Oa4/9KiS+oE
 lLj6/zTexXys4nGRudWFYuEmP62oJrw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEwMSBTYWx0ZWRfX8/DSaPSU3qTQ
 zyYzgIFKq1LOywyQL0hS+UyC+wBV4zUGLj+i6ZCSoYWwQQ/7voJ7ROlMqKJo2Q8e8H2KkdspHwp
 lSmZJBNLirR5m4UGp7EAx9EP3/+Md12EBF57s3NDQKlPnMdR4D9+Wy42qVLyMW9JyDuZbQoJVjt
 TVWYWB516aTBd6lqhHuHmLbkpP1YZ3lC6IoUYNVeojuHgkqqhVsbK4MGKUVYnZeNAf9hzhBTduk
 Dq7XJUPzKkWqjvs1pAYTq1Cwi9o0XXYbhq3qdbhkPaabT4FkJydcDtIFduQTK5/p6mo4JiK4r0p
 3lb4i70/qrEOoztbhq5pI1pXknKdADRQmxamtW8GGcC7+hGTBYVmFSgJ7CddBpHbTSVvz21EdLe
 esDWvtObrOpbYWfJnA+8o0/3/+QC9crpmA8vaO/NESymgjGbqmCARCii5yvNwyhuzXxXhaZRfQA
 +lOkE1yT7Vt7D98qNZg==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59ffe0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FjjYY-ANMnpf8f3CrbkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170101

On 7/13/26 11:04 AM, Taniya Das wrote:
> Add support for the global clock controller (GCC) on the Qualcomm Maili
> SoC by extending the Hawi global clock controller since Maili is identical
> to Hawi and has few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> +	/*
> +	 * Maili-only clocks: NULL here to size the array to the highest Maili
> +	 * clock index.
> +	 */
> +	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,

This is unnecessary/wrong, as desc->num_clks validates the index in
qcom_cc_clk_hw_get().

Without this, we'd get an -EINVAL, with this we get a silent nullptr

Konrad
