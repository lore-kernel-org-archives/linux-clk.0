Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569964;
	b=dMSg6YigYCjuAQMFnl7HLr5cooh1kVMY+0huQx3w/4DBUrCu1YKWBQ2Hqx6u++NrePfs
	 C/J8c9yAEiVIxJFyFT6Z7xzXGQV+Tt5HEyDwVZaQ8afhMgPJxp7ixbPpzE/bYS9kuTUd+
	 Sy5/M2XlXOIEEQOU06QJwVrpZNL27ZyUsP+DFaTNbj4pn66F61cuwxu7jfO6WLkUsDvx2
	 NXWKFKaim3hIbrZNTygwWtPc7c3CXSqAzBCiS07lksjDvB7crrC823DUXckLFdnNuEQ8o
	 SArEqDrMjEeeNCwi9uXopkdxUDmPDYjX/L20e/MToCKxPJQW3TuwEviyjBT0AjT3/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=;
	b=twqQXESE2QJ6MUmTlXmpvkdKKIxxKdyTA5e/Xi27G74d5FGXSI6nkCf+BbYJgY0UUrvi
	 Qn8Iivc0rzmQ0l58XcP3WGGQrpd53M/iWBHfeVnbu9NTZ91/g6l6RpN774oEsZMtnNkxH
	 Niya8gvpXzE+ymoSH7qHisI7IhWwoSMi0QV6n9Ep7FrmGCFkdvZT5V4BY2ZcRrxl1vHST
	 TaaguhztSNzamGhdqmFFRUSpgilaYaf28DroCAXhufmYnrb5IFItAECaoChZHTm1OBnXR
	 NnnY5dm01snp7ZRq1e0v30Okuee/V2xL513sMl++wOM+x6P3Qyscxfj6eeaKRmCluNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbSUX4lB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrdATuPJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B16606A31C
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbSUX4lB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrdATuPJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jO1M3573321
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=; b=XbSUX4lB7yzP1MQF
	T181P7q7oRydYLPC+aK6u01y7GEZqlcC5u6Wo8VgSf0Zu1VH3Et+twsdsblyvVrO
	agl2XJh/2zJGDB5F3SAtJyNxe5E/HmUERZwL/3+HitQKVwjkWyVXlHBrex9rg4FS
	bzdem3AopgTb/NDkqgCltMfeQESHVuwdFisO2T9A0VoA3lWrLQQSoDKVz3R8rC3M
	w7VvR4yyN/05TK0ihvf6EjP51WyjwKuiH9Ex5OoRllvG0ortwArhdWEpbq7Ypec2
	TU+QD2ybSeOvfWWIw6lMjiKzLI6RmL1inOPKOblfbh9DffNijvsUTZrtp7Ro6ZZr
	AjZ5aQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htqmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:06:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so14008285a.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 01:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569962; x=1793174762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=;
        b=XrdATuPJ+MTxWQOx+MZWxhDi8skZkT3qvh1finm6bawyY0qj0KAx6WSQO0SfLuSyDA
         GoAvc1NsfeFctA8s1WM0VGdYNBJnRv3Sm/CWfSC7C9v0mwVDY6ZfsxbdqL6oC/eAFxyE
         nfb6oHC6ho7bJkFxiPUYa162bebdsAqeqCbmMrZrPNYFKsnJJQvRrgr0HGmxxVs7K4Lm
         Yoz/EAxPT3yLPWgt1dvIpvSqIGjHpOWFKof8+DN8CdRhj+jhot7254VnCVecFrf+JwxB
         pEriOc3OvAh2gJk5dwiOaYypRVsM+QUUx2QOdcymMTe9JIVhx75FvCTTTJWrqS+zdL6o
         8hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569962; x=1793174762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4F71u4Qk/bovm6AIW9ALcx4UF17CCmUdCphYjwW0Wo=;
        b=ZMOw4L1ivYyKOC4w2Zh9K2bihnTqAaLpBP5uDn0X3SGhcrkh3KeSJaBW/6ALbDFpMk
         mLW5QlYnKI/i2wE4zeAAT0FE0LLrb1a3EjzILI1SAMhz6Rvwb0EXua3WCQPfZQ7PP44u
         lb/RdduRrdzclsgObdbmgfCMJA5FFvnJB4UNxjY1PTC4HlmehVe6hp2BqviW11LQCIiw
         f0w7ROEnFcRwaw9zahPHHuP46Qmqz7jGznPIc5JHiA/75IbEJ1la5ElsxhC+P1A7Jycs
         immQoMXRTFtQZdfXZEDGOY+gtr3xd16s+itDdF72H6eyDUvSMgpReXjKbQLg9WjXl8iO
         JvWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVZl+YwPoLrdGt/B30c8ozjqwOocBXsL1yfqO7m3exbDaDtun1t3nlLJf9XY5WQZTWV6td8yBkzMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPbiXjZEK6GKRbpK39mo/rLY+qMSCPSeT2SnWx5LLaafHe/8vw
	jgU3C7ESMhoBGnwQ+GTqoHgSy04CjDwco/UmDPcoW8WEpem8sw7EahFX4Hlm8gwcB+NaoGrZubs
	d9dsegz+0jN4Adjl26Y+BDaahevYLCRf7WBhnpGgZZZOkMQhbXOs1+BAzCCsS3/c=
X-Gm-Gg: AYBFou2CufZi9d1LEXVcBhxpOz1O1kgcXc5HG62hGd8p8R6VK9dhWa/tyzfsmJ2/Tfu
	mDy86+CW5EItPv4NXtDevyYU6BrHnFsWU+K9hh0JuJI3VTYY19NDdmqDH7UhRGI8p58B13+Dpa8
	DDjFogzh9KYWYh9aH6U/olPUV1MALIHyQxfnmkJ+ooPvykJcelrXqo6VwBJU8a+MFmccDNaeUYr
	XPS2LHjYgerWRlIhMfWO1jGgrCy37lLhkmm3+FXGGgzrx3faGHi6jmBFmInTKDpaBPl1cODzSG0
	BG9Jh0NQfh0rlM/0760XrNCOs8Ts1WnWbu89p3JGgGa/OW3+BhCulIm78HaZhjU6Jvo1WcwEL60
	qv9wEDgG/o6jsJ9SudMlufw==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr340886185a.3.1792569962336;
        Wed, 21 Oct 2026 01:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr340882885a.3.1792569961901;
        Wed, 21 Oct 2026 01:06:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030db3e8sm550186a12.8.2026.10.21.01.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:00 -0700 (PDT)
Message-ID: <3c5f973a-c97d-4a76-b357-09f8feffae28@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:05:58 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020065430.1251541-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8726b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=9eXLaK2AgRjqOK-xnasA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX9lB0bak5Pzle
 83Lee3z++2JeTxBxQRP3YmwqWdXgsd8B4hjEYI36oFC+azG0S8SUFBJNjkWrzTwHVZXw3/j6SYf
 cQu+NnF5NF5wSo8YMui6fU3GIQrlwxM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfXydcf2rdLciGt
 SlaGARj38zTblqQwka7G2yTg2Q10uVK+Eyz0+k9dDV1VCEQwmg0dQ7P8cEZD5N6MASIoG2NpgNW
 Na1afowaG6UIZTIkUQZCc5smc4Cl2tTHXOZ7ISIJHcFKXvdQMbLohOH8YnfBkjs2no3P8evDrM/
 sdCjtAgcrg1iBmW+eaNgt2YZcoldOKsRc5TL3xHZcRy8eJjUTf5VriV7pzV1bhbUQSdhl1AWwvy
 2bciM1o9x/dd0Z23Mvlk/wt/DU9dwZoKsM+KC7ckO4t6oLkaBC3Cs0VhauY9Y16JYcVZYwajdvy
 PtMimSsJoU2Kg290v2xcfKsqri4TbsT+46TJNB9Li1IuMcX1JdSDFfHUlTpvx34bvJe9a3vbtl9
 d2710A+nQWBrchDL2zbspHm/zRPlJqFWGI9DkJUcW4nqZ8ua1YdCHzje4vDhFgoJPhB1SNRRpFI
 y8QG0JArcUFy4DO3Fog==
X-Proofpoint-GUID: zjMhNCqz0-0cmCcpL2s5R1r83mBe5s19
X-Proofpoint-ORIG-GUID: zjMhNCqz0-0cmCcpL2s5R1r83mBe5s19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210032

On 10/20/26 8:54 AM, Julius Bairaktaris wrote:
> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> 
> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> which takes its AHB and SYS clocks from GCC, so the device tree does not
> pass them back to GCC. With only .fw_name these parents never resolve,
> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.

Because this is a "never could have worked" situation, we should
properly fix it by adding the DT references to those clocks. This
way we also get fw_devlink which will ensure the probe ordering
is right.

Konrad
