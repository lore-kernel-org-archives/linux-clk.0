Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD437C0E5
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898852; cv=none; b=tPYWjAtqDFEi6pbtJc1KTfLFdtekiG8jqRiV58ue+eZUfL5qDJXQrO4r+SFcuc4askSBsGTI0vjyrfz1y8hQdu9wezmD5vtP4+EPYnDdwzXug/6B1lG0+5ArVi/IVeef1wy3BFUm3wFAAoAbyQ7AEWd+29iJYPBeQvD/IHnU2qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898852; c=relaxed/simple;
	bh=XWHZjySPatNcfSrBcwX0qERyY1r9YZCkhTFdImzBxm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ck4MWGqn0xIA/DS6gp6YIJJz7ICbC7SvaD36xy0qsKcsSSgaSPso0ThjOnDmgQoLNgRIs1+F0SPQv5EwSzimZwkjq0LIaCqVnJtNI0FUmDtW0cGczo4i0JP1nadR1v4IytVhtCWd0laRfb60D9clJfyGooczgS3GeMs4YN0RGwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKMILTpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EX6F01mu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKMILTpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EX6F01mu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XiDn831397
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUx9xVrh1YBiyYCcNow1M4IxPfA4MQ8LX3ZysQAwPbE=; b=MKMILTpR4fGzazvg
	LX3j1CVl8SACtnb+oSLLViZi8OgDvWj95aC9UsegpEBk47mYArkdD9C9o4gTh1mH
	p9eFZw9Yd+Wl+3EEoEibEup7gKA0E/FzgvQrxsV18jS0lF94vFRbvkm0dQlneomY
	cAYBPC3sZKgS6/GfEiejFCosh54qOajQnL6Ux8bVa1TQQcoYHg43lXE1483YWByH
	sGvFIdqfINTorRVYh0hvxMA4KhJox+HmiKh0LS6k0Nzof7Vj40hp4lZlxcfaES8v
	timsUa6e6YNCj+2BH1Z/QCHZFdnQiTxXUnr8+sCtvjfqNPSjsGxFmrdVsW+4w8v4
	TTWk0w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032j1md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:40:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so1997558a91.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 22:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773898849; x=1774503649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUx9xVrh1YBiyYCcNow1M4IxPfA4MQ8LX3ZysQAwPbE=;
        b=EX6F01mu0rbd9z2bFzaw1oWnJSZziAOdOG6RJJ92/qakNnT5m+rquq+oUPZB/r9FPD
         y0JxRODlQxJYNvy/v1ib2KPAcmYhW1W709s2TljFTWAYKwXOmbJHA8mDI26RZTGz2lC4
         OkmwK4XvmOUctep9ONH2TnwRsaiWr+DZBg2UZYeRwbeE09ZvWnQtuOJpLMYPnNJ3xZc/
         7giTAWcMpBD4uEH9QpwAKmsuJn0iWHadljszQC9jM9M7CZnuT+JWMJJzfzndZOxVYaVo
         RZB194SjjAyo2iQ10vcckgYOMe7vNJWpSCtduDFDBTL6FQfuttKnZwPlmEtntdMnD2jv
         Su6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773898849; x=1774503649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUx9xVrh1YBiyYCcNow1M4IxPfA4MQ8LX3ZysQAwPbE=;
        b=h5madgMVmHx3Wcx6HehJPrxZhNppWg6H7Y9HXpzY4p1icLLZsBCnWfBBLqLl5YCOET
         tUb5EABkyyaYRfEAgfmZKCEiutt35nqQRZpqGck+8LaxrH4AunD+me2PkL7nWeI8tDpt
         JK1qw1KKdOSyFKoSjhClUk1R0ItkkLMAI7f97kYZ6pl0dl6SIOkYCEN1hkzww+h5qBdd
         s2cvRdCrzRE7vFtXJMF8byVgJM5EoDiMUTDgKoxeq98UloSCfU2DCZhQTDjHOE1dA142
         mJAeVoERmpXnyhAokazUAvIwuzU4vb4cdYiC4GO2usWcTdnDRf8tbS0pVWXrrTsRLXtY
         AHlw==
X-Forwarded-Encrypted: i=1; AJvYcCXzaFk+EHq5gOaZw3yfMKvLcQX32d4Lvo5AKu1mqsPjlvSEYejVaQ08y/b705SZ8ZwGE0yHXCt/Sog=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9a23oRWj9zcgeRkrltlV2cZcLEJwMjqE4o2s7DLgfih/Kjj8E
	0a8KZuumygnXV4jqyv5tVyPYDrJPaMXJ91hg+BAWrLa1tQVVSD4Y9CeLNuOs3Fzb4Bep0PadfuA
	+BN2W/0X2EpPoonmB8xp0nIC8Isz+65nHJw26vKH4rqpESLep+g6yyBkW/OM3QCo=
X-Gm-Gg: ATEYQzxmMml27J3vRCymKIJQJ7hzd1/c+S4cWMJjJZWV/lKVM+yl7NxCq4TgAqu2YpO
	q2vci4/x/8Lsa103eva+V3uNull/zdD4GglGe182T6Bp5O+J6abPpDHaHGFQGgCMupvU8dgQwHz
	SImIt+SeoG/keWVDGW5WbG91INDlR0samXmfqpBSCkT6317OOEO7rFfXZ1u7Rvi/UcKec6Puvpj
	WLGOy2VZfeXmMqb9jMumg+rIec3yibrrmSw/DuNN0YofoW/iRPNmLep4sbKWB152cj2I9ADNtcu
	cQHBCmqBUP84GVhqBP67LjD0hf4+ORt1ImHmSyKzmh9xtXVW4u4J0mrhbrz7i9K7wcPrYZ7LGCc
	PxniRAq0JW5+/69JSn1JWSaK6bt1MBfjHuSiNuK4amASi8NckDnqhBdm/jYNkq7OFIOfuwMnMT7
	przYjXw0cH/3HJlCGb
X-Received: by 2002:a17:903:1b03:b0:2b0:571f:6f07 with SMTP id d9443c01a7336-2b06e4079damr73634945ad.39.1773898849429;
        Wed, 18 Mar 2026 22:40:49 -0700 (PDT)
X-Received: by 2002:a17:903:1b03:b0:2b0:571f:6f07 with SMTP id d9443c01a7336-2b06e4079damr73634735ad.39.1773898848983;
        Wed, 18 Mar 2026 22:40:48 -0700 (PDT)
Received: from ?IPV6:2401:4900:88f7:d60f:c026:8389:5abe:d964? ([2401:4900:88f7:d60f:c026:8389:5abe:d964])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e4199easm61199775ad.5.2026.03.18.22.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:40:48 -0700 (PDT)
Message-ID: <235572be-0789-4575-b6f5-f7a1895455a6@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:10:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
 <ablhdKJgEhU8KmtO@redhat.com>
 <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _dRFY0LhmNMo5aMkggMpX81dECQC0fxb
X-Proofpoint-GUID: _dRFY0LhmNMo5aMkggMpX81dECQC0fxb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0MiBTYWx0ZWRfX7GPQ+tnoL6Vl
 RpX3G3VA4IIG0Z29OUqHuaNT8RNJujF1EiZSBif6I2v1O2kBQFG0t1R26c1+wxXqXi95aSLtXZq
 fOnFYXNI/XmW4WReA2yw6xueuC25Ss5rDRRhH9EuvPxq9SBfxGHf5bD0FulK7FOjsrOtZBMN4DZ
 kga9CiB9s5vYDfbjATqeaVaVjATDArrJ3bbJj9n33HBGk5QQtHtyp2rRAUxRCQ/c4wUCgP8stc2
 U/+/FFLAhgUWFc4m0PV6nusDuhiAciHJJn6kGow8V9zx+SgkWUSEem7evkuHSUkywm2umbbprie
 00MS5vb8fFSy3AqHO7YN4XIQHJvan2/YgM3dfBGF2OaLlje+5Ah/wGJv9drmwOPp8SmozPl2vXz
 /AS4AY4OWEZuC0ZxurZJHDNnAPilLYE1MPEVKOBkY2vp/HvmzIicA+fJBo6A4M5j0zFoLkEQrRN
 6iodIQV7Jw/sv+foUfw==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bb8c62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ih0Mk5aDYjs-EetowCwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190042



On 3/17/2026 7:50 PM, Abel Vesa wrote:
> On 26-03-17 10:13:08, Brian Masney wrote:
>> On Tue, Mar 17, 2026 at 03:21:17PM +0200, Abel Vesa wrote:
>>> The solution has been already discussed for a long time now and it is:
>>> drop the clk_ignore_unused late_initcall entirely and then make a
>>> generic sync_state callback that the clock providers can use (or they
>>> could implement one themselves). This way, until sync_state is reached
>>> for a specific clock provider driver, all unused clocks remain as is.
>>
>> I'm willing to work on the sync state support once my clk scaling
>> series [1] lands upstream. I believe that Saravana posted a series
>> related to clk sync state, and I need to look at that.
> 
> Yeah, I've spent time on it a couple of years as well, but got side
> tracked...
> 
> I'd be nice if this actually lands soon.
> 

Yeah, In Qualcomm SoCs, we have use cases where certain consumer drivers are
probed after the late init call. These drivers rely on clocks that are already
enabled by the bootloader and expect those clocks to remain ON until their probe
completes, after which these consumer drivers can vote on the required clocks.
Supporting sync_state for clocks appears to be the right mechanism to address
this requirement.

Thanks,
Jagadeesh

>>
>> FWIW, the only reason I posted this patch is because at the end of
>> Stephen's LPC talk I got the impression that this was also an acceptable
>> change. I'm fine with dropping this change.
> 
> Here is the scenario that proves adding such config isn't the right
> solution: think of single kernel image working with different SoCs from
> different vendors. This is actually the case where distros need to have
> a way to provide one kernel image + thousands of DTBs and be able to
> boot one each one of the boards. Whatever this config is set to in the
> kernel image, it will not work with all platforms.
> 

