Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198C3D47DD;
	Mon,  3 Aug 2026 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749183; cv=none; b=VlLG1AZmVtu/wLQfRJzOgPFQmP4pJtq3nhqwIJjGbmuR0dXQv136RKo02XJI8VQ1ARwB1wLRaLLjHXdH3f2eBrNhU0bfpq4DfSeD4kN4bMb3ayks2Zg3eIPTwxWHq5EVRqYaSqxzd3fZlgV77U9zobKsSVxxfREkPYgbeK7jA6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749183; c=relaxed/simple;
	bh=l2tkEc0MnWatMPdBlJ7V78+HojJ0d+53dWVJ+Zzx5Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1c2xc+hMobHXqFfeRNxFv4y4MwiR1im9HEx7MCKzQKGhJN9qs1NZ8t8Ju56iS8KYF01F6k6CCC/cVKZKMzakq2pJlphwJ7RZ/b7SWPVmkMiBAh24+p/KV9ngzSgBVnUcQtTyE/0Bye2BTzdA7tZm1xH8wD32zptUvaCKdQaieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp9N50+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp9N50+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E291F000E9;
	Mon,  3 Aug 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749182;
	bh=GAExiW6Jrx2onTGb/L/xW4Z8Rk5lgXM2r5mArfI1oUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sp9N50+D2ohoxuSgi38SjsVhRH0oBRelsaRGEFUw1zhdYifocIRi6YJCDQqchT0GG
	 VjeVT+W8LZOyM8n6ZrjgrD8axstNl39Kcvk7Peq3gu5UrgfYOTiLRaif0eZQxjP+Pl
	 VGXVZpQ+k0PqIXKfInquv8z1lXxtUy6KcAEh/7qTEtz1yxXgHFdiwUzo7Ebt6Txhwm
	 yLd+yggUeEFdnGuMcG/Wx2fgOOz8qkIBzyiO4syf6Coo2e0o+VB4AEs8zMLqI1KMMj
	 Vr2DgSerS/V7riZkd4QMhs4KbPH/02rV+FDA3RHCUGG1kqnwKJNasw8HWjB3WAMC9j
	 WEb+thpHVl8sg==
Date: Mon, 3 Aug 2026 11:26:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Cc: mturquette@baylibre.com, robh@kernel.org, andersson@kernel.org, 
	conor+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, 
	linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, taniya.das@oss.qualcomm.com, 
	bmasney@redhat.com
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi GPU clock
 controllers
Message-ID: <20260803-bulky-thistle-mongoose-80327e@quoll>
References: <20260730-gpucc-hawi-v2-0-7bf618ab8a34@oss.qualcomm.com>
 <20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-gpucc-hawi-v2-1-7bf618ab8a34@oss.qualcomm.com>

On Thu, Jul 30, 2026 at 10:53:48PM -0700, Dongfang Zhao wrote:
> Add the device tree binding and clock, reset and power-domain IDs for the
> Hawi graphics clock controller. This lets Hawi device trees describe the
> GPU clocks, resets and power domains, and lets dtbs_check validate those
> nodes.
> 
> Add the qcom,hawi-gxclkctl compatible for the Hawi GX clock controller,
> using qcom,kaanapali-gxclkctl as the fallback because the register layout
> is identical.
> 
> Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml | 78 ++++++++++++++++++++++
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 22 +++---
>  include/dt-bindings/clock/qcom,hawi-gpucc.h        | 47 +++++++++++++
>  3 files changed, 139 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

