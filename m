Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F08137F737
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357224; cv=none; b=a5cFQ8mHeANkgcyfdq1Zm9PSb/IjKr+X6tcJUYZ6XtYO0ncEUMciLvaItcYks9Kg0OP5B8S0ovB+9qsuI+wEhCqGQy9i43OciJNYh6T0xm3aYbIbjP4m1bUKxbqBpt83biKzhHQ1W5trRuKyTua6t4GNGpMzOo3rkiiSfGFy64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357224; c=relaxed/simple;
	bh=s3gG9bt6gIhaCHKvCQrWOYigG/n946xGXxMAqW3Vnxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkvrUParh/b/HKdynBMhYDpWyKw3G2PsEEvChrWC61c/97t570kX3+lJQUcrMo02QNi9ardX5H5p8tJs88NJVyawvgLxSdLLBjZTs3OMTF+j1+T2T3cBF9CpsCyhfDiTeNKIo6nmVZQV5UFR0Mi+qWfW7K91HlCGQ8X/vzQck/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0+STH9Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpJJJj2t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0+STH9Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpJJJj2t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99kbm3343474
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 09:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3aMD0iRX7sybcswouW7tcUH+clRIg1db3DRq2DW7P0=; b=l0+STH9Y8f/y2vVP
	xdUNUqwXGCfRbPi6A8iKNVfzNbLGaSDClGQkpeYcq62MrMef5CleR57XYHaotGix
	cbl/PfbWWPm2694mOqWxOCaZ78dMXV7qMaIS7uS0JUyNycJ074vtiTlXUktrNTWO
	nqWVIL2XMbB4d30jdUi7UkCk4OqEzdinUjjLt+v2BEc01upJPuJ4cOdMoYek70mU
	jK7Ys2bATFiTjtSH8i2ZpZHdPlGT9HvITNWy5VniUGvucoD3TxCI40wNXNASbO+9
	+HYyPBXTYKwDTyZTT/0AFMetEZNmJ/tCeYibRgLI5rB1lRzNcLPvpRJ5nqw4gjY+
	g6XR5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrq86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 09:53:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90f6e66879eso146008185a.1
        for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357222; x=1779962022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3aMD0iRX7sybcswouW7tcUH+clRIg1db3DRq2DW7P0=;
        b=kpJJJj2tvAosKaHmhoKU4QMi9U38kZ0zeH/6URpgxsT/LYoYSTaBH4lH1SdEn6lWgl
         cryZhm29uzxbIhcVQxUIhxNIYEDid3wwbtcoIHRHzK4KJWNQ/MwKYAmnZps3SDeE4vcD
         BwgsukIsh5ZlwdeT1BuvGgvqt9lt57fGr10C3rLLZRCnTEd5AKU1uediQTCq+uSq/CQp
         ujEyvQ4PWaQCUe9E/j7BOJOfVKkHfxPv4343bEb19RQYiyZMNHSDkJUWzvTm7T3dDqvi
         4tuOW7AOwaTuq4TlxhMpB9RSgnmnZyNkZuhyvgmil2zo04SuRSBjqymsVBeoWZcrdFSs
         /iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357222; x=1779962022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3aMD0iRX7sybcswouW7tcUH+clRIg1db3DRq2DW7P0=;
        b=OOxa4dZ8KqDWuL4wEHD5yuc2TQABzwakoGxeKsN1jw1lofScKfeF+bpHi7oCr5taJx
         FwefOvcvoJvrDxFlPLeyLDiHEbWN1jQYOt69CQZZ0F13Y1c3JMG0NwRRh6BDxZgGsr59
         DAd8TA72J8hx5lRAtTiahlpofNBZmZoSnP/pZ7vIozaACSpSHp94pAgzmI58B83D/8qY
         V3N42BP/ZU6jt1jXNdQbEBvN/NY2RQLSwhlux2pCOuv02vpx7VLMVZJJjxpW4ziEVgSU
         BelLGwGaQ24QxEbcY4+U8HxNXOz6MXYfiK94Tfs8J97ssXVUxlCmycniw5pDZIuk1BVT
         abRg==
X-Forwarded-Encrypted: i=1; AFNElJ/Qh4aeRey7MlbMHRgfmufyC/faQfpBeYCqMUVhcXTHa3PAws5Y4NjUjAXMjIOZfcCR/Ks1W3TrmAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQzC3MAkfYmWD8emn+C71X87znL+2t1CxUFbOfjHH6XbrVHjdF
	S09DEVwcc0o+PAyqNVl1YnJp/bZ5HldrlruQ9wjzn26LlijQHeiNpYDqd0CrOAtyEg+EQmv8Ac5
	5sD5o0Ni2oREs+xwrrWhlHb7biliCbWUlcrenQN3FfzPLS95Av6ALxPAfLdiT8Aca+5bMoOE=
X-Gm-Gg: Acq92OFVHloFVe4kxhIUT2mlg48pa3DEr066eMqVOoSv3qqefbmPrJLaaPg+DohrRws
	sNqDGaE8aBYrs0hA+wMiWktjfoA2YmGuIj6gcwW1PjZHTEUty8C5pZwmtIbI+4BKTo18jYP/VdF
	7YMuJIiS7BfQIV0EVd+p5UgB3A/4oXOKDos4SrwehE7WYFueYm23y3KK31TRbx0a4VsNEllBLXz
	4uunH32PLLsDwg78rgk/U1WojB8498ueTFRISOE6AKsUnnYM9husIKXvx8/Ws6niPafBeaKlsgv
	nS6FnWFh3OorBGASUTNTW1xp6LVWqxmvkMRPOVSGwTJE9TuB9vxBWSOqDSr7zelCDGw/hl0TsI6
	/nXUtcRVgMc1ICNywcbkFrk1XOf1UbMhzTvRJoBDCCpUEN4SR4ey+60eA1rkNGisN9I0FtMyGZr
	HtcJc=
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr157290485a.7.1779357221646;
        Thu, 21 May 2026 02:53:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:8f8:cdd0:df67 with SMTP id af79cd13be357-914a2d44cd4mr157288485a.7.1779357221238;
        Thu, 21 May 2026 02:53:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410c87sm23152666b.30.2026.05.21.02.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:53:40 -0700 (PDT)
Message-ID: <f6079442-7df3-49d4-bd4f-06c37fc7be3d@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:53:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: stop enforcing INTERCONNECT_CLK dependency for
 everybody
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-qcom-clk-icc-v1-1-1dc6ea8bdcd0@oss.qualcomm.com>
 <cbf66c6f-9418-41bc-9d0b-f1af0fe89485@oss.qualcomm.com>
 <x7v2wra6pbtxpt6t4dty4fpo5of7clt7ul2ptw6c2rpeojwbvz@xselcvmgyrsu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <x7v2wra6pbtxpt6t4dty4fpo5of7clt7ul2ptw6c2rpeojwbvz@xselcvmgyrsu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX7HCtc/9Ejgim
 RuL+q5idHEvpoqe0dUhUeCNsyJtKS2Bcg6NMwFiQFP6gPQxnDer/GdRBGYFf1RKRzx2dT7YPEen
 h7RoGAnyAHqRBK6F1bUUG5FZVAthjK4mCswthBEY5dCLtQ1WvVssnbXl4Ulef/5HCPgZOKL7dY+
 0AePF8qGfIX3YjDxvIGHYm2aeBRtMGOvkUF7PtNCnP+Fz7ahIIOTDz9x82TM+jC6TKbUjSbdp0a
 Ntpq9jXIcFsK6w1ejZixwvfoRpS4TsTtJCnXoTuQHZU3IQI0Dul8fSxLCqogtHT2KAwpJ0h+wAR
 j03RL3De3Nn1ChIDffJ/btZRPIKhEALN3869uKHpD7iVi8y+a6EZUPK+xYMgYM1EkCpgmxdj54C
 AxgifgDskE4QOrhWBR9kx4MX9ypJYlIdkW/YosTnpmgPbX+X9vxCggBGYpPpohiwmf3bBtCK6+q
 a10bciqbbnFApksxcXA==
X-Proofpoint-ORIG-GUID: NB5YPay0WNlDygcPe8_vZlJ35nIzKNIA
X-Proofpoint-GUID: NB5YPay0WNlDygcPe8_vZlJ35nIzKNIA
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ed626 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0hp0MMcYVCcYrrn_uN0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098

On 5/18/26 2:04 PM, Dmitry Baryshkov wrote:
> On Mon, May 18, 2026 at 11:22:06AM +0200, Konrad Dybcio wrote:
>> On 5/17/26 8:51 PM, Dmitry Baryshkov wrote:
>>> Only several (typically IPQ) platforms use INTERCONNECT_CLK to turn
>>> clocks into the interconnect providers. Stop inferring this dependency
>>> on everybody and set it only when required. As a safety measure, make
>>> sure that the coresponding clock description fields are not available if
>>> corresponding Kconfig option isn't enabled.
>>
>> I think this should be a 'depends on' instead, if you like having
>> PCIe/USB
> 
> I'm not sure I follow. The INTERCONNECT_CLK will be selected for the
> platforms which use it to control NoCs.

Eeh, sorry.. brain fart

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
