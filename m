Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DEE3B7756
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912463; cv=none; b=rL1srQuCa+MxvfECR3XpPpaHulU5Q0rfOE3Wfdoz4fiJHZQleJ9j9gZ6zngy5LLFph4tOpObXsqNuPWJzr0O8X8+nDu/7Tb/ovShCVSnCzUB6lT4KsGqxWYqe0AjmPj1GRa+6zS7pTRNy3qB/YjI14AnQhag31N5xJkNiwRSisQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912463; c=relaxed/simple;
	bh=vsKka7G3UmX3nzKB76Cu1Fakbt5a+HQd2kFbP9s5dNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIDqTpteYBEnAbIvwRkyOJOcXzy0byBtB+VOCSDyMoTUoDt8Qncb4DTnScjJ6LjDWMNi9BOfyBnIuYSyHOGxK84UOFgVuo8u0dwl4k4q1yiIYn/zvo6uXpxCOL01INYT5CNZwwIqngzNo6ScnYf8yryRhfZ9U+zNm9xereDLR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNPZCTzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYShVi+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNPZCTzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYShVi+w"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65890pNh3163827
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 09:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=; b=LNPZCTzXuPhZKgwN
	LWdoZSqKJY+pA57plhC8H1zPKUTiJqYskr07jsFA+ethhPM/jI+d2EC3Z77vem+B
	+CEirqmLUW0KOr6sGth3k80oH4UZleEhS8G429ZKepkZL6B4DZVi1P+80x6jw5Jy
	EzDHaN9oQtxmTEUj2HmjEwOTGR2QLKWkh/rNSA6VTQB0vwSDnmHqE5BP9CVqH615
	VkdI1Spvh85Z/417lqis3ZjGdOP7use5XVSvmNFM0pq2JJAJ3MXnLRhUqE2qqF4F
	JsPqssmj1pRBXFRrxbcx9jxn+5LrUPkPXGappxISXb8HDGezLSWS/sVX+j0EqrMF
	k9tz6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0g7kx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 09:54:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso118711085a.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912458; x=1781517258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=;
        b=cYShVi+woA3zREEjZOPN1LBdNBj9RMNHotGpvvj2S2dkeCmZXEiRgYCFJNiJBMnflJ
         HKYGLgwPokaEMSFFuu6TV2CFVioyntHu/uX5FITN49H+Ewp8QnuhjTMlIEbdzVn9wBEU
         HqRjNBLaiVhricOkcSHnyviyKXZ08umxj6a2Z1xcDeNyT/Jniu4buoPUt4yszO4dlvDi
         DKB3muwfWsws1xmjQ/VkINvq3565tx5kCjlQ9NIjq/B+wuSyGBp3qQChi7ClhCmAakUT
         jFk+xoF9csKJnO+xHyIN8vKf9MXyOmG1Nk/tveAqSADkhzR3BJuPldG0O5y4Mt0E8pMr
         MKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912458; x=1781517258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Uf0btmHOdUL8kHEgziQswexx3pz/E+zEob8tZKq/+A=;
        b=nqjVtw+q7QwEZyttvYiPGkY3R2KYshBoUtqdU8lSi6QXsP0xgbU+KXG+xt0N5h0SeV
         /0bZ1zHk0xgkSHkZdNYH1tpCqtucwTyM/BUZ0UnOZoIhmflcv39fO3J1FW2+zwVs2OPe
         N2hfQnkqhHU7xTS5n1DsRstJVmrm1nBgjxzl1v/ImxpkMEVV09wJpWBJeb6tDLK1vxBj
         5WBPYq6bEZKbH/i30Ulm5JFLTdeL0bP5nX75vqQwppcxz3MbhuunOqakS6gqf9HCUMUH
         0ObWlhiXNheccUfZXw1u6bekIeZDmCpu5+xnXEg5FsGvlq72Rbf3hv8o/GgZvG5k6yRq
         z/vg==
X-Forwarded-Encrypted: i=1; AFNElJ+Mqw/fDTnp6ZzyOMzn6jiREWft/AQlcgFJbbiCFznCX44TFE+T2297lNlvZkBge+obiiO3HTXJUBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY6hZ0Spoqd+DHr2Lnar/vmlKhQu3anBkoXUP3efjFPuPSBPf1
	480MrnvIXQqmOAVqiZElVRLeFNymKD9LGP+TtVG6Wdi8oguEUtvr7Ba0gBSsJ0ZpbajG+09eq6y
	6eBSxHnHgJhINh7JOoaQ3P4I7Bxxuv59UUBI4oHVouOgwlyQ2muUwk5fmjrZ3Mu4=
X-Gm-Gg: Acq92OEWMztwWtd/m+kgthxWPPC1HF8p8C3S23WI/uohL3CWKaodeM2vzvhrouBbBq2
	HAiu16nglzLeIZ6Y7zcWBt5tFXf+Y51FBeUxttCC9LclPpUMON6XpxSTefBdJimzNqC6n/6OO9h
	4rVTYkOnPbwQX4F4jf/ZWyQ8hHRd1N27VsneIxGWhmKRDQAh4Hf798KV1joCGQfcHsJRayMaRFV
	sB1bFtvjSeIWhi8p3SfdNQy5OPcX+uWnTwGrUALvMxfzRHCaBjsl399SZBNrGbFyoSGZwc5WH6t
	Xn/lsm0YQgLeeZ6nGGiQzbt0HZJWUoCANLT6Gwbx6Bot+oY3tg68SxtpWgLT4z6ZH9Pwz60kddw
	wFGn8+V0d31yYQkC/C2EgOK31cat3wsP0LdbKH94nEu8GZFjfPG1ylamr
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1416235685a.4.1780912458314;
        Mon, 08 Jun 2026 02:54:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4145:b0:8f1:9e59:2208 with SMTP id af79cd13be357-915a9d5af7fmr1416233885a.4.1780912457931;
        Mon, 08 Jun 2026 02:54:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051cfsm848509866b.38.2026.06.08.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:54:17 -0700 (PDT)
Message-ID: <f9136a2d-9556-4d5f-9e26-70255702b6cf@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:54:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: Add support for the USB3 DP
 PHY reset
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
 <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-gcc-usb-resets-v1-2-6d9e7fee2998@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MiBTYWx0ZWRfX0iTvjWIr6gpe
 FahlnW5T8iSssKdgC4sJj5SEVMzrLzRZeL6uqtim8FZueHSjFHF5LzNWJi6ORkX9KNBi1IdYrPH
 9MdJDD++ncwQZILe9jglC17+qMmLPpuae8NbmFHpfP7lPmis6fUBT927PGEEUbb+69OPWkBRX4c
 Xe62aqrQybEpdvq3VNONHi08i2wExh8kcjINEKTTub5FucZ2LyLHUiKAW4fg1kZ5XkLlZaEQ5Ak
 /N2oCLPyMdACECQlkw86/uFgz79psbN4+fyiS1pFojtfVhEH2mp0GKwScs338Dg7FYgfDz7R9vN
 0oW+hsDOJnY+DPVjTbPd+7VdxhMR3uCOd09vVjQEq/8888bKcVk1K8+kQBI/dQYq2Qd9WyBf2st
 k831o+3mFfPEBomGa+ficOvP5QX2wSuSyT7Uk4P/v5QwJ4+mUCxLF1YZyf6Hnk7c8yRRqDIvtB2
 LT05sNMGUX/VfwalGIg==
X-Proofpoint-ORIG-GUID: TmKZpbpGqZFulqa6rsWh2ktJbItL5xAr
X-Proofpoint-GUID: TmKZpbpGqZFulqa6rsWh2ktJbItL5xAr
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26914a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IyfWUWnWmjsiacPjz4MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080092

On 5/26/26 2:54 PM, Imran Shaik wrote:
> Add GCC USB3 DP PHY reset support for Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
