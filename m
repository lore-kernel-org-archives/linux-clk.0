Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B4E1DFE38;
	Tue,  7 Jan 2025 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736232864; cv=none; b=qSx6ZbsbyR3g1VCm1yY2GqnLEcjJYRHQ35oPyjsOu3RgA7grJyAPs+FneI/ChYYfClnyCEd1YJhNuQYP+GvJwZumlrmnb5qGb8Mrsa4LvOhGkpcW/Va0BUtMfvWfJrg1DifUveE6yXWh7n8Co4OTQY2C+WTnS+8Ss2AKQbzM5iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736232864; c=relaxed/simple;
	bh=lZ3V33Q0uZwjNyBShagVjvo8YEiV3bQRY2IjGY8UaBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5F1rD3q0rWTwFQOzVyMAA7v6BDebEEDPh4CTpE2cC9wzJfIrD9X6oWZ7bSNZZ871HYrZJ3UbNOKsf9P9+hdh4J4gOYyV8UHXUWYbmC0J9QLRd+gkNExYGYHSDypjpAABm6SMcgzH17WklGSchjlp+jCUX0d5epiOpNXwOLqJOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAJGEEzD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAJGEEzD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF69EC4CEE1;
	Tue,  7 Jan 2025 06:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736232863;
	bh=lZ3V33Q0uZwjNyBShagVjvo8YEiV3bQRY2IjGY8UaBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAJGEEzDerOkhk/hxhMYDhBxLDyqAVyQwdTrHZF+ofcxvI0UReUiAdegwR6aanGDv
	 ckOjjMRo2n83uP9ehmM5OVh6QRSH6G3x8fsoN2VIl5uVHWbbGFOKu1paWgMPAbLlQ+
	 Aixr/H/EoN/YwlkgwSUkvJdQFCqlmtfp8VTpr5Omy454Ktbz1D+MF6Pu/s41lQHjeu
	 dY2fMCf7ypSwuALnyDgK7WvtICUbrJZ1Y4xymP9pyKRyKaKrAqxXsz7oOVJWc4Orow
	 1xmB//QZuJKAIvtedzfJnL4rii2lfk/T/flTUSYrqsyAimNL2+Xpj5lt1tQ4iaTxJ/
	 ZRprJIz82TYww==
Date: Tue, 7 Jan 2025 07:54:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Visavalia <rohit.visavalia@amd.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vishal.sagar@amd.com, michal.simek@amd.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: xilinx: Add reset GPIO for VCU
Message-ID: <hrtwoxi6ib7obmijhe4rlrpppgcybhp44w3mhjg7d4ovbrfnv4@qyjt57fuj3o6>
References: <20250107044038.100945-1-rohit.visavalia@amd.com>
 <20250107044038.100945-3-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107044038.100945-3-rohit.visavalia@amd.com>

On Mon, Jan 06, 2025 at 08:40:38PM -0800, Rohit Visavalia wrote:
> It is marked as optional as some of the ZynqMP designs are having vcu_reset
> (reset pin of VCU IP) driven by proc_sys_reset, proc_sys_reset is another
> PL IP driven by the PS pl_reset. So, here the VCU reset is not driven by
> axi_gpio or PS GPIO so there will be no GPIO entry.
> 
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---
> Changes in v2:
>   - dropped description GPIO property
>   - used decimal number for GPIO
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

