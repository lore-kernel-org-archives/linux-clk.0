Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE893B38B8
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523763; cv=none; b=nL/A0eBU5h7BE1/bZWCcGI0U3J027Zsgv5vrllUEDHTZKvYFvYa68+BKFdPLo6FO8yV/oFv+yxmtv4bw2gcPX+MYrloYMSCHw1F73vU7S4vIB5KsXI+VeK2tcWq1AM2L88UlTikGF6sXaqfzXIdyxt3iImIdjDcdscvYpxJVTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523763; c=relaxed/simple;
	bh=7HZ/p2qWs0/610chpsEBI7thFDTZBQAfrf5UF3//urI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdFBBYWg2iH6a4Qng7JohOpWZ5SGsLcEEOBJr2XVqLaUTZVqAONATvE/FWZenj2Jx+gDNr6x0dF1E9bWfslx5wWctXESmB+KTi8MUFJ6qnDgYpVgYo5QqIixkHDA9dGLPxtnKIZV6Y6VF0YCainAf6DG7OwcXzPxOHoR/heRDcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1QuN8NG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJweCrYb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1QuN8NG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJweCrYb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3TEJ2667497
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=; b=b1QuN8NGglJsWzFI
	/5/OWMr0iy45ykbTib6rymqZnggykGKI7MPCQvcCYyMuo6CU7W2dM7tvgAIUyjBV
	6c5mtGi9uby5CqhI49cGSA4KOTAsFVN/WNeepR8mDPxX5Mr5IJPqZ4UYCMHw4eO5
	mCCFRELf1Zuz75R2+02jvLYLCEHJtu+3Tj45B9ED1TpZ7oWFTQ7XkD7Xf7B1UUY7
	of9RAUSqWZxfOhN+x5Lf2Iry7rsZqeARGcYhOwywGz4uA+G0ciLdJ5oiyQzTkXES
	+pTguuAU+a5IgiT+Gr5hrsY8vl444DDJQ1Ng4v75jC+yf19YzzgNe5Wf+6NLvPmr
	taRn3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hguud7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 15:16:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3881937456bso1388360a91.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523760; x=1784128560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=kJweCrYbaNT/4vfy90dbbBVDmrcA7rLH3rL737zCOFqlo/XEzmCpmZINie5SXP+EWH
         OHGiNbHJC6WNXTcTDU4/EQ3sjONhxLHdO29sKcsj1fKQY3zBu2pqIin6pR3w2XPA1wpp
         vXsfcqJPG8vixZvak81aiMVAeYpqYtg0wbHc+HriVQ5gRGqDBVmLTFwWhYiSIXERzMHs
         AoxEMexI09AEXhkq5/NbvjTslqPyHH00B0w62wburP/tUgOysrWle5ButPjkcpvmyzJu
         kDo4NDwMzm1IbLMAnU23CfxSfLMFmaYFTtd+Q01FhV0FW6afHBq9wgJ49ceuCs9jUfmt
         3Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523760; x=1784128560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPNK0vo7rUMajncS03PJq6/nSh8BMzbk+8fJOLI97tg=;
        b=UPgK92sC9S1J61ohXADyrRrJRlrTr6BuQwlIVEmgWB0/MckPq6B9Pj8LHvnIuj/Htz
         /Yx4DPhcgWhaEMW68yXlaz3DL5Nn6Wj6nRsmjSoWOCaqBzeg7923tUPrh06MFygrbbJf
         7HZBMwD+A4kydc7xbWwZuMzF1o7tYPFpO/Z/vODhTfTB8ivK1dYpXC2he/e6nWYDcDVv
         8suBgpZ7O0QyikApL1dZAYhI9EkSNzsaCXaJFKDHBcJnADTvuvTJEOu1qusC4DFIrvVF
         cqNiTRCtBzRWTTSS0+KQQ4x7HngDsUbzgbR0PrkzTif5Kz5q5I9XKN7OVYfwpalKOmKw
         js9A==
X-Forwarded-Encrypted: i=1; AHgh+RqnPDRp/cbIyaAkri1BK7rJZaykVrjfS7bY5CXXYIQkULwNT2LZA/tBeyuLtJ2EHCRZCWSXRSju1WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPi0bkZpeb5g2YVpdJtAtsjpKHShoPkI2GeLeibxws2jG6dwSQ
	nYg3/Vqe27+PRpzsa0M6Oz4SHwRCLvSCwHCR5peNk2D5e9uuWgJsZTFzPqqKSdJJCO4+xopkpf/
	BBUjPjNq5xTC1l4ulDtkDWPA4HbGQBHKhCLqHvHWW3RFjcVQgafU59pq4Ts5Xzwk=
X-Gm-Gg: AfdE7cl6MsHrBH4epPSrzl1+9IQxz3ZS8fgyPzksR7Qtq9jF7dOc41yXE2jW8q7JtVs
	xcs7Xt0LnQUL30CqU0Kjv3sB8PyTFrch8tWbYiV7CL9Xf3h2ToOHvXfmmIz67gADYf5oWXCPN4i
	aR2mpxUX3ZaOFXXb4cAram/qkIYhTO9HkzyWsWxneVMlgCKBVL8RUL0svKwZk1zro/ECBr8fFtp
	GGZZ7BsxthpbgMhK032ZkYCOZQeJkn9lf9ZXWRZOrRaqNr6k/zIp+XcmGiawVDCEyl3nNhIWC/n
	n99JuuGQtGjUgxEbY/wd6ioBOQA+k8D4IL9MytumoUM05L3Gj9MGQlrh+pmbua072H0JD8PiG5W
	S+0SDtEETOeC2r/MRwuSYcCw/gV5Ma9TS2+X3W58M
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475166a91.6.1783523759641;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-387d7270f6cmr8475100a91.6.1783523759171;
        Wed, 08 Jul 2026 08:15:59 -0700 (PDT)
Received: from [10.204.66.13] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm18273012eec.18.2026.07.08.08.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:15:58 -0700 (PDT)
Message-ID: <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:45:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l5y1-NK2XIwYRlXunw19r1QJHVK0PuVm
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e69b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=hdgLcCZjOrcdczLgVvYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: l5y1-NK2XIwYRlXunw19r1QJHVK0PuVm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX5GpltwyAqrSu
 D7a7MDn7fVnZ724iOqVkrGUUaTRolO/y7c9ZHaS1CYkcMCay8ulnxMnMNqjtQcDGfKE/jDCkPUX
 400wFBO3qcCtjJs55ky0wGrFaYudrXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX/buun677G5XR
 466D6Gr9WsTqowpc0soTgSVuOdd9/ifbIS+v8rW+mW3DbjYAiDVc+TY5tBsRm2+/0kUtqgLZOcZ
 3umXJPM0bVzYlOj3gLw61sPmOyLqaN1ylh0T+l5UwboIc0DvrtedUFhGulv7/5EWlL9DU+YP0FQ
 JsNPD5fiJl5UQQOJYfY2mNEqOgRil5+Tp7mouoA4M0+gobcfk4i9K/tPVkfHm+xfiWEktHgTKaJ
 86hHvck5OpBjCo4VgwhshXrFVFJFWswYCVcxydZbeULKhG9UqaDv52viLHCEamSBvbP7p1eNehs
 YmXs+RCAABFEIAo35QW6U1U9UqyxDPY/OecGLXfR2FI/Qd837nno8VfdeDgZw/ONXmKWd4F6SJZ
 Scc1LiMooQIA+/03KUw4USoPjWTTNct/9MzfjvQBc+kmPLcDP7yPP/nTkDgj/R8JqKfOk8go/cW
 PgsaaRB0QPnVKb4zOeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150


On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>              iommus = <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
>                       <&apps_smmu 0x860 0x60>,

I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.

Regards,
Vikram 

