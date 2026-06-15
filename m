Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960E03FCB3D
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535102; cv=none; b=DNoZO63k2bXsGTMjX02tAGVNpQ3zXO3Yl1H3CMx3oZph7dx/8MBL7LvCgsFbvAjgr9LzuHbuUDEbrSCFpcd+H5qUL4GNJBqWHNWtS7lmM+jIBZfAujmLleIVzWzvIdOIO+pSLdxL2uIa2aS6yUT7b7ZaPOGl9fzmqrIPn/fa+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535102; c=relaxed/simple;
	bh=pnjFXfHvTcgzr/idrDh0pO+usNWN9B3o6L5QG6iq23c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ruko84QIof5mFoCQ9U4Z3amuPvZ0aF45/K6MbamG8F/JaukV61NiEd5GR+A51xT3quUPEewH6bAYKEEXKvU03e1paegohPoGrqU2LSWgasxUr+KYnmS8CRBoWejCGqMl5rPXbmWhCDM6o1aPGYuiyY2TH1w0lE+/p2lU1YhpgKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okD+eTdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iO3kFl8Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okD+eTdY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iO3kFl8Y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEZ2Ox833631
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AUYS+wae+hsbFs8L1IrRqpyJhpzYX6yweeTpXfvcbo=; b=okD+eTdYYLRbfln9
	V2EKlJRaGlSkmVYAV7zIR+agqfTfF5XpkySQMSi95/GrbVcPpMFLpD4Sal5HBCmO
	g7LlJspvBprjwrioGl61vqtKEblz6xSfMgg8y5DJdCQY7pGz5o5exenV5NmHKWu0
	/fOdphcUtvm10OrN24ecj/j1oclbcm8M1AtBjYTZeMwAZJfxZUVjWVyT/yfW4P7n
	Qcu0lORxKvVdxzOvejhfRHS6XgbFOhBTDpOrhT94Kj1FT1ss0cm1+A4ryo4Be1OM
	EE4WnghlM69AEtBiMgQbvJA+NnP/AgPb3dodYJ98vm+bdy5ybFUywVdfVcuNG0zK
	Rg1LZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhgse0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:51:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517bdeceb54so8125901cf.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781535100; x=1782139900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4AUYS+wae+hsbFs8L1IrRqpyJhpzYX6yweeTpXfvcbo=;
        b=iO3kFl8YoJEDT73YUlRUMVwQ+IGW4E2nE3jKabiiOO/5opu5RrJMm3SMlbxhyUzwoG
         pVFIkQLI0o13QhCRK/hgpeX1DUNgK8E69yMayT1gkPpNWhZoMs/Gz4msAqm7QwnW5SOl
         7+nJRroqsQHX+ZNULQBYM1QqpuZjxvzejD/tKNgnEVCI8E2pfVrU8Gkq11ou0n+Rg/En
         CxFunOjuO2+NhvBM67mg3rwKddcnltRkROBa7iRXOT/bqoxH5kmanYLscR+GcnFLfMDO
         1096o+o5YmJ1Ibr6PhxEVdhD5PpBe2XaBqa5bLHFDoGRhdCmgIghnJJYezWw2dxihoXG
         Rr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535100; x=1782139900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AUYS+wae+hsbFs8L1IrRqpyJhpzYX6yweeTpXfvcbo=;
        b=M2ThQUGVFDYZTZ9XqPMUOBDbHAuaUXzd4LYUyE3pmstytfoN/ThbETVK/6rGfTgrBL
         GrYTxFvHQaJXQo1v2vYRsbP7wvi3W0zJL23U+RUXZHcj/PNbuRGhw8cT4DZWDC9RtIic
         voeTuHrLIqoXv/G9mXmvv5TV7gYmtL/ZrbJGvuKp1BkmIzYmvqBGzoA8s74vfue/GGpH
         lfOrrB2sVaPrcBpJCIh/5feJwwknE4FjwHw6nkUkJhU+HTVGv3Oz+twKip7OqUPgzmC6
         zmn0jACtxL8/ABDc1hkZSBwNkkLI7tkL5DnGAj45z6aGBrnav9kj2lq7LkoynYa3zU4W
         HriA==
X-Forwarded-Encrypted: i=1; AFNElJ+aOd9MDVSjN6z08pKzu7/2OclFNR+N2W9ec1oguiZqIpY/l8t+zD+ijw28uKzdq/ssIQVnOZ+xqMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgtOztqYre7Qo+1eSzGnMC3BdaA9+XLuFJVaYonBCX//6y1Y/I
	g5uCLzfSU2M1R2G3gPpjIpeKnl3KPZhro+3StIQoLVmhIva5ZOP7Bvbinx8Z+4m+lsQjLLhq4sI
	L6H7XtyucgslhVH6AseVmw3TKN8Y+FNVQiV4BZpspf8n5Mfzr1KacwOiSDbSX6Hc=
X-Gm-Gg: Acq92OHJu198DTun+rgvC1cRwT3sgDqIZGRuC2BmzSVRQnnlNReyBYQ2M0libDzcQwn
	PrGR0vrSk9s2EFUlMPVRmxhQTY6bZ2qnfnBHuoAZO7B24t/VEWnGcmP/Mi4qElg55QSYnh1Y0Wf
	AKOmFY4fMcXtG7nu3WbkJmMweFsybreq+FnCBWO3bumsAgONadDeqUQYDWvwg+68NkL45wRdW/f
	QJ/dCh3Eh2eZTq/VdcVW3cknWBrOqkh1Cumk/H5ryGrHIOBrAz4XL/IFj8mqrJTH830ThjdW2st
	om+Nyy4OPSUCHt2EyVdGfrzPI+MNdUrooxfJnRonyMVb6m/J/aChAdiKiPzt7YHOg0tglmDXSIM
	LQhQplzu0pfO6vXMAWzjnjphos3Yw2LT4LPD73efH+gZR/g==
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1354305685a.3.1781535099771;
        Mon, 15 Jun 2026 07:51:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8f3:5988:f97c with SMTP id af79cd13be357-9161bc9eeabmr1354302185a.3.1781535099280;
        Mon, 15 Jun 2026 07:51:39 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949bc64sm3651693a12.26.2026.06.15.07.51.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:51:38 -0700 (PDT)
Message-ID: <fef227d8-4ad0-4884-98ae-fc48056c3856@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Val Packett <val@packett.cool>, Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
 <ajAQqVB_knGO-bqL@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajAQqVB_knGO-bqL@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1NiBTYWx0ZWRfX8GHnhnQmpcn7
 hHzOX6HV9yYp/J9yCoQW69s6KIq0TBf2sO7kwl+wKapsvgyuJB59sq/N0/YVl6RZuhTI2ooDz/U
 MQUQEYIvM158gHskn3Ar+XpjbY6dzKc=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a30117c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OVboD8nU07OjOQKM4TkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ce38CRmlWX50g7i-oCS9FrqxtBJxut7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1NiBTYWx0ZWRfX3o31KgjquWVp
 aAywVYMQjDcvD/5frDdAzBj4B/B4z95pRxqWbiPIcNJtMy0qlHtNk5HP0vPsacXQeJH5p7TfMEj
 l0J8FwrBE15Vm6ogxc5hu6jKBknu0pgKT1TW+lVtr1T9N0CSmumalkIVMMDladOZtJZyws2Ag1p
 pL2IfQdY+0KnZwjFSI9x56Oyi1cxR5Tf6VzZ4Umns3ELqXRayP4pjd6j/UK72HMBooZWq7SG1Ag
 e/C3YP4LRz/YN5uQ6Kz3MNl6MZrQu+jwBCjfgWIHpbQM0Pha99cAQhlkkOToCPi1ikOTPby/EwT
 nvwFlg+VZYlsteN0hqNhAZiG0maOZ5F5wg/OKGmTSMyIsCwHBUZQQFvALfI7VZXFHpoIwY0r8fD
 TFU/Nkw3l6KtXhpocJg2jP0OcZaglnQIQvmsjvmjODkTE5dTCxWRZwtEQM5V/gPTi7ywWhY2B6l
 pi/D6rrdIivVC22XU2A==
X-Proofpoint-ORIG-GUID: ce38CRmlWX50g7i-oCS9FrqxtBJxut7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150156

On 6/15/26 4:48 PM, Brian Masney wrote:
> Hi Konrad / Dmitry,
> 
> On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
>> On 6/15/26 4:24 PM, Brian Masney wrote:
>>> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
>>>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
>>>>>
>>>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
>>>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
>>>>>>> Several qcom clk providers currently have a sync_state helper set to
>>>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
>>>>>>> sync_state is not defined for the device, then the clk framework sets it
>>>>>>> to clk_sync_state().
>>>>>>> [..]
>>>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>>>>>>   }
>>>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>>>>>> +void qcom_cc_sync_state(struct device *dev)
>>>>>>> +{
>>>>>>> +	icc_sync_state(dev);
>>>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
>>>>>> internals. You might need to set drvdata to desc.
>>>>>
>>>>> Hmm…
>>>>>
>>>>> Currently icc_sync_state does not seem to use the dev argument at all.
>>>>>
>>>>> How would something get messed up, now or whenever icc_sync_state changes?
>>>>> o.0
>>>>
>>>> Yes :-(
>>>
>>> Sorry about the delayed response since I was out of town all last week.
>>> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
>>> existed prior to my change, and I should label it as such with a Fixes
>>> tag when I post my next version?
>>
>> Up until this change, having icc_hws > 0 but lacking icc_sync_state
>> (or the reverse) would be be considered programmer error
> 
> icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
> programmer error. However...
> 
>> Starting with patch 4, this gets assigned unconditionally, so there's
>> no prior bug to be fixed
> 
> I don't see where that situation happens here. All of the places where
> icc_sync_state() was previously called, the new code now calls
> qcom_cc_sync_state() -> icc_sync_state(). (There is
> qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)
> 
> In patch 4 of this series, it sets up a framework level sync_state()
> callback with dev_set_drv_sync_state(). If a sync_state already exists,
> then that call will fail with -EBUSY, and it will leave the existing
> sync_state() intact. So it's not calling sync_state twice. I will
> clarify that on the comment.

Dmitry and I are referring to the situation where the clock driver isn't
an interconnect provider but icc_sync_state() still executes. That could
not have been the case before, since most clock drivers didn't come with
any sort of .sync_state()

Konrad
