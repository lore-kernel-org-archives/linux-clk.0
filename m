Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC25C2F363C
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131964; cv=none; b=dyoo/FBGVlWCJJqQbVVzTfyBBDwnaxfBd1OOokSDkpbqcRqKewJiQpd8tuQVVJGu2yIOh3qMoRokaOnk/Zhv7ySdCqE0LHmn/0Z/KG+HaTHPnQ9SNcDtf0LnTcYwvsB/NA8qOtNIublWM0ms6dGYUjQarCFVwQwW6BrE/gJvRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131964; c=relaxed/simple;
	bh=/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwXM6ZjleVRUmrlNsKoP0YYFVTJqa8FHsol5gloeaVm34ndqFPfdDBBezVfrg+Ni5Vh43LkOK1zBG/RCGa+9noqvFmcEPV0OhhrA727RpQ3Cn1D7ia723B33txrrz3RYlREWOu2DMciPInAaokBQ0XjZiMFZGtFff7q1POIm54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTXtd+nN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTXtd+nN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M4BfRV030213
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 11:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=; b=BTXtd+nNVNpr1wMx
	klsf0O0myoX/Eh7pgTzydU9l6B7RNlKHy1Vv80wlAlf5KbO5TAGkUotzYZ5vIPxA
	5JkoqWydGseevMrTmvw7WZQb2zNcyxziwNa9EQwjcSoXawVJq7laeG38d/OSLP/V
	4Gz5tvrBQLRciqMMyebjJTAi4MvFOQSj07bNy4lkEQnYQ84+BEN06bFRYcmV0A9o
	heBHEHHdeF6sRbd6vJSiPYfJElyS8aP3Ba7IIMzfrpX4IdZwPa1yfkxhm1E+Xl28
	BqamLE3BBEbqUHHdFE/NOqFwTJuCLaizgifVSpljn1uxSxNSNEbqeEWXBXF1mBuu
	jXCDLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge4cpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 11:19:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6c3d10716so1563071cf.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 04:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131961; x=1761736761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=;
        b=OfOr4dZaAqBpPyJy+BZ7/vFVeIqNQmIQXLkoLEaquo/2T1ADbnfBBCL115Irgqw7af
         wG9U7tj8Mas3wcBXbGiHX+N7TfdiXBHPh+1HJlebVop2QyOFRPLq35M31b/vYmlya4QW
         aP1gI1cKDjOltR/5FpkPoctGNe63/3bQdusSJU99djFYlYKAPpEUGCOS572IxVXEqjlJ
         cL9e0RhnGtknM/sbnOwpaTEvBf/wYCg+Vh34lMxhX1E9L9zENgJa03cHHHSBI4cxfqsy
         cYSQXnoCFNCbMsLWnBIGbPNcC5RIUPM+VXUfyTIsEpPOrJdrVLAMEKk2L0PfB5LMQmYk
         0Cig==
X-Forwarded-Encrypted: i=1; AJvYcCVm0s4NLy/sjGw2LN0ixO3jPfZ0Zbg3nEvpuJ2wGOFm714r79WtdZHFD6sBo2Z7j611DIB1JDyQW7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKmJm/M2MaOgI3Cy+JF4KQoEbwfQk24diJSfdOdAd0QsFkyLqo
	Rty8O6VonSRMO+Aq2Nz0J5MuAM8v7F0PHEhvrmjhqaMAArEwKZ/IC4kS534s+fOIR3OpQsoc2vr
	7/AWJWNNhYlrOH8JHTW9qA4XuRGQHU9oAawRR+cQZ+HJjxnM3pMyLO0yggubu6Rg=
X-Gm-Gg: ASbGnctkx+DoSPQoGyWcIxk7DOO+kWYdqUcpPjKDsZsuQ+wWeuHIRQbYWjn7LItLVcO
	HaZx/7ORVsWoWsCU1JcCHlpNGQF5SuhILPeDhLyn/rjLkpFDZPBHx9MTsQ8Xte4GF3miF/rE6o7
	U0MMEvELYFwLKzCCsker6dcs11r5bQa7Amu9g/JRzs2CxT9mBnBovpkHogrAxWdAsw+Aobd70fJ
	8ZArzzkQR6eW/wns5JLPfwQeIWeT9PwmcnAqFhd8vhFcwV/xlkJz1ZCCIZcCuR1Zpx6ke6hqx1k
	2p2AeYiBwNXauZf1Wx7G5VTJ/qVS6w7/FpXWtnd9x2eGgGRZ/os6pjwNEIkW9uWQhyOgQmwvVsN
	s96uaQFGaml7BDu2o3DOjnnz0UXR7f3phzgZKTBiJlz/24Ju7b3wa+KHQ
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr53460921cf.10.1761131960852;
        Wed, 22 Oct 2025 04:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHazv7EpuQKVa2TE7vWJl88ysZRYLrTeTShK//8fzdheK7Yg9kZVd8M9zY6Uals8F4qoNmYwA==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr53460731cf.10.1761131960401;
        Wed, 22 Oct 2025 04:19:20 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm11844158a12.31.2025.10.22.04.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:19:18 -0700 (PDT)
Message-ID: <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 13:19:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX9nnrUE0rixJk
 17c5D0nBQKBrczciQBjoY/PozOBi5slvitzTzarj56bGDiAQDsVxzkDzSU+PUamqpUnBhnbTIM9
 HPqCmtubjzZPZ8VOsCKvZflz8vNMo0WxID/h1BQthjo4SOXOAdnUgmCz6cRgTCMmpWy42NWjLGx
 ZAy1Gb0cN2SBHuFV9QMokMnUdg3HR5cwMPpn39+upUXtXE+1f5sikIqHNms+b3U7WAF0K0JhmmW
 SECLb5hBGpoJSGyzP07hanFxu8jc6bAboDuhaSZBI4wt2qjKOaLCYLMcG7LGLEw/tQCNy6sElNG
 mG6CuKsqHeqVzv8vE+WwpvtVC4EYliCYwg+kmHL6AdQdFxRtXLViguxcHWWm7Va8PV3zfWFfiPP
 LvfhaxQX/22ua2lgljDg2cngH4nHrg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f8bdb9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ElG4cDhITSkplFuxWWoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: sPDEvprqGroSe3UKwFB_XUh2KP7o0lZm
X-Proofpoint-ORIG-GUID: sPDEvprqGroSe3UKwFB_XUh2KP7o0lZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/21/25 8:08 PM, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.

This is perhaps wishful thinking due to potential complexity, but maybe
we could add some sanity checks to make sure that putting things in
unused fields doesn't happen

Konrad
