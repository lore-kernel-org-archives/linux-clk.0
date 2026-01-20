Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978A42668D
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909438; cv=none; b=gi3IdYC377kOcOGK4docOxPv4LB1rQYbXKxdbV8eZ8QfZczfCmO2LZu7m+LdVuayQ/bJQqU3/ECyolKMaB0BjOjmbYLtY3flYjInEjzq+9fZC1o8jD6hoyMxKiUhHTcH5Neh6PyTAuu/Eg01vbo+ePcGF+PAhpDRHcriMtJU2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909438; c=relaxed/simple;
	bh=TBJAFEXB7pUqai6KjvPDlvSX7uwXO1rTYHITS5eD3hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+FiLXcoVP5j6P0jd43+1hEB+sAqgnfq2hACyR5zOb4WU2YLC1Nd3Yia3HzmPxPLr5zGcOGek/cybeqounH1erSTIyWYsNr0tW0lA1kVOLrVXCdB5JfWA8sqbsf2pOemzXY1pUTsoCP9mVJSGg/BWKb7qvDcVv7eLDmtka9ko5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=oexglfcU; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="oexglfcU"
Message-ID: <2b532215-e530-4b9e-900a-e67c70d5e19e@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768909433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDuc7hpOHRtcWQi6aDzHf441wxFw1bVpR1pKewUL+B4=;
	b=oexglfcUQJ8rzRrPCaBIilEBWD7mxtWFrEZE4BVemsL9LrKn+bwz1ggMRRfzlVp/9JKkfm
	cpQTe0/p74VpijdQmMp49PAQSsST7Uyj9eyHp2+yR1cChLsXEbXvaoxurIFi05dUvP8FzG
	scw93zDGGAf99aqxfhq4UQ4ekcfM07XemA+yyZahW/6VQdo4Sj+V0O16Zb4a8Ql+ThTu2O
	2xW1MrBzuuFDRFDF6CSv76ILCEzxiG9ScNiC3GjSwRV6XY4oIXR4QcPTeaLxFUQnKzErEQ
	DPvj6SZqO9zRpVN06kZ7aBegrPbkdNey/tow5KlnmufS49a08HnIoHTdR4nUFg==
Date: Tue, 20 Jan 2026 08:43:42 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] SC7180 MDSS core reset
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Kalyan Thota
 <quic_kalyant@quicinc.com>, Douglas Anderson <dianders@chromium.org>,
 Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 1/20/26 8:19 AM, Konrad Dybcio wrote:
> Add the missing reset for the display subsystem and wire it up, so that
> drivers can consume it.
>
> Compile-tested only.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Thanks!

Tested-by: Val Packett <val@packett.cool> # sc7180-ecs-liva-qc710

Might be worth noting in the commit message that the real world issue 
this solves is that after probing the driver, the DPU would keep trying 
to access the physical address that belonged to the EFI framebuffer, 
causing constant IOMMU faults and visual glitches on the display output.

~val

P.S. what a coincidence that just a week ago this was discussed for 
sdm845 
https://lore.kernel.org/all/bfe55d1b-1b45-4187-84fe-9475cb90b00a@linaro.org/

