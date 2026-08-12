Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB9741A51D
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786528154; cv=none; b=XXe2zthcZf83Mylj1nw2xYwqSC8GRXjqdvOYXYRavnQRE56UrZAlKyKCdBeC+oCQMaFbWyjQEc9rcc5Ymie4g8pHFoftJeTVLLR/xHvmJz0UXBEUNpndMQ56trn9msG0NNEb3c2SolZDmB4AHj1SbzWWe2rgXnL5ID3dselPxck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786528154; c=relaxed/simple;
	bh=P6ujx7qOjSu41EG6TJTf/zZQEyn0i35Pb1cqX51ocwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXy8lMPWX+Dq1HQ8Lfb+K8UdA6lasAQpZkbMqWugT9hOMgxW1F1r8eYr/mJj4llisPmhWDHrhqxRn7bmZBk0uaSawv/vBF2pYSm+gywAvDM2j+6GmEYs+09Gwl9PQGJq2YtqTDVQu48aRR92xZ0IphQmUXSKvZj1CLBsR5XH4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5kcRMBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Je61rVct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5kcRMBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Je61rVct"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9g2Zq3452365
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 09:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=; b=B5kcRMBRxZ4oleDp
	4qtfimQechtTailYt75vgJtuARqnyhjMLbWsDJUEgnmxlACNM1tV9BT/W5jdzkIK
	qTo8UG4vTzsffQkTppnTFCvWwV7v3wa7tPeZQEMVL/kWVb8kr9XTUPgDiEvbxh0b
	ZM2v3H5GGKN42KrIq7fZHOfF5AwvgovELcPDtim3s+a9NtodtjkyDQnkJLiO19NZ
	hNiELf66VxnaVHvr8Wc3j1E7OAXGcCqvobbQx/73yczsnEC6meLHH1/n92GQ+YgQ
	08YWxuaIvTzZ7THFyFtk8LLy2QXiTIUOMtaOILIPrNRY6s6NZhPiPDnDh2x9hF6b
	13Wt7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrh0v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 09:49:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso14007211cf.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528151; x=1787132951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=;
        b=Je61rVctj4CUmOZrWWLVfcI1oHznfjr2j+aXI0b/wBQiK99wkdxi7hqGFeMLWKdx6Y
         EXqS/DKsZrGdeIkVQGMPEt8tDiguWQyKDywTyBZsMtydi8GVyeVdQESxYKle+YkqDFLn
         W1rjY4aQRLZfKWITlZc4NZ2pSkuuPUNRptIGg6/BqWdXCkTRtjXbuRVh0dfOCnR5Bzru
         I5MMoCTOfSElahLRWrwPaM179TfPPZUlh6TPEzttCZ4HekTCbd0p+5W5lFVRQyyGKyQE
         /vuAHteOS4IyMYEWlyQR29gDgLwDMq5SrT1uE+h4j4Fpa2wt9WDRTBlQl6v00vBh0qSl
         7POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528151; x=1787132951;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=;
        b=s6jIeH60rOCVW6H9pqcGA9kYr1hZUjHdZdywYMNpLqAWZkZaz2dlOWaqcgOXwFMefP
         LoJmIiUK/ktev/fMZy5EuEQH3jXlPAX4N6+NlxEh9NKbE/OlJTTGRso+eSL2Ks6qaNSP
         8U+fxsWL5S5hsZWBhRB9BycxK6cXjYrCLTbHsw/I1QrTA59K7eKP0PbSvtzF/NzVp13q
         c7adO/eg9fKA2/0k0CQp37cxmIMg0CgqrzgCxnQLK50Pv11AwmlFmpu32n3nRPtcmpM2
         Z5E8nCKCDFkZUOG3Dbbwx66wnMMwx8UzJiSPeejde80w2WilqKUglKtKFJxRmnkft1fS
         1YMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRMJremW/SDuWhLRRf9TlCgF/kAl4gMU5B/go7wIIGdMzzks0mDOqsycKnA63riv4GGCLKlHwRXFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIdCSDiDa38y4k3ZZ5nuPSGSI2P30gH4QxjO7UQ0Rwsn2nkUl
	xW3Ss8O3bqlTgxJHpGLryRsSKjecNLbylR/I73sAXlBA+er+eZhFRar68oQxdrCh8fV8KM2BgTA
	PxNgjZGRlThrByIpTadWiimTXebpKu7JM+wVBkMuGvg5Xx/DnvZaNmj9rERZJAZ8=
X-Gm-Gg: AR+sD11ypxHb9oUqgnrIPZg152PIoL855NZptGRJwFfzC+AuujoQS2kC8t1oiucjsjX
	Iak2nuobutjNcrNaK6+gNefZoNypHPYfL/NlH9zmzzCskCj6ySopFOH/l5YMyN8fSQJhqcc9JAb
	xnnGQ8VvMZJYr0QhlBONViiqkY5mEU2rtM5z93317IlbI2mnWfRwkhK2BCnnt5WmomPoc9hIckE
	VudeOraK68EepMeu0kOP8SlcOPg3kX+kr1HATSGkQw9dTNoZBqDqXlqBl1kx5xVOLfsFUCsJOPT
	5TdA0sePRWlrlk/ENWy5ZTj66+KKLk0/UW/btOP8Q+9GfPLtLLMVGY1fxhKdXutGEhc0NHeziKG
	AwGcRqQsFb3vEe0gvWAVasl7pRw+kWA==
X-Received: by 2002:a05:622a:1a8c:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52d646b45bbmr24961981cf.4.1786528151293;
        Wed, 12 Aug 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52d646b45bbmr24961791cf.4.1786528150895;
        Wed, 12 Aug 2026 02:49:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d709dfsm5950355f8f.35.2026.08.12.02.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:49:09 -0700 (PDT)
Message-ID: <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:49:04 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfX6rdI2nCHMrnX
 NbRZmsDP7B7GT8twBZ2wdsXt8sE0Cx1IwBXg+9F3KuRw5jNKHp9jzwq4FwBXl0awOVel5x04LHl
 VdAAPp59WwEp+JOGcc0OGKvBe00In3yNrxyXriGLW9Olkh/uybemYO0o6Bp5IoslSAtEAnIUJUk
 8kkB2y53uofvrfKQfjQg1dxQ0Lpg5yRoNn9IYOIIEjMsPslE9kLjS3Q7MzUVEWPUhdO5ECAVRRh
 54ePE7Hxja4A0qX6E2CjqJdGu5sRTfhm2iU2BAok5B136AqsPg+H1XabiSvNZwCJOWlLwpXuf/z
 EzKLT13aDgdq7r+15y6yRzZGpQse81oAzhNpnGDpVk7nE9p1MCGMvaVjSmMcIsFl5Nb7Y2sDejh
 zB+h2p5WPyyBGgSAD9Chyt0/IlOwtwUXtNjTJwQhiLqdWMB6i70RNtwn7GG5F3d89sGVH+t1wbe
 nJStzbsF6sRLcJuP+hw==
X-Proofpoint-ORIG-GUID: HkgXgvY14XU0iD8uVdoT3eKNfn__z6cE
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c4197 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=WMIDViIH5NI-YaAP1ZcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: HkgXgvY14XU0iD8uVdoT3eKNfn__z6cE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfX3H4epMkebRTS
 9KQY0ZCt8plyjwvNNofMCe1S3KH38F2oJv3XJG0tKSNAGHJsQHOC5j6lsmHWfMLFZQizvwC/+DV
 AtxSOlPK4CBuBMIsX2nmItf4k2rHKyo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120077

On 12/08/2026 11:41, Yu-Chun Lin [林祐君] wrote:
> Hi Krzysztof,
> 
>> On 12/08/2026 03:59, Yu-Chun Lin wrote:
>>> Add DT binding schema for Realtek RTD1625 clock and reset controller
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> How my tag could appear here?
>>
>> Look:
>> https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@realtek.c
>> om/
>>
>>> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
>>> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>
>> Who added my tag? What is the actual flow of this patch?
>>
> 
> You gave your Reviewed-by tag in v5. However, after that, Stephon provided
> additional feedback. In v6, I modified the patch based on Stephon's
> comments and made some other changes. Furthermore, I added the clock ID
> 144 in v11.

So how my tag could appear before Cheng-Yu Lee signed off the patch?

Best regards,
Krzysztof
