Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB3136358
	for <linux-clk@vger.kernel.org>; Mon,  6 Apr 2026 03:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775447765; cv=none; b=Fsmc97zK+6RujhG7PMKJDFtSCxvXkh0UuxYa+RwWnsvVM51ahdDyfkJrPPAnJKymX3jfrPfcec82Ww/yOZC1FM4KvyQ/3ZZK2ki3Nhtm7qRbF36mkxYuZlNdZFcIqAQnItroBLBEUYzi82LRZ9Hn9cOcAY1iAD8P0GUM55aW4zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775447765; c=relaxed/simple;
	bh=p1vY483HycGMnejrqOpyVYB4eBSMq/pYkl7XqVTVeQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IuoYHH5E6IUXCH/fnJiZ8vRsdBupfNWMtDRLX/ke7sNgPalWpKllO66AIYcj8KB6jc3kES7dgBcuVNrFyshnZVzkk1BBo95dItaf4B4QJEhkFmOzGhMYLAVMTkZVUerVys9zzD6fPjHs3NRxx5huvdwmBKBQPk50Xh4M93zVVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/nE2zdJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e533O0J4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/nE2zdJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e533O0J4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635MltGI1757610
	for <linux-clk@vger.kernel.org>; Mon, 6 Apr 2026 03:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=; b=c/nE2zdJhfqKWlI9
	Z5jpxNAaFSJkmwq85a6wevjR8GRgyE8cx+mEjHEHZ4jS4pMWvNZFn4hBFZvs0xI3
	VSKYm+DQP3EQbu7I+YaTLZQB+0dJgHfirE4fwdnuhtEOlfXHM+b33cHyAQWFQ7JL
	r6GC+GplkgCY9VPvAELmOkfBrJKgIdcUyBm7H6YMbsaOOGMP1HMyOnqUzG6p7Kfy
	r+2EaLzUVtUdyKRrAcS6GHrcBw0uInaddkMBbZ5PeOpMfOVRdZdyf3LfK3ThCdzh
	7YOUPg5pA78wDpO3NcpfaTD9XiEB1a2uZP85i46ApAia0rE3ETSBaU4Y3pa1sZql
	Cnj7nQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux8bma4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Apr 2026 03:56:02 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76dbf0fad3so818273a12.1
        for <linux-clk@vger.kernel.org>; Sun, 05 Apr 2026 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775447762; x=1776052562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=;
        b=e533O0J4AvU75kW/tPp+QIEnZmqz6e7Qr+IJdNuKEIhK35KNd8g0Q4INuxNcq72W6Z
         mEJLMnue9yQhOfXI50dP9QWZi7cMvIZphmSWKGXqmMo+zt7Dj0/PnOftxRG7bpBHd9YT
         r1QRms5G7my+nmybY0zf808DtlMGd1VEv4Pn+pYiOQnPU3MWcpaxaG4JobRbc21WTKbe
         cyyyBdVPFGULQiOKPCiYTBv7WWM6y2k1LFYmIbcRlWhUtUaH8q114pJxyq0FxxTm5m7m
         +3DLX4En1SmlsFX8fcN+EkKA0c4guY79WP+oa0UrYOiY2h2vQ/ajAhptLIE3Etajk4Vo
         AQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775447762; x=1776052562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJrcXiZ7T243FVJ3L4ZcD67EASI1BaR85JnQX28OM34=;
        b=LipGaNx8BDhdEbEB9Ydv6y32kS1dzKZDqPAwq44Mp30ocDANkmihnk44vn/TwNJ+7u
         +F+yssq+VGACHmWi7r7Q4tQudMwpyB8R4O3CwIqRG0RiIulSWrS6pXzuCWOu8mLarWms
         ZE6dql0JDUJjNa5hvCE+WCTj98UkPIHEtdOeQySJHF0/4K9Sy5KSlfF+5TMYcoMwEW6f
         mQ0Vih5SBULCXjOujcou9QuuzWkOa1/UEzYqfhtE/zFgdmzzInK+itC+GFcbjTF0BbsU
         Tq2RoG1tRYk3RRzo2s4B4Yqy8yh35Ow7pVvDsMwcW7f5onXP2WWof9nzm3I2iLTLdTMh
         qkJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU0nDT1llBbe/ygu68BvV/4TDxjdFRrDfagDbfo+aF4kpQBMPE5U6ARtJVoy8RbiZuI29Qr1wLn3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwryaUzR67A+MjNCk3H/ZAaBwggW9OxPsI3Q97xUipKa+yuE0cv
	LuzqUkmFgcY/X7nll8hGxsMWuAzLGrykw5bmvSfKtpRj/X6K1wH4XdEvzl8P54MNU2Fi94BIql0
	+X/YBnRDPVWlU37zcD1aHleMwNHcFT5L87fkFXFs1TK6A15DA9PGVmEw7jnUbo+s=
X-Gm-Gg: AeBDievuaNMMk3xI5mFIcuGiZysYKxQI1LHtXVQftlniddlnKGT5guH/bUZrPyTSevH
	e0fhhFW9hA1Q/7KnLvsZ+gZZHpqyWhFVQha49Y2YaNaJi3OPez9IRGm/S9emb5MDZ6FKqxxSGA/
	aZF+JAF1dpkA+v3cQLV+TQHGqOoDmqiiHzjY0Mfwck43AJhtwIqVCVvWFYClZVVupM0IebZYCBz
	zXZXQn71hKbxWKQbmmaU5WM6+Pxj7uRjUCvCzZvJ6IvN+zzmSHS1wvLyUkWh2m3m1Yo/8uWCLiv
	5ZKWzakK8B1hcl27qZ0eEXDhcI6D8vU0V8Mz+bAyaAET3rMNwLmaAgQ3uw+ugZOm/dD9uC2g4im
	ZGd5l2J0CrwaTSVhWSPv5lgGKHDT7UCPx6nQ0n/KNv2SxXkWOfw==
X-Received: by 2002:a05:6a00:1950:b0:82a:153a:c133 with SMTP id d2e1a72fcca58-82d0da4ce80mr11068327b3a.17.1775447761753;
        Sun, 05 Apr 2026 20:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:1950:b0:82a:153a:c133 with SMTP id d2e1a72fcca58-82d0da4ce80mr11068305b3a.17.1775447761294;
        Sun, 05 Apr 2026 20:56:01 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm12799494b3a.29.2026.04.05.20.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 20:56:00 -0700 (PDT)
Message-ID: <ac3a08a5-8eff-46d4-b1f3-5d98a951d637@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 09:25:52 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly
 use additionalProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P1m0AIqEbqzcaSR69FlG-Un7-tanq6mr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAzNCBTYWx0ZWRfX7+CenTX1bSSj
 SkUKqnQgQOFtCYTVIe/KC6ruas8w/7qdKZlQwSHAI1meHnLY5fVkyO8EfzNW016TA2AiorBUKCf
 3B/vVKHWcvKBeBqWSzCitVLcClrkFx8B6uCoqSURCXMOvnlDIgkLHjOhSICQ3CyidAiWHMGnn11
 fqMFW3StivJ0VujeVJqonLUE7mKnaAW51aQxOHMHl+jTFm3obJGz3qsP5fz88gCz4ZY4G9cNa1A
 sUGYiZtlf4UgWvLQYSZAnT5OopqgCttOZlbf2sU6mhWLzF546y3TIDyABXzbAq1QFYquE1YHJJW
 oCa6+1koRTOxi75pGy8d+xK4wIS9P1VMps4IHcZp80dad3aMZ24WobQ2cA0wTTDUfck51i7rn52
 9JmggInTQYxLVLyo+H5JvKHoJ42HAB4aYKv5xjupY0f3IFpY1waUp9pK+eRyQol/U/LidNGKKsx
 CCU36aJqR7tUhGBIdng==
X-Proofpoint-GUID: P1m0AIqEbqzcaSR69FlG-Un7-tanq6mr
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d32ed2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Yt71NFteXPjXTNy6dsEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060034



On 4/4/2026 4:24 PM, Krzysztof Kozlowski wrote:
> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

