Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA5E1C84A2
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296177; cv=none; b=llhSDAwshOD9SuuxG8oNGbrKJbyYFbgb6VQIvKWz7adJOt1+qa0Ytc/rhK+Yst/509SaNSBN8HX/rh7W3t3LzceC7UusxmdBU99UpJo2ujfWj8AsgP9C22QY9fRAO8XxjPr4BirtjeWHDH2j/sQI1CsmoFL+bXfLUzND2DnuqVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296177; c=relaxed/simple;
	bh=BzEk29JGiWKkaiyVUQyQsqDYy9jEYo/hDm64CTzoK7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkCQjshjKuobOaytOGa4ol4jePRbawFd6Nuk5IYok6NJ0ILkKZ6V9Ny2jyz4Et2EtMALn0gV/P8g6UiSZe3m2eia0bjNmv61nyJ75kaLH61eL8T3jwgGPhFEropSiN+OWmY2MK5we06PGeZtHty1K1DwehEGA0umDFLZotx3pek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhAm8PuI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baVaFoS4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhAm8PuI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baVaFoS4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7Fl8E2439356
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 10:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYUc6DnbYSfkS2y7eIMHId3IdyTyXlVDPIse7G1oYz0=; b=JhAm8PuIimzxY4nu
	GS2uhlEEqb2Yjm5SVwjENCRXTqJ/Hsxk7kwOE2TCIawEs2ZAJaYTY2G9lHJ+PAPS
	v/QgCKobCRLv5Awdw8sR9RW60OIpxId1HT5oP4DQk7MVcxQAyDvoYMOd87q7sEIK
	E9rfyrhIgKlYgWGtVyaXVV2y9iB7FsKh787wUXCp9lkhwaaz4/39GSLND5VyN8eK
	HsdDu6w2ET6R549FobBtKP+s9gf40Tl+AZIjlUv5dZhYLhGkZvz73cYp8s6Qyij4
	nwiYOl8TFNkGmFA4kAP+8fKiWjSoVGouTaQcVJuQ28FRlR5z102xHBWEki25THSV
	Efy52w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq0p7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 10:16:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6bbd0afffso14335625ad.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 03:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782296173; x=1782900973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYUc6DnbYSfkS2y7eIMHId3IdyTyXlVDPIse7G1oYz0=;
        b=baVaFoS47oL41AXMYtnaMSH/mxk32DJvzuQQbHbWL9gBMMGEExQRZogDX1HazteXxJ
         tAq44WLta1FHxhpvQKprcaD2l6hAtLUFqyP8WHYkn2ijC/OFRjjKA6fWxqr5RR0mvsyW
         l0ggRqfydGC41m0bUdOgzmSOcQHe8ww73T+kjDWtQAiFwz13TpdT0p6Kjxs6FFhuNAu1
         ZwfpesPp5dWfX9zQdejCxuk7iAFQq++bkU1LmkjgAD2cBHjXNCLGaJI5hwAJ0m09bzHk
         gBSfneWCZQmIfV9FBGEJgNyXyY7h4JiEyOIpYK+8OCWxg00w8qNkvhC9525i2M9hu4C/
         yZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782296173; x=1782900973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYUc6DnbYSfkS2y7eIMHId3IdyTyXlVDPIse7G1oYz0=;
        b=LXla+Y40Rlu2kUbGP91HehBFbvfOfaL9ErR6WxZUGAGR2LjjLEUFADMuDPvgmhyva7
         uxzl05xiTNbQvL1ZBwVICHVv8jZaD/0UBtSrqHio8yvwzGPYzHEuKWnxFDG6OoIfTp3R
         fC2ymghzEOfl3tb5vwc3zfEttqQyJkY5BaEtR2wDNvvoV9VVRyYZbTpJKjNUlibn+epv
         7fIKLGT1nrbusOwr31bMKCSkNywATaQqjCn2bY9zbI6FEWCMeM/D34rUEWsIVqfQf3Sl
         NE845SOKfolnObMnJa63GhyAv6jyCb99PcvAcuKpFegpHJAQKsKUoi+ho58mPDRnUYCE
         3sqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpDLpFjfFUtSAjQukil3zgjOokd/lkYjp+pFN7mIcLNnhjzEPvTW3epXYXiOYga+9u8X2JIvVQUylE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmQ8v40skqktPBVYJsM2D1IGz5znvUMRuPdBdlp9Rx2NWAUoH9
	mnkRE9EP7DneDePvzaFe8OKvcczlI8eLehKOgfSA5HP1roZHEbPdfoOBDRA8uyvw84MiXLjr5U2
	mZoyt1/LrAPgmnAV0VrmEk7Y3i+WPlwDgCo6WWXH14sX3/o9lO6v/2VdSR06A68o=
X-Gm-Gg: AfdE7ckiqtKTmBd32ZLenuWf0ArIjrSdiTV7avncvIsVHnvVHYMAxRjjcCBYmYKOEKu
	rAMaXdAPHNGo3DfggyTiRfe+oQeFyPiUyqKNeYojNzOO5rZtKTKQ8S99BN0ekssPp5gSUneZ8CX
	3oEalUQ8Y+Laiong++FONSMOtu4TPVBv6QjLQep6J3Z7hXcZD+VJt0W86YPhm73yDcwgbon2Qc2
	WTI2WsrYGLXbN6WiRPblBkEMAVk4g6X6izecmZuEHNE57qUx2Kqi/Y7YT/bXZFbL21PZ0fEPl3k
	Tqfy4sj8tzlVcR/PSNYJ34Nyr+H6DsQnkQm35O0mllM7rtDC4ZsmsYJmTzZVG3hggLPyB2NlCNm
	G1BGxGsolUzYTar2QrMIRUqq9tzAZaBZxTofoi3srImTCvoyfScGYbgrBTlqOTyYLCow/1RONc4
	iz
X-Received: by 2002:a17:903:1b03:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c7c772e013mr70238455ad.37.1782296173434;
        Wed, 24 Jun 2026 03:16:13 -0700 (PDT)
X-Received: by 2002:a17:903:1b03:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c7c772e013mr70237995ad.37.1782296173004;
        Wed, 24 Jun 2026 03:16:13 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7ee339400sm4026735ad.33.2026.06.24.03.16.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 03:16:12 -0700 (PDT)
Message-ID: <50cef9ba-1a64-4079-b416-9b418486cbca@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 18:16:05 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        "Kiran Kumar C.S.K" <quic_kkumarcs@quicinc.com>,
        quic_linchen@quicinc.com
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
 <7095f7ba-bacb-4d03-89cf-ed43882d8213@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <7095f7ba-bacb-4d03-89cf-ed43882d8213@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4NCBTYWx0ZWRfX6H4EvAXKvmwj
 6hXnD7b+i+e2F1L0oJSbmSU+XuIdtOKufJy/WHdm52gfP1YZ8UWN1fWzkel0ZKj75csIZ8B0uxZ
 J1bTqaHHq3GunDf/qKMdHXO9v0Da/Ns=
X-Proofpoint-GUID: NyME157fqOs3ofy6mA_XIiS4ixbZkJhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4NCBTYWx0ZWRfX62oavrhQ26Qs
 wjXPUSkIHbJ0usozvdMS9dIsRKXtmZyessCj9/f1T0/F5QNIH6TMmAZ7fLUDlztvtNioZknN75r
 vKd7EV+1sAjqSEw9Bae7JmcU97UfWX+5w9Ev9zSdXQNqmkkc4erex8o4+wcwk9QXmna6XcbJr0o
 7e0lFXfxwV8IJBUj3foMawqLUZggdIo/molSacL8XYApn0mKhzq9F61afQopgK0DcSKqZwYr/90
 kjWi1ZkG/x/8mOSGb80Di1lqo9RZe9PHcWHNYjeW52SAFHFIrZ48HdObzwPrBLzL/CbfQCoKiyH
 ES0BNeRDjRpA/EG92g8ms/j+A0pXdY7D5BTiMRzAH8+kRpeEIfGQ9M4Z/MStSRYE+Pqbm5UjxZ+
 z0fbnuHuw4VwMbQiWB4NUr8sSxE4uw==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3bae6e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0nUQaeTidBPDXHyOA6wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: NyME157fqOs3ofy6mA_XIiS4ixbZkJhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240084



On 6/23/2026 7:31 PM, Andrew Lunn wrote:
> On Tue, Jun 23, 2026 at 05:42:34PM +0800, Jie Luo wrote:
>>
>>
>> On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>>>> Driver is not supported - in terms of how netdev understands supported
>>>> commitment - if maintainer does not care to receive the patches for its
>>>> code, so demote it to "maintained" to reflect true status.
>>>
>>> Maybe "Orphan" would be better, if the listed Maintainer is not doing
>>> any Maintainer work?
>>>
>>> 	   Andrew	   
>>
>> Hello Andrew, Krzysztof,
>> I will continue to maintain the listed drivers, so their status can
>> remain Supported.
> 
> Please understand that being a Maintainer requires that you respond to
> patches and questions about this driver, give Reviewed-by:, ask for
> patches to be changed etc. If you don't respond, ideally with 2 to 3
> days, the driver will be set to Orphaned.
> 
> If you want to maintain the Supported status, we can help you set up
> the needed CI system, and get it registered so it reports the results.
> 
>     Andrew

Thank you Andrew, Krzysztof, for the clarification on what "Supported"
status entails and for the offer to help with CI setup. I would very
much appreciate the community's help in getting the CI system set up
and registered for this driver. In the mean time we will also look at
resources internally within Qualcomm, to understand how to support
testing using kernelCI/netdevCI for IPQ SoC. This will help us test
the driver continuously as well.

I fully understand and accept the maintainer responsibilities for this
driver, and commit to the below:
- Responding to patches and questions in a timely manner.
- Providing review comments and requesting changes where appropriate,
  and providing Reviewed-by tags when needed.

I would also like to take a moment to provide an update on our current
efforts for IPQ SoC, if it can be of help. We have already re-started
our efforts for the drivers and are currently actively working to extend
the IPQ drivers to support more functionality and for newer SoC support
for same family. We plan to post these updates to the current drivers
once the review window reopens.

We feel maintaining the "Supported" status is appropriate and reflects
our genuine long-term commitment to IPQ SoC networking drivers in Linux
kernel. We request you to retain the current status for this driver if
acceptable.

Regarding the email ID change, we had attempted to rectify the
MAINTAINERS file a few months ago based on recommendation given
internally (please see below thread), however agree that such an update
in documentation is also required.

https://lore.kernel.org/all/20250903-maintainer_update-v1-1-2183fd2a3c44@oss.qualcomm.com/

