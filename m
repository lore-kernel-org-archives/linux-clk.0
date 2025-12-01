Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5F30E837
	for <linux-clk@vger.kernel.org>; Mon,  1 Dec 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596576; cv=none; b=oLFu1NVNKUaOAomiXrbjYF5liyRjsvqFQlxkSQzsOGgU5PuF8LoVCvMS34vXAYiBN1ihayav/LVRSqVaHTVwAapLq2+8cTMAhHflrIYjMQ9F2jwginFUbYMnOy/QaSiFxpvpVHkM3+lDVKEmPg39oo/HiD7/00BYHxpvv6rnEWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596576; c=relaxed/simple;
	bh=YHUabI6oaBSTjvgVlO1Hvn/bjS7A5uSs8UIw8izSD8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5iAtI/8wrcKYveNEKKXtNRIfxAJ/G0HMYUsj2KstPplBc2irNgE9YOoiyHvrD9PYbS+ZCosO7zzvyGzdv1cVsZoFKlM9D75wLSF9blh9GyCdb9dQGnpHEewluFeabBwN3qWOFhCjcYN9wEZPVEvTYUQxp8lb57PlZe0BaBWFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJSg5RpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yhp1VRnv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJSg5RpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yhp1VRnv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1BK5WA106133
	for <linux-clk@vger.kernel.org>; Mon, 1 Dec 2025 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGfnOzScOWVgG82Mzbbv1ytlFb2z+zd/IVAh1lbOkaw=; b=mJSg5RpBUIE6sVZR
	0qImgYNxxDLUhL8hHZEgA0DLyoxdO/1VtZb3AjFdb32+oIwf817ivY8lns+R8tDX
	8Koi0RjU3ZCEBxQ1hJIrZzi6QG5Nh/Rn/nInGuWRAwMh54nXWph46CyPPukrwh1q
	i4sUx1kBmQqJlVUqNVWHg8dwkC8wQ6swlVORPm7R/zsCW9ztRD1hynS+Ns8G8Fwy
	J1tKZr+OoWHkGfhqyHdrjv5ePZQpDFCQAZHqpEHiuxyI4Q3yjQ5sf4Ji4fdtVeBj
	S7gpG40eSrcsFobalmtiZtdUo7nB+cRmDWmFN1tDqEMxrkk78hNlrbGMRCjFBqfp
	2aSB1w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asa238br1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 13:42:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5dfadf913a8so450150137.3
        for <linux-clk@vger.kernel.org>; Mon, 01 Dec 2025 05:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764596573; x=1765201373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGfnOzScOWVgG82Mzbbv1ytlFb2z+zd/IVAh1lbOkaw=;
        b=Yhp1VRnvFzTsNNIAXN6RSiiJI27CP81NhebiKZi2I/LDAgzPT4QA1fjYNGliocLsxi
         0QJWl5bjVDPOhZuJd23eQkStBwVxDosdGVl2CUrMAm/rKVLJfpSfZpJ6VRL6TnQRxZSx
         xgjHgkUznZnB5FJj2ZhmdFde0qeh8RyrepTYEF+VjpEHI2ru6ZYjHt4dOrgZ15fKrPFN
         1FynCB2VnYqLWDuwYRti2G/Gd7FntRiUZ/Eap1tAaVIOsXQvWnZIlPS0IJsZJM5gbvpV
         H/UqjaJtErUY8dSZvIzpw9Njflt4haIZ4Y0FdgBXYEb+u5eFh0awwHyel1XW+fNW5AdH
         RhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596573; x=1765201373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGfnOzScOWVgG82Mzbbv1ytlFb2z+zd/IVAh1lbOkaw=;
        b=BFN2K5Ol//5YZnAbJRRDDulIL45zr6HdKHgkoQfSFPDW7X3dVIpNTWzxke4Ld7eZjc
         daV5NM82RW0rBWtJin8yePonSVSiawvZPkh3q9cAAoRaWaJ4wGD1zydGo9LPs7im9uQO
         qHqQH3IlnNRSrnM71UQb9xMuxE+AdJJcbbwBm8akqySN8VozheOGpgXOAOoIB94J1vhY
         2JXJu0OnWwwjX25oygR6Nj09+niC/UHQgOIXT860htcUKh7y4ieE0YSPz59BlTkErppi
         HzTmbj0zSbyFfyJTfpkPjXVYxge9TinsfVTsmRa+tLd0OBClhNsVg9uNa43ka8m3n9G1
         thHA==
X-Forwarded-Encrypted: i=1; AJvYcCX+oMRohKvF3fROJ0NZMV9mP+iUDPhyPEPYyn6J4b5b1FidYyhl/vfT5o1s/rCLksVeIzen7QaxJeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK98ARLf0SU+pDYcj6kylHv7ezNE/lqMCm33cc9NzrN4Sux6Oj
	anesTQT5tHvSIY/awfzfSu8c31yC9Ke8sff/88NrqItioOoL7aCqy86T4MgntpCvoMOIzuNzBgl
	HB3n4lS+Ys4cRtjBLQ0qWDvTOg5jE2u+ZAdmOXY8szuNB26HTtbdCw8HqRUB9KyM=
X-Gm-Gg: ASbGncuE3IUZuLk0DB5xvAD7Z4TtsTyZUj461c5HqNZmI6u04eHakmYwT9Xmgj9C/6S
	aoLjiKmeIsjyszZf5H2pL7kCmEa7dYUSF82zqWPU+/uEz9phhAKsJnmkRmCerUvl4cOapbrkHL3
	oSHHYlhu45SylRdW9pMgpLXpTentnM8OMIvJxZttRgjj2+o6/b05vXyVAZIGjaOC9Jhhhdrn25c
	O+L5uTvN8FrU8Jq410N+JwXaLSS7ze1cWzhL71M8w1yuDWV1mlEgk25RkRYCzWoSdQoYz0UaNZq
	MS8NztLvabT7oFA3FqcLoyFuBUc8Sj8L2vcs/WYuTMX4KnJ9eQqEgve+yQ+GhjGSDQ+XHMD+329
	Bs7KRPRJfdGNzVn6HUZF1rfcWPmJ/Ex+GWFFkKR/3IlqS5UOYLvYU76U7pYlwKLXMxK4=
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr6519679e0c.0.1764596572705;
        Mon, 01 Dec 2025 05:42:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFZokWE+Czmsot/9JmOCq7jC8Gts2P4ILmE3eeU7u1uTuz2O2A4guvb61pBVl0X8a4b11mEQ==
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr6519658e0c.0.1764596572293;
        Mon, 01 Dec 2025 05:42:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062261sm13956466a12.33.2025.12.01.05.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:42:51 -0800 (PST)
Message-ID: <1d9b953b-5af0-4a81-9182-f1cd47e772f1@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:42:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: Jie Luo <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-1-55127ba85613@oss.qualcomm.com>
 <2d83f0d3-4798-4183-9e3d-9972db706cdb@oss.qualcomm.com>
 <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ed2aaebf-f0ed-4eb6-b880-9c39d4f0533c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOurWeZb c=1 sm=1 tr=0 ts=692d9b5d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6Gc6VnWkpHiBV2CdH10A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 9Ooo44s6pv1pZwiQ82ybzQjbsatt94xT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMSBTYWx0ZWRfX2dc1eGhuoxe7
 /0RfdbX+0Sz+tPWx9sJ7FabEqWjUB5gzD9uWzDqsl4tnAhf38m4XuZFRPdTOnSTr8FhTaShMKyq
 RYN72ZEzHAzMU3cSfFGp3G6vm2v6I5Y+pYWoNDqLjdfSUAqZgQG1pbQ+PDd2xle/Hk5VWLd6J2V
 nsFRJe8OsNnTeY9vIRhhYwE1diMS9KAunMOrKbvODFIOU7IczdOzSIneiqh4Vq2N9u5xZ3JZ6Y1
 /o6Z4jPK2n7V8DpPCVWx63xPXRPTfQSnMNwmHIV6PIQAdX81CbeD9ZKUxFVgVRRPsXTE3X5RWAa
 EV0AN7uSqzlAB364WGRy7GhuEa2s+klCJwasY5j+/MDcLYkzIrng2m1IkpNIc/ZuQ5cs8+PLyLG
 9nSQQExph6Ivf9bhnmQuV23Lmmb/5w==
X-Proofpoint-ORIG-GUID: 9Ooo44s6pv1pZwiQ82ybzQjbsatt94xT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010111

On 11/28/25 3:29 PM, Jie Luo wrote:
> 
> 
> On 11/28/2025 7:38 PM, Konrad Dybcio wrote:
>> On 11/28/25 9:40 AM, Luo Jie wrote:
>>> The clk_cmn_pll_recalc_rate() function must account for the reference clock
>>> divider programmed in CMN_PLL_REFCLK_CONFIG. Without this fix, platforms
>>> with a reference divider other than 1 calculate incorrect CMN PLL rates.
>>> For example, on IPQ5332 where the reference divider is 2, the computed rate
>>> becomes twice the actual output.
>>>
>>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>>> rate = (parent_rate / ref_div) * 2 * factor.
>>>
>>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>>> IPQ5424, IPQ5018) that use ref_div = 1.
>>
>> I'm not sure how to interpret this. Is the value fixed on these platforms
>> you mentioned, and always shows up as 0?
>>
>> Konrad
> 
> On these platforms the hardware ref_div register comes up with a value
> of 1 by default. It is, however, still a programmable field and not
> strictly fixed to 1.
> 
> The ref_div == 0 check in this patch is only meant as a safety net to
> avoid a divide‑by‑zero in the rate calculation.

I think some sort of a warning/bugsplat would be good to have here,
however I see that clk-rcg2.c : clk_gfx3d_determine_rate() apparently
also silently fixes up a div0..

Konrad
