Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BD35A3A6
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024688; cv=none; b=IXlzgyBzaaPjYt93FOjV0GYuvnHXs6/l99mTznP3+5e6S+kePkbxgBHoY4zlSdyw1CsWv+2rL9CQh54TRot486nkoJfLtPWHx43v/b9j/nJZNUZYzO40K+HZ6INrTBqM2FLMWibP0pDW2bjNl3ws8aUezgg+nhgd1lD1fyjB5TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024688; c=relaxed/simple;
	bh=bV6DgEAbKJZLYN0J8dVuJg5XZRJMUGqCLBXs/Tn3PxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oIjqrtxBuEVeUp6yof/6Fv6xXSnSpau83quM1lCXdrJBfPyKwEQ/fqnf0N8uWk6KM7/n3mDyZkl2eGsimNHEKqCn+uT0bAHlBr7SyV1X/8+m/wTD/HlmSvDyTDys54LbD1ARAGj3ruwNy7nJGRC41LmRVxlzYL3bUQRRZy0fud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9AmSok8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkzW4C5R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9AmSok8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkzW4C5R"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9W2CK756614
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVJB+1j/Ip1slZFi5GyPhPGdi+QIuHGlcxeghRVubMo=; b=Y9AmSok8kad0dlJQ
	9iH9rVsNRqL1PtVs7oLw20BhpFhS8zoRLuASmq8PQPzgHdL/wjI1rCdCD9duopAr
	oPM+018Iz7nQ54FJozCgV6j94dvGdDCr9zLVJaVmw42tX9Mu3+i/OGQstO1Zo/RD
	3KphUBaYkUdSDzAUnmAuot0k0zyNTg65i3U0GVxTIR6Uo7j5Z2mC10J8mc3VhGj5
	jsEACjmXhX7RqUZP4oArMffGgQoFCVEVQAefNMK+LnRFcCosTEi0ZSbca1GIp2zd
	flvCh+ri/2+I865xpEQdESE3Yktu++9mmXnZIVVLBs/rwEim5KP574L+h7R16lK6
	PGQu3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bke6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:58:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso69592971cf.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024685; x=1777629485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVJB+1j/Ip1slZFi5GyPhPGdi+QIuHGlcxeghRVubMo=;
        b=BkzW4C5R3Cimu6/tup0zHHHZXz1r/sWuBWLCRQzo/CQcJUMFJcS0YYy19iYa6rN8pT
         LOKoTIiVKKSQh7s6WV/hpT2Zs5FH3rFTSYF2RwPGov/aFIAbCPL2Ii5/CEARSs3vhxB+
         HBzp3bL/5e19DwcJxdJzEC5af9FO8YfAxDwvZA7qZre+AssOaZRwgJSqH1vByA2szI8H
         ZqrnmhHcI0XQaPOgoQ0oLgvoiHUHkfpELJPHr5cj5V4eXzqNBiVnPHJZ8feJgUIFyhqP
         /pkrGl7bWmX+lbtcw4mLns4Am7ONaWaC5dylSNmWhz4gpuhp4Wq5uzGUF0JVPXMoDT4I
         oPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024685; x=1777629485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVJB+1j/Ip1slZFi5GyPhPGdi+QIuHGlcxeghRVubMo=;
        b=FwYw7I98aRw3NkJXN4/J92HVOnXDtl7sD4OiWrR71j825xQDHdYVeahtOCRjat8MIB
         YMxTSKmz6ZgEfNlwzwWzwyPSzs5xGqsbNnH/mIqbldZnYO9wT2sRzTWQmWPIfVR3Wsds
         rei8OjmiLFaGBHPJnaEy6UMi7qjkFf212eEpK+bISVH3iN00BpF3xkkZXqOctLhC0jNZ
         N0D5ECeQERgx75cPyQCF3bJXo3pI0aSqlT1vw6O4SE/1WJkTYTPD0T7RGQlthNZ8htZw
         uX5auH0sDWo1ALGmCcnYOLlTfHCwBbWnUbYNg4jQt2Y/YkaKNOXAmz8Yf69+yeSyLXy/
         NL3g==
X-Forwarded-Encrypted: i=1; AFNElJ/W+3XALftl0uVWpJALRYFRoMMSiEIQ+bcJ51Aj2T0BjfBAMsIhqfYHGKsaStPZ58VBPP1wH5WhPUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLKQDpyJC0WOW3nPmo4vhJK7btoSFiRn5xTExsoMY55QpigJyc
	TnItl6cggdfmr4rkIJvchetBd9k9eHwlyQKSjsVV6xLYevuYDK086CMV1B92VV/Xll30ZTQQdT4
	g9j0pCHbaQi3hcYxjHNumiEpldGJbFsqGBy5lP/J3fGSptG0XtUeF5Fg492Jje/A=
X-Gm-Gg: AeBDieswZCAl0A1mQlapi5rDZN3CXbq9GT2DjdCr4DuM1hcCOv/zIFJ/aSJDM6OBqny
	aNYjWUcZWAwaqDsVho0bDHF6x2WIwGbsqrTmLgTEk+SmpflecBD9pvc9Q0n9VDF5Wj4Xf6FUFSx
	vtQsNfj5eoglqDvODwEGxkS7fmkTkGGPPQVRnhFs/kq7HNWZAYR7oG1glapdvi11whKejGIEnWv
	deccawh/bGav42MUEGI5K59dM22BxCM0G//gMKz9MTh6weyzKAuOKCT6JOdn0yuC+QonA3g14O2
	isWjvqMAsdqFAFhl2VTIBqrZeIgUkVL5TmrMPkMvX5kb3zW5qUzF20OXtXsxApA/rWNThgyqtIH
	tHmdfxWpsl8joxmIL+JpGr/eVucHhEK9urxWxVVwas+efE4PnX2loTwzSFaHr/TnQgE2ztNscqc
	Ha5hXfIIbR2hcSXg==
X-Received: by 2002:a05:622a:144:b0:501:4767:a6f with SMTP id d75a77b69052e-50e36c08aa2mr313961431cf.3.1777024685419;
        Fri, 24 Apr 2026 02:58:05 -0700 (PDT)
X-Received: by 2002:a05:622a:144:b0:501:4767:a6f with SMTP id d75a77b69052e-50e36c08aa2mr313960981cf.3.1777024684910;
        Fri, 24 Apr 2026 02:58:04 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c47fe836sm4861717a12.3.2026.04.24.02.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:58:03 -0700 (PDT)
Message-ID: <086fa582-082a-4339-9168-479f3e92288c@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:58:00 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power domain
 to GCC
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
 <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MyBTYWx0ZWRfX3wee6IODaeel
 3wbJypmSu2Pm5E4ThLiYxn0axWbaA+4iTyq2bxKUMatGM5i7MCSJwe/w17Kew0sN+7ZDYkL+RHY
 J71QlGJKQ7QziHSuwS+Zu+sW4ViLQN5XzTjlkugLRNHq1mqSbfFr87Hk4HsF9QdBFfo89iu3xaN
 7fnsUUjyvxo5eVPYVn4KK6x3EW6TdFDfYwm4MxrHRak6ruxRqaxwqQErSPJqtArYsiUoGj/+H1X
 c3cF1RJs46Fm1Pve90ZuZenvpH68BnMcYNMAUkbjOG0LlFcZn0S0kqGeggp9SpWxX0bcHOWVSJt
 t/ipoaRqvu0jlATtfTjXmF2mxxQtkWroAHlxWkMpJYo9RIrfOiWdM84BigPtqNiCLp+6QLxQTJ/
 uHwzRRnyn06YXBAcDRvmiq6ntCa6iMr2MG3VGoUu4M8iqBOmCBDGkkK2BykZd7l1xDSNt40crgb
 AMsAFgqWIJy1bw3yGMw==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb3eae cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Fkf1F6wwXAJK7cocUXQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sEjMPV5VyCVfG97Ivu6g8dM_-Kt2jCg5
X-Proofpoint-GUID: sEjMPV5VyCVfG97Ivu6g8dM_-Kt2jCg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240093

On 4/24/26 11:07 AM, Neil Armstrong wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
