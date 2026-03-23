Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE91FC101;
	Mon, 23 Mar 2026 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276090; cv=none; b=kNimWC0gkSrZ0epXGEZoIfmRPQEwmAG87JTEpQgGJ2ZvhU7WR9O1QuMgevJehUifBZMtam27pjSoTJRM10q5QE0uZBvzXklyMk+JfN4btNrCfIw7povyFSIw7AgpzsJ6PfCBfAvcQ5BtXxQOHC+VW1XIw6vKRwiVz1uTYmjFZFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276090; c=relaxed/simple;
	bh=mbtEVinGGoFAGG65jvCAfLcX2UZyN3FkVZ6ahWjHf6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpE8uPZTQYXAhjrDpnbhxyqquoFKGYyhu46LIkkIOGTCb1wNnMNb6mm2ysay3kGYY0ewikpPG+MuJojUb7p8Ob28le4Jrsjk941oTscD7hVAT1tw1gBMz0iDnPQjd3H4TqgNSvm/27cNQWsJ2FG/fySxCffSO0A4c4Go/n5SLM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6ih3iMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6ih3iMy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B296AC4CEF7;
	Mon, 23 Mar 2026 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276090;
	bh=mbtEVinGGoFAGG65jvCAfLcX2UZyN3FkVZ6ahWjHf6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6ih3iMyXrsi0EnqMWySm5wMlW5EMOyV32wgtDiiGuz872SA8ND9mI1HGWfphMT6I
	 TRMw/nGeHp69L2RIzqkrgyBB0jUov/+iy6JZwnu/kSQF3d7Hcs6rrEVmb39f45kYxo
	 o9xJJWi60jVrV9HcckgoqiBsNZUHpQj+fHXyiAB1lrfPgX8E2V1GW1M4ua12d6lMyE
	 gXeccf2zufyGXf0cUXamz9j4mQQ/FL3QNTmCiptOnWmw/EPnRY7mjLDzGv4i5LS0p1
	 Cth4Lk73T+DEPPr6JdiQ+dLB1ZsxrgOCXSY7VKnm7KBTvlL0eUK+wCji2TiuHotk03
	 9VZKdkh4ofOxA==
Date: Mon, 23 Mar 2026 09:28:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur: Tie up the CX power
 domain to GCC
Message-ID: <acFN2Fqp9yE84q3h@baldur>
References: <20260309-glymur-fix-gcc-cx-scaling-v2-0-d7a58a0a9ecb@oss.qualcomm.com>
 <20260309-glymur-fix-gcc-cx-scaling-v2-3-d7a58a0a9ecb@oss.qualcomm.com>
 <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb9b49a-c879-46de-b272-30f601947d99@oss.qualcomm.com>

On Mon, Mar 23, 2026 at 02:07:01PM +0100, Konrad Dybcio wrote:
> On 3/9/26 1:08 PM, Abel Vesa wrote:
> > It has been concluded off-list that the Global Clock Controller needs to
> > scale the RPMh CX power domain, otherwise some of the subsystems might
> > crash or be unstable. So adding the RPMh CX power domain to the clock
> > controller which will result in all GDSCs being parented by CX. This way,
> > the vote from the consumers of each GDSC will trickle all the way to CX.
> > 
> > So add the power domain.
> > 
> > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

I'm expecting this to be resubmitted with an improved commit message.

Regards,
Bjorn

> Konrad
