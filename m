Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B073368A4
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911058; cv=none; b=MuczM4sXokUHbEn2Rf+/DPBanj1ZEBK93bUIw3GYMUJouF5bFh7z1DXbcE0G2fG5ldFyAk4Lvb5v790O54SteNYaTZdhAeqlxGgU343h+MnUlFF/Nky4gtnrcJLxHySLazNqvK3Y0vD5vyGqt/Smu6bay2vEPfAYvd0IvvmBP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911058; c=relaxed/simple;
	bh=7etrQsKPXJgspwHdPEkFVaZqpdV1j5zwr6oRj2zu2SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWVFRG6/t8eKU9kjDdoVyyBQBLYagSyTx6CzY4yzCNK0PDJLyAdLns/W2TAfAOGyrYWsPt5kQ0pp5i81Odrx7gt1TmdznDefDdkbqERkLi+C8VRreMbREfiVF+9KxoLPwMGa6Ok1uHMswWPy0wLb2n7bDKRjxHvxpYrCreSCt4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODHjDIc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZYuuHs0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODHjDIc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZYuuHs0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Rk4g2834032
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 09:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtXahxCwBVUjHp05LHo/UlL4zW3Nu76n6fTmD8M4yiI=; b=ODHjDIc2O3mM8acG
	azXxUkuqXinr03HIBlFcGpALjhq9CYoPOR1IL9MyubhAibE7tG+K7mdRMi7G3JpC
	4cpvGGh3Zni1IUdnfbL8fKkEv8y93n9qXWReUWdaSjGHFHnNZZcgsbJ5FNT78ZEZ
	J2YpwKMJTj5oPr3S29kdtxeawOKruogwep9iV/Z1Rxbl249g5NCV4HdfABfSnoJm
	go4hxVr2lx9nW3FehsOazyQW+vFqhhYUqOKmxthhNjurEydk1I/0XG8NLduoC2Cx
	UYP6kQR8uu+PLTWG9jZdGgEgSfGBE9VEg3/pMcorYwatyc9VAPTHoaZIT1RqWFa4
	z5tvlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4ycrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 09:30:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915a4ca0a4aso133361785a.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911055; x=1781515855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtXahxCwBVUjHp05LHo/UlL4zW3Nu76n6fTmD8M4yiI=;
        b=aZYuuHs0BAc2LJV7GEcL2saECRDyuc1qNhoGsayQ3DpGfakLE/xyclajpxIVk44ynx
         IO6Yqt8lFagQRISUz+YqgN9k/1dKGDAeeKWz1wkxpE65OOC179nXEfI9186I8g1TyX0b
         8RxNrlpLjnSFFyDVmjFzK//h6ZSBeqp3MW8R9aO73WFcm7ozypYhW3OXUtYCXdxtPHk6
         0oqjcNAjHnQyous44GQzXmCuIWKrVDW+fpysDAqZfl9HHNjPXLXnow3R3TxeJ+y7mmsj
         kU2lLJ2Za/hRO9FMa6isn6H2nZnXjYiUlW/FRvr7dplFVMGAzxPj/06Ahy4ZblMkzcNj
         Hodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911055; x=1781515855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtXahxCwBVUjHp05LHo/UlL4zW3Nu76n6fTmD8M4yiI=;
        b=EJG1JHgUbmY9S2wzEqPF6pxRyTe47WuB6SH9It0bmU8zBfFdmE8R9BL9RKkvXFoDZB
         cd/er288JOg3ONCVu36olLfLfw3P7j+JjZC1tgTrlnATtAVltoqajFEkGtM32bOOL+rj
         gEpz5mhMSm+pD6+tF1CcxnYdJQ6oHNnY33FsXVYz709k2lZLui9lpAzN9N2u8bTURAg8
         MTkrebbhhZl7wctZRAKta7Cz0WA5KS2W93yi3C8PkagOB3gNJ62jtKNdN4DTE2BzW6U4
         KAVcl+bcL6Y+YSLbcemhtfN0u3G4twUPtP9frUmbb0U6T25RA0y+y9hyMl5jTUSMJw9P
         4FgA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZOhVjEPRTajX7u3eSmJIlY2k1OMCmVK6fWMskMFhoiA8l4gSL1B2fgw1B1ws20SvYlWd+dgpsyl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNu1n1IityOR4meFyErro3dGQ1FNxgF2GtIgRUlIf0howo35P
	46mZp5Bua+ZWPpAn506BTYJwDw4PiSSmo9W40vhnV85MNLTnjVy7syYB/B4hPgJzOHsnQgdwLEB
	fbAI9+2icYkV5CwfHtSSkal51muwlYkzTI+glNL9wlk96xbidhOVCMXtUM2oExXBEuuuWRPU=
X-Gm-Gg: Acq92OGtYlUTCSrqb4LE5/yG3x86HQaYbs+n9hWRNo6W2FAIusxgQjxyiv2II4IjBEX
	NFjDgYkw+JcY4oZVe1z/2blrQIH9wgGPkszEFiLeflB5Eby8mN/buEAOzYRBvLD6nrobx1cKn84
	KddoiDG2iowhay2Nu1pSLBg3at0aHxV3nmlc1jeLqhRM4uG/3iert0NqF3eEEWGdX2sdcWSG+2G
	8NCQHI1FrSCNq82V8h1aBoig4+dg+uPkCwW4msSlmMGIj/ss+Jm/kt7Z9ms+e+93iMN2CG7qkLF
	VR9rHpRruvpIKaJU5zrpX1HehzL0rOzGBHbtB4A/TumQ4oTwAU49x7um/hy6oI3xmwE3afP9gIK
	3130wKJSu7t5kjAV7kGCyN34R49kZBgqpap0sPvKSB7rTj34sYDPHMQ+q
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1429086185a.6.1780911055438;
        Mon, 08 Jun 2026 02:30:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1429084485a.6.1780911055004;
        Mon, 08 Jun 2026 02:30:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051a5sm847234666b.35.2026.06.08.02.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:30:54 -0700 (PDT)
Message-ID: <2bb65878-99c4-4f18-8631-01fc1c60a05c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:30:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: lcc-msm8960: re-apply PLL4 mux on resume
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602045002.290918-1-github.com@herrie.org>
 <20260602045002.290918-4-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602045002.290918-4-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UgmNN-VluF48bmVGa0LLl_gIoi3_PNFa
X-Proofpoint-GUID: UgmNN-VluF48bmVGa0LLl_gIoi3_PNFa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OCBTYWx0ZWRfX9XCUs2XMs35t
 UVIPAnghjvmUgZLZhUU0LqRVCMAHgTpwGpRCegcC7hfB1YmBC7rTRrA0BiTR6zSP2oWmLLmKvOt
 rXRZIIaUOp2BnwCcTHq09eXAhYjfQ6bsyBnnI7YDH+GMhhPshwr9OoiyuLdIy3qpKpLkyRsdVrD
 shXiJdCoNIsPIKVHuzw19cPZ0m883pd1wzVt3Dh02sPMZVxeDBjdxt37HUSlKYEmO/juGjmLwgD
 IZnceKIg1XXwUIZMhv51jEz4ltQjHWgaaCMvaw7HDGrklramnvNybAu9GXBDHp5zbuve8c9NxYw
 9a4Y9X5ty/J/qU+R0OKhQXY2M7fwBSjJtF+jNEOaAckcq/qz3QDdGn6hBh9nnSt8kar5QUtl+jn
 0HAuBXW5DnWxMz1BAY/sx0CtGhZmhSLa2xJuVUyBy9PeL3PlRsUwT1vzg4gL8Q0K12EiDCcKvLO
 y2OtdZp40Ggw0sRi/pg==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a268bd0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cTwmTnRGAAAA:8 a=-HJkJ0kcVolaLlqfqt4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080088

On 6/2/26 6:50 AM, Herman van Hazendonk wrote:
> The LPASS power domain on the MSM8x60 family is collapsed during
> system sleep, which resets the LPASS Primary PLL Mux register at 0xc4
> to its hardware default of 0 (PXO). The probe path arms this register
> to 0x1 (PLL4) and the rest of the LCC clock tree assumes that
> selection; after the first suspend/resume cycle every LCC clock
> silently returns sourced from PXO at 27 MHz, with no diagnostic, and
> audio produces wrong rates until the next reboot.
> 
> Add a resume PM op that re-asserts PLL4 on the mux. The single
> register write is idempotent on platforms that do not exhibit the
> power-collapse (the mux is already at 0x1 from probe), so it is safe
> to run unconditionally for all compatibles. Stash the regmap in
> drvdata during probe so resume can write without walking the
> clock-provider tree.
> 
> dev_err / raw errno are used here (not dev_err_probe) because resume
> cannot defer.
> 
> Use pm_ptr(), not pm_sleep_ptr(), to assign the dev_pm_ops pointer.
> pm_ptr() is the correct macro for conditionally compiling the .pm
> struct pointer based on CONFIG_PM; pm_sleep_ptr() is intended for
> gating individual function pointers inside the struct on
> CONFIG_PM_SLEEP.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---

This seems like more of a workaround, but the aforementioned PLL seems
to not be registered with Linux.. what drives it? Is there an ADSP on
this platform?

Konrad
