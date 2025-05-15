Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4321771C
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323614; cv=none; b=dnSnxxBiOVB/XASdAMKKk08dDhIqvzZVUXQJg4jrQwuYqHP5pVjnl8zyH8OY7bvbBxf4N4qpLM4QcgsB5TNZqaE6ZJTU2NW0RbTxQRmfBaX3cMUxrksQkl2i/dXj1UixDo1f4XRM1ymzFqoCuvjsdVIl7p+ib79lT0LeaV5cTN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323614; c=relaxed/simple;
	bh=LA6n+/pjiNT3RbGvtG1aJhvDxaCEaENms1z18/PZRDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNDdSAJ50970X3lMQbtfVZp5HRXGPBxgmFeD1SvIM+mU/yJTGqvwL/y/kcUh7EQYXKkesdFOrNZJJ1JgGFy1sSO/xy+ZqbhOIxzYXcMPlnskHV5lvBZNon5U2L3NyZY6+OuaaTyfDS2jDvwGW19pk0zgIQ11fmVMkpPWOILV/Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXHWEKjp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXHWEKjp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCCf026149
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4pk6qqQf94MNh0qP3FehAuZCQoGUKgM5ka+mTmo4Kc=; b=VXHWEKjpAhc9tyHx
	wnBUtsDyrO8f+PPjfbcAaf3eCD8gN+x45HZ/o9XPR6jZ7CgOi69o0AQxgN929ODA
	e41SsfbTbsO27EwBIKKXF2JBgc/B30r8LKrfCl1KKNQSzq4YfpXqrc1lnh5zqvDK
	N3tsy9MQml8d7e340VdShpR5xz9dqgEtNG1XazpEClPR5fb8X2yXx/oJ2SdNZK7W
	5UpdhzqFE7H3Y3qb72uPSiDJMihiX+xZbkTr/Mw5RWM5FIv6OnhemKwNPLf5QqwQ
	o5uaNkUj59HWABTguBWEB3xrnadDswsrVhtfVVs1SnSQr6lKKLrJ50PwQY5OXT8+
	SriR5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcypttg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:40:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae9ed8511so1949931cf.3
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323610; x=1747928410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4pk6qqQf94MNh0qP3FehAuZCQoGUKgM5ka+mTmo4Kc=;
        b=DL+8bbFJ/nfQPZTZ336omKmQ/ZaoFgBMsizDo/DKMRgQ/4Sr00JAqiASTZxHTUhpaV
         rjfwBcIij55J1Uh/bI7CpXQ1ZXe/YytL/lJ6abNXJDlB+lu/cqtKP1uqkTQRLayACkmD
         929FwMXQpnAYiL5jGXAtArk8TgjI/kSbog6kuX142dxf6k9mCovneDVIkA8lQvgm/6Ch
         9oD7ERih5iJ3G7FNckQtp2ChXlBOChy8N9qVEHrme4wnH7kIedk3uNYxKnmKd5Vh3rtv
         /mtYvsxKpfxwVekowjDIjjNtBmVfNQItH87KArvc2ZuQgENMux1uwnLKfKVpF2GmHYoQ
         vZtg==
X-Forwarded-Encrypted: i=1; AJvYcCXeAExMaDnEfej6PUZ76Nx44bacMYRhsWTgaNyzZQ3/t7NjVAWZAhzF8lEi0/l0YpdRQrOqrlpydUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygB4Qqintxz/vJ0xiX3sua0ZYtrQ2581QrXdLJ26bsdv8ntVMl
	YPSlQTOi6b6SdXQWRxjjxFYuP6kbmPP0UES4iYH02GGBaXU3dcaz2PHlAXmOAEGAHh09X1phi5m
	qCZWju2EY79Vd9T4ykayJ+22iWlF92Ht4rZtyBMnA7RK5DThitXgWMCk2zeQ=
X-Gm-Gg: ASbGncvCbmRvat0VS1mpN9DuSRGMcwGTg+7L81DGPu1pjUkkKa3uckkyRODEF2UqjZY
	UX8/cde0LuYMziY5TGag+AB5vVKeVV3QIMdJuz632EX8O42tZl9cFlOIVQTZeqTVnKwAf8J24da
	oVxdOfFE7TKaLmJTIoKLCSE2BZJzs4k1KvHbLzCSLdZOle+lHEPBg856MuLb9f9AVQkUwFanuqa
	6BU2a0jrmjwdE50KU8kz7BBzjVxznpt09WMQ2BcFoKrbEuh+0I2fS2JwKyZzYMsSrMaBMOqa6PQ
	KZghoOhwaGQo76JpaSjalToyCzlPcioCk+lxCfJcn/VlMNTyfl+0ETsg76NupOgxyQ==
X-Received: by 2002:a05:622a:1a93:b0:472:1de1:bc59 with SMTP id d75a77b69052e-49495c6672dmr34442271cf.6.1747323609905;
        Thu, 15 May 2025 08:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeZxWV/aIj85YA422H+ZaMSL8z0aOcepnuoDEjDToxS7za+PZIF+/FGdk5MduxdyhCILATxA==
X-Received: by 2002:a05:622a:1a93:b0:472:1de1:bc59 with SMTP id d75a77b69052e-49495c6672dmr34441961cf.6.1747323609433;
        Thu, 15 May 2025 08:40:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06bc3bsm6306966b.47.2025.05.15.08.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:40:09 -0700 (PDT)
Message-ID: <d8574c30-d397-4218-ab02-e8afebe9a75d@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] clk: qcom: camcc-sm8450: Move PLL & clk
 configuration to really probe
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-9-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-9-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M3rlt4omzYU6wRY2Whjt4yReOAupIT8m
X-Proofpoint-ORIG-GUID: M3rlt4omzYU6wRY2Whjt4yReOAupIT8m
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=68260adb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WExNFyCIVdiA-8HnxWkA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX8jANpqa3TTlB
 Hzoo6S8bZEuJItcnWuNDRRoCWqVM2e5+wX+ZF+vx6BUrVheBn7/aabXCSBaJ8xNAm8sboOfb00O
 xhzd0aswj0klDCiMYO2uqByVn4fBns6Nos/UuiiIpX8XmJVIWT9xj4lQlzWLwk812hAW7YlAjct
 BimwPtafYRDiDjWW3f1xhO9goAW8eAL3fN9hmYr24CXzzD/v7FsnpwXop0zPKRycBCRUQbVZd0A
 qzsGf9CqyuZ/1LO7XaA/Is5izvCJUW/cfdnzYP4CimiCEIFlexxFGq220tNfaBVvcKbf96qHtBc
 FBVM8wCI6RgeEcaFl1bYeqgo24fzTXRbaapJeBfI+q+sOBLJh/YKcfxSKAnpEN98CpkcIPF9ivf
 ad4ZP8P2FBC6z9sv7JxFP6g2nhcugtLiH8c5tcYedKdFGOtjJlEnfsR2M1xRpSU9kjVbN3sJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8450/SM8475 require both MMCX and MXC rails to be
> kept ON to configure the PLLs properly. Hence move runtime power
> management, PLL configuration and enable critical clocks to
> qcom_cc_really_probe() which ensures all required power domains are in
> enabled state before configuring the PLLs or enabling the clocks.
> 
> This change also removes the modelling for cam_cc_gdsc_clk and keeps it
> always ON from probe since using CLK_IS_CRITICAL will prevent the clock
> controller associated power domains from collapsing due to clock framework
> invoking clk_pm_runtime_get() during prepare.

generally we want two commits for such things, but let's say this time
it's okay

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
