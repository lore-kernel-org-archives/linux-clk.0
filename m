Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6D1D61A1;
	Mon,  6 Jan 2025 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736148110; cv=none; b=J43m+GNoTF/D9+IWqiOV/6tSjInA1uwSKIXmyE2tqDP+//YPVezupgPjTqtgsHX9jkgt1O/33fTz5GM3VTMfh6XUU/IIg8Um79VAPJdG0GgrUO1829PDrwX9zAFcWBL4qMwU/awnxbKyf83p03Tt96V/io5BbJniIdt+WZDm/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736148110; c=relaxed/simple;
	bh=Z0Wk35+tGl/QBB1rWY7uIN47MRruJiSyWdDTUtrLcYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uZjWGPwwAcutyLyzsC3+jlBkApfjPAwIv9oV7OMuqBAvNz13zZ8+AEpoTPG8BoL6UlTk+1P8aK1ZHW1nFv7Vkpy/C+Cn504Fl24149xIMv1FnAQZP5sYnfowW8TJSRy/QufiYvICDqjhrBimhTWVWaIzQZc4AICLRQQPb7D70Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1fGTVcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1fGTVcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B093C4CED2;
	Mon,  6 Jan 2025 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736148109;
	bh=Z0Wk35+tGl/QBB1rWY7uIN47MRruJiSyWdDTUtrLcYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1fGTVcdsjRaZtGGJVvqAgZ6nshb7+HPYRXiogbi3MWDv9UX2F32HRz3ablznrzBe
	 6faWiRQll411RYkkh9TfqvzdQDGdvWDELTMEG3vwhhyeK+m2WBRaGbFr8eVXHAAIoz
	 ou5CBXaaK8J0X2fukZbfb9jK4vKp8OtHbvp/9Qn4NHA0WEXE1apknZ+wxgn6naAwM9
	 FYoONhONDv9GKCRqw3exeSUMA4CZApQb4at4S5vqzvaYn1bVYhGWrK1twIywzoyQ+O
	 LPw1/lysTmHBRi3a1u2cgrY5AlDbdq84xIFmbh4G6ghwlJ2UE5L/5Hb+4fcOPXadDJ
	 lbw254AeHIu7A==
Date: Mon, 6 Jan 2025 08:21:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 3/6] dt-bindings: clock: stm32fx: update reference due to
 rename
Message-ID: <ozqeggxydhuiddnxkkftu2xeqxp5omoluada5ra5aecieuwc3n@njhepvhd3y7x>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-4-dario.binacchi@amarulasolutions.com>

On Sun, Jan 05, 2025 at 07:14:15PM +0100, Dario Binacchi wrote:
> With the conversion of Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
> to JSON schema, the reference to st,stm32-rcc.txt is now broken. Therefore,
> let's fix it.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  include/dt-bindings/clock/stm32fx-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK, you introduce bugs and then immediately fix them just to have some
patch count?

Best regards,
Krzysztof

