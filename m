Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9FC331A7E
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777397140; cv=none; b=tFmWVEQ1cog/LcMP5WokuJdzLqPWf+dJcFKR/0neTX8zH6MA9dYMO4oxglSaRKKu3exZT6cwriFK8PKXjIItDabccepOAziNqa6ikZWNXg9d3asV7YUagOhdHaKI4FGSPBjAMQNO+kWVHi3urh78ivlvwBaXkcKsO43kB/6/F/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777397140; c=relaxed/simple;
	bh=fGEvSKKrJp5vnG05fgLesw2rCs8hn7Cq83GP49OrIb4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QOxv7sOQLxOb6zCZ7ViOK+gzgvdG926VxBsiJGYxQ1k0X+NMOR6SRKZ8tCe35cHV60KeNZcu7e93HE045LUuyAm9LFewC7ptXgX4HPjWATTuVqBG4Aenucz4XftXKqXq1Eu7VNph4AJza99xeE5/eyCtcJYyF/OEapYZ2mcdDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fdjC78W5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jrUzf2G4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fdjC78W5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jrUzf2G4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsXiA863011
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 17:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmRlkAry5rxLITNug1gUNrl6wTOkbnqP0LFzwMZv0uY=; b=fdjC78W5GCImrW1h
	D8P5M4uUVcH5n9Cstz7WPpPaknVgkWui2/y63Un/KWzPQI4Zk7VVVymSVeZ6ZFEn
	F7GSZm5atGso46WxaPoKKNrQ77lyEbm12Y/15w+i71RHUzjNRYv+UR/f9qIefXxt
	ebYO/tHS/hidCSHH44/mBnUsId0aoXzWNQdBPZGotjXoXcc42aeYETkZU92KEc9t
	7SIzvkRXkJWwxPBHb10dz2ttJ86aD8dfJPjAUzMRIj7VN9DNyfl/b9ddYscOiebU
	ID/BbBWNFcS+eio+gml9M8946N44h+ybr+Nvxruv/4wa/Emb2y9UiavjzJ+Zq3Z3
	JYooGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtry0ja00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 17:25:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b241be0126so226755625ad.3
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397137; x=1778001937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZmRlkAry5rxLITNug1gUNrl6wTOkbnqP0LFzwMZv0uY=;
        b=jrUzf2G49rD0nK4nmtX+bES4rzw7AJhSxkoLpvEtRtkVHyD6+8EdLwTn1c682lF6Hv
         c0WFmeJGkYF2zzt7RgQgSv2B02gqkC4CCjJcktbmxwlJcIzcK+bluDxOgSmxrzhZD74E
         nN0L3YqgdXVwoqecu1z3CJ0aK+pdr2dG/Rk9xlO+fdCBe/S2GsxV6RvfnZw2J/QaKABp
         v2j9BC+5Ji9GoWonpemt1/Jstz2Ggjnoyh++o9UTWKPxQGrYICwWtJMPal5ydvOkwhYC
         P8TciEB/lHh0/vgsdH/4rfPc1cR1ohW8vZiWlgLmNYoQwuPk1oiBVLFFP6D+r79hhaJQ
         Yrww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397137; x=1778001937;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmRlkAry5rxLITNug1gUNrl6wTOkbnqP0LFzwMZv0uY=;
        b=gjJQYkaWg6sK4+XBfsV6Ym71CtnQY4XargeGCIJPRt2hJ+pbZoFq8Nj46U6j4SC9VR
         f5lIiyE5M4RHrwMLGaiYt0uRaqK+UStK3AWe0r3FHA5GGqDact5V8QyOBTledR97+eVO
         u+gDyHFu6kbWvc8CdnHEVdaYZRm+FxF8K2aOi2aTucI6KnCl0INAWQ9ydYSTVBPtSnkt
         I7HfgwlsMTi6zOrqMGLcZJIaqUySEH4fikjiZhxIQN3hG/ShsYkQB9+lYy53PeWjJwsD
         gAZxUT6cPSwotGUzABNT/bRB9QcxvZ37ThdmcBbAgn1/aR6EHE02hoIfTbvAZJ3qG0Wu
         AYmg==
X-Forwarded-Encrypted: i=1; AFNElJ+hu4C93frOid5Pp6QKIueu8URkxGi/bcCeJ3HpUqGi3yp3DcXR2IAotIz5n/WotC4mYtAp/98jugc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+lW27kSyZDlcEKNHeLCn99faWBEM/fV1yiQUwXoRK9k/c7ux
	oY59XQ2xJm2DV95LVWoaAhRy21c9oBE/Amgf0iAghUL4rNk5Mh+LxD05D0KYslvdKGP0r5/1spU
	g02iTlR009YWWLo5kjufwQM1HaD3gDvZD4KAu+sd94okGmzKHZn53rq1/Z+rqztE=
X-Gm-Gg: AeBDiev+U8J7v69OrYUCuYzWwbmhZDtN3tLWoazJ8mzRPX2K9YytgspWu0QvUo29TeC
	jE5QnbTHbvzCZsvBjotd5uOvdQVyNZ9zUUrC3ityAo2motmrKXbFM5JQdWDsBcNGElc3uw0vZVK
	1ASTsY2xy+yRaPyj5ANcFlCYy/vHnPWW1Bli0ViWtq4BFp/1ZYGVdSCGhZTagy5qXpyqpOGecEK
	dfS9im2f5c9lrpSHdml58+vOSUqSDxzZK9HIf8X9FeQx8qpP2RvS9M/0hljrELmwyojW85LKjO1
	xQ4s37ubxCHl+QUxdThZpexzZktIwqj+ZClOuw0zZlbnMrDUBRVOlN1CShW6SKvVB2NRGQGPaCd
	pgtOJqmhmr8fTrsuxaeYlAaXzrimI+II93BXwzhA3bQsmv4sn9v4rN98WpBk/SUdR
X-Received: by 2002:a17:903:3503:b0:2b5:f105:52b2 with SMTP id d9443c01a7336-2b98739675cmr3922785ad.9.1777397136762;
        Tue, 28 Apr 2026 10:25:36 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2b5:f105:52b2 with SMTP id d9443c01a7336-2b98739675cmr3922325ad.9.1777397136215;
        Tue, 28 Apr 2026 10:25:36 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.243.58])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8b4esm32088765ad.73.2026.04.28.10.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 10:25:35 -0700 (PDT)
Message-ID: <94a49f16-2e1f-4d32-9d4c-483d56fd2731@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 22:55:27 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH 02/13] dt-bindings: clock: qcom,sm8550-dispcc: Add display
 CESTA support on SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-2-eb27d845df9c@oss.qualcomm.com>
 <20260422-savvy-wolverine-of-chivalry-9ae6fc@quoll>
 <3ea2c4a2-4a1b-4062-b332-9d5d0a53379b@kernel.org>
Content-Language: en-US
In-Reply-To: <3ea2c4a2-4a1b-4062-b332-9d5d0a53379b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KuJ9H2WN c=1 sm=1 tr=0 ts=69f0ed91 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=EwI1ikYXukqkrg4G3Narhw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HjAgAaymx-b2fZWta2cA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yJlr_FcBtTG5FdqdR-53ejp3wafoEoFB
X-Proofpoint-ORIG-GUID: yJlr_FcBtTG5FdqdR-53ejp3wafoEoFB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OCBTYWx0ZWRfX06MrOjgLNHuU
 QbvcmPbuP90ErqzpBQ0mZ8zdo/Fv1hL1sWroMiLicqNsnizagJXfkNWvCnM22xBNKNVBOigcBkm
 NH2Rn41hAjU4k59bhP45ObTTslnx3Qu8UJM4Sj9WD/w/61CkhFFzIY9F789z2cIDBMzciF11tVm
 HMB/OMMSQpWZ6swiY6xuOKEED0BDaEu7uufqpIiKlzs/Xc1X1WIZ2dLlh3cB3DJzHMCgwT4B7jp
 69wfzLj6Em26s0hm3hA7P4/7Wct3iDcDBu6dtbRwuYV9uViDSn8KOoWKeIEN+prCez2VSsO7Wij
 8EGp8WgLp01AEt5QoEY5jtA0TgWISuV+IEkgUUWbi4C7hJ0ZaK7uowK48JKea/a3btef4BHZx/a
 Q8SDpaR80v3W+ikuVXnlJ9Hqao+GBJQSD4zbNJrxn402zhhEM6QfU7pd7l7pd6uBW7d0IrT4YV7
 cwWFszSwE+MOfgtDa/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280168



On 4/24/2026 2:39 PM, Krzysztof Kozlowski wrote:
> On 22/04/2026 09:41, Krzysztof Kozlowski wrote:
>> On Mon, Apr 20, 2026 at 09:58:55PM +0530, Jagadeesh Kona wrote:
>>> On SM8750, a subset of DISPCC clocks is controlled by the display CESTA
>>> (Client State Aggregator) hardware. These clocks can be scaled to the
>>> desired frequency by sending votes to the display CRM(CESTA Resource
>>> manager) instead of programming DISPCC registers directly.
>>
>> This looks like completely new, vendor clock API, so no.
>>
>> Resource voting or clock scaling is nothing new and you do not get a
>> vendor phandle to do it. That's like basic upstreaming 101: we do not
>> want another vendor re-implementation of common or typical solutions.
> 
> I'll provide a bit more context, what I am looking for:
> Are CESTA and CRMC truly separate blocks? Do they have their own
> resources or maybe something is shared with clock controller, e.g. parts
> of address space?
> 

Thanks Krzysztof for your review

CRMC is sub-block within the CESTA block. CRMC block contains the clocks frequency lookup tables
information for CESTA controlled RCGs, which clock driver needs to read and populate the RCG's
frequency tables. DISPCC block is outside of CESTA block, so CRMC block is mapped as syscon device
and is used in DISPCC node only to read & populate the CESTA controlled RCGs frequency lookup tables.
The actual clock scaling is done later by converting the frequency into a perf level & sending it
to CESTA HW via CRM APIs.

> If they manage clocks, they should receive some of the clocks as inputs,
> because I don't imagine a block which gates clock somewhere else, to
> which it has no access (IOW, that gate to manage clock is part of the
> clock). Or maybe it's some shadow registers? Or display clock controller
> does not have direct clock access in the first place?
> 

Yes, there are few dispcc clocks required for accessing the display CRM/CRMC register
blocks but those clocks are already kept ON from bootloader and they will stay ON as
long as MMCX rail is voted. So if MMCX is ON, we can access CRM/CRMC blocks.

Thanks,
Jagadeesh
