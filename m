Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E04156DE
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200347; cv=none; b=YphcQWHmaSm3qGS1INoec5qUSOv022b9mDGcqjQhmwp+nT/dwJ5pkFnadynkhwiUSs24TkbsGvtdTSicpE8xfWgEnl59tpYauCD0QLYIw3p97/MmhhzeJRKKqzSnw8mG+1umPEAiuRY67HaB1tj7nCdG3heNGu5gRW8yiPPUC34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200347; c=relaxed/simple;
	bh=yzH3rj1qE1iSUDcLNaIAmbiWve6bqP2OJ+u3kW2gTLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iN0y7cKiIplu/E/lhTBWXYX/rRrzkmz6yp3UYJNquGWIgU24Dnfw57opKVniEVfx/QHeS0ciPefCgQQI2fhz+eotRSRUD9UcI/7MAxe0lGkXqCl8MvsEpZyI+Nr9oqxNz7E0SjUvR2JQcjgF6OT5eYBqlVRMyxZu7A2giZSI7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXs5bHMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcbAR4Ys; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXs5bHMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcbAR4Ys"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rhEi2362165
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=; b=lXs5bHMJOg36IFTw
	YHeHq0C1sRqamoqaV9r98QJULx1ZLHC3GM2/avlZ6k0pAmyz0y4rqRY8SeQzprIY
	Mm+SK0oh+jPzsuH20YT7DRxT4JjLAr3i+WCWrQpc2vxBpOMOdy0GWwF2mHrKxKhF
	rmVL+qLbdFb8AhwxOLjQSYbm5bSPL+4kp/l3/rklj2i98pFu1BaENR+oebUccaDa
	vBGnMmdCt8k7uLUsMGJA3lCdijiuHM5d/HW632TxxvW9TvAkYk7v/88DqYdWDiId
	FHVqIG6jYR+7AW4qQj9DZ5AqGjgIhFQJh1R+KpKTipc+Cp1kO3nRgVkw/1JtyJdv
	b7nisA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqkg3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:12:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a3514f912so7906098b3a.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784200341; x=1784805141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=;
        b=LcbAR4YsIFGB2ZF/Ma6ir4k1P/ITidnyiGZblwsCG1DZ2HmJ9s9R9p1ghEHQFyBjoJ
         OneaZehxJui+/UD3+GryrBXvCefzq4SEHMy05QR4k2ueQgWimX7YUgTT/H/Cna4jNcpn
         ONBHj2nC6Qi/zwi+B4eYVubM/8Q6sjjOQjcYHwB8RK1O76uW0Quut+RIloajO3+47gZU
         I/0ODK+yjAC+Z9yeCGC6UIB9yLOo0YDP+eaQMmTJwkYhL5IOetytp8rVyHLznaMUGHOK
         5tY7vmTnB/xyfkygaqbCxliBkMQiDaMkfv/9ti8Xq/jaxWNmDx80Kvwe3MaJzNMzzZvr
         c7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200341; x=1784805141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhRDmVLt+j+++2qCqj2WWEzcP52HQCdEmO997P4JbPo=;
        b=mRguZp70hl9udmivGUa1jjifD9EnIp/EnE0xdn+tUVEe8lKsR/6s027Z4jjYkLJOc1
         4diQL1YcGFZSLYSFdSjMOCKrXaRbdrkE1gk9JDGlGnaD71sivfBZ9kFckBO7D7TimClX
         1/oLk40VuYwrLKCAAZHwcUpAkhE8XBgjZ5nBoIwxWbD0QqGMt567aDBBVqfiqKgTqzk1
         a2mTkhl81k/l3eJiJTTktBcAS7perammonDsLw2+77Ksm1kg4fbNC1MJv19txsmw4TMM
         Z7UMmF8towFXylUUFNRMDWS+ARTKnB56k/rgjGnQ+0UzhFiDjiKEci93s4h3Lo6tWAAu
         VL5w==
X-Forwarded-Encrypted: i=1; AHgh+RqRLprn6h5cA/HjmuyS/NUYIGlCvCu+aR4GjO+0LrHlUTkpbCp67R+NK/rGdv6I2H3bOwdE0juy4GY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgizIQ8U2g74CrEJtNMKyJDseHdYLQM2w5vzjoEsKyst28s4HB
	VnW19BZ04dje2jtTPRkkEmsDGGcZWNg2uC88Atwe3Zfr3EoOBSPQR8UGoiaZOp2MHRY20VkZOcE
	12yV9229r5pJ3rW3rFXSOVsuYjTAxCEPHWhL26KWUkgIxtUFlMqKkYcc5ONbWcaE=
X-Gm-Gg: AfdE7clxhTFamvrPtSUlo3w9BmQ1JmySpYF/JJoCML/WC5/VR2L6vuY7Qu2pQk4w6BD
	GGnQK51c6TGUAlfh8w38zZ1iBEZUqZlNbZy2fzwo9T9ROHmIqzxco2QV0Jtegi4seFe1k0J9GBS
	vg9qkBezvIhwT0QMX13R+APdwixQ2i8P3L+F9DpbKRNanOF6elxT/EVNcT3AQRhkiG0TQavmT6k
	ilhaUptrmD65EI3qBLlBBrI7bPYVZ1n8LwVnZ46NYpl8u+1OWQIHI2bOP4HeqsY2Kr4KkhDKYtU
	wfuPbSjjx5TnqZx5auNmXSxge14CZG9TLI3aljc/1gisKuhxNR4X1hMrrxxZUk6SGr2x0sAFxX5
	bJZe/cdPTz4OZGoNoh5Ofz7gpYJg=
X-Received: by 2002:a05:6a00:301a:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84a51442e0cmr10682705b3a.21.1784200340761;
        Thu, 16 Jul 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:301a:b0:847:968d:b101 with SMTP id d2e1a72fcca58-84a51442e0cmr10682655b3a.21.1784200340258;
        Thu, 16 Jul 2026 04:12:20 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a5f3sm4578248b3a.5.2026.07.16.04.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 04:12:19 -0700 (PDT)
Message-ID: <316fd37b-9936-4bca-8521-9a11ee65cbd6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:42:11 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing
 CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <20260715-glymur-fix-gcc-cx-scaling-v3-1-72eb5adad156@oss.qualcomm.com>
 <4b543abe-2482-4381-b41e-623cdf5be9a2@oss.qualcomm.com>
 <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <olkjcrfq5t32gvqgpcqiuyp5jhf72f4piowz6osxhain77f7bc@ggwuk4nz2ak2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58bc95 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1U0sEZR_6ltlo9pre54A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfX46cPP3/tzAZD
 Zv/uxTnA6waQo9LlC4uj4A8qk79gDZHZ7imvTXcYsUCUUX2ECkEeOGo8PAoQEGaQrDktYy+HAfL
 2LpfDMZ0UOwPdP/G4EsnFJVINl/FFIk=
X-Proofpoint-ORIG-GUID: Fd1yjB4Pemly0Iyg1MyKIikf2qE7zC36
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExNSBTYWx0ZWRfXzJ2lWX988ZVN
 7TSwcaLyJ1QHzdLeHndT1SSsQZZ4xlkXosTtTe1jkr8A4HVAAhoB7cwq8tyrpuQjRjrHHrcZchy
 6oxi8dxadmsdL4KCh2WC3UCAPzkXQNsV2we6h4Z8fFK3HuKVhywvvrCcUplP93T44AvskWHL4dm
 KP+Y9IAd8E17FYh+DK0kifCugjIf6xKuJ4clYvGpPX6EkhpAy+WVneOrv+vyQ2Rlw6tUWc4nsg3
 UJP5THIs7PFrMq3KpmBgiusPTlwvvu56g1Q4/NUaLCsLBM2k0XdsYtUS6aKn+SwBNunnTvi88Ej
 jPsz99BRkASKyOTqLc7QRqTkKFLM4M4z+OeWbWYfaTlBWvjTKwMceN38kMBdHA+WYKahydbBouc
 7pI2ukEZ/OecD6OxEMi2NmGuLxxOKHiMgoc2hqjESMevmEcx0OLsToH5qSdpuptSMOXcvKs4E0t
 6pCV4zPF65xnOtVTtgA==
X-Proofpoint-GUID: Fd1yjB4Pemly0Iyg1MyKIikf2qE7zC36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160115



On 7/16/2026 12:52 PM, Abel Vesa wrote:
> On 26-07-16 10:13:48, Taniya Das wrote:
>>
>>
>> On 7/15/2026 6:59 PM, Abel Vesa wrote:
>>> The GDSCs provided by the Glymur GCC are supplied by the RPMh CX power
>>> domain. Model that parent domain in the GCC binding so the provider can
>>> describe the dependency in devicetree.
>>>
>>> Add a single CX power-domain entry to the binding and make it required,
>>> matching the hardware description needed by the GCC node.
>>>
>>> Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>>  Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>
>>
>> Abel, I feel we should add the 'required-opps' as well which will ensure
>> the clock controllers minimum voltage requirement.
> 
> But it was agreed in v1 that we should not add the required-opps. So we
> dropped it in v2.
> 

Okay, sorry, may be I missed that comment.


> Can you give more details to why you think it is needed ?

My reasoning is that if a clock controller requires a rail, it is
preferable to explicitly specify the required operating level rather
than rely on system/client vote. This makes the dependency
self-contained and easier to reason about. Clients that require a higher
operating level than the clock controller's minimum requirement remain
free to vote for a higher level as needed.


-- 
Thanks,
Taniya Das

