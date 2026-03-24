Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7A3DBD53
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774343667; cv=none; b=Dxc7ArvGodTC9JHaPEHarqq2Qrm3IAJDyaJ4LUf3bGZoN7yu2BU6c02cIxZyQY2WhRJhMuecf1oFvVJXLPabUInDDFLG66Balcngk3wEKU/00jlaQ5/3S/jzyrnFpY5O+mceajvAyMnJwD9pA5dopJ7KDDHEDmHXW0cyspecTzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774343667; c=relaxed/simple;
	bh=1XDBE9N5yL6q5NLh6xhTYtrhIDGBuuo9/pJd2LX09zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ln8KQNZYidxzy5uSPg8kAaFQ6vJ9Oj0O3/ra6c64SBt3bWkETOQPov+GilmnbTcBu9RTuKxhj54DbooRqwVipGz7Qan6CnhnSdVCbJyPbz2ClTza5C18FeTF8kWk3leXH3+Dez9kC5DNyxk2F600DAv1JG6QctvgjAg/39NiQRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nir1AA0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAT4pnlu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nir1AA0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAT4pnlu"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O42jFq1762120
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0IaNJvCEdTohWyKCIT4qk+cnIi6SSrthKfIU3P72Gbk=; b=Nir1AA0vkDbjuOln
	JtWsKJb+6DiDgxpBbDh/FWUI5eYJM/4n6gYTEHusJdda4GENhoBtpqdXvKVWtmFC
	Wyqk297Gow8+6KecqF5UCjeoeplY0QDP8D3W71L5QsX7r4nLIms8AQW96YprNGMT
	O7Cb4D77T896Cx+Oc3fRpuMzyLGIWOwByqqzz0LVHdyTEJi9JsVkBuvh5QizDkLB
	/9mdw+PqyHIWXnhfNOxZHsk8MQjHA/Z+6D9+ODczYkZTA9H2zrFpm4dgal2Us01/
	SAyu3s6/qawBAjBsAvU2XNCL5UzqqDx6pYPJXKiLm+pyiGkTtUne+NjA0Qk3yojQ
	/Roavw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f0brqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:14:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a01982dc5so49660506d6.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343660; x=1774948460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0IaNJvCEdTohWyKCIT4qk+cnIi6SSrthKfIU3P72Gbk=;
        b=DAT4pnluNxRTks16mjX0QNQdjh/9oGUFqeFzkR503/13mKICRUaVvQ9KpuWQ3HHuaq
         gL87Ra47dCcssgIP+Em5ayMgoKbxTl1srMuO+slXYgIII5t60ZnbIpcDRgeMNJBokYBL
         GzZNFUSHWTh8nG1QjM/m55/M4SEhsG9KObTMLz80uAmv7iDOagwyOKX/sjkG+C78qzED
         dfwaqPdmC6lxN3a7PnHtTF2OYmdVG0ejE2CjFV8DnJs7HEtbpOHMYCNCE8CyaY2+XLrE
         9gNAnedu4PKpQbM4h5/2F9IzL62+IJgpNV75++vJ1HNt8zc/KW0lTOl+AfVfAvX4CN5k
         1HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343660; x=1774948460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0IaNJvCEdTohWyKCIT4qk+cnIi6SSrthKfIU3P72Gbk=;
        b=DXmT+k6Ng2Dzl8NSwgWzCbllhXC/gArvDVe9xwl9XBMamd4wPWC/E03V91kpmENcFP
         6WzDtZW1ewvljGIIV2zPvt1ey+Hna+r/Sq7iWcQFaMlM/wJfFKGnvT3jvtd6gH+gaHIw
         nZBMdHz1Mlq2YvKIQRtOoarnidUtrdm6C+3yElYpOapVTkuslhbsWzJ7QSFOt7h4T0/D
         pnCNEyEOxh7qMBR2RE0aC9gz1vySnzhOiUkGa2YuhKC+6TIjDqdeurvNaq1LpfI8h34O
         KZkx7Ksf3TabTkz3byoe2rZOKedsOy2lbge8PM75nBiuPATI80JnvlyOVm1XE3kgxHMQ
         8vBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXDvwBw7Dce4YfaKRCEpu2fVJX5MnalYgcWvAG/qQm5eCOglvqaXis7rmE7m/PPxCII5sQqMQwzh4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7nctgOvGEzKzfRt2Ch0d8Z6UF2F6vLg6yA0XbphWv/jU8Yenr
	/bWGmnUxu2gOw/x8SAOT1enmcegbTRPDvKr5q/es8qQ14e0/qkmgxAfZIlJxP1uG3pWIcLu6dIK
	yeKF2dFKYyNKxG6VoPZKZtaat88N1BcBvmPA27sCgOCCLN+HIpcHRkCzWXiAhL3Y=
X-Gm-Gg: ATEYQzx0AJxUdy5iZL3URHKpphQL052sDs/Ae/NfRMjWWivbbPwYgC7g3BHNv/u/sgE
	O1T82yLvYX4tG4uXHw0xT58SoDuaUaxtD16IdneGtNdH6ITJdoKOCA6NDxZp8vpyVqpXe4CPVxJ
	vxy6jQpOd/k1tMijJ1f6SG/inXPmSwSU9Ht8GRfivQUj6gw85pfDpxPz+jGjFdK9o8xPzDGyoey
	8ck3ZcNxKjDyOZczyYjmhPWrQVfqBeNvvCzRmQH92qKuTbIGWpBO2r3u0Zm50iXEHVBWDfcU1F/
	qebv7Gg7UVu0yjYueQf50OpQvrYvGtvw8V0W1AGoKt4KfdBQ3cb7dZ/sEqAtKhfR8SPeqU1tE1O
	mASTVrwezQMumscG2bu1TalNprnE3LbtttiGoWbuwHfCtMzHVaiVmyMnAgi22b3B5Z2sVkKUAiU
	5qDhA=
X-Received: by 2002:a05:6214:2b06:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c85a4d8afmr168526886d6.3.1774343659949;
        Tue, 24 Mar 2026 02:14:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2b06:b0:89c:51d0:20df with SMTP id 6a1803df08f44-89c85a4d8afmr168526676d6.3.1774343659479;
        Tue, 24 Mar 2026 02:14:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440f2sm610816966b.5.2026.03.24.02.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:14:18 -0700 (PDT)
Message-ID: <753c4438-6450-467f-916e-b8a3f1d3940d@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c255ec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lpdi1krX-adDAkH61YkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: pCqTmbuwr8jbdTX4ydKcx7kVmaBjBjp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MyBTYWx0ZWRfX42y9f6Ym9JLL
 Ug7iwtSjrZTU1nQ4GX4ns5CUmkFRmqv05fNdGcPGMwe5iNVaInmuKiMgJOg7uDedbsb7AqiZU98
 Z//3CBX+fgOvY4+iWXa9R3d28GHoY3VH5MrLc9s7bPruK6RWjIfugL3UOSVur8J74iQ6prPNaKG
 /0wHMrQ1XcvpIZhkOruvpiP68EVNkJug83KQWZqGdwNp7T12Dh7T2oKy88aBgiSXKvcrXQ9lhcd
 xbYpIgMbCMnOoWeDhCJv83WrYCEQ1+Hx+A0sHQ1TpAS1NUFFo7ikgoTziLqcR+JM/ehr9iDqipV
 e99lY6PkmZacjwcbX7VSHfgOpNLY4DgM/OcCWUbXpFtiq+AEn2kHQa5X3C779/6gSmDoo3SG/AP
 irDVtZ+sVOUUUX1RGkn7MCg4G/ZE9k4U2jrZiR4vPqG2WDdSpKI6QIRq8RJ6ScfGPsYD87Bcamm
 NVAxzMwosKoHCqXuyUw==
X-Proofpoint-GUID: pCqTmbuwr8jbdTX4ydKcx7kVmaBjBjp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240073

On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
>> According to internal documentation, the UFS AXI PHY clock requires
>> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
>> the UFS controller fails when operating in MCQ mode, which is already
>> enabled in the device tree.
>>
>> The UFS PHY ICE core clock already has this bit set, so apply the same
>> configuration to the UFS PHY AXI clock.
>>
>> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
>> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-eliza.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Do we need to apply the same fix to any other platform?

Most of them, actually

Konrad
