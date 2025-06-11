Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A4814B945
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749618345; cv=none; b=kdu4Fy9vZ/ZcUeNU6b2nMrkMsa/imDisNLsuLnOuJ8qBjBfW83QoneKHbQZwm0mYcLVFx5BeKeziPGHvdXn8Ns1TFvHOZljK24a0W3rEjJSE6CqXcqiLRC3eaIVip+rhMJN7k5hrECYC5odUagYWMQ3UzE7EuYwbmjjIVgzPK8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749618345; c=relaxed/simple;
	bh=aQYY6xCCcAYMYix4A5vJaId13rEdEFR2wIi9qkRVWTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t17F3pFK8ydl8aunTSOToIhlndqp7cPMW7CgTMJVUsuTJ5708v97SbKxhqjbfS10nCnDi950nuYln+90INP3mKFMKU1GeW4WEwW/hcJU7woiTPFpOitQrtrwQ80c+ro60/lIZ7wch/9S7q8/povx2RR4yDF9OISWkHdEjeb/XHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gceIcVzP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gceIcVzP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQBF1010618
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 05:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iI9NMDhEkMnV0ltFhVkLoW15tu5Nhk3mtinuC3YUV4o=; b=gceIcVzPl1+9oJHI
	QjtKp9RsK47gzVGU6HlHQ8EKdhG7O3j+Wq6vXEKJawePiZVooHKH5QuFCVYUF+aV
	ImCBHgoj7VoOaJCft632KoQ7CTvEGSp4D2oRha1h9W/VgDYKB/hppM6ydjwj0qX0
	04rHx6RGDiyWJtkr0Jn1kck757jed8kEixC1zChgkmoDxMuVNlX3NWRuwRFwz+kZ
	pnttwuywuGYVF2fX+AhQUpSruB5GjyO+UWc0gagVydQtCnQxGuRhCNtVIdyHg8uf
	8Xq3wjewqUNIsF3BFyXawiZSGQU3FrWQaSAym1zilyLuiHaz0d39oDU4aeIjG2Y1
	F2Iqlw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d123sc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 05:05:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so7004353a12.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 22:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749618340; x=1750223140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI9NMDhEkMnV0ltFhVkLoW15tu5Nhk3mtinuC3YUV4o=;
        b=NDZ/t2JjdDKgOmdsxf5u/k/eBeVj+1zHm8uTPAyVWaa/5lUV4z+ufDs9/EkgXjtr5Y
         ByQf3LJZsvGCBL4e9+nBH0HvGCJR0TxTYaC4ZF4jhJHLEyBAvtkenlXkoTdQhuU20TQG
         n/6PmUCjqoL0Y3fQ9BDHwgrNkOTaOIXcXxxENaeQ0XS9hKk4IU5vxky9Km2+ne0StWpM
         cBw2Hu8EUGkfYmcbl9mQJ9DBJsn1sBlwbsGND39AztDc0p/IvP0DDr4+ktRMC2quz1jw
         4ALZoeyAxifvsdm2+Fbq/yUEXkCLbQCeGVw/puagb078MWyiDiBTf/dN9TrlBLEw+9Ip
         tkfw==
X-Forwarded-Encrypted: i=1; AJvYcCWMmPngVUPRqYPS975am03ETpiwHvLoTe1oXnxOL84lyiLjyFQOAfYaWyk77Sl1yx6JgFYMkr4iCjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/Jx3hwf8Y0rmsfFYv+RPwCEv0muI7sXNnTBEAT6U62u5s+jt
	ATKVxoljvG6nJHFhBhkLMKtxIJRequMYOm9aRvIg7UztbzmGQF3M74rdeYCsgk0GZ8zs6yW0u6E
	pS9bCVZmTHJbX1u3/nnqE38ccNzYXoeX3xya5j+Coz0119HMaovpYlh3zhQ9QJ+F/MOzi8QY=
X-Gm-Gg: ASbGncsZqXVviPIVC/izN/nxTxDMSgzONPM/EUKK2AHj2HRgN+W3im25Ti3jGds1Jvj
	GRSpXVjIQ5UXIOL9aSBfQ6PxqRl2BKRzxSBKYHDBNPwjQ0b4IELZkYy3/juEaOJpeYLxleLHBBk
	aOsWFC8bJeJqXEQqEll0ftHHuyfHOgiNJ406OstouWqv4KfmLZ6LviO69L4nUB+DvxRsFUM5fnl
	ht0jHZ9JJaHShbaYVkj/u+XHuZ5gVwVlkJYVaMnL74vykhAuj+rKfbaHJwWcUqgyY9q8tUMNxcX
	B6+E82C+nZjIYgor9JKzBHR5VwupwaLR+97t8GPErw8P4G3KsKv6HGI=
X-Received: by 2002:a05:6a20:a11e:b0:215:de13:e212 with SMTP id adf61e73a8af0-21f88fd555amr2079342637.15.1749618340584;
        Tue, 10 Jun 2025 22:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlfmx/FndYaMxUj1Mm8zVA7Xx2NEooQKaHlG/FisCHiAXfOwLHC3oXYqQPC02W8mtcz+1vmA==
X-Received: by 2002:a05:6a20:a11e:b0:215:de13:e212 with SMTP id adf61e73a8af0-21f88fd555amr2079311637.15.1749618340150;
        Tue, 10 Jun 2025 22:05:40 -0700 (PDT)
Received: from [192.168.1.4] ([122.174.137.154])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6f1dfsm7587129a12.18.2025.06.10.22.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 22:05:39 -0700 (PDT)
Message-ID: <9b8ad81f-28e1-471e-a8fc-9e64578aaf4f@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 10:35:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
 <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <sy33khkakjxi66amjbuugnypjnegvd4z4dyfzvrp72qkuv3roh@dxaymdc6cfad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Jvd7tvOiVTDmP1FRYcRKGLF9cXXcz8l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA0MyBTYWx0ZWRfX9jc/oT5ZA0v+
 XPrxeJGifhtmw6Oc4IFb3cGhb/WWKhFgiPgVbrTUEVXE+8TRsJGH6swhCJus1FrLt0YA35KdCQ+
 K4Hq9W24KBNNLGblGY4VR8Z+OB2w6XDBu7NUsUJKSDswEa+VIHt/KOQLiXu9XAqoafTAM0T6c78
 9r6MxdtlyPLoHQOkb2jvwj9pnW04e+qm5sZrxkQNCeN4tSsauTO2L5d+sNaBf+L0T8Sr7KybC7L
 6wwu9vt9nKpJcPz0hI0R2mA/FGV64nlWjaR+g5CwK9NMtE/0PZJMgNObp/Cmkyi/rmxVRzRkHYD
 nouhIrzu0YCtn4VjSEb7/rdthJFx5zrAXIag5uDpZi+Y2BUddh4YZFXiksHSMYXfR5c5Cb19iex
 4eRoTGnSP9NY2aU4vNG5eZ4vKGGYg9TJVKOIQL63VrQy/ciW5a7LkDZoWjRRAgkfe+bRQdFe
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68490ea6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=oYmrSCt18pvj5yoFrZalCQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CUOy4OKjmV6SWOl3eY8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 5Jvd7tvOiVTDmP1FRYcRKGLF9cXXcz8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110043



On 6/11/2025 9:12 AM, Bjorn Andersson wrote:
> On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
>> When USB controller enters runtime suspend while operating in host
>> mode, then wakeup because of cable disconnect or a button press of
>> a headset causes the following kind of errors:
>>
>> Error after button press on a connected headset :
>>
>> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
>> [  355.725844] usb 1-1: device not accepting address 2, error -108
>>
>> Error on removal of headset device from usb port:
>>
>> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
>> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
>> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
>> SID=0x0
>> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
>> PLVL=1]
>> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
>>
>> Enabling retention on usb controller GDSC fixes the above issues.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>
>> Note:
>> The above mentioned issues pop up after I enabled runtime suspend after
>> applying [1].
>> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
>>
> 
> It makes sense that the BCR issue appears after the flattening of dwc3,
> but why would the suspend issue pop up?
> 
> The change matches what we do on many other platforms, but I've been
> hoping we either could drop the retention or clearly document why it's
> needed - so that we know if this should be on all or none of the SoCs.
> 

Sure, will try to root cause why we are seeing issues during suspend (on 
sm8450) and come up with another patch.

But I remember on sc7280-herobrine (and IIRC while testing multiport on 
sa8295), when gdsc was not in retention, after entering suspend, we 
would see a disconnect and reconnect of connected peripherals during 
resume (probably because controller was in off state during suspend). 
When I tested with RET_ON in sc7280, I see the re-enumeration after 
resume never popped up.

Regards,
Krishna,

> Regards,
> Bjorn
> 
>>   drivers/clk/qcom/gcc-sm8450.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
>> index 65d7d52bce03..f94da4a1c921 100644
>> --- a/drivers/clk/qcom/gcc-sm8450.c
>> +++ b/drivers/clk/qcom/gcc-sm8450.c
>> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>>   	.pd = {
>>   		.name = "usb30_prim_gdsc",
>>   	},
>> -	.pwrsts = PWRSTS_OFF_ON,
>> +	.pwrsts = PWRSTS_RET_ON,
>>   };
>>   
>>   static struct clk_regmap *gcc_sm8450_clocks[] = {
>> -- 
>> 2.34.1
>>
