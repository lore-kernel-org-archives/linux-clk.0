Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C662C289367
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729046; cv=none; b=SdV3SYmx3D1IiBtwSVjXWo2l1hfgt7+WLEjPembCR9gFrffGavsP2G8N4hmVu/VxQoUjYgqPtGUKT9t9VdDmM4moFrV/YEwBRnFtbgx7EG1acHAvVLT37bWd/9E3TKQGWcZ07q4dtArCl5w8aXOUUiEqeR8wli8+S3jWxv6/gf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729046; c=relaxed/simple;
	bh=yUpVDpfstUTvBShEWh452166LLBk3hB0rm6F58PzqDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmZaNznxOmkNutVYXfrWdJ3Fo5Z996z9m8POdyB/zsPZQntyIAjJQ9ynzg95ax1SzKd9Ylj97SqXsI0Mmn93qAZVEU/oCDMJ1ZvWTOL4SD/fad7LPPGrL5JInKYuxZ6EnY8xCMyRe8AjF2YIuZxle6dO47JjI/iHmVf2zGge1js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjASJJrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzKPjC07; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjASJJrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzKPjC07"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATSvA2579625
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yv3dmN+/b2qLyQGRXAJxgVm9+F8UR7u22dzaZZFmT+0=; b=AjASJJrQfLAXQM+f
	ZV0sXfYn2I5WKC7JQaI6TjJ9p9mcRhDROQiXBcdi//JioSOmdDaxaDAGUP9hWIIF
	zpHGwZwz1oVKkiuG6A8sGbdGA+FWkxTwEuqVT2IkgEBHHcYbTXNndYXA0nEL9afP
	W1IYQtlS9JN9W61NoVE1GzoCi2hNn2wmm6NrmjFLXL7AFYeku8kN2xc9OQNRnjRA
	qZPMfZNFgRPbVijRwbtxj6p0qKxyW3rPnTApYxEeGfwr5n0qG4UkqvFOev/kyKsC
	v/1TSnhmYRplztI1FlSmSuh0MjL4ZghnENmfarQNa68f7ZfHL3EBbwIamRoDO6u8
	YvfpyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gwdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:30:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c08e9c344so588451cf.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782729043; x=1783333843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yv3dmN+/b2qLyQGRXAJxgVm9+F8UR7u22dzaZZFmT+0=;
        b=MzKPjC07LuWH5jXKvipr0vFTt0ytL1O8XZTt9TmzHAeZ6h3WrhL1/6jzYggK+mBIgs
         noNvqAzsJumKpAIv3ZaAtzZ4Jz/f8sJMRgKl/Ee9eM5DoZQPOfGROEo37MxcZFFezUf/
         5JeygbPPjsPvIqHzQGZOAMeZdAf5A424aIdnzXrQes2siOoCMscMRBox6bDqIXC/431+
         NCc8K0sN/wf40kUCurryYifpzT4VPQH+nLwFfrsMFJjSs6fq/7QeFy/8xg/1Pu2Wh5zX
         Zd2As5lM+v/T8sB+7Gqyxb/Q68YimYGWGGFBL58AUzoDqBJBJHVxaCDVdmk9xz6YvNzA
         UQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729043; x=1783333843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yv3dmN+/b2qLyQGRXAJxgVm9+F8UR7u22dzaZZFmT+0=;
        b=DHDOQlgSBS8rvHIsx/cp+y7VrQX1pzAxQwDqSdK15wLQMC8kAemxB/7G/i3w9lLBfd
         v9hPNSZwsyDXltr9VZVSkZmZhyWVZTkR5AOhto8Zfas579CZuD6I/8hMsYI/5GYpLiAH
         Y82zjTwQbvDuYLfVntAsxAlWAmb2Yfrnu6aGtDtRvuU8IoVBqdxkkcaA9YPqk3uNzBQ9
         4ySHf+y7CfmFYaw4a3dUceKeMf99Yr5f0I0iMesGc/jCtYPOgyxFBxgtGstCuQ+DdbH/
         XBC8hE26rILwUIZ453XiKTRnR6x91Ud0SgsdXmXWk2OTrIDWkAdAwQyBXccprTbeI7hC
         FJhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Ai3mBxHxlT2PW3XFKr+HznyDFkmjHriRsh/i1ud2tvm90srPhQSwLGfJYAh3UtjwPzTQto0Gn/M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/myjXrND6n9zMP/1d/QZHhlJmLuMeK+34FRqj1Z9Yz1fzXrKP
	g8xojNwmGmlD9HSaEb6CN3Pv0XD4ZtCfHFUK23uxoi64x6WwBGHUP5qhegn0f1eiDx8iuoe3U2o
	CnBnwIMFOUkJdAI9MZiPGCKEDlT8sORP2YfP4WqYNEOuaOLN4iTDouM+dv0UBRDk=
X-Gm-Gg: AfdE7cnbhyYn21Ulojc7CAdUjSA0GyWhOkfD72oeBMYZrWe86hBFQn7xZrblsF9zHei
	yVOcKbhBqWM1T5e2ajYYGTZu9F1L3hM53LgIPvYmLUqNZatS5R4xJvIJ2lcuo0p9AmLtIi2t/ky
	2RZQX66kt7j4Mqfi2p4IBOcfFt7hXFXUes0X1Qaw9q70IaeO99WYQXHEQyfy/bOzK4GNqkCoaOj
	zg3CrivxZqLt/Ww0tUhUDQSq3OphEUeC2LPyY8tJCea9kAgI0UGpa0Bvo9PAoGw+WRhPSV0BdVJ
	Rw11Re4k61Bkc0dPzpCAi13pFBtePn/JqeIB7ArpkBJrUipYUxrq18fFfhMeGYlDn6ea7n3VPGy
	2dlOv/nIEjxqQGlr12YahVOefb7zs4Sko2RI=
X-Received: by 2002:ac8:5f0b:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51a8fd2910fmr82101761cf.7.1782729042716;
        Mon, 29 Jun 2026 03:30:42 -0700 (PDT)
X-Received: by 2002:ac8:5f0b:0:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51a8fd2910fmr82101141cf.7.1782729041983;
        Mon, 29 Jun 2026 03:30:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c122db5dba3sm481538266b.22.2026.06.29.03.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:30:41 -0700 (PDT)
Message-ID: <c6df90d1-bb3f-426f-806b-9f31840126b5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
 <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
 <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aj33ujz1m9qYOcRs@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfX0WxIVjaKwcdD
 PZ79xeNkLVJV9hKsw4SY4OTu6/cRENnFrSr1cZr90V/LS7LkqgypVRA9kSZkzieR/ag7LeXJ/t1
 WLiwoe+lvZI+PJxs5eLIFXxa6cnhxmQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4NSBTYWx0ZWRfXw4mfaCHJbuK0
 VuuJodYuTYkl4jQpRpjgLiTs6bsRoPJVykCp5zTWFLs6FQGjUCznRcIXl5Z8oyEMm4dALd4KxiC
 ITaKWbG7Z5ng0i2XHE3L7ZmL9vNFwlyFeTUZve359lFA4rZO9YQJt40DxXWHi6QSa4H0YkvuXC/
 XlQ08/7d6yc5/yl23a0DCNh16WDkxyxG6xBK/AujMrz4f9o+KoCdDd+x2A9PMY29w7MSIn0lIIB
 dbHONecohc7aZ30oT/c8u/2xCsW10/9rJoXslLDwCMbsRfpFVlSq4v4SOhLX3ciRe0ipPzPw8e8
 7HQ5jYRPCJ9qRHQCM3ogzwMvSNHx7f/XTDgquZOU9lXdvqr1JvmRO5uVCDTTwIgTSzB2rj3ccp5
 JASy0bZaUqBNCD2C2rDZRkuUHfZnWe4Cgdt4bb93HqHvsP+SfjpWe3vuWmG8QyG7qT+tAy55Hid
 JUOauG3Z+IUSa4JNf2g==
X-Proofpoint-ORIG-GUID: ahI0SEfD8sRRyF3rk5ZFh_tURfQLcNDA
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a424953 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nIBEM5H7OJN-vwckHmUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ahI0SEfD8sRRyF3rk5ZFh_tURfQLcNDA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290085

On 6/26/26 5:53 AM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 03:03:39PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 2:49 PM, Qiang Yu wrote:
>>> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
>>>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>>>> Mahua is based on Glymur but uses a different QREF topology, requiring
>>>>> distinct regulator lists and clock descriptors for its PCIe clock
>>>>> references.
>>>>>
>>>>> Add mahua-specific regulator arrays and clk descriptor table, and use
>>>>> match_data to select the correct descriptor table per compatible string at
>>>>> probe time.
>>>>>
>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>> ---
>>
>> [...]
>>
>>>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
>>>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
>>>
>>> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
>>> require QREF. So I didn't provide its structure here.
>>
>> I don't quite get what you mean. I see that it is there in the graph
> 
> I double-checked with the HW team — QREF is not required for CXO0. In TCSR
> HPG, I think the QREF components you are seeing are in an old version
> diagram, but it says the QREF for CXO0 will be removed. In the updated
> diagram, PCIe5, USB2_0, USB2_1, USB4_0 and USB4_1 PHYs get refclk directly
> from CXO0.
> 
> In theory, we don't need to vote clkref_en and QREF LDOs for these PHY
> instances, and I got confirmation from the PCIe HW team for PCIe5 PHY.
> 
> I also compared the description of the TCSR_CLKREF_EN register between
> glymur and mahua on ipcatlog. Unfortunately, only
> TCSR_USB4_1_CLKREF_EN_USB4_ENABLE is marked as "not in use". I believe
> this is because these registers are not documented well in ipcatlog.
> 
> So I think part of the regulator lists you commented for USB instances is
> not required, and their dts node also can to be changed to use CXO as
> refclk instead of TCSR_CLKREF_EN. But the mapping between the USB instance
> names in the QREF diagram and the TCSR_CLKREF_EN registers is not clear —
> I cannot find TCSR_USB4_0_CLKREF_EN_USB4_ENABLE, but there is a USB4_0 PHY
> in the diagram. Can we leave the USB regulator list as NULL or we just
> add them as it is harmless?

I believe the internal discussions we had indeed point to the TX/RPT
elements having been removed somewhere in the chip dev process, so
the regulators can go, in my understanding.

As for the refclk toggles themselves, my understanding is that they are
still meaningful. Although, we should be able to just smoketest that - set
all of these registers to 0 and see if the related IPs still work normally

Konrad
