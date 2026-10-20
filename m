Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792477823;
	b=XW6wSaeKnvpdqYtQTAZtvXbqE8+e3FpwRoUM8YPBV2sfTpfQ+2U7ytXIXkCpAfV2KbYg
	 Ow7jjFSES8iDvdqWks+AqQfPf5lf0TOHdBF0rlmIB8n97OhkvXs3EqzFFrdtEEBs7aS1I
	 vwqhs3hcMf5tslG/fkl4pAVvYw/YJ5LimPvAG6TUUk5JculwYTpwW1zzrL/6odFHwVj5Y
	 tc5KKUNBX2b/2XH2BOcH0xmWRF3oktLPzJpqy36laWjYLKnrpKs78zGTe3ezzPEmsR+1B
	 LRUJvr2KaZ6t5tZNnaGBU/8mz731KxUphKfB3IP9Q9cDcBXYFeC//W7Fgpkxh2R/LMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792477823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
	b=ObaNJfX1HcGUdk1t2DvXNShu9W7Ilny1xHsNUIDxfPfrBM+tXVHTEUt+BbEWLOBqX8Dx
	 VjMgvoR6zDGBiK0pEqCKPnEPErXmN+aOZ5QxpJ0KM9jH+uFKaKaB9S2oTDeaCIBkdfAgK
	 FFYANr9cXdNV/K+VuN5TVaXV93twMkZXRfUHBiw51MS5jmGK9PucFoSd/ecf7cJ2SFEkw
	 zVbXv7CxEiKuYJIx7LdaopV/Ng4WVth8rI4aBeq3DHp2rIshgze5vBSUnOKzpy+cfIXV4
	 U7iiAPJrXp7XPn+WoKhksiYvuR5dFl//uNM5xjyaVRxmg/GMWo2hitDKib4iPWo9UKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmmpDTzX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OrpnJa/1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E8606A321
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 565E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BmmpDTzX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OrpnJa/1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tBUe2877674
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=; b=BmmpDTzXNc+YX4st
	bfe/NK2/6gFZ4vdG1tyysppxiH7aai6xMjWcsJrYj7qGW3tmsHtp4wC7y2cg7EfT
	i90zz/I9Oj1mq5SA3QsTBGdRMutye2yOnUXVBNWpqr/X7QujmY1+hygCKkVS6nPs
	1aqRNYQwXNVM5Psv2l/yDvpqBw52Ucr74WakHHhfxfLfMiCMTfzRYFd7Qs8SANQy
	8pC5f+COiz5ScmO/Lo3xQqo8NPIKLfX3F0v8Xf2nLNOSTKrQy6MdwhdVurjWafTo
	JM3UTDMxJED4vimMW1OOJm4nL9LUiKbvau3ddjQJfuWmWLhKj9HyjsULIalrPcv3
	F/htkw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ps5v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:30:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so105266085a.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792477820; x=1793082620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
        b=OrpnJa/1RfQTQWtVKVd+9K+TeDF77K3v5UngTSzUdHZLCn45jbYaFRDRxQZq9y9yQG
         zubdwksfx+KwJmrg/EbXJnv9W/OZ5dLTfZomfyc+ldWt/W0BATsFFACgYQKNcUex1+EM
         rgyysjmXU/+pF1ZxQdE9J0DaSgFsO2uA+Tg/43Wp3VVbU+MYTth2doQyhd0EpBmMIWok
         xw1VVAqPAoOdt5Pmw2SxC8tVWTptE5BMVLGE3+ThjrmRV1hU58FukMQfq2tB9J37uk2g
         q/W0ivLz1XWPC3mSZbUctf242nQLaTpdogHf6CXxnLIhREMiBOL9MRXIQqg+m1nRQgXn
         aRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792477820; x=1793082620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKPCIIT6M/fMZi6tJxyHxHDP0VxtrN0zYyqL+KEmnBc=;
        b=b3BVejboRTEiAMuFWTzZywKwFK0psc84rjtx7RSOpJ6eDeQOWIAZ4m1dP89VvY6ulY
         w0x0HQMtlrW8yRD9S1YlYgpEuevNSJ7hnhLXIWmtTwG5TNMQudaFDIBtR9UUaDAhnBFQ
         CG4zSkMLILgDc5SLG+AMXuWiGIJduUPYKb4pf1+xZOWastFtTgkjpz3PlLxrLYscUMJ4
         gV4Dj7+bRHB8xAQIQLhHMy8H46sMUu/payTHQcWFoKEZCJCR7OvPLlvvYvkRUPh/XL9l
         DdMlQ9xTduwxPeEavO2zlyFD+2CmYgFI+4klo17MJR9roG1c0B1U5gjpjp8vXNVbpt7e
         YqFA==
X-Forwarded-Encrypted: i=1; AKwUvBx2CxvHIxL3Ql/kDLqzW8tRSK5p+B9wkzDLkEAWnKEZAk35AF0eWIikQ+hyvpYigJqtzyC6YrZkz8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYILjBAcGaAVJxAPEJxa2hHYxMLatZvxOLTNOenRuar8JPshajI1
	ZO/KKrf5RSTw9w9T9jVRsobyy+iB3zijXfDAW1XIEOgoDJ2S6TvPn9JaW4/Ci1xy6kFO7PPxlV2
	6kREJ5p9bT296iN/N5fKDeTsEUj63oBHSEyTtVxFKQoqy4FCRYUDDASh0lkvbmUQ=
X-Gm-Gg: AYBFou3ipsMdeDclWjmVv8ZtShMEByB1JY/Wanz8YRI4A9cTKy9OUUVa7v/kKhDuJRu
	+BHAJWtlyIRZYlEtMKg2XrxTS0HiyFYbTG+7jSqIOh4twJj1YP2A6PPdIzLCzUntH/+zP1eJjSw
	lgqp3mpaJFSxU/UmFnf9kgRgtgZjM3deE7ux5X6ksYsJHRDAmQEpUQnqNwO+dIPHfrDGF4RjAWH
	2T4YmFL4RdR0fVg+mNLMy5RjyOsvbAzxfP2Ez0fFdam/SyD6dj/PyPyXec/b0KMQaD6sSLIZjIU
	1t5MDjKXO5mJVN8Z9V7/i+ao3f1fr+yZEC4LeMxshrV5ax7GnE9Aev0iunPjApWgGDJFPMTrntK
	gYBZZ7SqX8FCpN7fRy01IzA==
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1908557685a.6.1792477820444;
        Mon, 19 Oct 2026 23:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f29dcb869mr1908553885a.6.1792477819882;
        Mon, 19 Oct 2026 23:30:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf72asm458746566b.18.2026.10.19.23.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:30:18 -0700 (PDT)
Message-ID: <ffdcdf4f-2c96-4c8c-97e2-808f94b59aa4@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:30:15 +0200
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
Subject: Re: [PATCH 01/10] clk: qcom: gcc-msm8998: leave the GPU BIMC source
 and SNOC DVM clocks on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-1-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad70a7d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uh-2cw-LvnS1HXWvbVoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX4DBVXjWttLMe
 WZALEJwVfHJo7Iy2QyKu3Mv2cqGPrK3e2Hy6genji/Rsp9OM4nX6n4eXiBHkJNrhabX5sc8t7s+
 9fhzJVMjMSnBKG9Jh/RPlRWERo/7praJ0vfC9sr6sSxdPWGWOKo8aOk3VjxhYO8pFtw2UNh2jID
 V2uhoRHxkWp2RtwrYrYpEsuNyb0Ny8MgA0X6OHfK6r0vMtC3RLv/MG3H3KWLsLKtj3DVc/+r7zy
 aPuz2TkiZUKzlVS+qPxgUfUxGHgLuA68+5ROvkWJbMAj57XnG8cOhDlvnFMBwRuKKvHnd3SDAEP
 lOGRZ7wDMeQz2Tu1gqMOHeVlyWCrh02WDnTb2ys9EV8HoBAaZMCv/92AUr37Y4zV2CQuVSkZaqC
 PM+3k5pOiHc7CBkBkbrUJ+sYb54fjx7KzhI4D2qQRVnFAJkMYmDZy9jK/FKm9Udfy+f0h2ifJvN
 tTuYTz8LpVhI1aWsOZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNSBTYWx0ZWRfX6QUeM0NVkbqI
 g9S1ZvJC5scXnpZBzyu+8Ky3Mdxz7gpsi93lfqUWww69mt5Fuf+tcrrwlocqBmGy/aIM+uz2eeU
 ZwWJNncoyOSkLuvUkNqVBMeaGoJx66U=
X-Proofpoint-GUID: 8GUF_0prjalt-u0yrKSfiBhXThv6tWpw
X-Proofpoint-ORIG-GUID: 8GUF_0prjalt-u0yrKSfiBhXThv6tWpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200025

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> Booting MSM8998 without clk_ignore_unused resets the SoC shortly after
> the unused clocks are turned off. Nothing references
> gcc_gpu_bimc_gfx_src_clk, so it gets gated, and the SoC goes down
> within a fraction of a second, with the GPU idle and with or without
> Venus. Listing it as a GPU SMMU clock does not help: the SoC then
> resets after the SMMU first runtime-suspends.
> 
> Downstream registered this clock and gcc_gpu_snoc_dvm_gfx_clk at
> first, then dropped both because they need to be left at their default
> ON state ("clk: msm: clock: Remove controlling some graphics clocks in
> Linux"). SDM660 got the same treatment, and the upstream SDM660 driver
> never registered them.
> 
> Do the same: stop registering both clocks and enable them at probe.

FWIW downstream just leaves them at reset state so it's not exactly
the same but writing shouldn't hurt either

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
