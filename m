Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C23955C3;
	Mon, 22 Jun 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118978; cv=none; b=dWNYWll9H0odRdJdOqrybRFgHdb2G/4orlWiuk8Ft/BIkDVGOZywNOWL8StiZljbY//5GOyRke1jONGoiF7KffjRMfQrfFbyF51ALEx8L8mE9Tv6nm20N3b5uhu6NOvhKUOEB3XQ1KjcYpaQfyYBBS64iKqT9rtZWcyy2lN/Vns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118978; c=relaxed/simple;
	bh=bof2RftABQM0VW5dqtozp5h4V8Fl6nfu+ykwzqfqVVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zde62zvz5EeZYdgp+sQXuGuG1Xp/SI22SX7H390eeRpvPdoZOQbWeqPBuqx6zrtKJgsKF3zG1vUq5D5EXgo5pXDblM78+wXIL4ZlytcGrikZuIo9qq0BCosqBzJTcgNsWSaS1BsHuuDWGFnYoQCqKtE40fmtU7CvDXBFCXM3gzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2zzXMRb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2zzXMRb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8061F000E9;
	Mon, 22 Jun 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782118975;
	bh=37JW7K3sg07SL4BlJiD2RoB54WDCii+ode2jFNVJxNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k2zzXMRbaAgtx4A9VTmvyk+GhkLCzkMlCr6+OXPPplDlPFcqL2XHR9tBZW8Vwazty
	 ihfQXyTKWaxxIn7Wx9qxA6RkKgO2VY4SPbwCxP+kE8hzBZgWnfvr0kIZOvZznfk+as
	 qjijR9aaZPZpY7J9wYgjhaIs0L0qGbJ+wi/1+qdFyCMClpeHUh2pt1V9IWps/MBoB0
	 LLE54H8slDEVL3JlZVAnW/08m6oEKuFva/dJBe0GaI6+MvYYtcv1xWqLNg5u3hV/cR
	 MBn0nbBxaaRcMBT6iaLT2FV9FfhVAqHr4wvPRQJaL4LDs5hJb43gejFx85KQAScnpC
	 SXg+TcGUpEwwA==
Date: Mon, 22 Jun 2026 11:02:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/4] arm64: dts: cix: sky1: add audss cru
Message-ID: <20260622-dramatic-worm-of-radiance-adf731@quoll>
References: <20260622022520.3127103-1-joakim.zhang@cixtech.com>
 <20260622022520.3127103-5-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622022520.3127103-5-joakim.zhang@cixtech.com>

On Mon, Jun 22, 2026 at 10:25:20AM +0800, joakim.zhang@cixtech.com wrote:
>  
> +		audss_cru: clock-controller@7110000 {
> +			compatible = "cix,sky1-audss-cru";
> +			reg = <0x0 0x07110000 0x0 0x10000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
> +				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
> +			clock-names = "x8k", "x11k", "sys", "48m";
> +			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
> +			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;

> +			status = "okay";

Drop.

> +		};
> +

Best regards,
Krzysztof

