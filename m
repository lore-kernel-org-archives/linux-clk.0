Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CEF1386DA
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766576656; cv=none; b=sln8VjHnw12vKDOms2AyA11Bz4211R4/KQnn+UqX8jl9k7bHiA9hehZuXh8lK0y0ZRANDH0V0ZV/y14LcN61amxFzOX5ZgloLdPH7k8BQsM7T2A+Ll+nQrRmcD1bC8IXKEjtInVF6r9SxxuT46QxsU3MZCp2nYWmSUbzn1mvVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766576656; c=relaxed/simple;
	bh=d+hZ0Da3/jFr70jTlXa2MwcxwIJnbYdC6hCi9sYzhp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NRt4h1h2KnpcTkXb5+1fxf1YMpNWiNeOmxs/M2c6IiTgKei3vkyfWWzLa1+v7LNv4n2Gfsajt3pqONaUkLpPQQa8Xm3ma/PuOV5sIpg6aFCAxEvkpNJH8f4JQwIwYDstVUUERvCHCapaEjWDLZ76W+gDoUCWN4FOehbp1kIAWWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENyXk82q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfWhskcr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENyXk82q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfWhskcr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOA4awC700694
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=; b=ENyXk82q2DRHAObx
	E9a/i02N1zLq2UP56VZ4ZcYuJrIDkECfJxmm3yHPLJ4FNaRrTRNQBVZJA0kIEDT4
	uurRQ26iShhgPM20AC9Yclu0nPkpntl15cBSAoH+ysqF0f9WGXbX5ujG622Tt2Yp
	tQAoJH6unFNtVTWoO4hPNt0LmVq3p4QLEMn9B30wtODqBkh2W1sgggvNmAH9BLoT
	EJMdZtuwueydgmPBSYA86Qi73COR30JcYNHIgJeU2cBQgD42hNOJxz/q8r1Z922K
	Pc9pg9I36LHfqsTzBKxaZvO2f1A8PPOdly8HABCHxV4MDj1iuAb3rvHyMrQGH/HY
	pbkeCQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jukqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 11:44:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1f42515ffso140505481cf.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Dec 2025 03:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576653; x=1767181453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=;
        b=IfWhskcrS5UBl7wi1CRa7bBOkKvSynwVIRp40+qH3CW8ToTR8eEGCe1ynt48SUuJHE
         oQGMfDC95TJ5x5tVJ/pfBdkN9nUErsGQJkdpQmV/JpaxOA7vcv9Io2dQlA/M2jahYHWO
         5hZ7UFAMj3bZTEKEehEAD6T9gemazGPRNA1t60gsToCgIWVD1jAsxWOKsG1MjV3ERjUv
         DtFueuOEe/b60gvDMw2aJ1cVJO2FEKnCevNt04bpFUqqNp2UMXAKcowjQ5npaJHdxWs9
         wEXT13R0QcLiPTvtsBSn0DidiID8w8FgvyX6hLyMtdSPHeL7aPiJAzSFz26H6Cv3F7na
         ojNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576653; x=1767181453;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw14dTNNar3xjN0K0rNWEepI5C//RRiNWDCDFQrVAK0=;
        b=sprwTQR9h5fpdLHHW0ptKX1DFqIgpiGgckXiWodklqEr7Tr0hfput4aGW1kPQaVWDK
         co/VOVTd3Z4Uf9HuLG6ochb+gxV02MLLTod2i3JuHJtFHkv26rtRA/PRdQLR/i3UroBn
         z23xSpKkRfVQi296ImO/Ee1dd44pL4yc7I+JYmlnIPNWjvqszTiY7spbULYI080pCdpL
         AdgBGUDzFATpl0pN5OzUJiZRzHAjqSlzxD2MsuE9cUg5b+iGWlKYRWIfHDWAYIJoqKMu
         28HhK+8caDweZRCql/NdSpKg0LpKHaH/QAgRUFZ0IOz1x//jyZZkR3bdyfnD0v3W8FzV
         dgLw==
X-Forwarded-Encrypted: i=1; AJvYcCW0/atjbDB2EIWNl7nUBtRJE5LshJTLpterkZOuGyKeBzd4s4EsUCM+mwa6KpHSYC0t1jh6Ggfk7mo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3p46cRNPIqLskVtTfUcT2Yf+wDAY7L1XPCa7J5o9czAjSCBg
	huHI+uNYnk9/6Ckwo94BItzsncGoS7wscOiOXiq8DLf8NGaAq2LYddxcpc/7GW27QnCIK38hYnz
	OwpxTjQIDI+QpNfZKTyOIn94VMG3BWH2XawZdISiVPRSk0bCIh1CT+7FuKHHTTTk=
X-Gm-Gg: AY/fxX4PC0KT2mW/6cUmcS8B3SrSEXyVHiPhr2Vi4P4fGL1adMlKq3wHl85TIN+AYg/
	EKaLaJhVb07q8m1gDXErDeeTrdu9d1AcuwZvh1KsbyZJLmSWrjVqL+E4Oq0E5owFhoH+1yd1A1i
	PcD1q0NTZjoZHYeSIa03CzNebQ3ycb+YNs9Yd87dvPdK0BemTuO+JvU1IoYUUpa2IMiVXitrCwB
	ctu9gsTZ/kiFYaXoqy86+ch6KXQScz0ZuLePQskqLJg0HRw+UaiJVDJv+XKoWTM1FbCZp9LvK5Q
	sqywiVwCWDl4pOc13auuvOSDvsknVBdUXnyStDy/yNlRMX0Bm7LZcaOCVXDJ1bf355LeKIEbGJB
	2RTrcFJ1X63a5AxNQe6HedQQHp4ecNBTGI9ZJg8Ce9w76TAoiu6adPNajtMLXzwoX5L1x/NezQx
	Q=
X-Received: by 2002:a05:622a:590e:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4f4abcf4ecbmr262095851cf.30.1766576653254;
        Wed, 24 Dec 2025 03:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs9zHgQ54O9SmPoTNaLtpDIdihVeFh8WVHEkudFfOKjPlO6nErt/T9YHjyboivLFW+6kjQ0w==
X-Received: by 2002:a05:622a:590e:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4f4abcf4ecbmr262095661cf.30.1766576652811;
        Wed, 24 Dec 2025 03:44:12 -0800 (PST)
Received: from [192.168.1.27] (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm1601907366b.30.2025.12.24.03.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 03:44:12 -0800 (PST)
Message-ID: <9a99ad41-10b2-4032-9ad9-e49940e1d241@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:44:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: zynqmp: ipi-mailbox: Simplify with scoped for
 each OF child loop
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251224114210.139817-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251224114210.139817-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX+/+oJ/gVvDR8
 +CqqdUJeP8F3vEb8Idf9sV2tjpGFNwynyuuBRtTq949dbX62Aadvx2EXxo2frvTulLivRWW4bUp
 LXzNaaQv06hf/5zkeTeO0kGkuqAK0vMsrNYKLX7BgCq5kxoCo4XW7OTAMtS8WJJ05J6sjtDTp/w
 fhlTSEMQre7t0Netj9S7pCNgJjxrTI6deOQzYM8QgNBarmnBKy3GouuVluC0Yz2xKgIS2BqLmkj
 5DqpfTsHn/UYLXIw1JwaE+oXpyvWiiUCR9aS8cR8BiGhMmyI5F43hB52ES9Vj7VqP6y45aUE3K0
 EU7L3VVvX8haymCIK/sKXOVp+vir5JAe7oFZ1uiAw4OLImJdAG6uCaqTP5OzgV5tEoeqORGGAY3
 gkyoHbJk6enKGLqPrU20hdmqWW3a2CpLjfmFWe2v8ZDXUxu3xBS9xI+ezKh02+bOjtrdz+UiVd/
 KdQvJs04X71yR0nzohg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bd20d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: VQuS62bDzS9S6S8XmvmluWcMZ9APBUx_
X-Proofpoint-ORIG-GUID: VQuS62bDzS9S6S8XmvmluWcMZ9APBUx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101

On 24/12/2025 12:42, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---

I am sorry, that's a mailbox patch and should be in different patchset.
Please review/pick only the first two.

Best regards,
Krzysztof
