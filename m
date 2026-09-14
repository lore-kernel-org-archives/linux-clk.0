Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8960A457E47
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387298; cv=none; b=TKuhGBQY3AGooLq3Gqe2li1Ks6Lnsnt38cW/JSgAq4Dakiw0eL3/jEGtQgCkUYNtSbiV3X3nuB58/XS3S9lDziWcVJiueIPZRykrAQwqoavWtAj0UfJVZGcjRmUNTuxLyd/Z71NNqXauQZJxCEvJTBbjMNEERuCbTkm8E8UVcac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387298; c=relaxed/simple;
	bh=86eYR0i6ZVOAL+yOW9gV5s1lTtVfbPgehRLwOGUh8MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ko0GeMKQi7eTFewxvv2PEiNmQWRFOvAinuZALH6lRfhVUl5oLIR6t9eXKHmivqrQQ6zKFCThdR0w39ZSMLgz9rqt8h095qy/gOAlu1cL9Uk4WdSlkuS21kDkgsb3S1MXzD9aORdcMBeg18LtDzv9TQEp5IGjdyUWubV+h8Ap6pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnamtNDQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/cUyenc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnamtNDQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/cUyenc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMpt4032520
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=; b=nnamtNDQQ9gHj/1u
	8u+wb1s8mTP6JWRKxKfdX3d8ABVXd5kMHmfW4wQ9nsSyRrjYa8WkAnjy0dXdtaEo
	h2enOSMboZOQCYy8H/CFLdd9f7u0SAjuYTs6HsjKsSMJyk6o6xUB+uwhBjPWBiyu
	sicjPLoGajNYaGVa0l8fMYcMn32TORMoX1I0eqFvp30N4DUbJntsg9O1Mb2f8SY4
	vyxc953Q5FSjtqXmzyZ3M9e1jVgMce4t+MrG76KRNx7HpcRB8WhzKnbYVSsGWoj7
	x1ZSWv1V0N9dsqSCWcPL2ykRO9F2MIYBz8r5t+u5rEJnunkGwCFUwiCOgKAy+DCQ
	w4ofBw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8eht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:01:19 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc3dee8aeso29138241.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387279; x=1789992079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=;
        b=Z/cUyencPcBCvGHjHB5IKY53arIs3r21sdUZTIMBq8b/WcRZC1K5QRiGrLTEKYAm+/
         o+m19HyH6Zc27DLsaiS9CvlYpH+4jImYysOJYaGzuqMXtHWHS9JRPHpxLT+wmi1Mb1Li
         ExeqJfg0/YVZjC05Igdjqht6wJqZYPRn1IEuWz1HdnYXGEMvOO9vB+uu/MhMhj8GBjRn
         RQjsarsg0lJlCgwe9iICBwuPGXyPxspLtKt+IFmXc8+txPgvBAp99GHxj84VnTZr7XM8
         m6ciE9MJfLyAqwRXxgIW2SloFBeX0StP1EW/TJB5XJXBc/8SlvGKF+rwbtoCC8YBlMu8
         tkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387279; x=1789992079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=;
        b=TJV3caJGOKZxtexc5LzF8GTy0GOJbF8hha2D5emo6S+Pcre9NGYa7OY8u+x+ewLPu3
         TukDSCNZhMHx/zQqvjYDK/iNvHbw5oD+NDmh8wP4QKdeKT1BDhKsJJwngkB6RH/3CMdD
         Jm420EzktQRBD2Aka9t67IBXnC5YQS7o7G19DabRllVGPEwUBCfeziv55L4gNtGjOoFU
         1Z6kFSku2cdTl5pPTGs3+pJ8EVJQ4+Yb0nUvK00l9HMyTFZJtSOK2fNKtKLbLLD4aqDr
         CCTCiNr+GgEbSz5gi1qaBFe4MNUBSDDT7Zqp3vF/nZN9ZInJfSSGxmthbxRWasfCht2e
         KXsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3EEYpQY7SsD7yGV3DEPDngwf90rfRLV9YWITLxp3HA95IEJQ/p25VyMMQ8HEfjw5NCqtu/DonHEs=@vger.kernel.org
X-Gm-Message-State: AFuF++mFRq+RQauGav0XbkVpOvmsXkW/luop+V4GeWs3m/uOs4kDkPt5
	hqI+t/PK608jA7ztUx0/7K+wy6vTCv8sXuW8xIsG/BMReKcQNukNUThan1QTWlKSibxpPUV+0C5
	FbiEwSuncrkjSSANs06NMODsv9VyDqej+/Dz83fk6pRHRRDTNdTYE06IJIYTN7zg=
X-Gm-Gg: AYBFou2ASe5XiXzZdQEI/v6cMFS7WLHd5iq6RsCQeoY5kbZoRGolYv0F8MfzQ2WAc7A
	nKxRQqVmYsx3xNFActbeLG/fF5zPQ5nZOfigrsGx8kcnQytNqmGjYf2RmgoUatlkV8vUqIAQDW8
	yzJwen98/yhGiuyzvaKfS1hM1fqKz8h77V3oS1Xk8iwKEB232M/yND47Rp83gTeQu+mhFZI2oVn
	neVNMJJKwX7fTFS0qGGFlonyVpRKsCVzA95xQ3biyXM52wM4wrQX4woAHJ94kKjqM3GYUHqTLsz
	Ze1Q2huUlVAs7/v3Q0cU5AuGCFuIDrLrVaKf8balNV1JotHYFmVn5uI2hzPUIuO6ywmFTIzMuog
	Cl+JuvPJpq0Nmz5kul+v8dg==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr321796137.2.1789387278908;
        Mon, 14 Sep 2026 05:01:18 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr321754137.2.1789387278364;
        Mon, 14 Sep 2026 05:01:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm417817966b.4.2026.09.14.05.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:01:17 -0700 (PDT)
Message-ID: <7f3aed88-fd53-4cd4-a316-630208e7c08a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/20] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
 <d0d7e3d0-15bf-4850-99ec-44d429c6bae1@oss.qualcomm.com>
 <42ef03e8-112a-4689-aedd-eeb7ec9b4f58@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42ef03e8-112a-4689-aedd-eeb7ec9b4f58@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX7speKZHu+dUp
 va2rqJ7nmkH48kIusmXBz5pqJFnHyP3GS3eqjPSp/1aVdL2XHwAfKndOjSCcVowmPKsXyJ0Z09b
 Mb1sllJxgZDN88W3LjIBCa7JJIqUGseYERTFMGbIwmKoskyM051w8eYZUcJRgUBzcfJ9E3gnuBV
 OcZo7DPIpEUWUd00a1uzSZooIqjMuH40PIXTed/KNXN6LDW1MIBSfFzir1MC3y/MIvsBTQKCGF4
 pmbLTac6HwOE/Oy1hbGXktFb6jOXTd2JAycj4J8m1ISqV7qs0dXg7yN7kT0uKRRa3Lg0UJImVOy
 MNXB7kxD8XgV08rpspgIrXJeq64E+5FS+yr0Gl+7DcDgN+mXSHDdMnXgTVOgFNYgnVjVn+8KOCh
 nygv8aWck3B+hH5LuzBZzLP5QrV4gWbMrE0XcO2sEBT+mJmOITWTM4QY1HTFdYR8G3fSGCOKa8s
 i1XQbLCM9hgfh0X6cxA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e20f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OuZLqq7tAAAA:8 a=NPzieGulNsBdfkreKLwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: bSl_yh8usstyYgA1qQoHkGrW4-5rbDBr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX7agH04ardgv8
 PfqBs6/qBpZR4JYyTc9lJt6jimUsys+T13Nk/ylFuPuM4YxsWO7E6pJGPIxNmQAKzuLBke/d7Z4
 EAmzcbbhbPcfr3DyHq/+iLen80fempo=
X-Proofpoint-GUID: bSl_yh8usstyYgA1qQoHkGrW4-5rbDBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140171

On 9/14/26 1:58 PM, Muzaffer Kadir wrote:
> Hi Konrad,
> 
> On Mon, 14 Sep 2026 13:22:52 +0200, Konrad Dybcio wrote:
>> On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
>>> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>>>
>>> Add General Mobile Shamrock (GM 5 Plus).
>>> Shamrock is designed similar to L9300.
>>> Downstream reference is [1].
>>
>> Please feel free to
>> wrap your messages at 72
>> characters, otherwise they are
>> a bit hard to read! :D
> 
> I am sorry to hear that. vim shows
> it less than 72 and I can't see which
> line is bigger than 72.
> Only one I can see is url itself.
> Should I move url to Link trailer?

What I'm saying is that you wrap your messages at something
closer to 40-50 characters, resulting in excessive newlines. My
previous reply was an exaggeration, pointing to that

Konrad
