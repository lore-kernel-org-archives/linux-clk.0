Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C5929B228
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136301; cv=none; b=NSGkxqRWeYEn2mAJ7PP1CHZ9mf4G90Fc0HPQBvE0BP5bnk4SJxYLT6SXdH+3IayaHtywdM6UWSKtFmkb7wORSmbNIpHJMZ/06/UwtosGrPzSaC47iXLsRn35b4u572rECtcYpGdBufkzIAMfl85Hf3UtTrpxfYmSC0u3vT7GWIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136301; c=relaxed/simple;
	bh=/jlOxmorn01P0oqnM8wboBQgCXBXKTHnzrbb14CijwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF1wWwtYunMFAh4weJhlEY3enYJDESsmjIemalfx3S7xhjAQDYVk3X+Jb7HIV2yhdFF7foYv2IGBo0nyxDMxRZsadngIbHZl8S+EO/Onv3Ud7joEI9riHM5kADogsbGoq9Q66FWSMYKIlZkgMvPMod2HlAwi3Mlb8OP3lIJaCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jh/PFFnn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3Dud7Gz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jh/PFFnn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3Dud7Gz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjZah524794
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 14:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	widYuhmWJa7lLm+8qgyJ46Hz07J1TePISepd47Ws5Ug=; b=Jh/PFFnnxHIQiPti
	5e5vZVDCBa5hwi049UU58DsJnO1RMYYRkwqZtJRNq2HGU6yg4TtYNO3sSTXpuGj9
	rIhwhPpHEsE6upgC4K08NWJz7b/ly8NEAhzD29d8DvN10H1rC9oLzyj5/uQRq2Qm
	JeFra98j9iVS6Pn9mx1FLRiDGkDaccCb7QzAmmSi18N10AICK31ir2hMT/8G3wxi
	ZTKiy+ymCHFU3wYInFupQKmBL+Xa/xJwpFCdOfWjdTImnd4Ow0uhornNjk5i5Mgt
	KCmhjBCyeYyH7uwhsQCTYykZYbOa7V/sB2WpF2LJVnQbc8Pv/hlxo9hUG9OhcK42
	cthU2A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q13xep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 14:18:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-868db1b2c64so1543665b3a.3
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136297; x=1789741097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=widYuhmWJa7lLm+8qgyJ46Hz07J1TePISepd47Ws5Ug=;
        b=g3Dud7GzknPZHzEJMJpZ5eDmcTAwx0V+DRinFVgx/7HOsuqFV/6ijMUddKAP6pqhyn
         Rkos5lvsPu6VnehpSlGUON7T9QKVx5o3ID7kSMr0SiEN5Eu8Wn0DLHNK946NFQ6rJRx6
         2/z2Myp7iYr2OTMuqZUPmQJrsWYXoMDkCvWkO9e4wGj7lELQP9G8IB/y7lCwXWE9OJCv
         uaL/nmktI5YTrtXN6mautHFT2yrj52bPcNjuTQd3yO8d9woqNTeaVRSR+SmXax2+dbG1
         GuV765Az8WFHgqvvB3j5Il7iWxkgott9/JTPVOxDjjlMlrYIvVcL5OmKH9NDyj20vdVP
         6UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136297; x=1789741097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=widYuhmWJa7lLm+8qgyJ46Hz07J1TePISepd47Ws5Ug=;
        b=Ct5UKh8gEZHixLCW3sy1H5QlgqNmwKfIC8NaFL0A/qj6lRRU7HmYsSvB2P08hOQHbf
         vrwEegXkvw2ByhMldv9m4wmO4+mr1DnQJSGUpwEPRrAa0JrdFlxZlZDZq2ii9kkTrDGc
         PdF/5si8lFCAiWvtw+IqeL+B+GcJpxf+8+0DNvErbvL/bOcDplunzoqtRKZWFSSp6XzA
         LyAW9EBC7jYAffKUvGMs5XtcrlnEuuU5adXiWjvdCgrk7N9IhB7T8V3ZIpkwT8OZ+1LD
         7/sipU2FAtdc5vhLDtto+a5ZJvEnVsB7g+INmq/sSe70WHiPd9iXAUeAFj1xHhju+4aI
         LB6w==
X-Forwarded-Encrypted: i=1; AKwUvBwum5ngdwP1wxM3QisprzfRHSwf962j5IJrJrISA8w9rv0479Zc8W+/uhgqpRILaI9Dsh0nnxVck8Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mO59zZo1gBHy88nYvQ9/kbCdq6p2H4bLsH6lfQpHXUg6ZOwtD9
	ChMSocmo8siqDteooUCQNS3LqtRSurm+U3NaNi6yb5rXNEc1qBu2KfCcWzftHZbT7D2fDOCwi8i
	Kz4sxHNmjdOLzxgW4HSOk/LDnqNEfUTU0QmCPBkLuUJRYoNS3lGf0V8Aa8t1mfK0=
X-Gm-Gg: AYBFou1FtE6u7mHG3ufxZxiyuIvy+Oyc/K3hb9TRyPiQVw+MRzdmpTPww3qqtHjgq4u
	NfxmJGHSYxQS02Efjl1ryeXGyzm41cXpqNt0KamgVKIP+BFyhqk4GLANGxUIP/+xQlPU1jwMfhG
	h7BPEAGvWA0Qj59oKpATdHxHaAFzdWxuBjm3bXmoN8S1cHNC5oCOFIXqKqbJ3/+nWcEHui6lLp9
	RsHmCfI0ROxptTPDLDOVX7unCDu68DtsVhDBi06cpIt7WXXoKvgYjc2c1C8SbM/O55PyJ0l3mIf
	2hcPYFq6uOtsQEIE1jrDet0Ywu4FQ/lVkQ62mCqDNjEsZ93i2847KlzU146cxZ3LTDHfaqeaga8
	f5QecEtjW17OOdXkQAu9/2GzqHEwi4i9sEzZxLR5O4u1rpd0wz/CMylg1IlSiAzU=
X-Received: by 2002:a05:6a00:c1c1:10b0:86b:4519:49d8 with SMTP id d2e1a72fcca58-86b45194b40mr5036340b3a.13.1789136297503;
        Fri, 11 Sep 2026 07:18:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:c1c1:10b0:86b:4519:49d8 with SMTP id d2e1a72fcca58-86b45194b40mr5036295b3a.13.1789136297116;
        Fri, 11 Sep 2026 07:18:17 -0700 (PDT)
Received: from [10.133.33.95] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29cbb933sm1183630b3a.41.2026.09.11.07.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:18:16 -0700 (PDT)
Message-ID: <623490b3-d370-4ca9-80d5-44bb79cafaad@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:18:11 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislaw Pal <kuncy7@gmail.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Georg Seema <georgseema@gmail.com>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
 <20260909132049.37611-1-kuncy7@gmail.com>
 <fcd7eb6b-95ab-43eb-91f7-f9a0ffe18ead@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <fcd7eb6b-95ab-43eb-91f7-f9a0ffe18ead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa40daa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=4Itt5vdypME_K62fSIsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXxToQJYWQ6k0H
 XVrTk0VNl0xl498FHlPGTyLmer6Dbpkk1Yf3xOCOm4xvLJs5vtL2x+AnQvPbJFk/bz+xiBWjKrl
 k6AZEcDCHkJyMQ0i7TGMWnByLmq6Wcs/HXTCQX6cL1/7O5UcTuHFwcerg24VoRJiFwYNhLduIoS
 6NE4nNldRBFiDj049F/aUV9rOQ5a1tCHj0T0FFTo46a6DhFq3/NPvAYetu6RboCPbiiVWk9DzEl
 kImIgQ4h2aEna9UBlOtx69P1cGwMcP6LHCpV1MojuyROyBbqI6zCrQsupWYiEP6X+HDvACJ+OUz
 ru8hh8yHaZoVRS2xGaxC88o8YPTFgh4rhW/JaH1WRntiSKW8HH+2gU791GXqKdBQkzrH7jZCLCu
 fb2w07CkDXPk5XSlXdkYSBRi0RZbwKQLfFf5ESoicPYad9tlERNdESsa40Fjr209/vF5Q0siGkH
 XMoT1fIfNUN1Cr8WqXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX3U1B0kEEVchw
 FR/54CIo0m/i3SpqTkzRTW5LG12iyPj848FGaNxw8OaCSA53EAf/IlYVUn2QPIFJ4+AAg11dDou
 E3tdXEogyHLLmfeLfGGWhlMjeJlUK8g=
X-Proofpoint-GUID: hq5eO3-SFUA1kXv6ZXdypyb7HHrTkvJH
X-Proofpoint-ORIG-GUID: hq5eO3-SFUA1kXv6ZXdypyb7HHrTkvJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200



On 9/9/2026 9:37 PM, Konrad Dybcio wrote:
>> On 9/9/26 2:12 PM, Konrad Dybcio wrote:
>>> Is it only the UNIPHY consuming the 50 MHz one?
>>>
>>> What consumes the XO clock? What consumes the sleep clock?
>> Nothing in Linux consumes any of the three today.
> Yes, that's more than clear 🙂
> 
> I'm trying to ask Jie about the platform details, to which I
> unfortunately don't have access at the moment..
> 
> or maybe +Kathiravan?
> 
> [...]

The XO and sleep clocks should be supplied to the GCC. We could try
adding the GCC as a consumer to verify whether this resolves the issue.
