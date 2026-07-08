Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBD23ABA7
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515795; cv=none; b=X9V81TSQJnMcmzVSEqz8dOhD1m6rKFNtnCsgMHs6Xw0VBu0zDJsHamfoMbajm0BiklrWrDdKKJnryvarKtCkLTQvnwVmyNIh5CgVAQbPUn+rUFfY81CrXUhML67HVPmPcN3tIIodUektQdtJvAqnCItbjiuCwKAFNXvQfprbobY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515795; c=relaxed/simple;
	bh=WdAXu2wQhnSrNal0fclWdl3vSbNYAndpe0G+kbfr2XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYGycPeCrmJTiwNk0J7iaGeIVJ5+d1D5P9YNQogM1MFBK9dlvFilc0JiIP6FmKupBhw0OJN5cCCzOAEInhWGAo2YaHdY9IutauSb3EAzcSSzePiU7aEQ3qpp5MwF2DYOatkh3UCVhybCWzM0C0e6MCiZ/llrjMIyCrx2wdHg//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NokrrRbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfqYf/AH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NokrrRbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfqYf/AH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3RUw2617304
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 13:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=; b=NokrrRboT7RTHzyS
	x4K6XgaFT/nO5k38Xa09rFmoVor9vKZIi7qmnRlqP2d11ThnH0pdBItRuseWlEUu
	vMRTOXG2CyiWQtu1i3jJh7llsTdKR3cOCrd+GfH9mP/8Dku7sv0P3W1kCIcAmW1q
	BNMc7Q1vAlFUf3Lc1j7jRIEDwq7APpArJni6cUbQrspcr+Y6ZeHAQRxi/DSQ3s00
	ZcMSwso3eJrAYeCodkxOjL15ubgwPpNQY13EgIOlPkHgW62qqVf+0+tkT4zB/GV+
	g33WtJChJzXg21pvgicPbuCKLglZsEtjBVJELcMRdbwFPVg/qK2URFjSU1gWxd64
	M7WtIw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqw9krg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 13:03:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a72d672aso1720615ad.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 06:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783515792; x=1784120592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=;
        b=gfqYf/AHTRZ61BqCiEAaDtbsRy1AM+QDd6zb1QIinhHsn+Hg3oNEXiF+9cg0QkHnOl
         m5xTcvypDjuu5A+ZAKO+NlxBNkKlibHXGfjn1IjdmRF8+13BzM+CLS1AyhipFNTadGob
         7+37J3TrKac8UiDu4fbK06P3rAj3bH7ZuxwHOZ9PQE2agmF1vqpZ5eX/M3Yhc960Xk+4
         Wze4weOsf1I7B6VumdEG9qVYi3l93v8VjHvykxjpZbHhkbc8zyEa3ptLYkN3KJKl0cgA
         koW7nIw1WYAosn4fSwns5+UA1VHV6jhyu01K/4xPCEO3AfWglq/r+M/g7LvHIaq3+z1E
         38HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515792; x=1784120592;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4o2s6UhCAjs6OGP5q7L53GHO8Qbvx6uRsdzC9P4HJKI=;
        b=cIVJfyqc936SegAgVP2FSQIUBGb6JfIVPR36MJ3+NXfYGRO5EYvnjpMyHl9ug2hKRB
         E3El9wuctXHaGFwedbiuV/ISryD3iYj73Dwz2hjDDuegf7Ax3NxP/fUV6Cso1kviq1Ez
         EpRKtV8UDglhTxtwBQHbJPiDVm27rg4NaAnT6tJYLGxQICcgn6uea/GY6Wkn5vR2xENt
         br61HquYYbaMok24W4cSOd3iQghFD6vOL/Z4Bt84OSvx15MqCLsHwYXeOUy3u9Uexdsg
         iPbLo6kPoGZpEAVxhbemdXxZ7zjart0m48y0F6OJJlh7nj4noSDeEyP7sxBd/LIUp3j4
         iV+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpfW+9beXP1Ng9NwIV6DkTSb3K+av+KsrG8aFA/hwdVwk9wZnwOeWG0TB5xFsdNranWuLqHNfBd/7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeheodbmsGyZkyhlmyhQSr6aao0hLOZclonFZpVqx8p+E0OS1+
	IN+LvdTijVX+M5S/EGre87bYYQgEeAoGOCqtvx0daS9if9dJEnUX9Am1k1e54nS+tC8TtLmk2v5
	tEwOuC6R/nnRlVwybmkdfzC6xo8xxF6lltXtsX8FA8YuA6vm8PpMN15GJs8ToIDQ=
X-Gm-Gg: AfdE7ck9+u+yJNGrvD52wJ4DoWMPODTe0eHVH4IqxF/2OZPKxv6OUb0GjIgb5LdoQr9
	CN2T/zc/aoYJT99PVqGbJUf1rQlY4ROzoLHa8SdrgXXTcr4kPksM1veZQO9+rb8EtG/gsWrAJyg
	KpwMcnK41hmLjLwkvG6UAvtu17CAUUCc1R7OEO6059rL4wt+/P+KGPs9HUwWPuUMo38DMy1ebic
	2UBKk4I5RpIm0nmVL5QXj2BP+LoI+BZQSdlYTxZ3yU6lPSDeg7Z/7huq6YeYkO8l8wDx+cUYYoX
	w0z+Yc+OVi6rZ3+LFK+uBzoD5cgk7mTEkh4OKBNNP/EnpBFOnQlFCnsZ6NFu3AqXs9wwRhszaD1
	QrODWfWjwkVDrutCstwqYft2roZA4ctTN3U4=
X-Received: by 2002:a17:902:e747:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2ccea276712mr21921355ad.0.1783515792331;
        Wed, 08 Jul 2026 06:03:12 -0700 (PDT)
X-Received: by 2002:a17:902:e747:b0:2c9:e846:a582 with SMTP id d9443c01a7336-2ccea276712mr21920945ad.0.1783515791798;
        Wed, 08 Jul 2026 06:03:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3859f69sm89230266b.27.2026.07.08.06.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:03:10 -0700 (PDT)
Message-ID: <6d2f66e4-502c-4f69-a57b-0cd779cd3501@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:03:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for videocc driver on Qualcomm
 Maili SoC
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
 <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-2-ef0828c0bf6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfX3msHtNSIQPc3
 l9pvZWoIvZPDAZf1RlCLGf8jG+vWS02e+Ue0WK5FhLrXGeft+iX9o/g+GVVIulVtA9w3wfURQW4
 8WgN77qmU9h0bt95bdJ/EqWAnZMSV9sZBFQEaIuwmAHTQptthtRP8dmsi+pSqCY71l3sD+x+bqv
 JcUZ2IGi9iIVDwLX5HPZ6hNzul65WYt1qahGyWOnEr4y5AiF2Rc+UY2FLGAjU0GTdItupt3S7/E
 YKcR6N1c8RKTym6XEk8SLx4k7LGjTnNm3RDrugBmCjo/KklL0TskExZo/RfW2Z8R7DaPZXeUzV3
 3zEIGpx1fHpC/rSSY8Qip8ty/WpTWO7sYLxlAKT0u8gGZUieaohE01NZK1NNnBeNU58zlkQXyR2
 iFYsi+MQ170oXNX6O23xHCJcm80erie+4FKIEKlp1yYXjck2V+vC2KK/oFVWp75NWoxPlP1wWa2
 H2ykbOVkzArZXO92DfQ==
X-Proofpoint-GUID: QIcUxZiSqcdGsxevdnDkT2vwC-_yPtaN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNyBTYWx0ZWRfXxnQ/PQVd0GyG
 vg0vacN8Z5x58Lz0Na4YSJdOZciANNkm1U8rxGCXv0ug4CbIFCvb/YPyyBIqvSV3KgfBnCa59gL
 rxFPw7E+KRfrnCJjIdxEPso7s48MXS4=
X-Proofpoint-ORIG-GUID: QIcUxZiSqcdGsxevdnDkT2vwC-_yPtaN
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e4a91 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KabViBKo7pAC4wHH2OwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080127

On 7/7/26 8:13 PM, Jagadeesh Kona wrote:
> Add support for Qualcomm Maili video clock controller driver for
> video clients to be able to request for videocc clocks.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
