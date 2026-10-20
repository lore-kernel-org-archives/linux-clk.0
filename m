Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=2p01BcjepXxfMGaGzO5vYe6PwEe5sDbR3Rke5YD435x1Gz2kdMAhejHE69OPgf+Zy4s+
	 IDm2Gy4123Bi8wOUrjQahTpa21BrNGOhIgsi6LkX7/cFE2rDj2VgfTGw/vLvxNHrgE2Zg
	 +ybGg/qxznOwoMBz5gsnFevWRc+zIKspwckX/a8C3oKJWKIvKDnp1nQFT+LXIMjMiWzPV
	 KFjWA970D3S8YZEcDcTYQ3Rc4ks4/5JZ2STYukwZ0swJYQS8DvtPPiU7Nu9fg6htuRs5T
	 AWQdXB5CAB9/bbDXBsbZxHJBxBaFeCAFG+GQDGCF0y5csVGmnw8UF5daJW/z3jvZPxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
	b=PonHTYv6ULT1u3fwRcEYy2xZ0j7SxsI4g8xYTUGTs87xKkn2il6+vyRER2BaaIy2Ew1A
	 LKqYtC2e4IyhEsXn8Aa0EzwEk4vO9e3LU47B4eTt5QLvcvW6IPLsTssVHx8cJejH8zsHc
	 eHm6+Ggvotz+pvYFEkqbHmcuHcAKtCmAyUOWkwfQQqCuwBNpJnPT9IHKjcLyimihvx8R9
	 4cJkaFQPBruk8WirJJHPYlFLcBnsJwZgDDqebLJgKIxx81PYEzg3GHiC+hLrtMC0+T2IK
	 lwCSpiiFCj9h/qM5iwLCulxMOUw/l69MFDCgZRL1ClewTdVT5qWYp5ZKvWBWEh+zMcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40490606A322
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40490606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tMwL1211267
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=; b=fLNiTKrnOBPyf1/E
	V2zDkk9bGOlg4SOcYxissGvnz8OBNDf87jH0opux+vHeArndM1oEDDxAaMeab8hw
	jI0RYFzm4JAqYhfvHASL1C7nkKCRw/0GcmSNBsIsd+qijrhP4cwvXd+xItb+SRU/
	SYxV1ud0ar4BkiOv0OhmQTxTsQO9NYF6DQ1lkeGojNfHf0PAeHX8Xa/lO2nHakDV
	R6aJ5Dt4nehkKO/gmbOc/PmkU5Rdegt7qzZZEczaLCSfhW3kUdtszdda13fiNsMW
	bLXtkNA9UeDGrTc3iFh2x2+5SStB0Kq2ZtH/C6urwn2dd5A7PLZp2PZiNDgiS/6t
	RGfUEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1e9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so605073785a.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482063; x=1793086863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=BAJpXqTDMdaOdil+3GEfoNO+K5s0MMzRZxjtoMmV3+SrQaYnWEKhlAvz1fRQN/yw+Y
         T8HVGtbgvmCJ5b3ZU7QmWo7Pzm5mtJAIyIEPEJN3WFL+fCkyT7Ctmd9XDNDtg1sd3iil
         fcnPQ1WSSIe//5Fmd+HGdp5in3qMgiJYe348XZkN4pFNKL/lmmxjNBLQbqUr9i85BLR7
         ZTpMb7U6Dn/kFbXfmYs7neaMWSh68h+zrHGykpye8Ym2BD3BC2ITDQYtLzzIgew0pWJQ
         Ud8N00wGTphzIcY5Q3r7yXtk/t+knUq2I578uY4JDQ88hGPCDIYPX032ZoC8lZcOQKwY
         LB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482063; x=1793086863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=wIuBifqA0jU/PBq1FPeCgSbA1BBhmEc144jbYFNrRTgoF+ForiaswGfYJHKzXs9lT0
         pKkyf7A/5Feyy0NT7fBN+DcA6Eye0USUC1hbdkzLMp3P7FcIyjDOwEBa0id7sFm3L6Sf
         3Fofazbz39R+mf6GydFqXkr27KQJYrv8th/7sKDLJDPn/fJEcR1lx4gTqZXA1uwiazfM
         UA9zu1GikdrevpsAA51tSq78BR0Z29fEqcZNzO0xJrDEEg867wFetPYKW1P3gmrg830E
         B+OYVia9pyYaj76R+G1rMeYH1lB7edv+4+E2Jrwg04CmlPFtMFYdviySy5ogB/mZmi/i
         gZ+g==
X-Forwarded-Encrypted: i=1; AKwUvByqTEN0rslYDXB7msV7IfC5iFBalkqHMWiBdmsQPpn1L6RHncGp9oeVQfOKrUo+TOo5G3e8DrqTTy4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs4Y41LC1OhQp/rh257zLXpT2SaI7LZ7MmDAgkAcF/IUXop6qV
	GJfkgY3axhDAcLtcuHks/sRpSTe6OyXCccOJo99dZSbQozUqKS+7H3PrLA7LnC7EJfsc8ARbzgY
	dlH3ws5YX9o8FzIx3BBcDUzCuEwHVNolpVq/0MpnH6vYI9wldclO6ImTkbnJv/h4=
X-Gm-Gg: AYBFou2it8nY1KyotyiQo34GE8E3LxeaGYHRCWFcUDn4vaQJUt50Lmdy61r0p7tFqav
	pH3KKj4ZQujehorVi+wdYn1sGqKU7sGl6zthaCii/ZDDdEhD3pl01Ca4mQPDscKpyf7XSOWBWqP
	2i+zlm0pg9tK9aMuHCDlqGzdKm5kPo53aw4s85nNCwta3gaIP2cuduVJiiDjNQkJ1YQBqJ3u23m
	sfjLHvZjQBJb2L6JGn2WVSCJsag1zurAKCRt6H5JQiiUAtyNU2C0IRhU27pZJCdpGBF3LkqsYyD
	IrowLJPybZzVCqU0OdkthikhOxQhdp+Qjgg/iuqeEWqDr4p6Iw85sJGd9+7vhgNSEekojRZhT6P
	QVDFVItp5rEXtUQtzKuOeTztTIDNyF4ZXWfUZ7kav
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606491985a.1.1792482062699;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606487885a.1.1792482062245;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm34100475e9.1.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <1eb062d9-6662-4b10-856c-6f5a3daa3962@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:59 +0300
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MP8LaKrifJFxi7o0gSgPU9avjY8Q-Kje
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX4+vO3A4CtUUL
 9rNmOEkf5eIXbVsHHoiXySoaFvix815MvTax/aNRi+CofQAJQ9nOCHjwmLLyn0g3xtP7d/fAqBB
 T/fqr3o9RyKxMWwtsSFuMyqtFx3eOy4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX7CGnBfv6i4nH
 hXEKJjXCRm55yfdqZFiwEpKD8va1+FOmg5D6fFESgNzRTg5DjMOL+x5asPzKte/hcnYIyL3DPZN
 z2r48m+IlyJBu4DHXPcMqh9PJAC1dRSe2BqpFIXu5Bcm8GBJ9xsGSRZzzDOOK7ijG0acmzWIU1v
 AoZg5bPE1BR6r7h1HiRRMCoPsg/Mfs4L8+r45B/9ClqKqipPQZnAMt4i1MLwt8Y7AfqhNdnMSXn
 S8ntW8UtIZM6pAOMZB7A/w/45cTbHUoWHog0b2uB1JLZ/16ZdiisJuJTO33So595N0MVgI74eu9
 Ep2/gK76ZdFEwe1UZgoWoHyVLiaz3tLCZsBP2qbod4HsQfrNrU4E+FphT67AN8K3tl0kRBUD71n
 4R+GN8pEa3OxDdLxtSnQh3JhiEO9bAfLE2DaB8LXyAH4QtPZZW5NfZ7MgDgpz2iOouQHXDSJKsz
 PlbtdjfCSd7XOgn+fvA==
X-Proofpoint-GUID: MP8LaKrifJFxi7o0gSgPU9avjY8Q-Kje
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

Hi Krzysztof,

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.

There are two approaches which we have looked in to resolving the sharing of the AXI clock.

1. The drivers newer touch this clock but vote on new icc camera which controls this clock (The v1 and v2) patches.

2. Use icc-clk in the extension in clock framework same approach as: 
https://lore.kernel.org/all/20240430064214.2030013-6-quic_varada@quicinc.com/
This is already merged and i believe resolved similar issue. 

3. Which you are proposing to have clock framework to accept the votes.

Before we jump and implement the v4 it will be really good to have common agreement on which direction to go.

Regards,
~Gjorgji
