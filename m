Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE61D6BB
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082251; cv=none; b=G2UQA8QCBJjN4/09P/PAzZutnO581pTZEYYqU0M4JfhKdTMMD2v9P0hKjilPQN9yav0BCggXVJbkpsuQ3UONt8IftYcMMgI+4L6BVrvYEVEofFJtJO/EFqSsehNFhuajj+zKC3KS8IFJhUYze4oFO4SXqd0UxJy3WMfsDvdw5cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082251; c=relaxed/simple;
	bh=mzJQrFxHSL3eTESAWz5T1yGZ+J03lJUWQCHcPKGgN20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5SVO+gxBsVdVX0Fjo5iJ9IgM8KkIhzU9LWc0kjcosrKIOTr6gQgH4Isa0ETOg3rGy/9qmd+hJryfpGImM+4V4KBwHs/LE4w3nBCC4TPbkJXneKDsGMAGS3QH2WxvQ+twA8Tpv14V3cCQKF2lkkiAe7YfiBeGxtRrAdFBOqpLDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aryBfVqX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bhtDWvEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aryBfVqX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhtDWvEN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8wmoM735521
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=; b=aryBfVqXsEgh9zsM
	/v4aLu414nbl8lmj6H6Vz18SNHc/eYDVX/Rmy09lNyJvFrzlB3jwp3FHsyCGADmI
	gqLuwl4MPjk61kV82VzJYqVaH+Ef3nXOuRusYgHnTHsP16Hs5tVE6BQLbAcHSA0i
	WP11zFo79aZWgJPJdVINtqrr8jq11JHd9r6NBk0mvx9GHeiis7nMHFbfuETWaEUU
	aDbCqfUetpYThMJ7wLpeGME6WN7ZfCOsUWxCkKA4SOzvUiGzZEojXcEliO3ncWhe
	fZ6ARqky3U1lPC9Zc2i6fa/EmfpljG8lxBjiP4S5FiMVE98axePmjy8Ga5aoJ6vp
	VemSsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1r0rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:04:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a4ca0a4aso196896985a.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082248; x=1781687048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=;
        b=bhtDWvENtERo7Qp+8qPr8AqUoc8krWiwrh/is1a2y4LG8Q9rjykeU+DksNTL8ZlL8c
         APKAIrYecxyM7arMYQdI2+TZuWzJFQtcpfoicrrVYzptJx3FIc93bbHWryaegaTY25gF
         Y7zeRx42NBZfQzI0+T4K5buPOtgnq4TpqwSQrgy5tpt3QMsYJVMvF+E9R3CsGNFltMq1
         VP9q1BX1piRbxzhjTQqWxYmJaelwZx1QzKeI4x34xfBupSpqOb5RnLItPg7yRc9qnLNT
         Yl1/rRLfqOGlbpOgkPFeUx3VKeQFkQsnmF0fowBEGLEkvhBofxCp35cESdSE5vqlXU52
         5mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082248; x=1781687048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5PkR6CHd3r+6amgLa4HebPTz48NfUJqUcMMEOkBLAc=;
        b=IvF4XF1zBXNa3dTiArZc7YlFdFUAGFZWzqb+X927PXJr6ADasVsqKpB/yxL7ZcNuaU
         5eST1MHnS2E8jGmMSgFA9ccIS4ffl3x8PL5TjBf5rLILsDecs0QUQAti6hp+KRTSBu/w
         RcNv9QYPJ3JihILy/3tdIj1d6rT+1Q5CdhvG2ODTVX4+BuGLvFJHKcYpCrkgziXu84vJ
         ciKB7SQLg1X7ICZ2pSNel0LgIg++bJZJj5aY76kU0MywqfdEe637IMOJNXBchlvULoib
         pu6dkfv53wsb2ALo4aTlpVjv3uNcCcYjNhXSJAi5j9LPEXPlCxgufpVIzd5tthWvlXG9
         CElw==
X-Forwarded-Encrypted: i=1; AFNElJ96eb7z72ndZwxeiFB5V/baTlcPnlp8AmRkwIjWnCEz4g+NCMbzuPB3G/CPF2qmqMXcGoLtzXfPaqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTG/Qa0nkLWEqrwL08pxj0hdVU4ywO4uABnvWta64CXFwsBCuI
	7eS6TyoYqIe7Oe24AelHCNQHV8QXQBplK1+zwFMWc68jeGWwFWIxePxj/oEapvvEX8g7QBikba2
	sMb7/hVWyIrJ3ns8d4C7OADjF/zUvM1/xu6XPeu2qtFuAmvKz7N7kJRV9CBo1OzI=
X-Gm-Gg: Acq92OHWUtRs3R6WKV4/4o8LjIMM8z/Njec2nmhAb5XWXZxLh9lmG3F0NEsVj80itnM
	0YRHjc1yE8OtscJiCjRacBb5/oel6Dffd4LagBtjeThBJtW9WfjbGBSjBaKrvJKGJnEVcUBePOl
	NtVJEP8oorVs2YtkgWFyD5hVBNy8shOS8vh2g5FVOHQlO8zeP9XoWH9siEDxuyeeKh0wStHGCRN
	57Uo4ixQ2cpjPg0JP6BSv+SSyfENqg5PhkZF0BCU1M3GLWcyQRWqpu1MkP+wb40pqa2KRKFOTzY
	z8XpYC7S66qpuG710GoJdpNAb7vM41Ohq8ZS8baHa3J6GygQqpJcIuTioda57M4ditRopgbWfKM
	q5uMONHbKTbCOsJa5uBxJMXfqKMCoJto0iwAhYRCFlY+FhMXf+T1lrQtq
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2200094585a.8.1781082248146;
        Wed, 10 Jun 2026 02:04:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a06:b0:915:79da:a898 with SMTP id af79cd13be357-915a9e33362mr2200091085a.8.1781082247666;
        Wed, 10 Jun 2026 02:04:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm1165456766b.11.2026.06.10.02.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:04:06 -0700 (PDT)
Message-ID: <67ff0f25-b2bf-4880-9559-e37ef4e2c6bb@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:04:04 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] clk: qcom: Make important ARM64 drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-3-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4rE5anukIKmBfguaLl3dueMdZTeAnzao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX01/8kHutlJXx
 hbC700H/MTLRCUqUqlx+gNtTtjdUeXxF3MjOPy4/jeGPAJZL1BSk111+7jVkzMBBS6rL1N4eAjT
 osyR6Bja9PrxeP6IDP5M9Ei2ri9Y5SS3E05mMYD/bjq6/lNIE3hbp2khulQMG8dYXki9x5+FPtn
 7/UzVVSBiEaAw6O/0lc+IgqI0iH9KxDf8fzFfnsEEOBjUEmEYSjkZTjwnvlhnJgvGbPYKcjxcif
 gls0B59kVsOvuf573EFzBD5/uCmwv8WmAQkp/d8jiaGZ92JR636yP6TjucHrUWrx654NCySIS2+
 om3YXElmwspQHl+EN55j+iUE6t0PEiqOzTb8Qc6TrNxkJoW3Vn5KuPXV0qYcbgAEIye+ydjeuaQ
 ncXxcB+cipGtK3iykU4tx7HLFax/SEaJUqy9NJ6ddN7GyZkmP3QlkcnV1nmvuFll53/rK2K2t1H
 ptF2IwCV54K/Bj2+67Q==
X-Proofpoint-GUID: 4rE5anukIKmBfguaLl3dueMdZTeAnzao
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a292889 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YbJbqLu5s_8SUIbSLSYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Clock controller drivers are essential for booting up SoCs and are not
> really optional for a given platform.  Kernel should not ask users
> choice of drivers when that choice is obvious and known to the
> developers that answer should be 'yes' or 'module'.
> 
> Switch all Qualcomm clock controller drivers which are chosen in
> defconfig to respective default 'yes' or 'module'.
> 
> This has no impact on ARM64 defconfig include/generated/autoconf.h,
> however changes few drivers for ARM 32-bit:
> 
> 1. multi_v7_defconfig: Enable QCOM_CLK_RPMH as module, because SDX55
>    (ARM 32-bit) uses it.

FWIW RPMHCC is a provider to GCC

I think TCSR_CC is also a good candidate for =y, as on platforms that
have it, it's necessary for USB/PCIe/UFS

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
