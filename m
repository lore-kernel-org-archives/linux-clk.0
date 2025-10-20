Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12172F9D8C
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962919; cv=none; b=cB1JXkuUNfAESbobRW4ZEWnL0zMfcbTBFCNLsRwmkMwCdWbvSGiOn19HbCAb2hTUupWFs5MTUdCBfwSlxbV4KSvfJlyxJBA8Rf8N5A5O7TvCHV+T3frRfnUdMQQ1+6G8pJs5FBM0UrqEUERM1Tf4fInMu0gveCkyHHdEcpw435g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962919; c=relaxed/simple;
	bh=VgVnyXqe3uZsYKis0PDC10eA8gOksqa5Yl7wUglsi1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FMoZa4xtr13ujzyqfJj74X7P84fbQx86RJQ7NG9ZhCejSTFu5yJy8BFfSNnCXvUStl2w3RU11FungayogndZxnfCQylecWQFSuBBlEbmSuVnM/pSdYV19aX759uqZgz0v7p0EpVu/LK2pKER2Y3WxsSGw8VETKwvZPzjwTO5hqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdZqU3yU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdZqU3yU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KC5OMS030860
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKCfkUI9DYpLSsbCb7f0JpIqO0wEPZNRyKV/I77+iMc=; b=DdZqU3yU8iHDb2LR
	wtlRcKRo+2G4azN14ruQNOxwkqxXkRLpOWrqzDXuvYLbXu5RSk1yPELb39h88RUf
	5VGNG/WMALONbT4vVmUF4mrN3gO1J04bqNCYUvKaI2PWuoP+V9f1QJZmlYIEM6+J
	BFhdApoM1Zj2AzA84zMKE0f893iGGl2q9KZYqhfg6L/v4bchQobJ9M39P8GLJ21r
	LPxLJ1huJ6Ej5SfRKP5Cet6PEHww34XGIpPauNfBfC7KM2qpP0XwRDe2gkUjSdtP
	tZGXSLuDeiyrhdN3OU/D3LGrsb5/rOx6QTA9Qzwq79ioJBOm59T4MdRVwKT20x/G
	C2O9kQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k4ktj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:21:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-890cb81b3dfso149685985a.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 05:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962915; x=1761567715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKCfkUI9DYpLSsbCb7f0JpIqO0wEPZNRyKV/I77+iMc=;
        b=qVJYRFMoTqJ89PmJ5EAPriGtRVVuJ04gP1FRIMR4fTy0cAOGxo6cyXYAAOLXnHBJzE
         avjWDO+cs0y7AN31a7iOpOXmgMC2dk4kH7TzGfBKdfD4K6bpIcEETPPuSe++INhmOVSB
         24Ybvq/eC/dZI8UQ/kdHpGkKBiPrbklqDebORGv+fnNP4f+xS8/oVR4F3iQplI9nlrmH
         7CJuzTh8qN77nEMi/I0eqZYe97JMyturVI3O+gjf9fESRh9KrUPeWCfHGDnIvyW1tKtz
         1cjprvjBjSSvW9AYMywyTkuqYUypFjT0uf+o8Sv3YmmU3r9/0Cqs3P4KNj2HA7F+405O
         6zmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXa2GhME7MCpRy2uurTpZwDaESPZ4w1DK+lJmGIqE6FxwlzYIbNFLuuaeKAOq7MtzT/P5bRC8I1Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+7hxfRmSVAIB23rij5Dou/FbpCFDft9nVMiXXrwToRvi3xtH
	ZIWX7Hgnljp+/vzM8lm7zi5S2SpwW8iWqZldeG0n0rbxRRqnWPweU2UVTys47/9W0ZJup7Zk3W8
	ck0J4XBlVUVYecpJF2+80CK02TKyl7ja8v7W5NdZN+UfefoOz1d3jAgT0ekn7oIg=
X-Gm-Gg: ASbGncuDUDUv+mRmJhLT+qbPxNeDcRI038qXaQDPbNOKrEPnU+I4bp+8qfONRIE17Zh
	bPsmAvo+PNoEjsH7eCyGrcTywg+Y1EboP1+OPsqpSRgeDGlX3h/pLsKuAuw9jfMwf/g2BpCCOmz
	a/gGrjI1JuUz0swyhTW95BXiS5VdMwQm4gwiNgiBDr6DSp2lhgY/6eJo5+vZBlvG7KsICTRn5dC
	JOqeLAZPmmrK3JksdeM3bYMJbn6x3/88D4E2xhXf1HKrOrOq3X+gWswVQEsOg327TCFZZ+Z74t8
	3GuSumO8c4LrrzlpThEPnjSL/ucgf25zO/BuH5HxFaK89gMj4b2chd5TxZZNC/RNT1DUoITKsVn
	sfb/vgZjsJJ6sHsH309AoChE4NaNON5+vFQ/XhyVa9Rj7MVGkNONsYIAz
X-Received: by 2002:a05:622a:130d:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4e89d411c5emr111741351cf.10.1760962914834;
        Mon, 20 Oct 2025 05:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzRsE45j1SvELohLH5CCKq4ye7i4regfvJKVczjO606BJEeqTcxSAhMC4HYbZMRn3PNcKbsQ==
X-Received: by 2002:a05:622a:130d:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4e89d411c5emr111741041cf.10.1760962914388;
        Mon, 20 Oct 2025 05:21:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526325sm768122866b.55.2025.10.20.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:21:53 -0700 (PDT)
Message-ID: <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1Q7KpLN_qM0vg-459zEy6J9FkyZrjMqa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9Xo5xm6ZT+9M
 Uso+WTYg1vtgBB0TnD1A8u+og7ckYjtezTFrPSslryB93+cKeBpErj3NZFXJ8l1qkhqNeCD86+h
 XpLnaQr8cvJXJ0V6+EsClBYZDBS4lNfVMk+fWZ+AlmTDZFmQodieSwqP6PkOjR39OEIv2xT3QtU
 LwWlABt3qD6UY50fgE7hjMukxzVVXRS8FMwIAsxhf41VnzScKsfHFKSdzQA+1N1oWTTeaqDRC6E
 kEij5qLXBYPNTfX9pW88OmxcP1RLKFX3S2ovR0QykCWMR0TyF6mws75Rt6V7rPLI5x9QMgEYgEi
 Gv/ZfUKuPQTobOSEgyCIesHbtZSqnRx59gbUBS9d552cHjAo6FtF2hDGPspHhcxoKO1cj9kOhkK
 h5brdVxEGDKb82qZfl/1GRXYtQwOCg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f62964 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=tOHfr81QrpHVPz6DLswA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1Q7KpLN_qM0vg-459zEy6J9FkyZrjMqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On 10/17/25 4:05 PM, Luca Weiss wrote:
> Hi Taniya,
> 
> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>
>>
>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>> Hi Taniya,
>>>
>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>
>>>>
>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>
>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>>> domains.
>>>>>>>
>>>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>
>>>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>>>> not exclude an option that the problem has to be fixed for other clock
>>>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>>>
>>>>> Please work with Taniya to identify used power domains.
>>>>>
>>>>
>>>> CAMCC requires both MMCX and MXC to be functional.
>>>
>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>> need multiple power domains, or in general which clock controller uses
>>> which power domain.
>>>
>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>
>>> That'd be highly appreciated since I've been hitting weird issues there
>>> that could be explained by some missing power domains.
>>>
>>
>> Hi Luca,
>>
>> The targets you mentioned does not have any have multiple rail
>> dependency, but could you share the weird issues with respect to clock
>> controller I can take a look.
> 
> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
> again, but again hitting some clock issues.
> 
> For reference, I am testing with following change:
> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapolskiy@linaro.org/
> 
> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
> on this phone - results in following error.
> 
> [    3.140232] ------------[ cut here ]------------
> [    3.141264] camcc_mclk1_clk status stuck at 'off'
> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
> 
> Checking the driver against downstream driver, it looks like the RCGs
> should be using clk_rcg2_shared_ops because of enable_safe_config in
> downstream, but changing that doesn't really improve the situation, but
> it does change the error message to this:
> 
> [    2.933254] ------------[ cut here ]------------
> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe4
> 
> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
> iface clk, could something like this be missing on sm6350?
> 
> I'd appreciate any help or tips for resolving this.

Is CAMCC_PLL2 online?

Konrad
