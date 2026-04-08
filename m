Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8EF38F639
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 07:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633196; cv=none; b=u9AbBIRc8rTffeQ0a3zU1dNn0rbxasPUzZuuea1l5j/la/MohY73LRYMWPg6GjqfL0l/AdPFelUdJ9CzZLiAw6hTi/3+xZAWIcADxufxqtOZ39/PQBV5NFrDaV1dM0Dla7adWVvyVKxEH9eUmZ/0CCyIerknf3F/M+nIJ7QxGa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633196; c=relaxed/simple;
	bh=Ybsw/1t2E37KzSsbUyVwYRciOKqxI4UFk66cbCzpYzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgrhlFOeeeaYhiK951Y4RGABFIh3r0Y6+bYDqyc+rrJ1Ts2hJgE6PqFEXkMOygAg6R8rMztgMHapl9BtUm5I8HEZ2UmGrgJEw6rhwtQG0yFswzJkpekTIpWe9AYYtPt+rHOSGlQSPCFI+EaobnbHKI1sl1ukfTiYI3figDhi9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5g2CpXR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fV9ig1gJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5g2CpXR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fV9ig1gJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385bC7o3362742
	for <linux-clk@vger.kernel.org>; Wed, 8 Apr 2026 07:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NHy+iMr3Xqnr1XEITbbqSi8Jils/yDblCvPpvjVgONo=; b=D5g2CpXREiB8xYvp
	gQYIZLSZAb4UPRwCpFw07wMuDmOY4Y47vWCtOtPVzhoYS0AcFT6MXfCbGec4BNvO
	lEOfSfzOOvtn0UnrJ/SGp18CRgthWEiZIt/5cv6BBybRtlCObEfh7I9eJA+lR6t/
	aBtzO/8RQ9c403MUYNlT1JnfUGniPelMZcMbj5h5ZTLDyQzQxWpq5rkdnqIJDXO/
	xdU1bM8N3ny2tcQ7swPECrcLEjv6qvCxBkxNu7D0P+eud+mT3YhrKGN25vjLK2KF
	P/OToiPeQOIhO4QdyRTm9iWzKyhmAetkoW7zfSb41t+069PJr66EW52b2oFrJAYf
	P+3gsw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkj36a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 07:26:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82cd9fa609aso3652669b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 00:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775633194; x=1776237994; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHy+iMr3Xqnr1XEITbbqSi8Jils/yDblCvPpvjVgONo=;
        b=fV9ig1gJwSgcIDpTcT8HDWaF+I3iAevxKGxH1wUu9AKDhowB23mpskPIwnu8/sS8u8
         k6GIAaLokD44JGLVqiONERRDHTvprOhybp0El8Tsj5C/MTNSJzis3fiEoJ7Zfvaicpcj
         kjnI3Q/dakXzBXQQgDprwwKIAmMeBdsSbyrIWIMqRrnqmOkM4b84S3ZiOHe0ry3ONKls
         2beroHLayEYX2zlrs3x5mGDjJStrTiHVYFuI4ovvYF2SpXKtrUl5Z7QofyJtgM64RFz2
         Du64V/m3S6xER+kJ59laqcBJ/RLOnT0MPPluXSWkCl0KGLu1iNDFqKGZa4x0s+vVJWQt
         RUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775633194; x=1776237994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHy+iMr3Xqnr1XEITbbqSi8Jils/yDblCvPpvjVgONo=;
        b=Id6HrGXfvBWDwCztwG+PnUqAj2p5UjgtufUeTcRFlGH1juUC3hvWl6fxk6xCmHgygI
         Pf11ylcxGeWWgMRwQdLGuJ8b6PtEQzxuA3H9rtj7GdjcbTrRktXW301sDjrQA2K/1mm2
         70PWD2Ym31LFGUQKCLfpg86u8XPpTaK7AMhEw32RCX6I3Mpd1xS/EkSshW5fSXuLsP1H
         hFtI0XMEpk5BGAR6KpYGqlAsntkwrq/izw2F1t13ym+ntPTqfM8HAAGAYaVSEc2yGOZT
         1Mq1hHoY/PRuEkyHMLHB38T/gchL8anEZpg4QgafkzddB0Gpoz4FoSUVtJTP6eIPGI7E
         qUYw==
X-Forwarded-Encrypted: i=1; AJvYcCVTdf9SNbjKQypKImthRzMYqphgWDyi+4caPG/SXjMhcxmTbf9/Yc6zxHS2cxBv4XRku3SWDXfV8qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmuKVZcFrxiPQAqusCA1D0qQTet5HhVO6CogjqTMUNJhjo2E+
	mOLL2ijjf+fcKXmcYK8W01V+BBXfNs+xRSW5I9mxFmb9KhcGACxmz2rVCdRX7rWrFhFkmtYRp1Z
	p048+cM2opAXTWrnCnDgQKJKWQK0pezmGl2JnTTVsle8f6XQexMNIGY6384b40yg1183/hgE=
X-Gm-Gg: AeBDiespDlEFnXG+xh0IGE2WVJGR9VAeANilKe7lNOl/6yMT/TOgtoExLFR1vAVBYgf
	wpMGV8ij6qNCAD+54AG+mDf8XXxZxiKWKMGqx5HRiPhb/ANhBO79LsmdzrhbMZoIIj6fFdIgJqK
	KgxNU+nTSmW9d3UiDFv1cTjO1jcqrMPY0XL47sDoB/W3cuBFsPw03SumpWoevsHTjDl5u8RdrV9
	ym6vXvohywqeDbc3K79DqLgQuDRukb6qVSC7ys96BHtWluVvR1SJJkwJLW8pXw/i7LpXZtB1WXr
	ciIeslmF9vn51Oo0KlIQNoOXFeDeqFslsfNLTELXIMTC3wqA+S531OOFanU8Sqm4UZxRQc94r1l
	LUWfAE4hLmVLp58681nds6vfndQjaqlsXJvcgM7b+lzZfwhXeGw==
X-Received: by 2002:a05:6a00:ad08:b0:82c:77cd:50e1 with SMTP id d2e1a72fcca58-82d0da993b4mr19225549b3a.20.1775633193562;
        Wed, 08 Apr 2026 00:26:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad08:b0:82c:77cd:50e1 with SMTP id d2e1a72fcca58-82d0da993b4mr19225502b3a.20.1775633193088;
        Wed, 08 Apr 2026 00:26:33 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c68273sm24431255b3a.41.2026.04.08.00.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:26:32 -0700 (PDT)
Message-ID: <404ca234-1bab-4094-b7dc-c4d0b072d929@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:56:24 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: gdsc: Add custom disable callback for GX
 GDSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
 <20260407-gfx-clk-fixes-v1-1-4bb5583a5054@oss.qualcomm.com>
 <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <6149513e-2c0f-4f01-a467-b4a213d65609@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d6032a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=RnFGxym7J1TeeuKG4B0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cvDYO5PVdai_N3tbWVX9EZC0R0NBnwTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA2NiBTYWx0ZWRfXwyUE/ocE+8Ts
 g3LvRj0+PExsWuHekmPPFn0uLqiFzpL2k8cCKfvD6N+y4pP2lHmIkcJLpDFCQIYSS1tYT+j0S5M
 /Hs94ZYXBT47FQ9cseXmpk0/XhsR4+6/qZ6FlDL2ndQ0df/JxE5jxjXWLcKU5t9dN2xR3b8EccJ
 P49AG4/JDg48r4utMlcaU3Qxf9im/H6Xhc8wmx9v5kuNS+cejDl5SG0tQN6T+unDcjZyiA6AKTQ
 R2fjYzdtrWZuTcQ1uGxcE97Jpo/Ew+USWmQawLN1PYfurZhM+GyQRwLVv7cQ6Mib4YG8i2gW2lh
 LMvDfJubtd8pvhj35y+JU/0cBmMlbXECwtvamKzvhz56QbuWd1IYxfZq7batvpx7EorG1s6WHDZ
 ZvJTNfucDpLiI+tRzMgH6M8vN6o2A2wcUUER3+vUjivyOFiZlupJWS8XSrJzUELUkTX/zeP56Ow
 V3WT0qYVGmV3rCW27DQ==
X-Proofpoint-GUID: cvDYO5PVdai_N3tbWVX9EZC0R0NBnwTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080066



On 4/7/2026 4:26 PM, Konrad Dybcio wrote:
>> @@ -675,3 +675,25 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
>> +
>> +/*
>> + * GX GDSC is a special power domain. Normally, its disable sequence
>> + * is managed by the GMU firmware, and high level OS must not attempt
> nit: "and high level OS must not attempt" -> "and the OS must not attempt"
> 

Sure, will update in the next patch.

> 
>> + * to disable it. The only exception is during GMU recovery, where the
>> + * GMU driver can set GenPD’s synced_poweroff flag to allow explicitly
>> + * disable GX GDSC in hardware.
>> + */
>> +int gdsc_gx_disable(struct generic_pm_domain *domain)
>> +{
>> +	struct gdsc *sc = domain_to_gdsc(domain);
>> +
>> +	if (domain->synced_poweroff)
>> +		return gdsc_disable(domain);
> Can we use this version to replace gdsc_gx_do_nothing_enable() too?

No, Konrad, the enable should be always a no-op in every scenario.
synced_poweroff can't be used to handle enable of GDSC.


-- 
Thanks,
Taniya Das

