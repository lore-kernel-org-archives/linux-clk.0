Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C163F8898
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724358; cv=none; b=TRgvprivgSP7aPPSzDS+Q3rcsrjdtNJbxPDO7PhgXAgoRFItiaIybsOggAShtlH4471Wtl8SZeQ2lBYrJMvvMjRquHe8TGBTtY42ZMOcxW/zyD2ptqLAbmL7QUL9gPlpHyQpiEFp4XOImgd2jmcVMPGbQRNUj8UIWJrAM1OaTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724358; c=relaxed/simple;
	bh=9VZyRGE5AG6+PTN1ZQZs/f/CAnfSiRJXvH/4u5hljWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1cHqg6EpLaHw3HV59/k2iIe1PBIydF69Cw2JwSSpOolUsbLNMeuYEmUc92a1Z9NNtZKep8raUd4Ss/pV9H7oGYRltasi5NB/S9YnNYENJ3JNrZoZjhuqSG+CXjD4PMwvNl9OuUfkUVS38Ie7kkOZpO5AropHVJkwOmNMezlk8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYVGprWe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRZwxNt1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYVGprWe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRZwxNt1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9Hh2v812882
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=; b=QYVGprWeihFbqW83
	aCIbanLQI2+Qhgi6/uwAWU5Yz4AJ4UPi5hKNOdN+twvSABG8nHRI7IH9TYa1EgJE
	Q3COLLkTvO2/1Lhl5bCxwqKNlbflhV8A1UKaAqkveV1lX2LxsOos2v+K/2ecS2Bf
	IazAqSrIeaR7z6vcguVMzWIxJlhsGA7Pz9LSUayAEtR6X2AvGP8VtpFyQChwL2H3
	Ssgkb5V6Ep3MT3FVCdGhIjp3YZc2gY5H652uIAD5LU/93rWorCqnwvSOk13aqWFo
	YxSIAYeXqmmvmdzxqvyiSVQ2hxxRLSPKK9EtqQ9kVaBXGpmiA87+KlSsqh7+ppdl
	K+E6Ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv82qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 09:39:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso14201685a.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789724355; x=1790329155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=;
        b=jRZwxNt1FrcAHwDzHQccnn2XfoGeUuir3TIGrLaQyrVvMV73PNfWtJWHytTFxHMAp1
         y8e65BEbOJ6qXpPkavfodMKIC/rsK6HdC/BVNnPvaAgY98zv9h3MZLa+hpwSz3RX9u9c
         UtRH8IfGe/coB5v81jFP7N42O7EMbZKQhMbWbDCpOAN+vYPlPd4K6005MycVXTPdH4VE
         GT4A4y+bzpQou3JKiHyYdU8OCQNp2O/nxyHrKHXnfYk6udf1WKRGtZqS8i1IP7gP77os
         XXps4ikWBuwYcHlg7btG/BDhlnz+2HSEHo3Ps7bvid9U09zjkEwiF1i0JptiIebTLmeE
         miwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724355; x=1790329155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljbnXfK0HSxtYi88q8uk1kj233fQBjiA4iMScmH5ED8=;
        b=oPxEGj/kxHPnEYaMqtqNUjYZIMSXcLDBX4cQQZZe8Td5rDvwcbbV7zaIBWyhaig+mp
         nDjCWIoSibWlzHxSwHGIVZYGwUMQTPIuwOn3hN6rejZlycBEAEG/PylJWMLj1f4PUnxh
         rUVCLUkYB5Mmxjmn4jWSneGOoNIaAAkVAVsgtO3ihBtg8dH3SK9sUGN7nu6MyEuwQzpD
         I9f67vFTV4ehcmextqYZBg6NTwwry4ASY8LvkPo5x11D50K8bckPCoD9xKqXHI5HflSh
         tJfIBJ0bru/3NrpEo4L9xFE7kUm955gKVZyM9Acy1boXfR8Ftmrei/dAqJ8ZZCXuBGg8
         7WLw==
X-Forwarded-Encrypted: i=1; AKwUvBwPU+14XIO8fIA8feo16dFyK0KgATFY3iYXklPUAMJ5951CiFgziYflfUvHws7yI2eqybd+4e5PSK4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6mtrQp2RZDzs9OMmorn+ETqSpo38H/5QAztK41u6f3xbnELdJ
	roPx1Nk5KP6HRAYTPk6V1/+Uv4Ve98+XBszr11O4q6NDmniY2u1pUYSugo9MCfBH/gdxeFilyJe
	1N8eP8TDV3fPPZYDy3k5jrMEC7S88hcMdTSGE1kMMBtSj1WYPi+6dh00FitGItLs=
X-Gm-Gg: AYBFou0+EC/z6xnvRJ+mzladQIS0ewBPF8ayhAMmzwmEiTzJaJefxhLcaYgdfKkZoNF
	pSRYOhgbjEQs5xHAPH9AQVuGGKUcp6cmhju+YUabwGPxKw8hrYkgg5nMqCrTqLtyUXGchQJ573f
	BKybumnANU1hWhO8I6R99o6Geohp5lv0AEIfPn96P0haPBeS2fZtn15kDjFNZQm7JXoxbZOs8W+
	MhsmYtJzcoPbY4k3BYDhH8UTZowqKFfsOEVmUJFap2JVlfXQG3iKRpaNhBeFPhIusj16bcqwUHo
	eI3mV3hBJ3u6epxgFArp8E3h5NirMiLWmyqriCVSkXy87iIC8joJhUQS82DiKR5FZiipPXtAdc4
	dZH6o+nfnVgRVZPXh4fo0MA==
X-Received: by 2002:a05:620a:bca:b0:93a:14c:329c with SMTP id af79cd13be357-93be04cd56amr164941585a.1.1789724354785;
        Fri, 18 Sep 2026 02:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:bca:b0:93a:14c:329c with SMTP id af79cd13be357-93be04cd56amr164939385a.1.1789724354375;
        Fri, 18 Sep 2026 02:39:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bbc68ffsm37355666b.57.2026.09.18.02.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:39:13 -0700 (PDT)
Message-ID: <66ed49d3-caf0-4513-9ef5-1f40b6a92ba3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/48] clk: qcom: gcc-sm8250: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
 <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfX4GWzVTG6YoEp
 EaRvRpKhROLNbBTDg0p5HThZqlYW8EQPDofOztZhzQphwUVn28lB//Q2H7A5qQFywIqLKY9Lon4
 +5ln3KkKU4yCvdAOcSYBqbiFY65wxrs=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad06c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9t_OtDgf2ifsZ5-kfxQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNCBTYWx0ZWRfXzOcVuYPT05re
 jyP8ONVTacmPBeRnaj33V8l5Yft1pKucG/KSVNAYTkTf/ne5vSulrp1yvh1RYjPz2+JdHgEBH1F
 qhXjdW274D0Q9zQ+S/rTxsexLSQNotyDhKr8b49F3RPsKLdIYmRmPsQUs9iE6X8Ii0lbcihTau1
 AiANSfuAI9izhVjsdsX0mcBMPON9YbjpktOurr+80SwEoaQh2dVjIlvIrQ5+CL70Jrwcath6xoc
 59BdJKNPtKgWDGKD3J89wT0+aLhCfonTj8DKgGvuVIWHgWwTmz1kamz1HENGFqLtkRmLcnVwWoN
 geaadkuk6JUEkuxN5pBR0Bc+LyswG4RYBNyC+t91waKYvfv8fBJIzstBPlX4eHCCsCp1NWejBm+
 cLxC51Rgt5Ke0qjXhbAfGj0DhXh7TbasOKjWN3xYAbrvohbnpBNuHzFyhiyOnldeOwvM/jR58c7
 6J3lHV75VFaPEwjFKWQ==
X-Proofpoint-ORIG-GUID: fSjggFpPq1lHwNlgbVcgIYTThY2TCc6T
X-Proofpoint-GUID: fSjggFpPq1lHwNlgbVcgIYTThY2TCc6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180134

On 9/16/26 12:28 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array,
> describe the DFS RCGs through qcom_cc_driver_data and move the register
> programming into the clk_regs_configure callback.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static void gcc_sm8250_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Disable the GPLL0 active input to NPU and GPU
> +	 * via MISC registers.
> +	 */
> +	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> +	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);

Tell the robot to do another pass, using regmap_set/clear_bits()
where it makes sense

Konrad
