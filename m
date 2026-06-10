Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E183B7742
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082465; cv=none; b=vFG0MvZVpBUmg3/yjldsYA9IMUS/PLDrfvnEH5k7MeBwzjx48AuZ3yGW611P3bd9iqcE4QA1APqtrMgL+dbTHzXrqM9mVawYzxoeET2xQ/9Dvpib8iH0CRHCC1wSTtzvmBi+SWmiAkghvgBnNUj9bdVQc7ixujUe0AucEdj/2BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082465; c=relaxed/simple;
	bh=5/mNPrIGccvB4YmjKw31XjbzhKLj7C+1Z/64vdlyjzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6Kb+uFTK9vqeX7/EXY5S2SNPEps6eN1lZm2ELt5pG22kSZubOd4HrArNErCJKOcd2qC+WM0yk4nwfWarFUt83vup/PCk+pl3DIMrvQNWFDb0NfWl50DsoxOO2462X/MyynTjWz6LnP8wMxt6FFtnB22oEgJ8EugVgXUhPq3yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBPH6Wnl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TE6jxPeE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBPH6Wnl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TE6jxPeE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hj9s530210
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=; b=LBPH6WnlVkF8XTV8
	Af+cN0FL1EWATgyiLRLO1rPcY07OlMhw7XYPN/OAyM5V6LGKWMEBxDeE2lB2GUw9
	Jj2kCq/qT7XAqwlF1xBkqop2ziFldUs6IQlmE4q+SE9S/04+/wXToThEgiTc/f7q
	fYRpUYMd0MnTKuaRoq+8UXYvEZ2WNdATFieq9Px4yVqTVTsUiur/Wk1OfJIpCr7O
	D5otzVQIWyiv2msVACw/yoXRnCznMGnXwbbSWH1aKohbiwIBr78vpAMcWddmRdFh
	caogT5mgoGvj1lkAFsYcafaJMrIYxd14e3DrN4Oe9M1LpKE+GwCjpsbSRR+YA+mh
	9oIaBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2hn6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 09:07:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b12d7bbso11716061cf.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082462; x=1781687262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=;
        b=TE6jxPeEDYE/M+gtQh7TcgQB9MwmeFeykyOfy/KcsTGxQu3qLwGPnef9YeHdQ4UpQt
         r8LT/399uHPSk/epsVqeIxAp9TcalfPgerkQb9tMR4Ou/S0n5A0gzXdSY0YLv2szv+Xf
         l+hITot2MuJrf2eqJE31/L1ecW+JQH9BjFXkX4TaryRPsgoZd2zNIkqDEmOlgPFtxLob
         TciyE0QVjLtmJPXx+jtNHyo1f84NNmL21mei7sTv7doEg6GlHM/wDWeuDY8R46XmdXy4
         vOTJ0/ZkJ7zxQfwFY2iWHq/XRktRofQ9eCnZV3DNSHwVDv7B0CAvUJSNNyv2T/IwJSas
         6JdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082462; x=1781687262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeO4uzQcS7EaU9LOkmxTOiDImu4qwZVUEBZXP8oCHUE=;
        b=aWo3OYOKcsOrIVCpzUoheHRNjbiHZiugKH5ScgG9i7gke+VDSiaM7egGujeuKpAHtm
         jksIxICoIkPkisYPMEqwQcafKExqZswJsau4UY2uotrhMcXmvpUzvmAYL4BK0Y6FET6B
         Mx07lE3/7QbjVQ/ll8kwG68OucpMhy9k3AKdOulZWSNUNF0qHsTacECUGqDBfMcsZCsT
         NK4gpX4ElphyoC+moTNAMpjck+elfOdlkBcsbwjMVZb8fD6MIx9c9mtXe0qPHlWJKIRK
         taDCCIWHm8hoDp+5sxL6dZntAn1jiS2wO3wRD/CYJB/icv1m10+XHPWA5/AIureju5SH
         stKw==
X-Forwarded-Encrypted: i=1; AFNElJ+ICf/uqs/37LZbP1HSjDBHC1efXRZfM2Bb3a+i8z6uNHry6jAEMb2swREDjQdxs9AdUvETQFGWhxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXfdRC/qxNst/Z7ScyQ2REnlP9LrfN3PTz3/3m8DoN0CNwb7F
	9qUb0HNLACwIUBKRx3bjPNTEykwWu7q4Xg5HDO5XtTcd1mcjNSGfx8k2ioUeiwSDHlBbbQ4rVsM
	j/feF3BSpSxwXatJ19ZEO7jAmyZUrDIE+QwdFuT7MYHyccyOvhMImBcg220LTaQ8=
X-Gm-Gg: Acq92OFIR1wSJ6FSM8+0xt+EVsuzH8V8A11tAFEty0cP06gy/CeO9KpzzSoNLYhqPV8
	bViaB+njIaI1Wkl/k9Er6TgCxzJhWejiuWH9nKJ9mkQktChwIk9SuwU7+48qnID6uxOn+F0hdvV
	9UJweNj2EYqM64FcNFV2UlXqncTPEBFIwHEJAfwx+xvAQwL755QpK53chayMlG8ut/Q02RzKAZU
	LEOZbviDjeWISuIOTlOqzEnwNEfKYQ7ebd2/wYO3s19aw/ts39RUkdG818dSC9XLOs8j01hk9kU
	YMhKOjCvvNjcjsJrR32M4tzweOIYypepofRXVUafAXNO1RYOLvVoYy7ElPIPYLRxCoI9b0lGH9I
	O6u7qpMFKo0+k7BjlZHg/q5FqFgbBCP4hf0bgmPynqkSDODMzYz1qSY3I
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr215927981cf.0.1781082461899;
        Wed, 10 Jun 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1809:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-51795958520mr215927641cf.0.1781082461469;
        Wed, 10 Jun 2026 02:07:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e03709sm1158881866b.30.2026.06.10.02.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 02:07:40 -0700 (PDT)
Message-ID: <4b53badb-c3e7-4870-8cd8-dcbb4036f0e6@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:07:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-7-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a29295e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ySCF49DNHzRfUD6l2y4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX9PFlAFYB1IfT
 /fH2CS0PttUVDQ4eVtx4Sp3iavQ0UdPnXjDGmoTGENoErmQ9y59HqHlGn1eJgbSf2ZNlNy/vOyS
 M2ETC6tA52DAjQwcTQ1jN5aiHKtYr0tzLCKVeNYz4RRJdQobbKVpDOCJIuxKeIzF3AZquFgSPpx
 Me3sPxmhmIpF4c8YnoXH5T06hMrX2i1XbCU545NVK1iTTOq5uo2mp0jj2xQZgGgoQZZbgSMZEGe
 N5mByPW69WxpUjPT5Dc6Zuy/jY8Xy4ZJQlRYbvkTEdyVKTVAbZD0jijAYzUmoERo33MVe/D/zS2
 gqI7tT3xrlJddZM+1IyUqRZ0J30aZxPNDHoMuAwdq4/sfl1NLt+p6pusalJvbWklNuxrqRO7NpK
 H+0sSPONu+VjHTuQzq0LQg3Xkr3Ng1VjWZdccr1DfNqvRpven0aKCGxXQEopa2gAxU2kKuwx4HR
 pn0OojyTPvvw60WL7ZA==
X-Proofpoint-ORIG-GUID: dn8dTypqqbC2qZJ4XxItHzikVfyLx9GB
X-Proofpoint-GUID: dn8dTypqqbC2qZJ4XxItHzikVfyLx9GB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
> SM8250 SoCs should not be built-in because they are not necessary for
> platform bring-up to shell or even mounting rootfs.  Drop their explicit
> selection in defconfig, relying on defaults which makes them modules.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
