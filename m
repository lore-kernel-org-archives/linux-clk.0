Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A4C220689
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573757; cv=none; b=H6K3UYJfebHnsCdc2JUZLgxEBPuAX7CHZOZ/CoUA/qj6tl6c3skyWAIvhS2srKY1GZ604PvFipULykam3MjVLtx2jTRQFz0e7Th5ufdCzvpCEcJEh4s402iypNZK+3wsbYRpAEHIA8mAE4fsuttOPS24CTcStZWn8oEu/QoYCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573757; c=relaxed/simple;
	bh=sToWdQKy4Ilj8vtZl1fJZYV45WUmXfqIRGKxYDJBgAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMBx8p+zW5i1tClS8hC9poqAQCisUpbArVOcXh/MqG97EdDt5VW2lGljtl+VWvwa79CBNleRh6dK2LXBbVDHIyoHQBmoCns7VF6qph2mzc4eloYaOevL+RX04XN3VGUv/YZT/NX71rAvLzI72O2/23dL2axAe9R5xCYk0FTn390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5hl9uK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5hl9uK4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TC8a012114
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 09:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJDl4omv7ndvFsud7bHAzIbFbElPaQdLGmav6WIPsh4=; b=C5hl9uK4YRXvDPx6
	U9Eaw4kphDAc62d/9ms3w+qqqJojv0NqT5rUazrhs4eo7M0bM4dLANit7ovWPzrG
	QNcZpuciVA6kgtv9STJZwENx1b16lMINP5UQiVO6pGrIHF6xDo8sQczChxxLV3l2
	ws/fZmbuq1ucBjV72OG0hrOnV3j4fqL7XjNkeJECTRudgZU0E5qjJ1iTMA9PyVgB
	Jv2qRJSrPORvsStQHksdH6rs0QAn2CHAYTEtwztzaSH51QwJUP4kf9g4bbXnqqqs
	uMr8tpHuIaTI8UCrAlVTHkqp88eM40HD1gRyTeL9VAPO2m/TYIMSuVEGMFOH0o8W
	4fs6/Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh18djk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 09:35:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c53d5f85c9so41851485a.1
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 02:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573748; x=1746178548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJDl4omv7ndvFsud7bHAzIbFbElPaQdLGmav6WIPsh4=;
        b=vmHR84hQtuK4K8faJASP3mbmlao7148KttKUAznL+6XRVyizIcaULIJ+Vt1UK9V8Tc
         hfqTsA3kY7R7KYGZFf5pFmXz9Jfh1A82oRmPjxawj7bKoOYRX8E38QTPJabMd33uFO0t
         lG1+N+qLY+BdgQFNw3CrQVp8mrb+vFpT4VTKBfiGcm+aM1DGutTUSFQzvPThk4MAzBxC
         E0gv3uspFVurb9qW90QUJgtzFFVg1SrktND8wwKRrcJ3ZzdZCVXfKwDLvs6Y87GgRCbu
         qWQ6NmZ2GbxdB/aeZH0n4/tEFI5+l4psH18Z1HhspNovC/eC1RFQNqJF0ujBND0SJpL8
         6Yig==
X-Forwarded-Encrypted: i=1; AJvYcCV1Wfap4PP2k5zRfox2MjIrWazrso1J3F/mjqdj4gdtz8TwaJYgm/tiDo8uGigpfhHI6D+akRfPILU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDdBmTxvUJm3zZ0c9+XNlZzTRMZg1aNftB2CKRoqWf3D2sX09
	OZ8qSXpTiYASPsMcO9m9RZpijJ97PAVmEZxQbQZ8bP79YY9xviA9yp9tk/Sn1T4VuZHV5BA9y2E
	OA5VEFZxXMMQtW7b31FQ1L7daZGrypMy4oNZg9wkGvRBuoFjmNz7vtezQEQZLD1hfYIE=
X-Gm-Gg: ASbGncvnobV6EK6DkaCXxLlZinTvKeaF1CWa5GT/dfITJcTXFOgGe8iEf2nOKOnEwVD
	roQwrk/v8oQGIKaMZJjk1ol2XuWM9tdHxpLhZDrSrTWGdrn3sHH3uufw6Zs0SnYyE906wFu+Kq5
	hxLng6HMAPImtkhDlaG8ae8uJrXtmQQY36iVeaJs9F5arjgCG4YUMwkO1xlD0NkgWfTEHkicE+y
	vajycfx2FJAwbrkl/e4KzrsWpEml72StU4dDLvT6VRdrWD+gGvB51qxuu3CFjDWRXqq221iJer/
	rvkiM1Ks04NLovKnT83U11R9VI99RKDc7jI87sGV3+PL+DZ3RXOJ3HjGyEUVxs+I
X-Received: by 2002:a05:6214:1c49:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f4cb9a3465mr12149086d6.2.1745573747744;
        Fri, 25 Apr 2025 02:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoiv4MlBzWT6NZGwE45WPs9WN6M0wjAeYYYXs2TXJ84tsBTXEo8eVE4CzqSua4OQ5eBomYJA==
X-Received: by 2002:a05:6214:1c49:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f4cb9a3465mr12148856d6.2.1745573747358;
        Fri, 25 Apr 2025 02:35:47 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7038340b7sm982484a12.79.2025.04.25.02.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:35:46 -0700 (PDT)
Message-ID: <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:35:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GqwHDlo96SQEU6gaSIO6t5F9pmv6NXQb
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680b5774 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=4NoTk0SwpzZkwhluMIYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GqwHDlo96SQEU6gaSIO6t5F9pmv6NXQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OSBTYWx0ZWRfX+GqXNQ1zUIPc C/wVOa2WQpLzLYdoJua5ItVN4I9VgFLKOZSYg7CHowAtTuNbfQ9TBxOMn+uSQCvrE6Vn3xvQn+/ bj94qZCenPI0CX27f3xQ5VasaIUBEVMhvHehixLtbq1y0hbg0uNM6u3y+f0fcVVTU777WG57Znk
 YyiOLZyMhNmhNkRIpChZhV/OyomkRVOWqj4FIJIhUq6CesFWdn3yw7ymzrVq//U9Ondc2Qx65eM n9PRXL2M+0f3pWNmNPwdf8EaMXhux/aN5CBkjMvWMobWiTNVRoXe/L1PQey4xORBFSjdDmKHcrm R0f44l/zxmK9CDWaOH2qi2d1s0UwaFBJ6mE4J6vzp1bOvs8vO5kVGT5/FgtTps0RdSto0553QOX
 yvTw+r/jN+ALjAPsZ/qQWelrmwtjWC9HYRARocPlERVvObIZweVtSMAYrOjWCr214pnMz5WT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250069

On 4/24/25 12:38 PM, Satya Priya Kakitapalli wrote:
> 
> On 4/22/2025 5:11 PM, Bryan O'Donoghue wrote:
>> On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
>>> Add device tree bindings for the camera clock controller on
>>> Qualcomm SC8180X platform.
>>>
>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>> ---

[...]

>>> +  required-opps:
>>> +    maxItems: 1
>>> +    description:
>>> +      A phandle to an OPP node describing required MMCX performance point.
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>
>> A suspicious lack of clock depends here. No AHB clock ? No dependency on gcc ?
>>
>> You call out the gcc above.
>>
>> Could you please recheck your list of clock dependencies.
> 
> The dependent GCC clocks are marked always on from gcc probe, hence did not mention the dependency here.

Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
bindings regardless of how we handle it.

This way the DT represents the real hw dependency, but the OS takes steps
to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
because the clock is never registered with GCC)

Konrad
