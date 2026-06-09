Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F493305669;
	Tue,  9 Jun 2026 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013852; cv=none; b=HuY/XZre1f8mii76lR0A8yZBThPV4ihZ9AgvHBmcIW31gJeAnTVjRQA8lQCBv3xaBAvmRgaCgDh0uYxq/pD99URFolkPXdv/3nvEOuTOM1tjD4lEWLJEaAMJOf3npRYjGSsnxqFVBpskeNNV2+BgThWUpTtU6FIyj120I+I9CKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013852; c=relaxed/simple;
	bh=bbjtc5GvvvTbA92knYgKbd1BBf0ZxBeA3EysFoT+wvE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=e0vQwG5U4spD3uCFmK4aJMsRTfoK5U+xCDlO2JpfdaknLmc0KhMV3VbxAEvQ5iOvlbNVqeJlXord9X9elbsw9HDXCIgoRbowRKyU4zlxxyiTfKc+m6VCyqN4/xzh1+C2DBGCP0nzD9e6pCioxU5Z856xjqCgvj2CUsHqi4GB1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=Gk8BYrOy; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="Gk8BYrOy"
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gZVy556ZKzY75r0;
	Tue,  9 Jun 2026 16:03:57 +0200 (CEST)
Received: from transip.email (unknown [10.100.4.34])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gZVy33X87z1g92mK;
	Tue,  9 Jun 2026 16:03:55 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 16:03:55 +0200
From: me@herrie.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Herman van Hazendonk <github.com@herrie.org>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: add MSM8x60 MMCC driver
Reply-To: github.com@herrie.org
Mail-Reply-To: github.com@herrie.org
In-Reply-To: <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
References: <cover.1780148149.git.github.com@herrie.org>
 <dae03d8bbd4a9cf14622eff86f8f83460fac5e86.1780148149.git.github.com@herrie.org>
 <a3a6f1a7-5539-48cc-920e-5a555ba04e7f@oss.qualcomm.com>
User-Agent: Webmail
Message-ID: <21b42110743a507a47ec35b40a841f64@herrie.org>
X-Sender: me@herrie.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1781013835; h=from:reply-to:subject:to:
 cc:references:in-reply-to:date:mime-version:content-type;
 bh=0cSWmJIIpSKQ/8ADmKvzfFvfnj1ZnsJn9Iczb1ShleU=;
 b=Gk8BYrOyRb1fMqB/iC+fRPL3CCtqONCbSUER3jrC0Qu5La++6fBLop2uEMzhBntTHQNV6y
 KwltwewIfTN5iHuWhjl3rUe+U6AFA56c7jZpeThJ2GaLe8LZ6LK0j5Dyg4CaYvttUC+aDO
 eizyTFGSkY5ScOTrGpapfdayqGTPSc58BhkgpomPt2ogmCk2V1zVAeAv1BbBOBrI2NNDr+
 fJq2/chek7ka3GptLze6gOp9WgP+zvmMaYuOLoiZqgvCgzr9xvddXh4+HWSaD1MJPf+KPr
 kGSmEvvVq6HEDgCo2owmtDPIuih4WyoM8U+tkKVXUtHTkuQQDrLQy8UIB47dYQ==
X-Report-Abuse-To: abuse@transip.nl

On 2026-06-09 15:44, Konrad Dybcio wrote:
> On 5/30/26 3:58 PM, Herman van Hazendonk wrote:
>> Add a clock driver for the Multimedia Clock Controller (MMCC) on the
>> MSM8x60 family (MSM8260/MSM8660/APQ8060) - the Scorpion-class
>> generation that preceded MSM8960's Krait CPUs.
>> 
>> The MMCC layout on MSM8x60 differs from MSM8960 in several ways that
>> make a separate driver cleaner than parameterising mmcc-msm8960.c:
>> 
>>   - the pix_rdi mux requires a custom set_parent op that temporarily
>>     enables both parents during the glitch-free transition;
>>   - the IJPEG GDSC requires releasing AXI, AHB and CORE resets;
>>   - several rate-source pairs (MDP pixel, GFX2D/3D) only exist on
>>     8x60 (e.g. PLL2-derived 228571000/266667000 for graphics);
>>   - the camera CSI / VFE / JPEG / VPE / ROT clock topology lacks the
>>     later 8960 reorganisation.
>> 
>> Used on the HP TouchPad (Tenderloin) for graphics (Adreno A220),
>> display (MDP4), camera (CSI/VFE), JPEG (Gemini), VIDC, VPE and
>> rotator. Reset IDs are exposed via a separate header so consumers
>> can reset the GDSCs and individual blocks.
>> 
>> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
>> ---
> 
> [...]
> 
>> +	.clkr.hw.init = &(struct clk_init_data){
>> +		.name = "pll2",
>> +		.parent_data = (const struct clk_parent_data[]){
>> +			{ .fw_name = "pxo", .name = "pxo_board" },
> 
> Please drop .name (the kernel-global clock lookup), this is only a
> backwards compatiblity measure on existing drivers. For new entries,
> .index is the best (because well, it's the fastest)
> 
> [...]
Ok will rework in the new version.
> 
>> +static struct clk_branch camclk0_clk = {
>> +	.halt_reg = 0x01e8,
>> +	.halt_bit = 15,
>> +	/*
>> +	 * The legacy webOS kernel used halt_reg = NULL for this clock,
>> +	 * meaning it never checked the halt status. The hardware doesn't
>> +	 * properly report the clock state via the halt register. Use
>> +	 * BRANCH_HALT_SKIP to avoid the "status stuck at 'off'" warning.
> 
> It may be that some piece of hw is holding this clock online behind the
> scenes. Is there perhaps a Qualcomm-authored commit that mentions the 
> hw
> bug, or is it a guess? Due to the age of this chip I would imagine I
> won't be find an answer if you don't have one..
Re: the halt-status decision, it's not a guess. Downstream 
Qualcomm-authored
BSP arch/arm/mach-msm/clock-8x60.c configures CAMCLK_CC_REG with 
halt_check
= DELAY, indicating Qualcomm engineering deliberately avoided polling 
the
halt register on this clock. The right mainline mapping
is BRANCH_HALT_DELAY rather than the BRANCH_HALT_SKIP I used (which 
works,
but seemingly incorrect); I'll switch it in the new version and apply 
the
same DELAY-vs-NOCHECK mapping to the other status-stuck clocks I 
flagged.

> 
> [...]
> 
> I see you have a lot of inline note-to-self comments, please strip some
> of them.
> 
> Konrad
I'll also strip the inline note-to-self comments fair point, they 
belonged
in the commit message rather than in the code.

Thanks,
Herman
