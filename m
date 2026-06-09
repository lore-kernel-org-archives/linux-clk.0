Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666C41B347
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012685; cv=none; b=uIPmHxENJJ3Yp7qH/XIhUJwTa8pTvLDIRLVBkA7LZiHAPVt0pPH0YVM27EGlFfdX96wLC2SOb/lpiDpuS5KuwuPiQAUY3usParIPboWxG4A/Usz79ljk4n5NVvs07/aD6hJPCd4qTcigyOzOlvtrEWG8M7ETtfHWZdtsOELOxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012685; c=relaxed/simple;
	bh=yFEUVspAipcSdEHp8C74WICFz2h3ah1KvhUBq50EYn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UQb1TqPFicmM6MMn+p+WPWhqfSjfWtA5JXUlJ2gAWZWrcGOMRi0guRxtonihQNw/j/6PxtV4bb5GGxiym2TvHpsNLdSCZ0U9Y+2QRljNhSeqNFjI1mW0XFmLqejUopqGcVOtV5HtB3sosXs5oFiXRszLJV5Tb8Z/zqhdVf0lzIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwqSz2kH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNhIreTb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwqSz2kH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNhIreTb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClG8s2251540
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elqZNXCc/AvbcsWkHmbRAiPZ3tFxiY5dxVY+KlVe54E=; b=ZwqSz2kHNMKc02q4
	i0qmxTp4o0hNXajg71aVI1YayfHWuUlW1HFlEQnpLqDED87QLxxa45HDCnfOkANn
	iv6uhs9VcfWJj5DFuVs1Yco5cr/yD2tE11B11ScjzHK8lkJmg+Lr8P6rcMEFmWdO
	Kjxt8R/vH8158WAOETM2ubODyWNsJ7gaFqHST+ZUCqBvRtiFNulCXXNN7f8H/zGO
	LNHO/FUul5GXd3xKgCY+g+gxVeE3kG9oc/bjf504nxRK/oacBa9qO8Q/IKSFnnwW
	cOn6LrjDv+rwzJUfA9KDs6OB9QAs8NmQUIpJzjj63ALYfUtM33AoQmX7xK6i5MDH
	3BsArA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqghhfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 13:44:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso150662985a.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781012683; x=1781617483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=elqZNXCc/AvbcsWkHmbRAiPZ3tFxiY5dxVY+KlVe54E=;
        b=DNhIreTbxx3qRo5Sykwd0VzqWZLLEGbJdZmXfcEfpR0VXiqsCey1h0TVjsbSPNqafu
         EHuYp8J1lqM0vp2E90ho69BpvwXL9LFd+SsNr/ew5W/HM/ygWTqh5HWBU2e0b4mrOcqW
         Ym1eUHSLKBXdk1mzPdDmYPJqjmZ/ERk6y2hnozYx9OCWxZ39Mi1bWbCE6bZjKthLrriJ
         s8rq3dmhxLHGnBu4+EAOEi3fw0DabePnkcXR1WqT6QvFFc0pulzC9QUlXAFHmIS9GZTU
         xa/m1T40XX4Q0mPvIyS0j9/BS11c5mgLaP9wv5x/QQYgkE+eykkhn+AWVFDTtG45Acl6
         iquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012683; x=1781617483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elqZNXCc/AvbcsWkHmbRAiPZ3tFxiY5dxVY+KlVe54E=;
        b=raaYbur7ChtbZGrEV1ao9rExzIJIPuvtnU72P5NFbwzY+PONkD63vA1ztUSTzYBSrl
         zYjY12Rxc5Q3O9bBKzcc1KMjCfMnMRG/3TW0apBS+8aInal/x9VuTJuMfAkbQ3nhKA1U
         tbx5TwynpHEh2/I7+5zugYmwDycf3kh+SA2K6TSuC9N7w+8tbMEcqA6fddPSYrGK45Kl
         xg8jIQkAj+pFNfcHynp5JTKVS8jrdchc907Exf5oPB/TMnhyLaJA+Mz6OjX1n5BYgyk3
         nDgJUowZHaEO5ph1gpiyNBcFrEkLigsfsjM7HVX5LLGQwT9u1E4W0zBPvn6wEE48Y1qk
         GQjg==
X-Forwarded-Encrypted: i=1; AFNElJ8A0zqRawnZdNMKwGtWCX/oYVB6NdIoT2qlbPGitOo7HGKhy5fbC49uUZfABVCHj29C6QvUTu4fSyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxNdPa8nFgPQTNqCvYYDjTv+linkD0I471GxI4vlbN1rHTj+O
	hB8qfSsFEDI+IuCl2g+af5pko8s+nLMYoUpvNIxgZ5P1jLC36c0sGh0ABUrzrb1ayPSWzSPUmae
	UF5V65HfB8eXjZyUo8x7XaOkNYHNgOO3SjvEIQ6xKvEZZwzvM+fBKJ27rd7QEsFM=
X-Gm-Gg: Acq92OFJZ7x7i4ISsCPoojVviN8LcJXh2JGt0656HQEwJDdryTnXVHbmnZJ9Lgjjnsa
	nPQj1ALK8vnjX953AAu5QdQXTAZ0VGemC/FCgqbRJOn1V9jeBvsUZxZCuPYWDzTTa/qm0tooAM9
	flH2LCpmXiwGrUM8IxT/VpsYQUtuZ/xVxz59uqAdHsgMHmkttWdbXvUsDHz9+pCLYeRX1E88IgS
	tkFGbS0RfTDXsCoWk5liCHRbex4IJ5t4/nfJjOE40xi5RuAhqwLdC4XL2I6WRgcj6q2p9vZylaM
	4bBXtZTUyRnwLly8QjNWAaD0VJNpcEtvpNXXRsWLJVzIQQoRUNwmjw99lA+qkahUgUwezS326s9
	+88FJZANEkdDcD/kSitmlZmFo/woYo/OA7z08j6FQhUbdUe82UiWwvQcF
X-Received: by 2002:a05:622a:ce:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-51795c0c10bmr185039561cf.5.1781012683044;
        Tue, 09 Jun 2026 06:44:43 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-51795c0c10bmr185039121cf.5.1781012682479;
        Tue, 09 Jun 2026 06:44:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm1046373866b.50.2026.06.09.06.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:44:41 -0700 (PDT)
Message-ID: <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
To: Herman van Hazendonk <github.com@herrie.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzMSBTYWx0ZWRfX2oBMOPKAFxgi
 bkaFT0TQuBkAtrl1TC7UVQmcA7RB3kMBohYgP7vB5Rz8f/oi7353k0VfEQu3LrujE/AHsl4pDmr
 uLp2m10/8f5pk/MkNyQe8Y3aYejIUK1W+WkfS/XycK3TJUytsdX+whTwOnnDcVehB7LJiXAlpEc
 kbAbODjTtm9wO37A4g4P50ND0n7hkEzR5klxgOC3roiELmCR/dezBRla/QXmVS5m06oEkcxBE/+
 RWfkOl2t4MjlI9tOIdFVXThROrwAuIm4hILw3l8VdXvWb6caI2cMTOWs+RxSAYiR14/LOO41KYJ
 il6ksgHRfjQe7yafBSeLN0BnZzSXPq/TVhaoQdhe5NC+665EP8OqIuKEwG5w5vOsRzErknR2CMi
 bzWrA2KP4l72ysb6vn2EUjNNJGxLtZEQ3v++vbIji0kr+JsphHjjX/rJgYGGLFUv4dpvNXTcSL9
 Ah5jMe2tkko1p/wvblA==
X-Proofpoint-ORIG-GUID: Ywz9suf5uHD1Gr7645jyx9bwDszveybt
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a2818cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=cTwmTnRGAAAA:8 a=1-bfvCXmkCd3W1BBiQUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-GUID: Ywz9suf5uHD1Gr7645jyx9bwDszveybt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090131

On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
> Add a clock driver for the Multimedia Clock Controller (MMCC) on the
> MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
> generation that preceded MSM8960's Krait CPUs.
> 
> The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
> make a separate driver cleaner than parameterising mmcc-msm8960.c:
> 
>   - the pix_rdi mux requires a custom set_parent op that temporarily
>     enables both parents during the glitch-free transition;
>   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
>   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
>     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
>   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
>     later 8960 reorganisation.
> 
> Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
> display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
> rotator. Reset IDs are exposed via a separate header so consumers
> can reset the GDSCs and individual blocks.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---

[...]

> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "pll2",
> +		.parent_data = (const struct clk_parent_data[]){
> +			{ .fw_name = "pxo", .name = "pxo_board" },

Please drop .name (the kernel-global clock lookup), this is only a
backwards compatiblity measure on existing drivers. For new entries,
.index is the best (because well, it's the fastest)

[...]

> +static struct clk_branch camclk0_clk = {
> +	.halt_reg = 0x01e8,
> +	.halt_bit = 15,
> +	/*
> +	 * The legacy webOS kernel used halt_reg = NULL for this clock,
> +	 * meaning it never checked the halt status. The hardware doesn't
> +	 * properly report the clock state via the halt register. Use
> +	 * BRANCH_HALT_SKIP to avoid the "status stuck at 'off'" warning.

It may be that some piece of hw is holding this clock online behind the
scenes. Is there perhaps a Qualcomm-authored commit that mentions the hw
bug, or is it a guess? Due to the age of this chip I would imagine I
won't be find an answer if you don't have one..

[...]

I see you have a lot of inline note-to-self comments, please strip some
of them.

Konrad
