Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C0139A7E5
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576095; cv=none; b=nfDv6eXvSt2NoO4LsXNpXY7VT8AGU3XhdYEk6Ak11trpcywu/E8Z+bkI5PRdwOAb67zOyNWu736fDcjTAkz367LkE5oA7UuCLa7CrEkVqxWix4YmtxQpCW8tXgq7AR7fC8F2+ZvV/4pPdDR+O9hCNwl+HBXZ7aEuQWlad60+xGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576095; c=relaxed/simple;
	bh=52Rtq3B3yetltmJYg/Jq6+ugsiX1P1VtCrsFWLjGCbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2IAhrTV7uuwkaUlMd1Y11xIgRsDw/RZFG6cvD6D0LAzMAAwp1RqumYLv/vCZLkcZTBwf82ckbUijSJvgH7upu3iJQM8DDgSscuBJ17wowQ9VryWY1J4Ma6Z+07eoHyTzj9lPTW5HD3KaeXns1A5Pxq9uvlIhh11Z5gZMTLW39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cSd8d3XW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yw+eNS51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cSd8d3XW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yw+eNS51"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C7sTI62728013
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=; b=cSd8d3XWV6tPTnyY
	qeTlceQh9goZb/iweKamnT/yd5ZL0n3jZjYDEVbDg+Bqisdqp6/ktzd4zptsR7WX
	qMkF9ozCfzf/cb4QZtOOHkdiF8dF8R16kkALmwlc3e619hoHn+5qDFGWKx9vUKMN
	urEVDYVttdIUygxhT8Upp6DnvBFUNSBQSJfzSq4zKBzLpuXfOjLSMp2LZUAD6n/j
	D4FiygpORscdB312IbtEv6E/WC5HfsUPsDDmczybY45dHabjruXH0BLdx+6PV4BF
	MqLovMg3JFYnIqemGD6vZRNthdf8/LrXQWPxY6IIxrBgUSMeuWRN3t9BmOfRvEBe
	vs8DRQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nuyab28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 08:54:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso3312073b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576085; x=1779180885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
        b=Yw+eNS51kPwcogkkB4EZECO9AYbUgYoHJq/tbEKSxqWK5Po+SK2S4YLKgcRg064D37
         PfPSlNHuTAEuYTCtXwxwiaMkfsACcitFZ2AsFhoq+6BY31QgQoX85AdzoPJq+JXqA4oB
         JCxMvwEg26Y0g4MlMs3nuk5VkQZckjDv19RPYrBccjfd8KGc23wouYyQv0b1VbtrCMzn
         urCTmOxYOXQYIPKagsHC3m/rWbRt/nixHxXPflnZkZHpoj9j7nCxSgkHVgaSasPcLcM5
         RoFJEJZo5YAkvXvfyi54ICLWCLSkiukbg25T7wKoZ7/4SxZeuU+R8Vpt0s4azp42V6tr
         3DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576085; x=1779180885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
        b=lJ/SLR5Mi92UtCo3E+T+OrkUzMoTDLbJQedYqvR2HpWtSXwBqstqPUFvAdCB86Jmi0
         WlF4RbhZ15TlFuUA45HCoeZRwUlghYN9KgnPzQx4OLsWCjZLMSgREfSH92OIkO77f6r9
         IrjxEO/PzXhpNgIrKjdOjRkx1tTxXuhaX5jgbzfDn6ZVhHQynzkn3CpmoZIxEC7mAHp8
         TXeM0cBueiLwcs1LkbDVZHrz1LSB27swN+b0ivXxMrywf4E/UKDbWh+Ugk2s6Th1W1GH
         BEdl/YZirF+CG672uL75l97wKvUg1ybNZA3FG/0cv5WCDa5cL0/2ilLL+PMsrvxxkWMu
         Zj1A==
X-Forwarded-Encrypted: i=1; AFNElJ9f+//ImYox4EAhphUMrnZ/LRGrTed0cWXiBKk3fndRA0ybKss8wxR7g7Es5jLgTNMH5lZ1XJKjIrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1ltc1cUQvkhYg1W8UDX1vnTZfQg1DmV8iN0ipqzuclDmAYaR
	BOzBarqD/MK0LUh8bRnFi4JzDhYPzshuky59tIiI6oTJeRSa1zBnZuOe0/ze4sHwN5rmo3y4ceb
	eTd2RNs3M31DwNReEqDB9+MlZfXJNigHVX0KokungSI6+/ITpA/EzKb92uDL/JLY=
X-Gm-Gg: Acq92OHo2LV+psI3co1e828PS53BGV4rkvtVrSpSlAb4T6GQjHI/ZiUZZgPhmDgDn4+
	kKJLMB0foxkmh1sMXNRfw/uvq0GtOpaddpZECl0FjlSvMuxTyD3zXDH7VpjAAXbfJHElF2H8jbN
	+RgUN9XWFeWfo0w9Cl4/vBnIRmZu8YBwOkJDkB4+ChiLcG5gUKqqbaCgH4bnfjiykI5gsds7Rj5
	p4veBvTCof7V45yEc8ilng0dvENsUHnIL39QTFQS5E6Ej4p4iqm9c9JFwTxnOLbJHUIBc+0ujZP
	F5gM0XMuzd6wXnD7mFbuOMebLNO7m+B6AWSfoMp5xGLbVcTVOTWXeeJlso9xL1g/0M5T/HPnlkp
	VFyupbWH/06Ggid6zxlLdY624lyjxa0c5VUcW99Hp4dj407fV
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-83cf5848df4mr17235931b3a.20.1778576085437;
        Tue, 12 May 2026 01:54:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-83cf5848df4mr17235900b3a.20.1778576084924;
        Tue, 12 May 2026 01:54:44 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f03bsm23389781b3a.9.2026.05.12.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:54:44 -0700 (PDT)
Message-ID: <f17c3e4b-b0e4-46f1-90aa-99751cbc9348@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:24:36 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 96MxCe9udMyyQJMeS2cEeOZqLxIJAYa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX+sSfVn4/q2AJ
 /76aaRe/j1VZXFRYWi8HE4hdQmIWfC1pAXERfjmzxJk790rTah0AL4N9hBSHW16lBQeRukLYUO3
 0pWNESbK98F0586Mk4ph+Rm5/gSsE5PQnmh9tPt6i0eHNlXoBmKlo+NRz86Bavsgy1qv1bYNwXL
 zJF1ZjTWcCxW9DA8eEX66z9oT0vaVCvy0zj6sQXLtbLhbLKCodzaJL8XQGBHhiHhrFZ3GT7NFCR
 s4Nn86fytqeWNIMJNqh+dwBU0cfMRYP6QAZ47GlpVg3QZGycr5MU/Kzg9Bki4jFZTXmimsMqucT
 y9+8S54rTm6BNiFHFjRPQx6d7PGMgHQGBbrDSVLgwSKW8PB47owSyps3nwftZa7saXRLj1v+dDY
 u/W7xXfchUwxytvWMaf8fmnXKZ1bKlxZtRh0+MEDtNP1xAvqPaw5EB4FPqR2YyWttP9cloDtvWp
 M3j3+OSAaztuM7+PPXw==
X-Authority-Analysis: v=2.4 cv=UZ5hjqSN c=1 sm=1 tr=0 ts=6a02ead6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2Qn1I_tgzRFu8vZVKDwA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 96MxCe9udMyyQJMeS2cEeOZqLxIJAYa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089



On 4/10/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:44PM +0530, Taniya Das wrote:
>> Update the compatible and the bindings for CAMCC support on Eliza SoC.
> 
> I do not see any update here. Also, no improvements after v1 comments.

Sorry for missing that update the reason for Eliza not compatible with
Pakala. I will update the commit in the next patch.

-- 
Thanks,
Taniya Das

