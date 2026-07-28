Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B6C29DB6E
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205227; cv=none; b=icG/UsMnZcJy+pQ2zr/NBFwFB/d3EHwBn/AvCOJcNMqcXM+fuqJ25xr5Zife9+u2ExFtNT6yOyCZgfnje8tZJ0cR9GN/00fSUco2kNaN+045EE0euxGxMqtIfwO2YDyuAV3xhqKm5vWU6OZyrdWa318LFyKPs7LQws3a8QfGmu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205227; c=relaxed/simple;
	bh=dyay5f0mLFWdR33p9X89+nx9+9xAzz6YoEh9yFD9SV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkT/BdTA6RzE7m+LSlNgAZI287tbzE77o/UNQjQybkrcxWsmaPwYmLJSesnq8m0G5YB3oBLStjhnFlcSxpEUw0LhZfcAaNV80FZX3wR9lEIC72hYwF153XSFgCsfcZ4DPOWrJgbtXj0uRT+fHf/Rr6UzP8PcaBYR97IcP5tWyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VSinCYV3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmMtgsE4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VSinCYV3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmMtgsE4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0kZ9i1500114
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=; b=VSinCYV3WGdviCXC
	4T6ZAl5h3UHaJ1/rFoB9KRL9x67o9R+07SmjlGAEVU5/DAv7RnIYlFIEG2qMwsBz
	mt9erWBDiExTAb/wf5Kv6uxF8Oaztu/BYr/MG3bQLfeAPj+DdoDXJy97l8ZVIven
	EJIU9ErSQeBLuT8QItASdZvsrAddMnp8P1L3XDh+80lPhJBSd4MAucpyM/8KGVyT
	ALa6Pkw30AS1r+Bh3x+hS7Zh6mtJ7ZBikLl0LwDkHbRfFArfgDyVK6G7TUTmwPOj
	+JbUHY+dQAOOHYt9vLS1F7fy5js4ME2MxW07suwxRwTdlt3FzSpBujhES37xQu2A
	5xoFJQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c6459n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 02:20:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso64963405ad.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 19:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785205225; x=1785810025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=;
        b=hmMtgsE4oyNQhwzNCZFyyjHkuImEgU9mlwA5IIQzoOV2TJZqvBvvM//Wc38TxmJSan
         Z3bsWaS3lvWQJY2KeoCR3yuLUjNvSQloP8F3xWGy05qUskHVY+vQzOPrZ+QmkWbNW+nF
         kQfUZUcmE5X2f04w2nOupaSA5R18QPwxRNn803veZSc7B0GeWJ/1c5q3idWRN+AsyOBm
         bn0cdarePw8qGkQ78WCUg/CAb1pIH6wdRAREax0b9gyQM6u5HVUjwu5tQQ3YAXbwPIZe
         Iu6C0clBo2nSN0gTXYPJDL9VgfhzG3Eg5rgvDrJ/ogyslLXeDdu6KbQJpDPXxAeLmT35
         NBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785205225; x=1785810025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U43hd6FkoglHWDW2UVbCAd/98ngvcxNgex10pHUqN14=;
        b=spvawi26rR4RbrE5b5sWPY6wW6xAi3LdVpt50pecr1Rj943me+aCnsECAJfC6E8qiO
         Qv1LQh3bqpXeYI+/82325KWikjn8O6dQuhAbefntOdb7gFxWyFNNtIsGNXazpVbNwwFo
         7lnY63ufPlQnU/k7eurkunT6VpjL9Fw7guNzh+VVg92/hl05qW++S1j0CzU/+l94MhnL
         pDiLModgN2awM8qs/BXbDLV+9JB2gsBpRQUYBd9epVjifK7Es1zyp8Ofw0fNAwnfLgfR
         +u2OfOjd6RmVu2t2FiAoMDd2CPuRLQHaQEpKLeC+RMuTZK7DbYvTkfHNkGxGVOCpCfCi
         DkjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCKkdPHzdmsKm0v3cthpC1c5pidVD18na80/5L3QUPvokH8t9+L+cDJ97x8Cm/TO4NbpQ5YKWP2fY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaDPJZ6EqfisqLuEL3ooSFGoyqTwC8h3VTc3KZJRyePgeu840p
	DgPtPdeAO65adxrVN9nKe6pbhAfhiiFu7WGH793bZgZPH4tYSVHlzKKOEqom/7X3LkkrRdJVpE3
	71DjFlkTj1NBKen7adHR97D7LXOdD4ekjWeAd9mVdRSWTfyzhNCtd0+pw957fgL8=
X-Gm-Gg: AR+sD13G9CnY3SIcyly2UvqvXaNdsPDlfMXqeWL2mbzgPpGMYVeomk7O6V3FnNHPL3i
	xy+HczJNgGXsbsAEGwrLt4KgO1wUikhmFC5hqhDyLDSGTocHpF3QeFq/98Mp5WHe+Ol0Ysqp14Q
	fRDRD9JWK7IKwZlODFklEzJtWho5MkRseN1snfK3glmUrJyREyZCjfhyymJwxnQEmR8Lfs95obB
	SBsCpG1VBs0hvUFwzDOu1MMvPhmAJk2Cb0pRLEBI+qKJyS0oZ/cdMeh6haIGXsAc1xaLnJ7u83/
	K3O06pVJRoKZ/X4AsGw2HQ9iIrbX10mpjlDiOh62MxnNV2N58WMHXHuauYaUeXrFBKssNTnWF/n
	lHi3SuJ4A1UsAPzUthDMrg2rNHUoJDvBeBvPYYfRGOiecvP5IeAuF+LDpq7NJrRQ+Aw==
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr4178725ad.34.1785205224856;
        Mon, 27 Jul 2026 19:20:24 -0700 (PDT)
X-Received: by 2002:a17:903:38c7:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2d015f39404mr4178315ad.34.1785205224408;
        Mon, 27 Jul 2026 19:20:24 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdcdsm43957695ad.49.2026.07.27.19.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 19:20:23 -0700 (PDT)
Message-ID: <603ce64b-374a-4d69-83d2-6387b55a5991@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:20:17 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] clk: composite: Export
 devm_clk_hw_register_composite_pdata
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-8-a8b8679d215f@oss.qualcomm.com>
 <amOMPmn1fBE1gGoe@redhat.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <amOMPmn1fBE1gGoe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a6811e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=Y8BVQNzp0A0Au5e0V84A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAxOCBTYWx0ZWRfX/czy6LjekN4X
 TYD2h1kWZsXjEwlXtAXLeANTr7gzqIMeamBFzRqoV9pLczj0UrlDoZRi2Hju8qOcwc4dIhMe4Nf
 XRYQw5YWw3t8cD+VsudTNwHroJb6WSg=
X-Proofpoint-ORIG-GUID: 25gjFcvXsewNAzD6h73K6ZanRWdhGm-a
X-Proofpoint-GUID: 25gjFcvXsewNAzD6h73K6ZanRWdhGm-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAxOCBTYWx0ZWRfXyGutZtrM3ZxY
 VVWXSl5fV/vtKHePb/oLjQ2+HrZxPPK/MGtyGAcdt9nurhh+twohpH84HLEEjCxrIAX2Ccs0qGI
 UB7wMCm2gpiQLCitwVS38FM5xdeafLxHViYkFBuGPp9S1st5/S+c5REwwGQwCMlnnzv3pky1ALg
 UnPen/6ARdECbKa4/f5UIu2XK3R3Ioc4VMbDmfF6zh5HYY6EYUGmT61abuGTAluvoeCJnzcror7
 vzvyAJAXhzFA2DGVUMQY1Bgb+7gvNyC1b/0Gdm0xNbNZhUIkScJ4FzBOUJlMqCjlsscgDbp7KkR
 edd5vELy2vzS+YEXSwnnnTjAW2va94zeWQjZ+P037OxkKOSb/XQGcUK3ysGh4qHFfEPyYke9S+V
 +a68MeAmjLMzmNVJEHKpJt3AbEXnh8DwJp4Ts6ul8tYuxjrxcGoRHVoYvqAzIujYV30TMUhgVCf
 seFsywyTS8wQxRH/giQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280018



On 7/25/2026 12:01 AM, Brian Masney wrote:
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> FYI there's a separate series for the UltraRISC DP1000 SoC to export
> this same symbol. It depends on which series Stephen merges first gets
> in.

Thanks for the review, Brian!

Noted on the UltraRISC DP1000 series. I'll keep an eye on it. If that
series gets merged first, I'll rebase and update this patch.
