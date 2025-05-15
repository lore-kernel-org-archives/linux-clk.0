Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BA6218821
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323760; cv=none; b=kI7qYbZp9ce4ydlvD9gAaE4AG8etLhO2nX+n6Mhr/dRZqFCR7k4Z29BcvlWiTEn4uGy+xsSjiTQPsNuWGulYB/EuYq/VbWmJbHLwaiml3mLeNkFJe28XDgxvVPKKEhQdMrSOC+yhBERCnjxvwfadnmJEZL22MUNm62ItCOjcaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323760; c=relaxed/simple;
	bh=FEo6NTHasI2BR0LBYbvtpmuoiyrBx+Jq0hbw9nffhCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kunJ01Mdc7Wv9yKPJNE1ogYTPcxHZJ3xMe08sY3YKyC7WUzQcM3QcHuUk9D+XmcjJBErIcSPnxqKeOfDQ05Bzpqroqmn0aaE/fclo6VO+WHX0CLnL+gEv/hzrLnS2y2kulb3wectkoKSF0gjPVHL/KgROv9UsnqYQCGHXlqRG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HYXiuIxb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HYXiuIxb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEF9qZ016622
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gp+EaaMTwpM0ikpSFqefh88Lpc/kVGRVyoOOkW3KS4=; b=HYXiuIxbWR1kRIEa
	0J9gPCpFT7y5dr+Jyw6qlYLYMpIcz0wChUrH3sZ+YOaA+yBP0dEx+8btwj/aOGln
	KZM5l2lQeCFtIbvL3Yin+n1yh1GXkWDM1C65Rqc9XW/B9nN6jNHwNakbCjBUBG3D
	vyL6t1OwLl0xOgexGtOj8Kn7y5fSYmbwQStjxJ4td91LDD7qot5KVb9LUu7wkv5H
	KFq/a+tiO93am4fysiDbewBBMkDhLCdWhjYzFzakj/lm0lj6qkgEyoVAmRw0hTQo
	N5ixLMExmiw0L6rxjlWWVz17AwoeFgKUV23aDeqY6Yr9O1P4uiPKfLzN8cGVD6H0
	C90h7w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmptcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:42:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f899c646afso3527936d6.2
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323757; x=1747928557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gp+EaaMTwpM0ikpSFqefh88Lpc/kVGRVyoOOkW3KS4=;
        b=ChVLxTzpRExfxR3/UpoxbsgtIAPtT0Xg297vxXASuT5bKZFF7ylqecUGD/WumQ42UT
         KcksDu+X4O7bczGKmX88kx3b8kpE6oX5As2ndIDOW3zYnYrm21mPg7+y3uvsdlS9pRz6
         117KfvqBSfI47G2deCTrHtj8QTVua0OAhgfjRMGXa9HX+Yc0YJW1C35G2ouadGeVFar9
         IjTKS8oroj1eLQTCP+j/sEjxDiCmk+dZoKt4JOAxpsKWZ9RM7ZRbp6pEMU6lJVJaKMx2
         gHqq+9nSA3aneNpLhbkXQpgLqlD+nfrJNhDRdtp/dBfWhNgI/TcJbRTazbeGn7H2unDq
         xepQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/t15hX9hpLxoUFGyYdMZ16C3nMzy73nZG3fUUs7cnDw7PGFcs/bY+YVSngGIOgRhHkGWa2fhZHXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxyH04bSJYzEsl7V1qXLCY05e1j0V+2VnbQlx9KUfqggM5d9j
	QcG+BDmYBZn7/ScNpJRzra+05ymhTszUWO6C1CeXwNBC0mKVkt+IuHp8witi8m811Xtu+/aG0WM
	09UX3kTaEvJO9AyBuYiqQ3VRhIRH5ms5iX1Zs/gXWxn9MK9msDlqugHLjWfiu6y4=
X-Gm-Gg: ASbGncs9QAIYoy5HRNhgFhnAAR8lekzGcBom+FqLsJBWEfn1wZN02mxdKr4wvQHX+wV
	DwbsaQUYG6Wg24HXAWiYw0aAtlJXNNvaw7oa7KCRwnpbc2IYoKWoExWynwI/PqgKRklsM3nSmnR
	cGih4Dtoybzy7BNz9cyKw6S8R7AT537cz/ZIHYMKUfSWtceuC3AYd36bh1O67wENoxrROJuPEFe
	iziYg9l/wGvSn8fYhhI04HTjM1t0v+w/CyyRUGTafNt8twiPgIjAzLm6WkI/He7EUg93aIRJY9P
	rxodwQ+fSbG8CqMD/GJreEmwMMKeWKkdJ6q0fzUToCs+V1NhJkKrueUBe+5Lh4l1/g==
X-Received: by 2002:a05:6214:2602:b0:6f5:4711:2987 with SMTP id 6a1803df08f44-6f8b082862amr1258406d6.1.1747323756521;
        Thu, 15 May 2025 08:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHycrvO/sWsH1BFm3roYJt54oQuAdB4SWzNxmk0MLSaYCohDOB0eaQ5GpCEYDaltbZ1ZS+nSA==
X-Received: by 2002:a05:6214:2602:b0:6f5:4711:2987 with SMTP id 6a1803df08f44-6f8b082862amr1258156d6.1.1747323756110;
        Thu, 15 May 2025 08:42:36 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm7133266b.10.2025.05.15.08.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:35 -0700 (PDT)
Message-ID: <19d32dfb-9842-4d5f-b9ee-cd5926e52751@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-13-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-13-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX3xWEpR8YhDmS
 rNewazKJPOKZW8vbR5Xf1GMzg0aAIlkDs7XBqIK0qunDUzdlzOGyzG6Cd+k8hKU8BKfsFbiYSDX
 9JWF7IEnKh5aqwwmzfYuEMLVKB3ICk7i9e+TnfAfNdP6W50fE/EryOiV5MgDQWK5XQoXvEmc44J
 +IiVM9MNbEugys1eTPgyE1BwRFE19yam7O0Ve08jDnkbM+jGkalcXY4C6x68APpqXeuLFvTmnP9
 j4qMjnDSiNZJdp8qLLIRnkFNih6HyDv7tQEYmV/7/7iZOM3CA/v8YcTZLxU0b/WQhDXVfN03I00
 DVv6R5JsxDWOpqRe51uT0eNHvulXOh5TrWTVTODmTdl8DMQbW3Jq6Cm90FIxf8S0YkC4QWWWcKL
 xT7tarDlJeFfwZ2NqKHRpHFOI6odq5wDcsp4GgdNAfgCS/tH41cJE6R7sz8ivrNnLgPuzdxl
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68260b6e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=pq9-8jp3JCCm2Y5_lFoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cQxMC9uJg-9yvaQ1budKsX4XhRinQQ7P
X-Proofpoint-ORIG-GUID: cQxMC9uJg-9yvaQ1budKsX4XhRinQQ7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=727 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8450 platform. Hence add MXC power domain to videocc
> node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
