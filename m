Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21510382286
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610896; cv=none; b=XgGpxom7hcXOndTs7ztE1JgxcV2x8KtAZo4yHLSh6/jE/cmr+K4kwlIxpDPmGANK7YRRvI354El7GmqcpZnOQVIgbd9vrUnH3Ycp7thygLYno6qhHbZNsKtOQqjqf72Yky4kr5OJo/uZZmwCfYexkrn4tBExaUOzYNGtGiT0A3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610896; c=relaxed/simple;
	bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8J0JH65PAOP5X/uzHGw3Xebvm/OgKcSWPkpxxBKTWUw3Rosx8Mpa2uNyw3X68Z3Cqt/7kmi7Xg6PChj7OGb0i+dbplcTNW0qae8r6jjhkvnWq3sRGeAkvnv+rLNGiQUjFjNne9bPmviHUp4t343DQYfmOTpMCOkHAUMyu5Z/VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgpvLHyv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vsukcefw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgpvLHyv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vsukcefw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwIJa1971382
	for <linux-clk@vger.kernel.org>; Thu, 9 Jul 2026 15:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=; b=HgpvLHyviZF2l86A
	avaqMK/HD9K4u+4v0YOvK+NtbkudPr2r9wXZSpXXZNSQNnTSm1OAcOUOkeNMU/Js
	Ct91/n7EdsTMkDCQtSPPJivDjALwt7rsquxAQbH97zPdx0w5NQG5nF/piNU6Hwvs
	EI5gTdrrWagAihHic8S3kqskvWOUW5GzQwZjtyIsbebbIaITueNf18Lf4Z5b17is
	m/WYYryEDzKQBwmD2I+5/lAjSOzxrU/RmlbzICjn5jDLBUzJ/Q3aitci2VB1S2dW
	bMfICuoaqCWfsBgsf99BvUSlMfVxhRTMpf22UvyiqYnfG6wSeR0Alp305EygksoR
	zrnfQw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpggxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 15:28:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so26754075ad.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783610893; x=1784215693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=Vsukcefw0o2eTdwdWJBVZKpuHf4npA49OcekDRHKKVs0aqhr5SqQQYGOl8lHKi4yV2
         N0CHHjD7scQ3lxy7D9vgEyaDlLDeg0YPRQhH8Z56UC9W/C8fz2uRdKYxWfWi0FTnyzV4
         8OO1omUqbVfq2DDXqlyvKK7FX8OC7uVGKO1IP/XTxKu9osNbQqUIVDjv8OWY1pv/SbBa
         VD/FEVlsfhEfY/jFEtSUlg9cbXm2/9j/KZHanGL8Fw4E0nLwS+JfYPQGQCSqZIPYMBET
         hccA4Pb4uvYDYdrjMhIpbX+iExF4+Lowabw6zI+Tyy/cORXs5l1RauUqc1WgxENT29pX
         Y57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610893; x=1784215693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhpoffETOuifw+MNksNM0dLoI7WKZHtIwfPDeUBNl8o=;
        b=U7wI3/qfqRHbRQuUg+5iNxAz2Eges7ZxKKs4w8klUsy3xPAiDT76RWTMMQRqCWkHEu
         oEnwkUABYDxfnkD7u7iLktYETbBl0tQUWcKvVeClrDNlOaDjMUjPNRFw0mR4UKPQUtKq
         NdzVnb1cJAj6Cp5V3y3ixZp8cCFAuhBry1c4wFMVkOuIBtdB7L1wBjbuWR2nVy+0RdgR
         UM5Otf2FhXT11mstIMktOnIy8pLiqm79D9o0TIeVMZOVbF4RbYsrw7iIdzbshNWQ1SnC
         h1QyKfjG7R6TkGlclxd+0rnYlAWd4KhZeOwSezPATaCLR5aX2rUTnTKPEKRHrpyWkT9u
         Qm3w==
X-Forwarded-Encrypted: i=1; AHgh+RoeOlr5TidrIRpDhQYZ0qO8V6BP320K1oPAsXv0j2C8jdHHliGaCweRfdAFwQKXheF5FZZk0FoXyew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3+upAgg82J7uWsh3cRU6197S34YAW2g8Ky26YJTZvBN0IzsPw
	ZlNtw5yqw+480+Qsz15TJHsSoowxxfSpGzBaWwt1p7ZXKLgnU+Lo81uw2K4t1nLnYr0Ezb5QmaU
	RwxfW92AIXw15t2PwaLu3Flvc3p5ZwfzxYIskdomqJ4ydexTrWMF8RnwHvbim1+Q=
X-Gm-Gg: AfdE7clHIcwYLK94B7D7ccUiUlSHoNUEZCohTzrqlS61GEZsMVdrUlnFuJIenV98azG
	bX9e5439JZnT5tEhLnrVlbh1bPcZWl0QHDSjSlxGRgw67mo6qdqmmdgzeJpBj/FevDtMgitlR+d
	R9QhcChHudNzm5SnG+xm4Z7RIBaBXU6cqRDKsXUD90nJEqC3xBGAxbclLyd7/qhXZ4QO0FtLjD0
	cVSMNcXCDQoGPYwX9sQ892n8YF9Ph3wBNQ1r8f7/5kk85qTiR9pPrjhOkADbC4poIsfhRIIMQNF
	Qnmj3dWVnx4JYfjUlSRnwgJ9Nh3iz8Fz0jm/L+oCl1wz3evOLMjZwy6YmuOsjeBTaPjvRiAPoFQ
	fsL1KUKaiuuCRPLZ2mH8Syo/RVTdgSJGsWjiwiMJGrA==
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9375024a91.16.1783610892169;
        Thu, 09 Jul 2026 08:28:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-38940638b51mr9374988a91.16.1783610891627;
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Received: from [10.204.66.221] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm13681204eec.26.2026.07.09.08.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:28:11 -0700 (PDT)
Message-ID: <85a05836-6298-4111-97ca-80d7e3b3a9c4@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 20:58:02 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
 <HCPw5KYwtYb7jBFED4lssTvcaMo2bK808SHkTWNR77q0DXGPQklaADJXvuyeBrXh_GsEMKdiaaktkzQ9_xeseg==@protonmail.internalid>
 <cbc1b1eb-0064-4999-b829-2bec451c682a@oss.qualcomm.com>
 <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Language: en-US
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <f307848d-6abd-4e96-9183-36f8599026ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX55QWZ1ITPJUG
 lFyCURj4icVFpn71UOdVBkUNX1GZMDju7wogpRM5V6YZ/VFYVTxKrTUy45hHgHiY+tlfm0O7OVF
 jpzCGekfVJPNxo2vRdKJDyREMoRGpt6Ra/0l5gT6Ixcl4PLMH2e2qPx4bUcU5SQIp+D6wU4+XZX
 8PF4F6Euqh5WGLQzSRZeUApdae2/pyqlSullvtsKNRAAzVAhzB96NRP1SD5Dicbu3VxxCt9WSGR
 DJ0bBlPZC9EsmIvxl7P53aW41XT1Kug3SIyBiTsWWiixeXKCyE2Gjkld+OhkVqJPg6HrQeFGb26
 0p/stMlniuAOLXcafAylNN8mfRxY7cT6R9JamABDL+Wphg1wG7oIcpG2ZkFlpoO33zQvh3iTvAn
 EF+p7t8Q53sKp0nsqbZyMU0UzS7/1m567WWdyTrYAsTAl4sOzNXpWMeIa4ITxpEg+nOTJHTO41s
 Pt7Mc/Wf7P9menU3QSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MiBTYWx0ZWRfX1jNkyyCj9YPY
 WXuSYgmEZWQuHVvTr+0k/Ad2gJZHwIAGFXlzLajNSnlKKJlwGIGppT8dJ0XSm1jyoJyU9FjQ3mi
 EqncKbPniPIyEfEiqzYHkfWd1jT9tWk=
X-Proofpoint-GUID: pstjS-fRcuOU0wwfJ9rYg8gnIBKSyHrN
X-Proofpoint-ORIG-GUID: pstjS-fRcuOU0wwfJ9rYg8gnIBKSyHrN
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a4fbe0e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HI1v2mgwsAgm2NAubtIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090152


On 7/9/2026 3:02 AM, Bryan O'Donoghue wrote:
> On 08/07/2026 16:15, Vikram Sharma wrote:
>>
>> On 7/8/2026 5:36 AM, Bryan O'Donoghue wrote:
>>>               iommus = <&apps_smmu 0x800 0x60>,
>>> +                     <&apps_smmu 0x820 0x60>,
>>> +                     <&apps_smmu 0x840 0x60>,
>>>                        <&apps_smmu 0x860 0x60>,
>>
>> I think only "iommus = <&apps_smmu 0x800 0x60>" should be enough as mask which 0x60 is implicitly covering sids like 0x820, 0x840 and 0x860.
>>
>> Regards,
>> Vikram
>>
>
> These all come from the Hamoa iommu defintions in qcom docs.
>
> Can you double check for yourself and let me know. 
Hi Bryan,

Confirmed — all four SIDs (0x800, 0x820, 0x840, 0x860) are valid and documented for IFE/SFE. My point was specifically about how the ARM SMMU SMR matching logic handles these with the given mask.

In SMR hardware, the mask field marks bits as "don't care" during stream ID comparison. With SID = 0x800 and MASK = 0x60:

MASK = 0x60 = 0b 0110 0000  →  bits [6:5] are don't-care
The four SIDs differ only in bits [6:5]:

0x800 = 0b 1000 0000 0000  → bits[6:5] = 00
0x820 = 0b 1000 0010 0000  → bits[6:5] = 01
0x840 = 0b 1000 0100 0000  → bits[6:5] = 10
0x860 = 0b 1000 0110 0000  → bits[6:5] = 11

Since 0x60 masks out exactly those differing bits, a single entry <&apps_smmu 0x800 0x60> will match all four SIDs.

That said, I'd say this is more of a preference — both forms are functionally correct, and if you prefer keeping the four explicit entries for clarity or to stay aligned with how the Qcom docs enumerate them, that's perfectly fine too.

Regards,
Vikram
