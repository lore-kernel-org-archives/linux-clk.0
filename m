Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A0247887B
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629004; cv=none; b=tg9VBRZnMuTK6rfTBxKicOV7l/+ZKT3kA7hNoEzAKr57dN+j+sHV1VbGTdbSqHcEDHTdUs3EPaQkhJiqsuHRrMtLU0uIsrl/gil9U675N1yxCnFbkNQTJZKcQ5Sc/liIkFB/JV/WWGZ49CeUm5hgUkF351ffq3MMmRmGnYI221M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629004; c=relaxed/simple;
	bh=e0GQP0MwAsCo4/8U9fgx3GQF+dr//7e99KM+lG8LYU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txzi8IxaFpRSf2iiRDxdHkn8isO90dFec5bSnTLsqubTjwlapJW5USOTjWERc9YPLxN8UkaQctUfeIt81GSr8p1F+QxFMJ+eE93BvUEKXu0QlyB9bf/2v8OunrbvUsfQUItYEaNdNNJoUoT3rx8Zw6GsW6oanIBdCQ7vKQBBETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gK8aR75T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDSZXYSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gK8aR75T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDSZXYSx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCK5qf2760065
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=; b=gK8aR75TGBV1NARB
	X9u8BUMlQPPa464ekNYPTRsOi5lFq2v3SlCdm7sOhKxqQY9wEcy2SVXTEgq/b0/r
	lxS5/6pXlKIdWsJ/ESVmicLg3RRjr2pLuCjNI5fwx4eQfpFKwJqCiZ+vJ4yMA4UY
	Fvab9T6Lw6hvpNzx2j9jZC4huZQBIGJBfXPsir1rpx0JGJxR028yZL322iUIIkUn
	E4t+Pwz0DrrfdMHBQWbdEe1LL8UpiQpV0SB+3dNLjQZwkZIH/sgX+PggXehlddAT
	sUIQJRzCCOyDlLZFXr/nonIdRiTjlarYE7XsaQijBLHGrfFfi6SiFEYxN6y+ywcm
	aVhzSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8vbku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 13:50:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce64c41efso12853261cf.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Aug 2026 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786629001; x=1787233801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=;
        b=BDSZXYSxV0evD/5PI+2LZSUCBk/IN4+04niqW14zCRncULXy3bsToeS2E1zS1PGlt+
         fsBAbEzfl+K6/xQkomaoL90vIn0UVUweolLozVUev1EiP9LSu2v75qB2wx7o8PuAUi7s
         bq9dypO5dBJsk2giYPOnKSXbkYrqIK6L4/3RFxPIbBeyhFwY/ePRlpf1VgIyCPn83OnR
         iPOKhnj7YecmPjJoD2+6xQEZO3w0aMCOE4dQbBVcm7BkUBH8qmd9TDy6RdRxPGVn7asw
         joXKCYvLUi1qtFmC8j+eaBHUqwHFMVn6ERr8O6yXjU2XwH9RCrtu7ujXScXsmhcwUPR5
         NzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629001; x=1787233801;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=;
        b=h/l2a9D2fb0CRlxsR4uvLV5WCOw0hiVVE66j8XVrEvdHPzD63z9L73m7DJYfyBgiKo
         ILTDUac/8mSiEiSTF/b9w9CWGGhJEPkSvksW/tj0Jz0XABu9hAQaC8JQPZzEAHIa/Abh
         EgL67+IbfsykILVv8nWJ7WTeiYVmL73v3mmkVIM0AbwHMEpkmoKm5YpHN7BNOOkkrvX9
         xE2PqlDoKyfqoOr5KpiOTAEPSu5INZ04tRYUPqK5T4LjIgqcf4BMJAmPSg14Lq5HZR3t
         DNtPJzp3tdo6zmR1YQbHq3vkUHwhvjn8uIEy8QH0ZGcurrnPG+wfTiCwo8+rfYHPkrWm
         PNvw==
X-Forwarded-Encrypted: i=1; AHgh+RoGJXHwbiTgr09zwFYAhDR6lnp4c/QO3AcAuyDtp53wG5c2Pz8P+M7J/Lr50RocJWz7NZUIL/r+Kds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymw/TNLXX1tlkbQKxXMZGUyuh8V6xDg+BCzNS5GyYnTOgIXtN4
	PT3ymfRfQyRMb07oGQ5mXFlj/oCXR0yjErYjEmJ/iTkDMGGaNuwRI9jS55rV+SgH9BI1EgD7phV
	+yNVTDvE+4XpN6knx5EP5HcYN75S4iZWzjTo7N221r4KJQoFVPXaXtcoxTtg+dSs=
X-Gm-Gg: AR+sD13PKwFYRdbGHWVhvcxJhYF+nGkQln09bT2EnHQ7CmQhInl/12rOvWGporpoL4e
	wXQTas0cQ8LrfcJwITrGreLZE/dEVPRkA2TZ0vPiQrGoWShREmH2s2J8Vf3/mSVg+9gWHP3PyMn
	eI7I61F3KAe9TwzGTiW84dbt7aU/YDqgdnSSf2ZiFb8tOIl5e7mEsDph4/EU+mUaMpcv0kEGHWo
	7ZiHYc9V3jD35O8p8JkJpoVmTYhja2cH7Tpm+wxuxJAcZFAxEVx9E5rLkbZM032WB1xGOc7Hdzc
	Kc64CyCzMCvs+cmUZTfYYJFrw3AvZxsj8SCVCyx1OOIuaZM55XYXUZPt2dvIDtMvEOyfJlx1r2w
	VlvYS0hNZEHIOkEEJ3DwL5TR3S4o2
X-Received: by 2002:a05:622a:228f:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52d73db0571mr67684421cf.20.1786629000765;
        Thu, 13 Aug 2026 06:50:00 -0700 (PDT)
X-Received: by 2002:a05:622a:228f:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52d73db0571mr67683491cf.20.1786629000255;
        Thu, 13 Aug 2026 06:50:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5612b8sm5585491f8f.1.2026.08.13.06.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 06:49:59 -0700 (PDT)
Message-ID: <d4bc85da-c02b-4655-817f-34af6d8762e8@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:49:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?UTF-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
 <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
 <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
 <2c6ddfeba0074866b4bd2d4276ec4508@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2c6ddfeba0074866b4bd2d4276ec4508@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7dcb8a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=jDsTJrNZ6oklJcrCIzIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5OCBTYWx0ZWRfX3gOweZmMLGYV
 JzSeO7Apyr1aDl0n/BNCf21T7rxB/WgzZlKvFSsmOqtaM1RGxN1QZFLMfNvXo4SRKV5kPQX9/fE
 K8Ah7QUFQI+AX08/cqJX/cBpE7bhyFlBmHFCO2fJ95HVHoIIHpFq4WfZnIRZKln6SXhPizbKU9P
 Oe6jEwXWuA/1Q6J56eeyAoJy54U0Wa0ePHh6LeU9DLZ0TvZLi4bNXaY0mVoghGWXBYiClPcNvSR
 K/A8slO8kCy4i0KEhW42ngD3LnifAWjMvEOGQtKlk4bUO80t9JFnkHbeETpFmR1y6p7ejL6dth9
 S4u7JubGVFCuEy7fTpgOrtsBKSaMaGKWjg3QUuocWHTOsKDWgIVJn2sJtyDtMHqVB9OuTGN4LI7
 o0apArCJ5gy3CqnQGFwehUd1p6+mD2zrXXz+SdiwEZwdTOOst2pM8gAAuEUwqvF9IDtBkNl2KHn
 dHgnb5cvvmTt/s3tGMQ==
X-Proofpoint-ORIG-GUID: k202T09tGqljOOkN9UYO1oqQ0LYoDFN5
X-Proofpoint-GUID: k202T09tGqljOOkN9UYO1oqQ0LYoDFN5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5OCBTYWx0ZWRfX9oDqaD2gFaEP
 n3/RtSV3vxLJY5QAdEausIWqXULCXT9cofa+wr7iW3LPI3HhGxajbAbX8WUa/NRS4eOKVD5P0kS
 mSWK0/Ox06/oUtUEyrlQvVb7uRIEKI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130098

On 13/08/2026 14:27, Yu-Chun Lin [林祐君] wrote:
>> And in any case you should use b4 since it would do the correct thing.
>> All patch submissions are supposed to use b4, so you don't make trivial
>> process mistakes.
>>
> 
> Thank you for the explanation. I'll learn how to use b4.
> 
> Just to be sure I get it right: should I keep your tag and move it between
> my Co-developed-by and Signed-off-by, or should I drop it?
> 
> Also, to make sure I follow the correct process and understand the clock
> maintainer's preference: Should I send a v14 to fix the tag, or is it
> possible for the clock maintainer to help amend this if there are no other
> changes?

You can keep the tag, but move it before your SoB.

Best regards,
Krzysztof
