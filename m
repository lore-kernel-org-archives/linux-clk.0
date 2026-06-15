Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34233F5BCE
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534006; cv=none; b=M3A2+U0o4YSr3JfCqUS6E/xPtY/dLpU/8BKnnhlCzmyXYsakvzazZwQX3XRK0t2TV6LzQLhODxEcZi4UV6C3vAATRco7CnfzTrwPtQYlK3e1HETowl+x7U9alSPTsQaymTkKzWmaAMuqjT1KL4dFCka1dVPILcMnEPS66ihznqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534006; c=relaxed/simple;
	bh=MA2HC+nJuMiryx7fCp6ddzKKGYKPWzCZYFTJWhzzEMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz6/hvRAucEoLRzua3t+QH+UhnolHkylSC7YDYCNPbsGxp+vABUbKSjS6DSJSArZH7n5VZiLy3dAECDB6yp10HAwFl7Mm59J5Z9iyHUzxSG8mOx3pKXN84hQj3mFWLAS6c90jagLrzMm3p4v1p06A4E1ElkeCSbK9AKd68bhDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIIKCZUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RP68iyYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIIKCZUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RP68iyYT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZH0H022301
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dv9ZEji4B7BwWDkbahrAwa3+NSTzy2uFpYlUp/k2i20=; b=IIIKCZUOuSR0VYK4
	Gf+utiApakgUA5qcs85b3UpmsFTr/tBUAWA3O7meipFTIwDiq6ITlxTtNoh2Tfbd
	7Q2DXAP2QniCBWFpuB+SzVc6SmBzW9Pdg7/cxMmmvZKpEub0XzGMJjaCrxz69hDG
	f6JYf1qwBrCU65y1PqWr1NrBl1fjbg/QbR8pvUj118NSpsEUX4XdFTVCKwxO7FAW
	oN05kJfvdOPreHVl+hczdCnXgpWQzx7CtOrnhb9j8yZonCOf6Nw4DiNc14sVwEGf
	r08gEkBzLrGkIqYcKBCyWJMO4Wq7wmRzyRoRmlwoRpNOxIV1okqdza3d7Ef9uuJs
	8reKBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa711sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:33:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156dc90fdaso84399385a.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534003; x=1782138803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dv9ZEji4B7BwWDkbahrAwa3+NSTzy2uFpYlUp/k2i20=;
        b=RP68iyYTHYd6iWNw6ZsuB0SyQrWhW9GlLIJakGQOgD+5gdqd0hv0zwwdwyDp59YRkZ
         TgPN5lvh6nxKhHqlaBA4wd7/0wgXG2xPF6h920J8hnFJcWr1uCi9ta61nOlUv38nFCxj
         WTA6t9jxIjWbhf9fkLrXoz8mOKK1OJYrCII4GfcOPDdbQyJPOpiSYG9KEYsuEnMflIqt
         maM+Zlci1dVF1K7fPWVd+Ku8Mx19qCpqwJZAJfmymOS5ppu9NqiaVXrDxuxkSWlWG/De
         BT0Ai7zhal+hHTX2q+uGBKOfme95wzgWFv8WKBn2D2IXE5jNcJJApuEBDnKKOKw4xtLC
         FW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534003; x=1782138803;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dv9ZEji4B7BwWDkbahrAwa3+NSTzy2uFpYlUp/k2i20=;
        b=Y311wYjeM94XhQPyWXCynv7lropnQ7nqYGDvc37vvuPZkj8GwP3PWOUJK6cgQaGZFX
         UAQFWHVtKeH6aj2KIfHLjujCngyYNgF86ZuN4h0ilQV0TK79LHzs0b9FOheFee0m7EWC
         oZ5GVEqSH7+MdXytgppP5h3vRD9HI51dUoYrw6QT+qmV4+MQfDsfGl0KWWUpEdB0P0v6
         L5XfmpwJ9nqagjlkHfPub2ltwZducEc76kv0ehCpU00U9uqfbunEKpIhEtjkn2MzfIgE
         nyOvCT7lpgqtnaVgcjwxkYyMJvxSwVEvo68/LTQZRh7F8q5luPD1q5T4liOxx5Fb8k3h
         K4fQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eMTjFasF9moooARmtyhM0B2BrX2IrH0dIfcWZ8wH3AvzaCopAiuKvi3bltcsbdKWOAOXSZLeM8Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsGRFbBRmxpsDp1h1J5OJQvis7x5nC3kVhUOFXAWTyYQ3pca2D
	IZjD+fsR8s3QmV9BeIHsKwDyY9IoaFTz71cXgTrLN9RqMArhzrAkaDBoNoTudGNc1b2pouxcA/f
	tbR00uG3YczdAZj/RgYg2oct/6bosvwF/qj1F2qW8pPilTi+KRIx7rE0dE/ywigk=
X-Gm-Gg: Acq92OFu4l4NUPaPiCCZ5PS8iRbEY4x8KoOmDdEYru49lWEnNNgBFa0+D57cB6tiw1J
	gi7OcLge9keBMljVRjabcL3MlTq3VVBvAqsl8n4LDoBL2tJqwYy1rRg6H7eRiDIwh520b2NX2WX
	Xp3DdbpuK5PWVsr08g9kMxDydGSAmFA5bMVeDO0mLV4mRfBxVLrd4shKCzyYPNV5aCIvws0dbmm
	ywW7D86FLawKqABFUiPpqJdkCxks38Jp/3JfVCWFEhgIsjAR6yJp9hu2RTab3CEoL6U1stv8Ctm
	33EfRf7vRR+MAiylnMraFTvZ5VaG3dU6JJk60QQQak/7OATBCmiOsbFW8wSsd2uu+M6fKhSBsCt
	QkX+QtOpJeb3RU42/efwDwwY+IeJ0sH1PBE/YpXYlaFrXRw==
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1315442685a.8.1781534003171;
        Mon, 15 Jun 2026 07:33:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:911:295d:59a1 with SMTP id af79cd13be357-9161bd4df47mr1315435385a.8.1781534002504;
        Mon, 15 Jun 2026 07:33:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b421bsm2863645e87.73.2026.06.15.07.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:33:20 -0700 (PDT)
Message-ID: <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
To: Brian Masney <bmasney@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Saravana Kannan <saravanak@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajALNcLMlTThdilX@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cfLuUxyhvmg7Png7QBd0jZMcYJ-tdEsP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MiBTYWx0ZWRfX6QMI/k7EUkxS
 GrrDA/mG+qnFbdERka2kjL5do1/4obl4hSo929JQOz04feh7Sf5OqDIl4qOS7hQ0Cp1hmsI736u
 edVouvS/LllSggQ54V+VojX69wRsu4c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MiBTYWx0ZWRfX7SoFzw3rFVAf
 bOc4OI1dMCUXbZPaofnTP+gpeyfofZZvd1f5I+h6l9RNYKvp6U124ny05Kvnh9qhFB3SSebW1uL
 qAhvZ7EpYD9l8yNlzO4euDNwr9Wl3pfm1mKD/qIqDqFY44etVFhud+809bwjX43U/HhF9NeaeVQ
 62OYquI30ZYC3Vs2VeUjkoNGM/gcD5jynT4rfbR6iaqoi/f/ZLJLyRIOYr+zoZJ6v7zkcx0koBL
 U2Xp8txmeglfz61yeVbuT1DamCVFZR1S+GQBQOnfET+Jvjj+qE5Wvn1C/XrtIuJt0HsEaBONrXY
 0tG0F3U6op+3hPVOu716hOMVUD/k8mky+L6VaKRakThliZe8eBtUjMkIkrkIQPa03VD6chcWpwD
 Xsn0ddOLuJElayWruTtNrHcwW8O4OShgXWxZVTId20lVWgkgRkZHPcAViLYR64R9Gsl83lNBFXC
 7BFjNpHQ2Xtaotltq0A==
X-Proofpoint-GUID: cfLuUxyhvmg7Png7QBd0jZMcYJ-tdEsP
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a300d34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4N5aaHjLVSWDVt9tEy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150152

On 6/15/26 4:24 PM, Brian Masney wrote:
> Hi Dmitry,
> 
> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
>>>
>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
>>>>> Several qcom clk providers currently have a sync_state helper set to
>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
>>>>> sync_state is not defined for the device, then the clk framework sets it
>>>>> to clk_sync_state().
>>>>> [..]
>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
>>>>> +void qcom_cc_sync_state(struct device *dev)
>>>>> +{
>>>>> +	icc_sync_state(dev);
>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
>>>> internals. You might need to set drvdata to desc.
>>>
>>> Hmm…
>>>
>>> Currently icc_sync_state does not seem to use the dev argument at all.
>>>
>>> How would something get messed up, now or whenever icc_sync_state changes?
>>> o.0
>>
>> Yes :-(
> 
> Sorry about the delayed response since I was out of town all last week.
> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> existed prior to my change, and I should label it as such with a Fixes
> tag when I post my next version?

Up until this change, having icc_hws > 0 but lacking icc_sync_state
(or the reverse) would be be considered programmer error

Starting with patch 4, this gets assigned unconditionally, so there's
no prior bug to be fixed

Konrad
