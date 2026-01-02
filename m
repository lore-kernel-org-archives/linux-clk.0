Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E131280E
	for <linux-clk@vger.kernel.org>; Fri,  2 Jan 2026 13:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362286; cv=none; b=OxIfJ08XQBRKOVsSnhhFDeU+AOfJvGvA9jli8P7nIISMYuzFdx1LfozRG06qoePrHSrsoDocxGT0i8JrgOOr1s+vdufwFs4/vuxJU8EnAkum0XnGBRqmU79d4oHTXhxtMEiCxyaSSUY6UglGMBI1g67rtPBxWM9WhgmRHRZvE6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362286; c=relaxed/simple;
	bh=1sV8MipC1LWZdrArTgWJG14vnKiaAJ4m/AHNLobfCKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUwOhTE3XwaSa8Zmb8DTmF+DXgTIkgJnJsOXz2kNKL5DWqgSGwddQ26P8WnD/PGsa15cy3cjGcG/UUyzurkaLIMS34MFYO2G0k35pUMDSfQQO+Y/ReVS8gTDOA5CQnfL808VKThboDz3AERUF40entpl3i6q9h2apUxngguYoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhpC6dug; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WlK1gP2w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhpC6dug";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WlK1gP2w"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WEx7618058
	for <linux-clk@vger.kernel.org>; Fri, 2 Jan 2026 13:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXZonBfFrLlWUInQu9VdJssXOsC/CpSwdoDF+7WOCOo=; b=fhpC6dug0bQrpgy2
	8862cfilctnWJ2fwxDGm4JVnWUyVIDo1jBvIhZvwS9WbyjLRAjhl4l/NvRm5zjYs
	jnTl6ruMe7Fq0C9jiONvjwbun0MR5QWOa2VOitaQMoHx+I4SuBZ1WH8HitqmENuw
	g1QTgynYQrLTOx99YMtnBVh7ajuj+9S8fydjNxBDRAg12ziv7xdCYrq2QWEJkRJ7
	aYsYKbGU0G4PwjoCyxlnpuV/irz4m0BALm7Cb7/bviGVfAM508hDsKlmwHvSH+PV
	7iE1B0t2I0li5bOt/1OwX28iNwGebNWsZdEGaOZowYFvrk5wGX0y+tBk+siqhM7u
	W3mK/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beb4wrgjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 13:58:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so55347381cf.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Jan 2026 05:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362282; x=1767967082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXZonBfFrLlWUInQu9VdJssXOsC/CpSwdoDF+7WOCOo=;
        b=WlK1gP2wXmrT/looXthQ+YhEfZKN6g1G0nZDi7NsDuyM+TpIKLL48aJS5hmrp0Kzcw
         r/YvHLSfhFS+KhUG95LPZcgonv5C2lweDbYrExWBImvNAfoY4WV4E5LYpx4z/lew22Oj
         +IM0HKjSANpnKxgP/otE5UDz/9JYdcJ84OW2faoQ7naqepXPRNbciamFUEIPU38kTjSG
         BSGCJzJfwQljVDILCXKzrJTdWmqIqKnzmi8SFXPLOeXU3UzUr59iSGCsa+ruV/Sa4Nd0
         XfGCZiZWuH5pLaLptHn1bIHkb67ywe2xkxtX7FhLSydljz8QRAmUNGxsgQdGUVisAbXb
         reKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362282; x=1767967082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXZonBfFrLlWUInQu9VdJssXOsC/CpSwdoDF+7WOCOo=;
        b=lhEvS7Bfx1+UxQAAKeb182i6ZnCq3tZZYtNLJBx1Xp1BtIg7PlhshptFDchJ0Ufh8f
         WocZTmxaTFhWafqtAA2S1PmdGKNOGTq+21JVkVCh8AdVFjoG8PjHhByFi9viY9JRthP8
         APsWSxbUu0xLclA5+/eq0rFSLzJ8cyYfNFLm8TjWinj9DdfvuNMgasS3sHr3K+xRosQG
         g407O6IOgUbIJjlHmntM3soCWsTW+2NELZ3PaaKGqHFj/XpzLNua9ohAFx/swDLgAPpm
         HIgHCe27Cr8xemaGD9UZPCp+sC3gKYTtaVudrOsJ7+sEeh7QlpcW6HTOnmsYCOWHJ1fY
         lPMg==
X-Forwarded-Encrypted: i=1; AJvYcCXdazTirMb8Tm2ZXvNW94aGpn1IY1+LKqiutSx76FASoKgNrL8ygJW9UqLed0HyVMWEbkq0YOJ6UOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDihsiIkwBqdvm8l4RSuXjvrsSNWO9NFzkIi91nRbZD0CtUaq8
	mJCJmltxV1WjkVpu+xsxKbN9G1RDx41BSj80NFfgevUx0/lDDb64RsMXnaxi2J8g3IX9/ExqfvY
	4jBsD1W7H1WL7iizHW8KBP4R0aPy9e4m44UXC96rqPQI1TzOIrQATIq5/4iN6WJ4=
X-Gm-Gg: AY/fxX7JGsBv/xBHMx8AP/Seg/hSKyb+8Xo2JpD9XjvdA07qnxByEc2giwm3sOmIEF2
	CNTwYKw8tsLCkpsoxjvd49Je/whDJEPT8Xed06cHxPK59qdfu45I8DddUeTwZyasY3Uhqg/BeiP
	jYEhyheczYh0nrNCTPA6Iqg9wohUWXMUM8qK490ZonCLamcxVMmo/NOlcyh9hdJzNvdLt0p98ey
	t55rHx/p9BbjHzGpqgxwjBoMZYdRRhW3Y9GAL3cyywsXrn323wOvtwbZgsyCLY6oIsUBeyrHme2
	4wPuYZcsZJ0OlopunBwgNVfy81pT7aTBx9UQ+HiFeP5W+KmuA7kGwf8UNd7+QbEe5LxpeIG6Kr9
	+JlQdZQaqlZqd9GUnUNLlXVsE2dYWL58KweDxxfC+3zT/OkTdmU9+HbpbpbI7mG+gvA==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr333863451cf.8.1767362282307;
        Fri, 02 Jan 2026 05:58:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Y/WQ8VpeHWMYOtwRnUu1StCNtd8fnIuIk1RT/81Hf/IE5HzOME5xziQdtKVDZLPfJJayvA==
X-Received: by 2002:ac8:66c7:0:b0:4f4:b373:ebf with SMTP id d75a77b69052e-4f4b3730f72mr333863211cf.8.1767362281838;
        Fri, 02 Jan 2026 05:58:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9ef904bcsm43228684a12.22.2026.01.02.05.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 05:58:01 -0800 (PST)
Message-ID: <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 14:57:56 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BWcCql5EpbqqrsRT1KJ48gUJhsrAy11U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfXy0XeWshXkIOk
 baGAnT8tqAvMfFIMCx0CbIvJ84tR1iZu0MqPCzQzNoygdhAXF4ckCVaMgjOU3bPMFoedhbNbL/V
 Joc3x/bvrI4BHOt+ykG2eI5vDi3Dcrnv8Td860oxkFoa99S5e5k9eUGHfXu/7kFuxC0JD42xlIr
 eIStoN1/y38xef66oJ7uTvK/vg6pKiP9SnEK4Zckhn3IUFXJN6x7Q8Dk7XiYodGtzrea+OWUQ9h
 023gJ/W9XDu5HfDxK9Vu462djnquWLV2cAu7WoGgUzbBCRKUL3tXoXlIVGayDUniTA5cysRY3rO
 ADRkJVHFYJ7NoWNEqNi8aAiBr1WAc4m5ASV40VkK/wa90QYsQF9VZV2CDDffjEZphhYGr7MWgwQ
 x314axnyZM8I3GbGIDZtUb1+BmyA5DY4sPm1slniHQbe5Qo/AR2wNqX6/jF6nepkkrlYi1zOrs/
 Ryyr0xZaD0efBzN5W9A==
X-Authority-Analysis: v=2.4 cv=I5pohdgg c=1 sm=1 tr=0 ts=6957ceeb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=LvUvCMLUZ1wwccowk60A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BWcCql5EpbqqrsRT1KJ48gUJhsrAy11U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020122

On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
>> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>>
>>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>>> can happen during scenarios such as system suspend and breaks the resume
>>>>> of PCIe controllers from suspend.
>>>> Isn't turning the GDSCs off what we want though? At least during system
>>>> suspend?
>>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>>> so we don't expect them to get off.
>> Since we seem to be tackling that in parallel, it seems to make sense
>> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
>> "off" could be useful for us
> At least I am not aware of such API where we can tell genpd not to turn off gdsc
> at runtime if we are keeping the device in D3cold state.
> But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
> more sense as it represents HW.
> sm8450,sm8650 also had similar problem which are fixed by mani[1].

Perhaps I should ask for a clarification - is retention superior to
powering the GDSC off? Does it have any power costs?

>> FWIW I recall I could turn off the GDSCs on at least makena with the old
>> suspend patches and the controllers would come back to life afterwards
> In the suspend patches, we are keeping link in D3cold, so turning off gdsc will not have any effect.

What do you mean by it won't have any effect?

> But if some reason we skipped D3cold like in S2idle case then gdsc should not be off, in that case
> in resume PCIe link will be broken.

Right, obviously

Konrad
