Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8644B1A9F88
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323331; cv=none; b=QJanJM7ABvjSOiootq+pVAyRo9/PxfPRCv3/HILLy0JbCXE6dEx99kS0Dny5Q8XiveTmBO7pSSUOJqqqN3WapYYkkCNK4TGDzIZv5JpHdAJ01fuMcCftXktb/hXCJXUmlzs7jiXW0IEHxqCspE4Av7ph/7JIDN5jMymZzP4Z4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323331; c=relaxed/simple;
	bh=u3TkWkPH6LWvLanuhDAXSqqIBVBVtYI33nSwq/2/5kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyoHj1wdgHzuZJLZxWI7eD4l7e7deb5Tkp1Pp+lQcGv2gfvHu4WrGFkL/7DTvyi26Bu4z1Ab938KL3pRFgNrgIO4tArz9yXsMCd0NANMZxw4foTI3dDgBPkgULtk89Ww6SFz2ge4RdFYZm1QquQ0JG4PMepNrImS73T+Q3O2DHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hnl/YYMG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmzPSONd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnl/YYMG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmzPSONd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNRZhu919268
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 10:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35pdAs0GELaEmLYh71wOirxIOtz+aG7dtGNqdZFfqPU=; b=hnl/YYMGkiFn6J1a
	EYZ0H1sGJzSmh4QUVQp3QiXc2muztkQPL4sf+KpxPZz/Ris0rcl0+oVD8nLP1Kg+
	hD5GTm0jlvFw/6vf53V559Xv56U7KNhVctW3bh7z/JbR0ilN/FEok2xafA1ZROZq
	wI0xlFa7SbRURTAh6tXkc7FEJFhkM4uz1BxDn/0IGgYbwBxfs5TMbrGVV6mpSZM5
	6NrDouJ8kzHwvhzL5ffAFKpVpBeKGvgqfCfGCWGQtNSokSnGS6HMnTkgOWrvIICK
	8Kw4otNVKsziifreMglJ16PZ6bYnLW3Hy46Qm23bZcITiPuMEYgZ5F1FFI4I05IK
	tWjYxw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81y6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 10:15:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954937be97so33744696d6.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771323329; x=1771928129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35pdAs0GELaEmLYh71wOirxIOtz+aG7dtGNqdZFfqPU=;
        b=BmzPSONdlKC0ZWYaE6AboA44A0g0w9x1eUQ6nZenNoDy8nsNvWpXUTtrBgfquvKM4E
         YRZHCfvL88bBQvSJbkTn8+RajNGlw6pIBDVJf+NlqKYTfhjvnuWBnkNQhwtssqZlmkY2
         wHQyjp5nwSf97Xza+HDjZ6Xr5K8g19ET8sYsuhCicJhtvmuEMiIln+VXSJfRLLkwdmwr
         4U44ulmdHYIpSbCV3uHVkaFXET8p97fK3WQ+KoLjh30jPmOJlL2W/O0hC2Fbd2DpASgr
         /DywfnMAm9xvE/mr6KA7c39g3boGYXutxNKZi+mOteBjLovYnVu77XM+xB4m3kqp2BaL
         aZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771323329; x=1771928129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35pdAs0GELaEmLYh71wOirxIOtz+aG7dtGNqdZFfqPU=;
        b=ImZWhdqCDuGX57ruVxKYih/mQSqFM5rdYO/SzHTyTEVa/DfYg3n5rPwV15AAv8SIdn
         7yX0sPMokvOeQYhPbssi70AwxXoXYHZyq6/vdg1dyElXDyy+rxN6DPG51NZfXxETCaKw
         zIgRwaNKECAYd/V0YdEk9kWAUJ34RXevPbFYqmmyGkTnCm+VnqduegmxY+Nv7+tjj4Hk
         q3oj8k0dM8eoyYGa9CBntL0ceiduP7lbBSn2iLgoOD3TGX4kBvWL5uPEbJjmuaswo38i
         WqM1kh88jOBn9CpmUqgYJhcnDSyG84IOkIs3TN0JNhbBcmyePREX9936HYMaj2wJ/OEf
         DEAg==
X-Forwarded-Encrypted: i=1; AJvYcCVqssxviSKihvB04CQ4thUlhOl5PyCO8wtnUkszo8HHYn5lM1CxzEqGzSYlMRIJ0SrmM4TGamjmhEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw10rb4TcM6P0ZS3hrjaXFM/rUskgm8MZf84ZBDg/pcccPcfSjF
	LukXZEQrDr1O8XPjNDuQf984gR2spavP+HT2b6O6J9VWxm2tTopgOCuDsD3sKBNRxTuDyz3+TSa
	wrzdIMDPmFURfUit9M65BU0URFrKnb0/9LuZQXIkqaMiZGRQ2hZaxcipR5OA3N/A=
X-Gm-Gg: AZuq6aIw79co5MnwuJURDxxcHgK49pyUZ/cLzpts6+5dmI5xGk8bDKA79T2QseAjMAC
	nnLeBJwyjE0XzEv7luF85y02gwBGHY5Az1Sd5n5V0jt0B5XD4stQB1flauUZYIfEhWiuLp08Yx1
	mPrZu9NJWCMoixRtkIWGaqQ6Zqm0j/5CU0IqdQ+JU5mcoDPUjyjicnFCNPiXTpvDxeglCni23C4
	IJy0ZbHamvbNIf9pvyOzkxctV6SlqXS994/UZvAtfZULGMLFuF+zTwaBbcbIbzJrQwhlZYDrU4w
	OZDFRZ/Mo0vzMc0tL9BhVohqTGhGQMAhfAbIlRr0zwA6FZ+C3x55Q/eQBEqRhYFnZ9d4g3lUZlE
	rCmUgO7ltwyFRZ9AxoVbL84JJmCAavWTu6302OTXU6NQPCIwOmJ6gohHCZgHlVUI4nqvCDOdjkI
	+j0vA=
X-Received: by 2002:a05:6214:8095:b0:896:f9ed:bea1 with SMTP id 6a1803df08f44-8994ac78794mr12228626d6.7.1771323328776;
        Tue, 17 Feb 2026 02:15:28 -0800 (PST)
X-Received: by 2002:a05:6214:8095:b0:896:f9ed:bea1 with SMTP id 6a1803df08f44-8994ac78794mr12228466d6.7.1771323328379;
        Tue, 17 Feb 2026 02:15:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7665563sm337195666b.47.2026.02.17.02.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 02:15:27 -0800 (PST)
Message-ID: <9933eb31-b77a-4ae8-b52f-c30999e99232@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 11:15:25 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das
 <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <d6392cb9-9ab2-4743-a13f-7432ec03762c@oss.qualcomm.com>
 <iepxnbk7h6yti7biozcgw4uq6l6fmtaxrgxbt2tmcjxf5x2lep@expe5bgt3oin>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <iepxnbk7h6yti7biozcgw4uq6l6fmtaxrgxbt2tmcjxf5x2lep@expe5bgt3oin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69943fc1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=kkBeuq3EVEdDXXmyUhYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4NCBTYWx0ZWRfXzrdhHX/VxyGv
 TcV6cC5PpCOTH8AL6yr2z+9vyO52fDlqZqm+dJ0Qyogj71RIZpz6z9raqezHnaTlvzyzy4zh1BW
 o8CXdPCKSy1TMf0rt1imjJC+O/01fD5xQxhxYueWjkqIEPcMJbk0baNwQvoB0UWplH8vhMmiuN7
 OWuk3VxhjMJFlwNdWbsYzjo8vCMn6/VYvawBd3qk0Qz1BkCgSqyn43lCVw+EI2PsBszgbNHCT13
 vYMt6mIY7TJ/6rO/ChqhoMpoh1j/gDb21eHXsL3mOqam4CmePPIzgInnr8ZCeLb7cv3f/7xWMS7
 7ybyM3DQPTVb3OhH2x2+XD0qkbb9oDbbAYDOPIAKAA5l78uv5pyT3b69NXN60+x1/cCwVhBDgFu
 LtyT6CRlV2PZUgkiAwmt4kFWgNiBcMYVPd0tCI+nu47W7tjd4/b4bdX+uOL4twtnYFCIZdXm1XL
 K4FT3UrpMvrDmWdCmxg==
X-Proofpoint-GUID: kGqC1gHznHZwwrX13LoaFFdvn53tCWpC
X-Proofpoint-ORIG-GUID: kGqC1gHznHZwwrX13LoaFFdvn53tCWpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170084

On 2/17/26 8:58 AM, Abel Vesa wrote:
> On 26-02-16 16:38:15, Konrad Dybcio wrote:
>> On 2/16/26 2:43 PM, Abel Vesa wrote:
>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>
>>> Add support for Global clock controller for Eliza Qualcomm SoC.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
>>
>> This and a number of others should be struct clk_regmap_phy_mux instead,
>> cross-check with kaanapali and remember to drop the then-unused parentmaps
> 
> Oups, missed this in v4. Will fix in v5.
> 
>>
>> [...]
>>
>>> +	[GCC_CAMERA_HF_CLK_EN_SLP_STG] = { 0x26018, 1 },
>>> +	[GCC_CAMERA_SF_CLK_EN_SLP_STG] = { 0x26028, 1 },
>>> +	[GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG] = { 0x26018, 2 },
>>> +	[GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG] = { 0x26028, 2 },
>>
>> So SEL_SLP_STG=0x1 allows setting SLP_STG to =0x1 to assert the ARES,
>> otherwise if SEL_SLP_STG=0x0, it's controlled by the HW state machine
>>
>> I don't think modelling the prior one as a reset is valid, but I don't
>> know what considerations we need to take wrt dis/allowing hw control
>> here and what the consumer expectations are.
>>
>> Taniya, would you know?

I see you've already sent a v5, but I'd like to see the above resolved..

Adding more context, bits 1 and 2 control the gating of the SLP_STG
*clock*, whereas bits 4 and 5 control the reset.. I think if we don't have
an immediate need for these, we may temporarily drop them as we try and
figure out a way forward to avoid adding fake ABI

Konrad
