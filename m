Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93B308F23
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320394; cv=none; b=XP35ZShUc4ziQ6Svm9oVskcwU2CW7e7zWGyFcNsOvdlzleNTRCSTAi5J5o+k/aTLDldPbQHyRnvFO5gydLAtLl/S+mktnd35+GJeJLCKQORV61qtqqp1UK+FK1rTZU5JCuKwjvzcEEspI1MWhe/TSYjEPGUTSpxDEP2othMhyk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320394; c=relaxed/simple;
	bh=91hry9pO4ZNwKwdeo15BNOS4GoTCbyu8ssR+zRQ4240=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLXwVnKXhUlXOQ9JiDzgYzmOitcjugBmKhRN4IXHnz/O24VbThgKE5kezNGeOO3wm+rqnMiaNSDVkSzp9EmNbzcyKdgjQ8rnOpbM86gx34YQXkcA6HrcLoAmXE0NiIwhKGL7ZZwhsqElwVKLbVdxhLJ397p8irUXz+bCD2RJsDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jy2UUQ+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOHTQN0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jy2UUQ+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOHTQN0u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNwPx22470783
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sm92oAKENnOQEPvWXTMG/8Szy9/9PlOsPy6S0WKSvrI=; b=jy2UUQ+vmTgV6qDS
	NN8qM3z8U3nE8iYilOQUA66S7co8NHgQIgUHT5sOgHVoJc25PMUOjHHg8HL6tDJ5
	bSDa0adEnbzciyIYH2xnr9HPkBOi0dPAeCt1DxO8c/Is5n0pD1Ikw8qWAisi9rAz
	gx7IAo79Bj6yXf/3ZEqjmzF9h51VmWHXg8JHeGIElMip6cwCdiYciFjbcyNfXbmw
	RYsRP8aL+9eJz5EwUqhz3MdY+eaOl9d4Rq4SAN5zKrD7sS37chQNnGZqO+1nofqr
	o4ecH4ttUMDkY/f9VkmSrje0ZoSYkcstS03GUaEjpC1Bb7gpnwb0NnzWs3T+q8TK
	SW1BYg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tm9pr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 09:26:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50698374e33so38677151cf.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 01:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771320391; x=1771925191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sm92oAKENnOQEPvWXTMG/8Szy9/9PlOsPy6S0WKSvrI=;
        b=bOHTQN0uAytimfWY+fS1QCNv7u3y0LntPxQAnvV25N3rPPuktl+ASF+mTI041MADMu
         oRk9AACSLE61ovZUSTsi+1Ot7yd+1cM0lst1v2Z5WYFmGfPAYiyUvfM4bZoxWWcPIqTn
         O9i3TkLef3hN2zHs1g2xz55CYU8CN3+6j8fadZLDJMHk5RMjKDEC90ar/dRPX0OTIJ5J
         GdhDAsUWofyIICLbl78GzBgHwWSOMobIBYYfRPzaGg9+CdNu1Bf4t4FwNVL+n+k0ce3u
         uGXt2aFe4VTdtJIbACrtWpdwr585Nue0eQcziLeLEYheAoNGzzUyDAErJ+WoG7cRVKKi
         HCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771320391; x=1771925191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm92oAKENnOQEPvWXTMG/8Szy9/9PlOsPy6S0WKSvrI=;
        b=DNZEDMse2mlEKXpV2KfJ1u3hBAvW5ZzyPB1FVMqzWoAZykSZlZ4cE5UFwu8E+VtsOA
         skO1k5XqfA9yeRKDm1cmzHrxuhiSj/e/8gD/ZmAAlaV9ZlYvB++TgiY/0EmlGR+j1Wn6
         JLHwIu9GOd2ZM5HbNPBIcujRBBAp3JPCN6Ii52VQ/Y5Xt9pB7ZTeDNGkdX5o0etonIrj
         UyClxbo3lbSdg8KCK0qhruIwDw0ND5agHtjrauBjk/h9amhYfPwm2fsHevCQR+jUfXxJ
         XpxCESWSaut9XWIgOc7bKhGCvqkvp+3iwf3d/wipVauZovpNZLvcpQj3Y5RoIMhyHUOE
         rNRg==
X-Forwarded-Encrypted: i=1; AJvYcCXBm02uZ/KkEOTQ9hFv6yscm2eRQV3CkoOxfJDDyUMy/I+2q8oAw3HVVF3Oa+6KhIImrDVb1vtTgYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfghOjttTbvHhCIm5D6ofG0puPV3NpTwHhukdNOmPutN8I5s7h
	anH3NQs36UALqn0+oD7Zd0JNMeagM9I5jch1Bbv6zfPCq56pZdkwzX0BL0CH2NTvLs3hRzYYvkJ
	uWPUZ8Gmu3BB6JTwcYretWsjNC7nqw8Nx5Sb5au95q7Eh8dkQAyCiXgNdKOeXTVo=
X-Gm-Gg: AZuq6aIvyIhEfHapIsRgO+Du7s5+ceVsuyjly54UYUSOO2lRoiNxLIu9hPpgQy5plgN
	9lMm4EY9UH5ABMMfLHYkTN12Ovm3DrOFMDrLeI4tal60nFGPifcSnLwsylo+DnL80PV01KVpjeJ
	PuoOYcGEeV0PNDNwsTVS7lZyN++fL5HgALt0tPUxeC2cNgrIKTm/WfMX7UmOsKLdm2d14CCEOqA
	bHPDJeeSFdsvhq0PtvvNGTvLbVLiY6g8KczhvEt3x7ja/j2XcOUjpAGhzUq8QJ/UIGxV8XJvC5T
	4ISrAUZ/HTBzAlOoqOc3h4t/8YFs6tXYN5wXGHraNHPGGajyRPduAIiTAfUDrmf79BOr5euXeeu
	A/1REimvraSfotYNwWQX45HiBXJOyS0oRwYsuJ+hAFGrssthf9jlW0Sa7HCmOB9Jv2mRbdxdPT1
	XhaXQ=
X-Received: by 2002:a05:622a:148e:b0:501:4767:a64 with SMTP id d75a77b69052e-506a6a4daffmr148257281cf.5.1771320391382;
        Tue, 17 Feb 2026 01:26:31 -0800 (PST)
X-Received: by 2002:a05:622a:148e:b0:501:4767:a64 with SMTP id d75a77b69052e-506a6a4daffmr148257111cf.5.1771320390987;
        Tue, 17 Feb 2026 01:26:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad4faca4sm2308272a12.33.2026.02.17.01.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:26:29 -0800 (PST)
Message-ID: <f3394308-ee08-45db-a0fb-569d1cdd7fca@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:26:26 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock controller
 on Eliza
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das
 <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
 <cqx6t5tcshcqyof4aaeawa7gyocaokzyqjmyxgxis7xsfc4wwg@jeggol3ifwu7>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cqx6t5tcshcqyof4aaeawa7gyocaokzyqjmyxgxis7xsfc4wwg@jeggol3ifwu7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8N-Hq79rcCk7i3QAKBVTVfqbtlQJi0_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OCBTYWx0ZWRfX1z86ruYRRWf1
 npJuIg8yyrMnPoPAypvPLKCm87gWrFP5wDMBi6BMGavzB0S1MGYpDPtVmspRA7mVsBThf8I/dXP
 o+4RSvLhHskxgnZ3vx6x6W12qVHTJYK8nuokO9mFYEKysJkhsbZIm3M9sSwf4yEvwImydnrfcU7
 6jSL+/WkJNuqoux8jhyOxsA5/8pfqLrrmc9Ms9/Su/+hnal1OiryugmDqt5Q+9YkEIo72w5LB4y
 d4vROkf7Bo6NwiQg2nboNLKTZzi6vLkhDjzBi6ZwW/FvPiI6Tdn3y05kS1z40utTQKTxH/sO0yr
 UMzOw5L65pXeohrFzVRqBqKfb3NjWVvZPBvzrkwHGJXlIp7QM2CG3aQAl6Kuk9e4i4lQEOW+Zkz
 Eg2BlxMN2yJrudf1G/yTIZQgmOji4EFVAnZCe/NJ8wwom4DR9kB7IpSPZoO/Z4ZHwuhR8x6plET
 zqc3fx1CJOkkwpkpDzQ==
X-Proofpoint-ORIG-GUID: 8N-Hq79rcCk7i3QAKBVTVfqbtlQJi0_G
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69943447 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=6ZlnZXRTM0lKxT0uN3UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170078

On 2/17/26 8:57 AM, Abel Vesa wrote:
> On 26-02-16 16:57:24, Konrad Dybcio wrote:
>> On 2/16/26 2:43 PM, Abel Vesa wrote:
>>> From: Taniya Das <taniya.das@oss.qualcomm.com>
>>>
>>> Add support for Global clock controller for Eliza Qualcomm SoC.
>>>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>> ---
>>
>> Do we need force_mem_on on UFS clocks?
> 
> Not sure yet as UFS isn't up.

FWIW downstream does that for this platform and it seems to be the
case on most recent platforms too

Konrad
