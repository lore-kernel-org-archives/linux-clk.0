Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2FF33D6C1
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120563; cv=none; b=siDKfaGQdmWzSxLi/GwScRs8xUx6yivA6qn2T8k6G3ju3Cl4WkGOpoUD7BtktNabhwP4xiT6Hdf7LWB/qK6wPaRpMNb5V3NuE67akgVUxW67Srv0D1Krn50Ux+fTxItceRlwMcXuK5FIw7q9ql1TmRB0vsS8JhRKNKKMsSqpAeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120563; c=relaxed/simple;
	bh=LhX4W4966WbA5RsY6vvGNAKLc5ZklFBLRf+iIcs0fLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbhF0pa+m7ho5Pe2ST+2WzT0mtw4eJt4LEWb2zNMi+lSZf2Ipx3MhT91dZo7Ia3grYce7qJkRPTNtn8ms8jXYwNKvTCviyIy5rnfwMQP2cbwRbPXuhAPBfvvgjS1qOPn2AJaTWLmJ0UTwpt9L1Di3a6mPQxNAZUOa/tRD22Akm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVMwo7JK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YL6/xAEa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVMwo7JK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YL6/xAEa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613A4AVC915756
	for <linux-clk@vger.kernel.org>; Tue, 3 Feb 2026 12:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=; b=UVMwo7JKrp0aSnNN
	MzC2V3Hmrn578A+I4RYHamWF/NMEGQ/mq+YgWorxlsvVa4nyNC34yODoazIpGE/D
	l/uScc8h0Z+z03Jb8FfyWWHYXoX0iHbUMjJRBksxjeKqLkzoMHHmpnEUoxD/jBJr
	cpTYWe48Ax5Xfz+FkvNxaAtBg/UrCEsJNJSA3die0nfn01Ve5TLbD9uKhLTfy3UT
	KKHSFYa8Dkomk+vWB6WzdFI4jUsxRYXHGaRwGMWZ8LhycRdfwal/ebDJ37WddCgq
	Jl9bur7MaXtwQmfzqKahXvqqI4uksSam3v9bpGfPan610lrDDQoq8C7iAZV9o9OQ
	ElB+4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exk8buu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 12:09:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70c91c8b0so155795485a.2
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770120559; x=1770725359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=;
        b=YL6/xAEahDazUv6MUYDt9id15vAv0h9hkg2jpyDMdsFaI/mOBC+JM6f/DLDAnqBkX+
         CJcLVzHueWPOJfUZVK0WG9E2Cz0M4926hgoAryK9UuvgiTKQsJFosztpnYT59+eGxMgm
         4Oc9UfNOt+2vO4b/ed8Vyp07MtNo80Ao2ltgnpALrQigmmkdVwKcN5r47WvHq6ov2M/i
         ze6TVRGhNOyjc95m6V3HtvaTZ2/TynPv5OtB4kqPsjkvYHVQ+ut1zXf2IQIL1piyc5LM
         krtuqVpqHW/aZT7DcT7xCXvR26QPEUmwjX5Y2n9HeNtQMBANKT9dBJYMG59PcCj+SZAa
         likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120559; x=1770725359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPoB5vfU+XGoctzE9w6IbSeTVRMHd7Q6eL3ax+WmBsM=;
        b=VBgLN7JnnFIbAyRLJ81EvhHITKGoryKrifWnlKygBZVWBxkVqNO8yJCRhd4NAocnVA
         mK+/lTaPRLCN9YpAWhlbtsfTQhQ4O0D7pY2/E0j+TWBMhfxns8iXSrKRas+6E158wTlD
         AYPWmCyPCEkwtZLzO9XRlTausrduVEq84/s/5M+r19PMGZe4653Osf1aVWT+6CYVPxLf
         fuw2u3KOxavsZKr82wk2+QilqVZ48wKQXhm5MhA5Cvw+5e75fZ70USj5E1bQbDAFgrBf
         xwzkqFdAffDC1L0TM4Ehv/nQJsFIrZUCsTP3oq+kYOb3MMJIbrQdX0p9LkEVbYnTib77
         9/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWtbvZ7AlcRacHZ7OKjayS5TzoNmzWzuPk6b14ZrXhbzgsomoDnd8WnKv8qJwB1eqRiG+IdheV/aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRKi8bsDIn3IC49DFmhasy/+oMkiA6nDh8ToP+b0lv+rtkvpGn
	wbP0syKPaLmujIB5YBdisinBoux7fuBs++90sEfI3rAkfhuI+OjffOmbSA8FEkEZhxRtJ2Oba1V
	Vlv453KGK5kJ9o01q2Wp3GBE7VM7hlPUTa6mrrSDT9zNNjmv2PTpo7BuMJfNuoCc=
X-Gm-Gg: AZuq6aJYqBhmahiZ2us24NOi43w/O1B8tqBE0iFSmWhJjPy+UwGOOYIcJknWHqVpkUH
	EL9hS2KtHFlCLTCBGTe5U+/1oE2PrPayaKcgVm0/h4aDAHQmCUoN1zC3rrMz6EW1In94mfHeJqB
	GA0DQc2nSvB9/u87UdRyWmq3/32rWympJ6JaV23mdwf/2xydMu759jA14eKFatoIlQodXMrO1cf
	49o9UoMijM21aX7qnqBFsR9CUurjNINrcZlh2EcDiQ0LviapE/KikNZaaFa7yUi9atqbbHWZnlp
	O1jVNa31/9CyUjirJ7dPyDiqtpdpWH13Hfq+U59bsvliMd2CSOGwFNS9SMBkrtuVsP2WGu5VYEa
	65lDJpKnN71mjhIQIAziKdb1pMeVwn1jfTqqdc+rHKjrTTrKpaXtchxkZjyquYcVPABk=
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr1529518985a.11.1770120559104;
        Tue, 03 Feb 2026 04:09:19 -0800 (PST)
X-Received: by 2002:a05:620a:bd6:b0:8c0:cec5:148c with SMTP id af79cd13be357-8c9eb34ff20mr1529515085a.11.1770120558684;
        Tue, 03 Feb 2026 04:09:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-659390c08ddsm751708a12.11.2026.02.03.04.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:09:18 -0800 (PST)
Message-ID: <006f6c19-d923-47c8-9890-c7431c8c1e77@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:09:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] Fix TCSR representation on SM8750
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, stable+noautosel@kernel.org
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202181917.imo5lk3smwott2ue@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA5NiBTYWx0ZWRfX05hDn8hVoUSe
 Gik//iBNNxRC0B6zQrVi+rDPUumUAPmblGCyl8RLVSeSDJr3n/X4bX0xEQifpaIx9HIo1NtLQfN
 sW54Q0Y9RPqLFw2OL5++AWDoPmaSTxGJ/Uq21e9eVJGA5hwvGb9hTrwgAOY9HhBKt3kSPbaKR5g
 ldabxntAy8KJwCbQ9r1XuAJqp6Dr3sqPMo+vhSJt+6SdwCH0oFOh7h5KiGq+/ssnk4clA8+Jkfx
 R2eldZZw6fML+GjdiS+ObVTIj1WnDU8IU6fjvbIzWaSKQLwx33ADvJJMMcqRCc5MJSY3LwnBlB6
 FGpHTSmOhPKpRziyO3hG7OqDL31vcw4RurDPP45ne7kGFNG5+oZBk/S8zizlll/7aWGZ1fRBc1j
 ZL4kodDsormB4gkwXzBmGiSkH0kA7YTB6wcFZYH01G3S9WuTUyUsS8ThozCtAhvtO+RqwpaBLYu
 MuYS0onRFWYTIfPM0BA==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6981e570 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mv6jPIj4YeSnJgRhVR4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: SV2f1V14048SignxglQ37jhAQehHRorA
X-Proofpoint-GUID: SV2f1V14048SignxglQ37jhAQehHRorA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030096

On 2/2/26 7:19 PM, Mukesh Ojha wrote:
> On Mon, Feb 02, 2026 at 03:57:32PM +0100, Konrad Dybcio wrote:
>> As sparked by this thread:
>> <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
>>
>> The current representation of TCSR is wrong.
>>
>> On platforms post and including SM8550, the TCSR had a sub-block in it,
>> containing gate clocks used for distributing the XO output to various
>> consumers. This is what we refer to as TCSR_CC upstream.
>>
>> SM8750 however, is notably different. That same set of tunables had
>> been moved to the TLMM register space. This is made worse, as the
>> sm8750-tcsrcc driver consumes the qcom,sm8750-tcsr compatible.
>>
>> This hardware change had been undone with the generation following
>> 8750.
>>
>> This series attempts to unwind that. It's difficult to merge, both for
>> bindings and functional reasons..
>>
>> I think it goes without saying this breaks backwards compatibility, but
>> it has to be done to represent TCSR at all. The patches are ordered in
>> a least-destructive order..
>>
>> I gave this a quick spin on (remote) hw, the UFS (one of the consumers)
>> still works, but more testing would be greatly appreciated.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Thanks Konrad for taking this forward, while I was also working on your
> suggestion to make tlmm a clock provider.

I was under the impression you abandoned that patch, but indeed I
should have asked first. My intention wasn't to beat you to it, but
to unblock it. Please accept my apologies.

Konrad
