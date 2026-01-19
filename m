Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21933DEF3
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768818494; cv=none; b=fh1noJ5qezjy6p5Qx8ZQISdRsyClNim4CjzmDE6dda+OhMGZI2car1v++8Lr/eP5KrRx5xL1TDZDg9YLJmbS3oyNZi6QgJmjMrkrS4eox0GedCspNAA/yi5z5gDDdkmQCTKJ0eOwogYpo4/J5lKkMIpXBVfTnlftEY3orPO5SPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768818494; c=relaxed/simple;
	bh=1TTWxLD//vavcXET3qSN3d3YFlnSmRQXg+2dMp5AMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQOkSMiycKz/ATuXt5MfjZk0kZDkr/BrTYHGuf0Ye9p1UCxo7s94LzynpAUKwOQEsFp+GpW1sIU1rP4M5K0HVM8dOSU2BMn9pe0u0x2fiYuN+S6Cgioa+JDANjFK4thkdMs0oP03eQlADkphHvZu3BhNpL9gop6AVqhTEvgtQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJ6EYiIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bneaf11M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJ6EYiIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bneaf11M"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90mQI1904963
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=; b=KJ6EYiIBH9g/wBvf
	blTbe9NYeUJNfqqFVn4I9dtUNpR7ceqayuliLQUyXH+o5DhTGup2z2bKdUyb7YUr
	VQRF7Ji2GLwn4GyvBpQ/+IH1sw4NVSCHk7RqM++uUIsC511cuc3PEqodetbcst4N
	Yjk+h7qvvlzqWndVNmdn2PHY2R1FtZNMN95i8gpeTCdejeWIcT93gkT3W+naKN4p
	CdcN/Zn35rV0TtyHKHDqaFbJ89S6MS4XTJhut1/GMmLBOFTqONuoo27JCm2b5Pc1
	aK65wS0t8JJAxmuecwsyznaWBnwe6hEzz/EtEBxOfY4702nikrlcLU/7ZoAA8FQ3
	bskqtw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8hq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:28:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-888881a1cf7so8121266d6.3
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 02:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768818491; x=1769423291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=;
        b=bneaf11MsD4AxTKjXsR/L8WOZRHN5Kxpgq2iq76jzJdKuoY5rwHnj4HUOAO2OG+8Nr
         8Os7eZjFGVbW0HeM3eDZHSAjMqiEvXVNbB3jcuYHgq97yjZhA2Z9+pwhwNmpdYkO6MNN
         /8Uevkg4/rL4d4mhUYKCOotyoh5cZzjv3JpHsclS22W0c5KAdYFaX2/4adNQjuUHS4QI
         +mBu49hsNJo5h+30m+ZQT6AJZfvu7H+CKWb3tG3Kc5LA6jTZilHG5/1LgVHoKpCEofF1
         jPyAnjwZ8lqjPX5Qz3fiZWESjPaDCKAEjF29fga17t1rdvq2R61ofCw8pFqqyBIVgix8
         VMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818491; x=1769423291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgDTgsCTahWEZhB03zi/3mLe2SOyw+84BxrjADPSQeU=;
        b=eEjzq/mgHgIL+Aia/uDL/tXAlC1i2fcU/KObUHL0v7tmQbY5ot8419jJzP8Iak0NwH
         Kq5hDHQbZ9uUmKBL29nOO6lxJp9hqfMgRUrNTlztHuQW0hUlu+o3iqVe1sK3RcvzlKrr
         MWGqZwm9T/bqBQMvdrxYP64zGqsEfQPObp3wWhECUryMcZ3+ETBHgpwi8Hjp8w3j9Hyb
         XnKUU6eQmxuayCP8gsMk0tHbbr2PmYPMYkdJbctvX9gUP8elL6rih5jXEVZ4aO1fU665
         2fOHILR3stVMHP12zj6rR0LLO572aJN+lhMMHBHSQi6TJFBcv3TLIqCOSycX8X12Vnhm
         32sQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2IoISH4Ub5dMDlJcaox25p+fElkGd5BFR3vQ1yyiuC47kr1Z3X58vP3962BvL+GrVRa//nJ+GoRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdQDwmU5UWV09yJ7JrnN1JromBolyiTRQlWgpgDhrcJuFr5Mvt
	hKAvedH4XfFumFJr5d2T1M+q8k0JTS7BTBSdQuLspZYp0PvX4o+e0UzXozENJxNUIKSeJaSKCzq
	xNjwM66eXQbD+KlYrjxkNlFpG5KR3oMt2pwBamL3d/n9NJK+ExYqVokyKDZ5YXqQ=
X-Gm-Gg: AY/fxX79CvQc8sEREwmgfNCCenEq/rD3AY/6hKBfeR8AmvMr6w5sIVDJh9J0Rez/sZ/
	Z8bQFOeBVX6qo3FqQIu94Y3mP5MKCtFEN15ZzEankFIQsKQ3DrJxdyz1KmeqOzC4tV8L5QD3nrF
	Su3CAy0Z1P/CAXdlBQqJS/iGM+WJXfezdEUWa+ZU8bDVC3lPgOYb4vvDXySC+QqgSz23CALe69j
	WrabLFhhsWzxYVZKmnTbvOxdFXqVFxRa0cGJ5FVDaRWUXGb+lKevf7I98gSiYIb1XYvl2HE/7oV
	dyuuGStHkJQSR/Z8ulG3QvMu7dEw5tWzxyxpJpbbnwfR83MYcZPVJ8Zz4J/msgzePpq6ptMWuw8
	B+XOtQ9ydJCKut1FoRqAnVTgqfD3tEJkt524lPeKh3zRdm0l+zQexHLvb0aS4mhKhXGI=
X-Received: by 2002:a05:622a:1794:b0:4f4:b372:db38 with SMTP id d75a77b69052e-502a1603f71mr117659041cf.5.1768818491029;
        Mon, 19 Jan 2026 02:28:11 -0800 (PST)
X-Received: by 2002:a05:622a:1794:b0:4f4:b372:db38 with SMTP id d75a77b69052e-502a1603f71mr117658901cf.5.1768818490586;
        Mon, 19 Jan 2026 02:28:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65452cdab55sm9920707a12.10.2026.01.19.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:28:10 -0800 (PST)
Message-ID: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:28:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NSBTYWx0ZWRfX8JDB/+8e6Z3+
 vl+FBrB7uoNPEr6184M1Eyxw6K0RLtI1ZSaxujd+JlM6NdNn4yr8omQuy4wSZHdlWcXEGjpdlxI
 ub1/eQdExZHh9tF74w1Y28OOSln8qfa0IuygH6UzADKkjoxaWqcnYKAx3fW1tREmNNx4b9x2URS
 YV3hHmXTNyRbstvxrj0L/IH1YznD9yQdNusdB35Z1F4aPjD5t58M5jYX2P4xfkH3U5k/HxJW+IL
 GlG5B7j2/TMItseshtj0KH5vri6eOu11xwrls8zl4Eu47c47AuzmwUJujblZ+zgm/CPXUnU31ia
 p7z+DIY3tD33YI3LdO8suRO/GFWm/bVxcwEjb3JaGl16Uj4ZN+QfGtoV2thJkOmzDZjzUlsRnet
 abFeZJceiJVgSyBdZ1SIgJF6clAJqYZ6g6fmMwMyCegZTtBP6hVsyDmOfCMBv3PEXFrnuNrlBeX
 0LpUKxoRo5YUzTdtQ1w==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e073b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RTbhy0NO0nWS4SIPpYQA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: JC_3yMCXSFx6hJYjUqyvL92Rp2kav4S3
X-Proofpoint-GUID: JC_3yMCXSFx6hJYjUqyvL92Rp2kav4S3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190085



On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>>> Document an interconnect path for camcc that's required to enable
>>> the CAMSS_TOP_GDSC power domain.
>>
>> I find it confusing. Enabling GDSC power domains is done via power
>> domains, not via interconnects. Do not represent power domains as
>> interconnects, it's something completely different.
> 
> The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> 
> For the power domain to successfully turn on, the MNoC needs to be
> turned on (empirical evidence). The way to do it is to request a
> nonzero vote on this interconnect path
> 
> (presumably because the GDSC or its invisible providers require
> something connected over that bus to carry out their enable sequences).
> 
> Taniya should be able to explain in more detail

We'd have a better chance of her responding if I didn't forget to
extend the recipient list, fixing that

Konrad
