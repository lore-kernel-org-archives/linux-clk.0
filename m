Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971763D332C
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951791; cv=none; b=ao0b46aDFJtQUMGzy1LOFmtJbtw4W8aCtvFl4ImUxYLhezrEqIU9Jfxs3YgeawgDxloB1P5V2rEZRIoslgdmsqJnv0BMT4Itv6R+/qL4fkdCwedCqiCWZe7kghHKQJF3+mlkOSnsWaNYzx69q6HxAOVOQXu1YKjKkciPzqmAjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951791; c=relaxed/simple;
	bh=07ypCyMw1Y1DkHyn6IJ9jzEBekZq2e8qxAawukaGOdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQUpP0Ua5dRaHSJodzcXsgSXiLW5qPykVcVawwmnp3wu4bh/S3vMMD3oc4Z6P3oWVbDsFzd1M5Zm/z+AeuDfTqXz4VE3haN3nkfntd8m1rVj23j9lVJsgFdBaP9W+GS3ePpSpagvlRh1xXAyQY9DXHu4BDIqfWE4u5NzQKj9kGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzUl/HrK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3emVvdT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzUl/HrK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3emVvdT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HSVaF3619086
	for <linux-clk@vger.kernel.org>; Wed, 5 Aug 2026 17:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=; b=PzUl/HrKOa9gIM7d
	JdkBwF59X72TiyiwV9JsbIO+ND7rOEAN9f7Rt8Vt+RAIzCqlXrwxAr8VuBi2kc8b
	mrPMJ5yRUcHyX3PfZgjIwpsiSkxhZyhn9jt8KZaLpgjsjefD9oDfX1FzjmCcrsIl
	lZcaRGp0CrQ9I7yVard5MfAAs/WwKO0FmmjhFICMYA/fDhAET61KhrA0oOMnopZ6
	lbs1Po+34+rYQkDF9/xUYnIidhDZDzoRDOL0OcvVsurNsFtzltNWolrLBcOQxvmI
	sfEdvIz98pPMdYema3L35VNsgbmqt1qUGymVkrHwzlSzYDE77s/Fs/WLZYfl9RRx
	b1uROg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r62690-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 17:43:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so15741545ad.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785951783; x=1786556583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=;
        b=f3emVvdTAl7VuvCxHxmHpKJ1R2ietv2FxsQ8AGWXT1rvLjY+JSH2KVUYwRRFPlsAQA
         kpZr+rZL9r+TltctrPpVKt9DqzRNloUYBLqQZ/FCs0cCwOdVotBC6tIKbwa2bMGmG2mZ
         sJjCp7WdNGO7nkmUT7Im53DzlI84CbKr1lN2DFgKXIAuPVqGcgfgBhphSZ6IjrRpDDyq
         XGWTTTtbsq6Wk8dyzdp1lP7UDxwkhPfVzI/2fHpKFXhqBZhjJDyn4zmI9e31PU3bNFt8
         qjXwThm+pcjWOV6smiaXIXMmYmpdZcXcXX3OJXawaZ5p1hRcM/j9lm8VR/+LUIoZPrJ2
         jqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785951783; x=1786556583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBgw39pYZbgIiZ2V9ir8GoYAeYCB97cB4QUU+tWM1ZU=;
        b=Y42KgbUDAvd9C1oIDDTmSxVzbTzXvxw71Zyd/4uT7Z5ZWP5UK1UuyguzP3om2Qmbq8
         0URuxv0Xvbmx4N3fryAoLB2GKScgpurguZG08YXgkg1s4pmGEZFK/vklZP6O7TeyiLuw
         SR1WZXwJg3czrlcYgv3uC3gSYhUDyT0YVAhABWY8LTJVYuO6sbDO1t6WmDdbsuLOAbTx
         8XjRGmzLmEIuO1AVbRPrnjswxxvhcdEBg2TTYXjrcvpKsHGhxABCwABXawy+y25I/xF9
         OhtOHqFZ6+hH7fcbRSY/7xItYmfiT+R+/j/sc+UFNTm88AqZi5NnGu4kHog56+ixplvr
         Rp5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqHxZ6Nwn30q2ORx4s35QbFwXF4sMRJTuKWsb/N0oa1hZLbCiaFVzJR6o23IrzZC/tQBvqG5CAXZ3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+lMHzBOuygTsutsatuK4GpfJlyXO7Zwcubqm0yR5EY1eVMUFl
	E6MDno0WB3sJiq0wbZCZaht0PjrWVARgcMZBfajWH46D874pZ9HfHE1hT2zibK/LA/mPNmVVKM9
	bVhotHKXlfdhdYp7L22fwrxsarbn+3TT6DMNgICV5HQ6ceKQnO80dP9tWU+magTI=
X-Gm-Gg: AR+sD10JICbvmKdrd0EwCq5CHtKnVMUj6y9cxp1XV4Q5zCJvrqLY4ei8V6N6urqjLzI
	d9Cmz/mjzR3GgX4Tj25fohAKJGZwHWvOuvBVw3ZQxApgv/a84L7YG8xdYRrKjXgTGzs593TEIIZ
	L4itX128ipE4kutrkQlWUjdV+ialMXs5KMqficFzpPz1dd1kE5qp4nrI8/X908HDHn349L8ikoa
	PHNxxLFzp42aCA5wTZbBYbHMKpYB63M1IXt+lFCYKiBxrXKPVOXA/JyJ/IyPRbymhY8rqGYDh3j
	D+hu3g2Ag737pBKbQSJDwHrkofy8Nv4+y0prU0ZIGOcLU9Hy1H7Nf5X1xG0IitV96RF8adWed3T
	lLoP4NFiEDTVWy+LKKLj0yrmYO0E=
X-Received: by 2002:a17:903:2288:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2d0ca98f8a1mr93789255ad.21.1785951783520;
        Wed, 05 Aug 2026 10:43:03 -0700 (PDT)
X-Received: by 2002:a17:903:2288:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2d0ca98f8a1mr93788605ad.21.1785951783054;
        Wed, 05 Aug 2026 10:43:03 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.24.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa49295asm20647695ad.45.2026.08.05.10.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:43:02 -0700 (PDT)
Message-ID: <0689a62b-28f4-4c90-bea5-065467d2ea9f@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 23:12:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
 and resets
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
 <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-2-e7a5101ed479@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a737628 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=zf9A3FKX68OF7GX/VhWQbg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=J0kFQpeBCHEeCUjyc0QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Ab787c8U-1qxkYjDeGIRu0u4Q1ZVPtyx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfX74al2N5GdsS3
 S//PFXB01oyhcQOBtULT95/DafMwFuJT5WaCm+Sc1VKoY9X7mJFObjeJl7Y2lqn2worbEVlZWKd
 +LLbHsLc5Eo4uzILLti+Lf40rFlKDN8=
X-Proofpoint-ORIG-GUID: Ab787c8U-1qxkYjDeGIRu0u4Q1ZVPtyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE0NSBTYWx0ZWRfX2U0ElUtD2FTK
 70EO9i4VNT2n7m0dg260FAUmiIWFTxGj755PgtAls6gHcqm98HQ4oArVzPOyMiyuhG0QN6x83WX
 2gKZrsOQVRh+EWSNJM+dI2ai4Gwktk1/v0gA7xgf2d1jJKz4msVUj9kzpgt1vKCzvBoJOD9y8uF
 RN0LndQy+v2H8eL0MyCZo8HbVKVgzc16Jbg8PEhSr4WwFZ2a4wAJdeXWmyiozDoBSea6wu7zw1F
 musPYXeRMJWkP5RExx0Lrj9KUD8ZnxLBYGtqFG5UEqgEqG34KPAQSWmQ9O8jyD+H8LDSKvbwn5G
 zqyKzcxpGjezT+doTF60JqP9H2tsBp3YyCjk9D2hMbluJCSLHvHXY1p/cSmjjKJGNitfZQ1FSYg
 sHVn1yVPjjwJSeJDgWuV74t+Bogd/FeqOhXQxpNg6IymH1auFjO2lG/eC3SjgJVhnAjdzlPBKHQ
 j7mmRT3VUqqW0E+WR1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050145



On 8/5/2026 10:17 PM, Imran Shaik wrote:
> Add the GCC TSCSS clocks and reset support required for the Timestamp
> Counter Subsystem (TSCSS) functionality on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-qcs8300.c | 103 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

