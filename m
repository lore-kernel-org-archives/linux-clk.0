Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A6039EF14
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334941; cv=none; b=IgkLDW156nCq33nb2F5r7kfvQZNS8qusSHF7SqcDXxRZCucXBIBpj1gxpkNmGhcukvJuHeyGUyo0bpzhm1H56xO6qsNYkZarvWlo8jkGesimPE/vmYdVlWJNl/MdiyiBFGSV9pRjFsbmfWFj2oObqKUM+LVAs7xnlXvRqV0ko8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334941; c=relaxed/simple;
	bh=iCB7897HV/XIy0aWQaoLcOKCxNFHQxcW6skNabD13Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeyaRWvqOX00UxP//Onhyvtj3iopiwcG6uuJ+6+ZEap1HCE46YKws3vA+vxhudHixGqf+Uv7qfEIE0Aeoy0VlVNB47pZG0CpYR6ORyWcbBTwvXoFPzufCIhkRK5SeqDO/trXjcl9OL3uiAnRW3ReZ9kXN5Ed+l/xBQL/KDMe4L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdMP/48b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqj/1ttn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdMP/48b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqj/1ttn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9X07C1553088
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=; b=WdMP/48bQKMP2x+8
	8eUedH25TxjVsykzU98QoP1WGR4sxeIZynkQwNvv2MLOCPD3Y7IaVPAAzh/wV7/X
	TvL2fIlnGua/QeSvrTjJem8vimNEPSZQPShCKx95PQ6PcOiZifvYbjmmVq0ca+1+
	K7bwzFL448J7Ln/0wMkOQCSUD645ZHH4x1prgXTs/SI5XYLaOmbTrx7xnr8ukQqz
	ZiumqK5wPsBEGAa6rft0P2jcr6rfGWiHLP+BjWOveJayWTHTi71lD3kuuk6ww5EG
	yyIqeGaAjgzmjRnEKWNdAUg+FdPyg9WY7d1bSa30NnIKkBNxqQDT40yfss13gdy1
	916yxA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn98kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c183c2eso68649761cf.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334938; x=1776939738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=Oqj/1ttnvOazDZJjYPf3H9WXF5vA4QSCxaXRXhyWMVcAhyAmiHzhCmSlqCIW6sT9m0
         JVHRl+bX8Qa7ubBbCBofSffZTAgbzbyRjEvyz71W/PDPOSo3QH9DjbJK8ht3wYFFAWcP
         ZETi7M9ZuBX4nKmA04M5N3336f2/uP5HT58SiK054bt0oOomtUrisVaxlFWAKvCDGmwi
         EnpIKsYPUpdlJm8c5Zp5CKTwHgs6saanzgCeguzJc5BYw2+kFuUNy7yU7hqZiDXer9hQ
         E2+XN4UDEjSZNYrXa9A6UGhZhYJeGKBvqIl96wVxGZMOWXFhzrrZwtunO9X7sKzqQwnw
         H7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334938; x=1776939738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=MLGWr9+cA0PxLsVqz2kYkyz0qha5j97GHk/lK1lOt/WT2npRj3/LbSMv7cpA3t3/e3
         X5WJ8d0Oiwuj5Kgb5MILCtYXr3++1pCWYrd4TRq0INBOGmIhJGhaiXNhL1DOZYT9Ap5K
         fT1XiyxXG4hoyeAK3wT9fDh1fkObW+/ok3YMTpkeTBKxfBuT6tD/KvSWRB++49wlmyjg
         NA98Z4SJ44ylojgP3l05yWojTPPosgc6Gp/J5uPXZhx0psPlHYlSHX8jC10QqEkRLrny
         Bmk/MAcBB5DIeznbhRsonq0eGrIK/1/THx59BNk0jF3SFxyUFW7BMJ+uUQLlH3bDuuUr
         ATNw==
X-Forwarded-Encrypted: i=1; AFNElJ9GZmxniMG1x+O8EYnhBDWdOYcczObUor9QH5Syc1EIh4hfUPLkpSaSYZ92RLa0xsc6/a54TqwA15s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzppFpk0ZhJKYH68CV62oc8HIc0RK+qBmMDhawW9pX5o4NVJBt3
	VXJWupMCP68be7M8vw/SRWWbH+0xKX5AlNZgsDmIHl2ozmAHv4tYK0mRV85S2c5iqwwZV9tS5/N
	nfqiJCpj8H8kkb6wnLhTXn81qjHaV3ZUnfcEUQ03xraAtFFiFHU2adc/DiabtO6c=
X-Gm-Gg: AeBDiesqSXDcmcLUVzSXUM6FCANj7iggjg/fraC+E2x2ztxxFAfpSV/dDUsFMg+ifKu
	jcswKrwicEUXR5fYAiCBHZdNBYOSNKlE/KiDCufhgrwrvG6V4rwJyiPYHUVmZ7rubLekqT3eXik
	hncXYvQQNq/fTZi7EMNcqHIL0IWwirfjiWu9Ms49dEP8NrkeaAYYyRu+mjw9VyNCFO9R/77UOCy
	4gqZjkTpjbLkFzw8x6UMdFfkT2FtS4zJcgUPZBsjGbYqoyuwVDFfnFyjO41yRhvwFRpbfW8/H9k
	9VCiCv8YRMrgiyt32QJDHsWz9stN1z8IGNw3oQfk00lspsDOJdqWLomKFjEtVCy7Bf0dOGkuHrt
	yaLhaKWyTh/dLi1Gau1fdV4AuoyTN3MLPcU8s62XrQhmLGnFPa3JKn0AjmfqxeIAnLCdiNIG1cd
	QFAaH71U1p+AB3rw==
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15688301cf.2.1776334938524;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15687971cf.2.1776334938080;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24865492asm96293566b.24.2026.04.16.03.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:22:17 -0700 (PDT)
Message-ID: <eaee286a-9bff-40ce-b9cd-5f8923736087@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:22:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TUcbf5tIh2tXkqDKpPMpQzNjwEJeGnkY
X-Proofpoint-GUID: TUcbf5tIh2tXkqDKpPMpQzNjwEJeGnkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX78l3hxYzp9Ou
 S+gkvUVGQS5myhXPNELwwdV8eeuy+7tj7E9jvtQGSzJe2mIcbT7NzLwZ9j33xW0IjUb8pXrypGw
 ZXeq6In78r6ov0lfTq0F97ZSr3zTCE569JfWQ1KmEIwMtJ7ImRco/0G1EgtipirMQ5CNRv+fNaS
 jsOHnVWUceyRWZBLCpBPJYImjjO3obd8TbNkQQRMA8/qLG9SR5ynrQmlBOPjEakvBd2Q3tmjVaX
 TgXR6JvLJWp6ZAcDuuregV6tdOmsjilNB8K1XxYZGx7KDPpEE0AjRPNlxK7vO4jOEIX1YYHQn0k
 winewly5mRs1skChNdw+sXfg6zjCiTbmzg03FTu5Ayo5MiQTRDnS5yUkEXxzPHDxWg5su6Pk7+y
 WbcdNQsbdhXsM9BI8yFOwLhEDs1DCAdjEB7/jY3hQvNiAfjHdU10uU0AyRURh+HzYL5HGamwJ+3
 pjwg04qOCUKk3WbIa+w==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0b85b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160097

On 1/16/26 2:17 PM, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
