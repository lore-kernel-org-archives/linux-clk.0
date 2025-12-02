Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4989265630
	for <linux-clk@vger.kernel.org>; Tue,  2 Dec 2025 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764689836; cv=none; b=TzMk0F2WbgTBoE9ijsMNfvFOOT31pT7AFwH0Oxo07+vAsPq/YWSHJc+R6v1Ua14PGnDyjERL5OxLPgVnHAWrn9SytVLj/53mXuxkw4vqOWqjIxbvEIv1P2GRkNwoKMcY2z34tLUlGJst3Mu58eR94c8tZNgLezsunGGGJcZaMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764689836; c=relaxed/simple;
	bh=j7IN6GMzwOkUHFNWSKKlQeV8ehCPMjJxrWIutIewhVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIxirBdkwzPngcHfd6i41lViiMgsYgcZ4sBhn4r7Wl/MvS+JqcMXKrrFsw65W4UKIWOqB3rVuyKEIjxVqLkStsayFrHcn8N8rf+cLPevdjSXvqDBTZW0Owqna5LvSgfo7K0iFwv+HzzWC4e4/ScAXmfu2ZsjVOTke25TYEg1w34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNymD01f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvLkqij1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNymD01f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvLkqij1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2Arh1v1590799
	for <linux-clk@vger.kernel.org>; Tue, 2 Dec 2025 15:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=; b=MNymD01fnkARBFE8
	f30Xj0Twb7f0JXMlzRlh1AWQmjzx6HXA4kbWVbK+kojTuHMCdOgSwJC7x3FlFDhe
	p1ESF91lcGvnoxNH0/gj4x7PtME5E7FoImmhRbx5eW/g0vIOxoTCLH9055hEy/fh
	0AiWHa+CYoT3drJcb7auPKuIH7TSlsk13BkfeZIC+MrPgsThZ1UDNEwxPEvSVc0p
	34TPvYZFldyEZiLjuYPBJ6yxT5ZfovBKNWWImGCGPXG0srgNI5VlMaZo6F05W3/m
	5BPOlySCNw8R4I3UFXUQzibHm7/xDr6VU/tKzbnSdqEFXbP/wyn+lxIquSuqBPHe
	pAjkiQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvra21p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 15:37:13 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93ceb095d13so198488241.1
        for <linux-clk@vger.kernel.org>; Tue, 02 Dec 2025 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764689833; x=1765294633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
        b=HvLkqij1FNp6evzAnLDbwDETR2GC4G30fLfHxp/Gx75BwfwIIOyxHif6+FLK8NEkJM
         1DJkqdEcfTIHFE7fsX0YIPyvo2i8pveqOVZInCFjJedMJGIH9y32EIgMhCmIVDTRit7g
         zniZgncZyeUYLySdadjyAEWf3CQgDR0q7+7lev5ln0S1KOZ5/VESVT+OWots+WTW9Rfk
         YgHry7oAzdVbfRIyEAw5rQUbugwt3S/yohJWPa9qNvHLUnkWWul9BiucKtalwOqr4Heo
         sw7MHvsjY3oF4rxWjHJLrL8jrRxa/tuqxI3g/n/O2gaz7QqXaKRk0+WMyDMh3wLHevnv
         5tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764689833; x=1765294633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
        b=YPcfckg/3PmBxSQxdN5DMPbPVYjExNoonS7PswXkQuT83WGP2dudZ2UXqkWslFJm8l
         fg3xgwI8FiCKbVwXHH9wuXvDS+//n1OIJiRDRvooq3aLrq/CFY79exyXn5p5bb+ynL+Z
         mGaxX6b7tD6tcpGU3Y+MxMZ4V52FJMqF0gKo+uBiK+sFMjFs1HY1sZkTa1KYb7LYAutU
         6Ay67g94AD7jx6W5IMJEN6DSnTGvanFEDFWbDxfjnodiv4AIZcz2zlaIAkqCD3aXSd/b
         DXsV873ohbrkVpXsrlUpnydxWgd65tVGvGBR6ACebb5Wjo+vkWD73HCSvZyEj4hJmV2w
         T+rA==
X-Forwarded-Encrypted: i=1; AJvYcCVWpJi4xpPS+qcmYEnt68QJQ114kmyK0Ijc0YWN6TRzHBh1jIHIb3L+9+smt4mt5/hAgoSJMz9UP94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn1LOSFa6U9C4QxvCjrVlQtMas2Ofe4keXyNBgU1t9ehgJFAXU
	gpc7Tqk+b0acG3MLPo+pxbJiLCOCr45We0JGVrwiBEfvDMBiLGgVvJSGe4u71XlqvIfFZonwjD3
	gOl39+RT7YfYTIOaafcXI9BXRdmPPnRbSlOTXFIhtqwq5LR+biyB5rhIkZycfHQs=
X-Gm-Gg: ASbGncss3+SBO4/8Qkq4BNGT+AJP9oa0L4uw/HOZ6A62zJvha03/x+p2fda6aVpjchQ
	Zip7pTMp0135scBEcu/GZ+3EBkyqU4C1To69Sk4NtbgBdHD9TScX0KApDQB/eSnVDtLN9qOC4uC
	jeATBrsy7pxBcC7bNgSVOeG+vwc+pd0N9MevdKhx7yne2G9UtQW7hIa8DV5sqodwZo9rSFKm15f
	ObB97FS4BKXFtV/ft66ssEqUtmp78urDfr4AWa6JtFdQ2NLRgWR9UpK6Z01GjNJSjTahMEqtdT8
	e7TY14S9FQuWjUx+cECNjIet9TN6EsMUjitid55c24IDcy21Vc9/5efkbWIYtBSh4h87VxSWfL3
	0FbXTsLJw9ZR0W1fts9h/ZMg7uY36e/pmW3YtHOfwv+6P7xuXnS/ZHTtAsarkw+g7eg==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr9556576137.8.1764689832766;
        Tue, 02 Dec 2025 07:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvD45845hdbmhM+YS7Wjjhg3RBweI2ZE3krzHTkcYizMtoYHA/7UWe6Faae0ZvkArgVzbYoA==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr9556563137.8.1764689832343;
        Tue, 02 Dec 2025 07:37:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b926sm1544786066b.68.2025.12.02.07.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 07:37:11 -0800 (PST)
Message-ID: <f7609d19-5254-4419-a600-d0904d92d525@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 16:37:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU
 PLL
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692f07a9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5mhmk1EvtyQYLrneLBIA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: wLVc6U6wlqyxoDcMrwDTAiPzZYQ25N6U
X-Proofpoint-GUID: wLVc6U6wlqyxoDcMrwDTAiPzZYQ25N6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEyNSBTYWx0ZWRfX9sn7Z22eoI50
 KXNzkwbInSrOnLXruyCPedUaxwRk7Q4I0KpZrFPY3HhrtChvFynk2I0Nv4Q63g+s14yxzpFHJpo
 ikT6NZY9zmnc6qAx52453nXrY0yKDBQbnjtju6Rb19GMHtt7oov6argIdEfHHcnutRXW4/cTl/i
 CTsW7c77/opVfup6ZveU2v43V7oXNscxuQVRVpZb6Y/Dj/P+r3t/ELpnDsnBPb0U1KDUKLwNNdB
 WIyDvnIdeSeUwWnp/KXJ43ojl2ZCZPrFsq/tpwQyKVGRPgQTlSpP6DFNw05eqqoeD/F8Q3t0kpP
 9WEv5fVCjkIJv5l9XzKBosR0ssuRhfs8BH6iFbOULJiXB2bgXLE/6TA48yq8Ao7fkzLkFqg69iO
 1kNLKIPAjUduljFrup0mxYr4Xike2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020125

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add clock ops for Rivian ELU PLL, add the register offsets for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Matches downstream

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
