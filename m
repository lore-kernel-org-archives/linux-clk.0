Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6234D4CB
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517998; cv=none; b=AGVxbZeWTDFP16jqDQxn+cnkW1bWyE7yL+SA/PkRUNQ7Y7RhrO63RyuepJ85s/aUNYteEAHuY6UyTfdAeqRbwqrrCBnr9q66RyCMaHqOhvAWTTFxaj9nX+OtS/za8PlONbJqxeCZOJkmg2f12Pgjc0LUgSV+/tkS4Ae5+803OZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517998; c=relaxed/simple;
	bh=X0urmZHdfzvXbY8NoOrHIuzCFP2iZaoFZvgdfLjlu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eN8NKHhhHm7cyREK1ZFVs83WjwlhNr8TaRjU9Tt130n6jooRRSRFP0K1ZE+Hfa+3WmC4rTfSJRb3H35/vCmY4FsYHANiO8CowCeVGpcHCc0YNJQkI0Ra9MaPU8AIrc61XFQCtRA3rPAxWUGPYBLW682/P0RfsQ6Ss4vh+pcjVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBtpIHcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/Y5cSgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBtpIHcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/Y5cSgz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8NOhF1554724
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=; b=PBtpIHczdyrevmQl
	BeL9I8yTP0fa/ArJfwHQ+AnONo4FydKH1//vkEq2e4qY4CrJWTKcLPFrbZwVr07K
	9vhvDgZZd/Ol4u+H/bbv3irdDXyLbrpMnPuGJDJblSqZpY1Z7Hto0pPlj2S/Wo1x
	4Sh6WiQJtnIsd9j7aNuUWFTMIEZt7Um6T6vhwclUfDWZG2xrAcT8LBVg57MuKUsg
	XrfO2Wjasn4xR8GgSLo+EH1xFRD+4q50LStqGMRKrApnkNo4vn+We6wgZInY2I2X
	gifpAueI/+YHKpslK6QX/QZaU1Mo5TMPQfz4+AJ9hxpBU97rs5uYA/fq4tYnOdmS
	S/knZQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj7buy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:39:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfe29579d5so34448385a.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517995; x=1775122795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=V/Y5cSgz1b+arjKTut5rr41OZ/XYglUY3XymGErlrWyg5B5gIYYsVLetXOrrFHiMGZ
         7yw1KTibAnhnJI4juhswn4A0HOHItYRVs+ckx8aeK+NL9IMBcvEeWnAa75S/pPp73v+z
         ElgJX6/fOB/HJBbRkkvicnaWLENu8wFoNlLl3LRIYmtVklwdzqKOUzvM6atN2l8CY+Lx
         DnIlVGRB3bHbIW5IEn66QVnjWwipyUiI4wTytG9K8hLPys5dl02uD01URBiECRl51qvT
         UCuaEOuftr07H4gOfd5T8xI5KdhlBIp4rviafJmSl9HHUsLQTyJBMasc1lNS3EDZghrO
         5QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517995; x=1775122795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=H+hmauhzHCRT6N+39WjCdOyJHNkR/djf6iVGQAej+5NEojI7JQJzAHPlhc30Q1DT/x
         m2vBj9e1OooiJ2Pkj8AMNa4R4UzKjoG1KG6zFipqRS6N3eNABx+PLwVYSTjq699lSaxv
         ktAHpolJwC3dHSJteHNP4ittt4ZCIHIlY76ZkBoBGPUQ2LwVaXxda/5ilgT3mR2eqN4U
         7PBayoyTuiG92nbhV6B/BYi9TNdafO4nCat9mTASGeEDopvgebnsSwfUnnSkWApHCAo0
         OWCmSIyfYUyT7NV0Qk8rRy4HO5VbyB8EWQDIYGxE/IgkhnNT2n0HSz7606b+Yq3KNGbQ
         Jw/g==
X-Forwarded-Encrypted: i=1; AJvYcCW2l3gQ/tJR5YubTxnoGkLKX4uM5PY+0Zd2baJPn6lsoCUEFMYW3AoQh8IsQfg050OFlALK6rH4qNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBJYfHnG5aVnzD2LviiMHEhJlqaevtn1rdUjJdGmdp6lwLhV9o
	tvLJRA/T8bBayYk2+xNpRSqUNQBAvXki/eXFhLWwM03WASe1ImudUiQyp5fxhNZXghfYuVIQLXr
	kwJekUCBlGSdAnyLgQha+2e29Z4BhAIWAlJKK7XWg9T3OgHcN0mLl2XHDudpSa44=
X-Gm-Gg: ATEYQzx/gn7BmLHWfrWKXKjYmjCcye2/BEI0AxaWysUq1xQ77EXVnb3d/iBXNVD82t/
	OCNh4g2zgEUOUqCv15+4sHQU0uBpglmSF/DNYkQtDptoAOR+9mRWvkDDGyfpY06dF8lQAou2JfA
	pD+HSjTgYH09B/thKNtdvXOn0taUtxIwpUSbX2bO2Wj14M6QvuIEaMsCkCrWLyDkvulibk1eV/J
	aUPlR+2HUmdrAUM2P4EbmpwTS70MCR++P1etWueJVVTFYLkVeXb8vMAWPiBD/pzixlvNp7FK/rl
	LEbuFnGB6Lxj7EYB+3Btbdo4rOClGj3EUzgAKadww3LzrOWhpssb9Od5SvQrD7M2rLkC5PQpCps
	Q74reoFGubajrbZ7QnDsrm2CiBS2SyER5ppkRdtlTplQUnieLDjZb17ZLLU9weazlhppRxfgi76
	IWs5k=
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648082385a.3.1774517994901;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648080285a.3.1774517994404;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a6041esm837284a12.28.2026.03.26.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
Message-ID: <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c4feeb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=2_2y1rQ6RNr2V2Z6SLcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX2MMnrHlxowNM
 1jnxyxyF71Xs0Lqj6M00OuB0rl4d0UszG+FHc+97+y3ZQOhy0/3a8PvlCooFak0qzxtnCg/mp1a
 YPgGs6IkNlxsCfmy6J1Q6gj1PS+zWB9f0vjjqi5IkKW+FKKO1oUNZ8o1ZmnA0rucQhXE3YQ3cwN
 ZJ/qoWc8v5b+H45OkzE9HmETrWJsbaDOUTsQIcx+FZOgIhQEvYIFOC80Il06tNWfDYUU+fgT8F7
 iflpuVbS4uLipfVV9W7TN0OxmUCkBRCGROtmz7VfSEcomHBBiEfDFEHfAZAgqXm4iMphi6lW6nB
 z2ctuUEXJuHMipx8xuRfBu+QV2McgacLRfP2URxP44q+HH3zugldgw9abk5iF4uZOijqKDFSCXn
 ygBcU8EoCco2ykOpc/awnI/rqwIQ0CLAMjNzx9f2ZCfcH27CAwJrvL5n3LfeIh14k5N+oE/097/
 kdcRhvLdkmgNdoTtQZg==
X-Proofpoint-GUID: kz4LNk8DHW6hJaOnBK29itUMU7afEUpe
X-Proofpoint-ORIG-GUID: kz4LNk8DHW6hJaOnBK29itUMU7afEUpe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++

I'm assuming all of these changes apply to both ginkgo and willow,
which both include ginkgo-common?

Konrad
