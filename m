Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3924D4499A6;
	Tue, 21 Jul 2026 09:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627577; cv=none; b=CLEqdk4jM+P9CqWCq2sbs3u9GHoW5PzE8yG3N4XpMMsGfbkzShvynOdsEYTYHfowgADL5XO6JFhTtFFDX+p3ivifq2NEJqUwtJzEuE/8zdCpMyp8HMdgoY6N6XTZ74FOZ+6ik6syGFHyBK9u8WgGOOuiTyvZ1TEV/EOx5EbMLIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627577; c=relaxed/simple;
	bh=QNXGxS4ntTA7wpPgg4Eiwbj0aAjbDExRoyKHXUWYhuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0Kyq1J0faKjGo+r5LY54+raYKT+k3C7I2YravHIXZtVPOubONxGGZkZmqKN/5Pm9XAkxS8Lc4fa6QS7SI+9cHiEFxH3QYeLKTCPy55v3dXJFbLgXsNkSiNuO8EPU5Wh9evKrHY6Pv2LYhz1XHfq2qvg25/UMIi7MseTzRDuo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/nYhWH/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/nYhWH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED3D1F00A3D;
	Tue, 21 Jul 2026 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784627576;
	bh=AlGdPXGwaAmA9SWNHfD7YCh8hS1r3I+Q1xRYbU+lJw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N/nYhWH/qXuQFkyodkxkbq5vnMA8dq2wRIErkjPvmP4iP0LRcZxFKv1NkMBEKu9SK
	 TP50sW1U3ezZFaZERPC3X58N8XkTepzszfZICZrNuhazwN3itRnuLPlYiMe+Ht3smu
	 vbyCLg7CuiSxcXP8tnBbXKdaAw1EI4QMBiZZSaihkYMFk511sxwzj3dX9cYdAEVXIj
	 CHV52trJbjPh8fPp3YBGeH+lkjjhmR2MjYS+wl/oeK6VAl00BDIEtt3gGtU1W3u/1y
	 0e1MU6BA/7dlkUKGi66xNpxAC8QMKBVmlgyeT8tVF5vvuPTx6u7qiWdIoUkNYyX+TF
	 ISa3a7d6O0qAA==
Date: Tue, 21 Jul 2026 11:52:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Message-ID: <20260721-tactful-cerulean-shrew-120a9c@quoll>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
 <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 07:40:41PM -0700, Qiang Yu wrote:
> +required:
> +  - compatible
> +  - clocks
> +  - vdda-qrefrpt0-0p9-supply
> +  - vdda-qrefrpt1-0p9-supply
> +  - vdda-qrefrpt2-0p9-supply
> +  - vdda-qrefrpt3-0p9-supply
> +  - vdda-qrefrpt4-0p9-supply
> +  - vdda-qrefrx0-0p9-supply
> +  - vdda-qrefrx1-0p9-supply
> +  - vdda-qrefrx2-0p9-supply
> +  - vdda-qrefrx3-0p9-supply
> +  - vdda-qrefrx4-0p9-supply
> +  - vdda-qreftx0-0p9-supply
> +  - vdda-qreftx0-1p2-supply
> +  - vdda-qreftx1-0p9-supply
> +  - vdda-qreftx1-1p2-supply
> +  - vdda-refgen0-0p9-supply
> +  - vdda-refgen0-1p2-supply
> +  - vdda-refgen2-0p9-supply
> +  - vdda-refgen2-1p2-supply

This looks like ABI break without any explanation.

The dependency here makes it also non-testable by toolset.

Best regards,
Krzysztof

