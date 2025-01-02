Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903A1420A8;
	Thu,  2 Jan 2025 21:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853160; cv=none; b=W7xRMsrx5fw2mFpkFRxavapcVZQ+1mx6swJvhecqaNprzov+13BZnES3ehcaeHKdsDHRjDb/2ikM5GvXIpEIbvv3Ok+XVMyfbeL+iIs6KRLlXHWzlmsApYAu+XHGUG1cD45BmuAvCxDmHHFq60XMBhATAcUj7dy8RYXXeY2zCuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853160; c=relaxed/simple;
	bh=kPok3EOQJmCACr+cJ8K2n4ryC1JK+YdP2I1q/Eh5j4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/vCRZOExR0Enj7bozAF7m/ugG89+8SEC+vJuwxql9nSGCbbjzEgRA4VHthJv6SQXs6f4etZzfCXrWZv9+Sbp63CrqQgLd0A2NkLvDdIKFoiN7Rr49zcsDUbj95SBPYBzpxe5gdlRf9yTbu58ZaNn2cjZzDa4soRJtbs0X0+984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=duFn5+MW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="duFn5+MW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0BCC4CED0;
	Thu,  2 Jan 2025 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735853160;
	bh=kPok3EOQJmCACr+cJ8K2n4ryC1JK+YdP2I1q/Eh5j4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duFn5+MW0IHYD8DUP5gs+AnpnPY7uHp1lIegqGYijtL/h/4a2kkVx6nabRA+XZsXN
	 Sw9ialQz5dfqQSyKWNG7cPyh4bMMW1O5SPbBC26TxlgWrslL7NKoEnaGdqVU74rH6Y
	 5r0dxRXNN1WewrUeC/p6QwUrqTHkwIDydIMtK/R97MWk2ZsOF9rrUq6aVOOSC7q067
	 00hiS+AkudfrsSHFrLoXoKg8OjfcfXPIfnNfWEk3CpcPLveA5IR0ivXmqNYeN5io0t
	 N9CRC/A4vvNrMlDD/vLYfgJAkAE3S9mjLGzgbG3D1NfBphkJai8OhdXoDDqtp9M7+0
	 VPwwKdmyh9vfA==
Date: Thu, 2 Jan 2025 15:25:57 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-sound@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK swap
 support
Message-ID: <20250102212557.GA600708-robh@kernel.org>
References: <20241226152953.36230-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226152953.36230-1-marex@denx.de>

On Thu, Dec 26, 2024 at 04:29:45PM +0100, Marek Vasut wrote:
> Document support for setting the Bit Clock Swap bit in CR2 register
> via new "fsl,sai-bit-clock-swap" DT property. This bit swaps the
> bit clock used by the transmitter or receiver in asynchronous mode,
> i.e. makes transmitter use RX_BCLK and TX_SYNC, and vice versa,
> makes receiver use TX_BCLK and RX_SYNC.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> index a5d9c246cc476..7a58df1e3f87c 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -132,6 +132,13 @@ properties:
>        of transmitter.
>      type: boolean
>  
> +  fsl,sai-bit-clock-swap:
> +    description: |

Don't need '|'.

> +      Enable Bit Clock Swap, which swaps the bit clock used by the transmitter
> +      or receiver in asynchronous mode, i.e. makes transmitter use RX_BCLK and
> +      TX_SYNC, and vice versa, makes receiver use TX_BCLK and RX_SYNC.
> +    type: boolean
> +
>    fsl,shared-interrupt:
>      description: Interrupt is shared with other modules.
>      type: boolean
> -- 
> 2.45.2
> 
