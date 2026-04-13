Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4937D104
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079103; cv=none; b=Cl57iLxc41phOBUkwT7z1N07431p9JKRv07VcXQKrcgwfnNn5us2y+L87mBwZoA20w72ijw6Nt+FSPdGDjaLE5/vVydpWUU+pM0wAIQ+90fgGItFELtEicG+czalu69ziDLx6C+cRMIb3a45ogyJUtZ86hvjxqWLnVXXW8vAS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079103; c=relaxed/simple;
	bh=eH8jzy/3275qHq8UWVm0QvGRDLmZWwo/AC55TjS47JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnUYrBEqXvBU8E59m6kCUQIFVq9uSq+UU2YQbNEe7jhflaJ4TtLhtk7EzLt4J5rVtKBp6TDKLx2q2Wy15KX+wKm2L/3r7hcc8n/BuehSEiCiw3qtyCfBYWmXefpcTLMh4ivh0xBKCP7wzTr4KjGDFK02sPvCp4NfibK/YVxF4GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMcKBObn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqW4ZCiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMcKBObn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqW4ZCiF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5VkNN2784365
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 11:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jk3X4v8HgxegViSZYWAtqUOG4jcrWQNEUqyBoBn/fnE=; b=hMcKBObndxAouxNz
	g02IgvAcySRvKWlRUMnPuJTgDZYeRDSDy+8C372Ea9oBt3xMjdV5WG0l28e9q1Hf
	L7egosE/YliOAUrIUwf90I3k4Vbpgsd12MjpWeZaY49nnSRU9pTBKBXgucTugnoB
	OIlkS8Z3X2SShVuWIA+26Jxig9k/X3vF/UkfCsHCLLwsreJX/JYGjI8u3DTrVaaq
	8qL6xY/2M/KWql+/IVibGOOku+K+alnoawTlr8GTaFE36hRXMWIVE908NFovcHMJ
	oh/5ZmhQEnocj/LjwulDNmRqhJEZL9/u1llzUuwQhPJzV5tSf6i7M+3oMVwJz4i+
	k6+7eA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpcqmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 11:18:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d840206c3so6607111cf.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 04:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776079101; x=1776683901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jk3X4v8HgxegViSZYWAtqUOG4jcrWQNEUqyBoBn/fnE=;
        b=FqW4ZCiF3aR/YrS3dr6IEG02Lnnqh59bmXP+OPOzCT1MYbXHOFjaTtA2VD1PlOEjf9
         PYMdNaT4tx7li60NnrzkzDcKIzOAY2ce+TTgU3pekj0LByyVxVs+owAtJLtwMJ+WCR18
         LU4ivorJ3Db3+Flr+C+XeXfEYNNl/2sK947L0/8VlPcIXfReiH2591Hnb2/rRIwdy23L
         2qV6qIKmWIfNO1/n9nuUoYaGlX7ePgZRxKR9G0xYEXh5CeEtTKOlF1iHXLNz8hupbbZx
         CpStC0wpTu+oC/4kptz6Cl1FtZfaNDfziLH85q+Uk86B7pOKvayS1a71x2QKEeOjHUxc
         ddPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776079101; x=1776683901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jk3X4v8HgxegViSZYWAtqUOG4jcrWQNEUqyBoBn/fnE=;
        b=PCT/K9tyCg65K86/1e/8j9TkosiPJfAi7gmT5zQn+HLquOpKQX5ekL9bs/N4nZrBxS
         kzhsUPJPOQasNeJ7nnjdshU2PZH6HaPZFEqMllLC7lfOlKoq+WGzqnunQJyn3JoOnaVm
         f+2Fh1oOFa+XgYvzdznGqCSSyWl91/Bl5X5GW5s/Qq0syZB7cUxbiZ0n1gyV8PHpT7oK
         ORExUBail0oU8CllCZI1x2D2Ljwhb84NGOUw5qH10B90zzw8a2Ya0jMxHyLnhfMWkdZ7
         ODeYwC0D9WBqbw08Xpiu0bfJMojIUYe9rRJxmMsAmH09HzpIvWN+2b7uJW8TCWsLiz6J
         NGtg==
X-Forwarded-Encrypted: i=1; AFNElJ8C4IYbn07IUnZY6U9jVaYUEJHgEUZ95hf34YPZfhi5Sw7Wm6vVircJ6MlX/wKEkr13KJe4zNnKGDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkqJN2eGmMzenhgTw5OIQe84MMkNHZe+FFTosQ77pkHkPMEBGv
	SwIv+GhDCpn1H2cbWhIriweaeDXxCljLB/1ibxhjBW8PTMcBQzGQJgbR0zOZKsmJp81s4lsyttM
	RNIHLwwXJnaqBIYc+cUam2jKjRtuiQLv0XJrv4Y9M9veqFVQYRKJX1jiH+fAX6Gg=
X-Gm-Gg: AeBDieucH/rsPEg0FYxOnzlzMbWFGzDJPAOdntnkxPAsuzQY1f+3WC73J9GEkKPHUo8
	UZoDWb8TYqepIkV/ItM7fh/C/nCNqqkveHJlh/CQGe9NOS4VfvYUjS/sLriZwX/XYyLn9I3Ko3J
	bRQ4DeH/ZqnTyW4ORyYm3NT+6VW/z1C1+Qsohl5HLUsbF74GMylted90RKefvp96DWu7ieZplpB
	CTU4wxe2oFbHHtXBMUXioqWny7D/01a186+swHJSatxRcNuauPrlla/9vTpPAUEgNGkYmLcgf/W
	GjfSm7J9Lr7HSskxx1NeXNKQv7o3a0zN7cjSwo9CYckCGSahwB2hlXVVAE21w0oVG3rZ+hHR0LW
	M9ovbG8Xe3yFPCvZ/zRbxysnzu9Ir5MUmMlk9nfP6zRKd5JRYnwgo2xa3ug4vsrs7T8ufvPOe6q
	rIuWs=
X-Received: by 2002:a05:622a:1c0f:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50dd82879c6mr123727391cf.5.1776079100989;
        Mon, 13 Apr 2026 04:18:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0f:b0:50d:5af1:65bb with SMTP id d75a77b69052e-50dd82879c6mr123727081cf.5.1776079100591;
        Mon, 13 Apr 2026 04:18:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm302144866b.38.2026.04.13.04.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 04:18:19 -0700 (PDT)
Message-ID: <3d4a12f1-a9ba-4955-b018-f1c271aab766@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 13:18:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com> <adem2WKh2B-Leivq@baldur>
 <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcd0fd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=lt5JZrjwga_6XPCI6XsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3cEKzKS19GExpD9ARpXWyc2MauCrRv11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMSBTYWx0ZWRfX1m3Pq71inLji
 yZc+AUAraMCq5TVfYovjkjrxRdVw8+Hea9AkoFsfLI9mMwcSsDs1GMQ8WrQPy6+Sh/gZxVWQAQ4
 ab4EYnbY7RwijkcwPphrTkJH0/Pi7nLagY5uu9q1MaP0OPztqBqDVk5fIdF9NcxbD72DVfb13BQ
 9nlXUxagoNRVyiNq3tWvtTNbqFpvbRrmBvkS3PMunDz8dPgH4bK5r5FD2z8MlKoV10I05t0XhXy
 E1mgzmTqzgo6y6p8sCc0Hgw4oFCY6KpN4ps0a9uBJbnF0KHhgmOyW13h3xPKXMYvVHjJ2m0/4Bt
 lKoqEftw52gkXQ43YIGjzxTSUlGGXzV13SnnRmPRwbaLeUo9C8gVq8N5Hhf9dHW+1it+UiccyxJ
 EMRZyHVOzatwiQXdZkuqo1iUP5iqMzpe/Qy6fq8zyhxnglY6OmEad5cleu53rD37L2lkKzCor5g
 bUfAP4Gi2Go30MYfb7g==
X-Proofpoint-GUID: 3cEKzKS19GExpD9ARpXWyc2MauCrRv11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130111

On 4/13/26 9:06 AM, Qiang Yu wrote:
> On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
>> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
>>> On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
>>>> On 4/1/2026 12:05 PM, Qiang Yu wrote:
>>>>> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
>> [..]
>>>>> +static const char * const tcsr_pcie_4_regulators[] = {
>>>>> +	"vdda-refgen-0p9",
>>>>> +	"vdda-refgen-1p2",
>>>>> +	"vdda-qreftx1-0p9",
>>>>> +	"vdda-qrefrpt0-0p9",
>>>>> +	"vdda-qrefrpt1-0p9",
>>>>> +	"vdda-qrefrpt2-0p9",
>>>>> +	"vdda-qrefrx2-0p9",
>>>>> +};
>>>>> +
>>>>
>>>> TCSR clock refs are just not for PCIe alone, they would have supplies
>>>> for all the ref clocks. These supplies can also be shared across other
>>>> clock refs. I think it is not the correct way to handle the supplies, as
>>>> TCSR does not have the complete supplies map.
>>>>
>>> We have complete supplies map. You can get it on ipcatlog. Here is example
>>> for other instances eg USB and EDP:
>>> - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
>>> - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
>>> - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
>>>
>>> I only add supplies for PCIe in this series because USB and EDP vote these
>>> LDO in their PHY driver. They can remove them in PHY dts node and add same
>>> regulator list here.
>>>
>>
>> The regulators are reference counted. Can't we add the USB and eDP
>> handling here as well now, and then after they are voted here we remove
>> them from the PHY?
>>
> 
> For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
> QREF diagram is tied to. I need to confirm that mapping first, I'm
> checking with Wesley Cheng.

I think on at least some platforms the reference clock for the primary
USB controller is not sw-controllable (so we wouldn't get a handle to
toggle the regulator this way).. please check that

Konrad
