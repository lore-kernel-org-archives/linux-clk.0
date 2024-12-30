Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D5C199E84;
	Mon, 30 Dec 2024 22:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597255; cv=none; b=JfcjudcBq3Z/c/aveP6r88SD9XdH4oMZdzuDod1C74WGhJ7fZIPD/KqBwbUtaanoKhupKpQC+j3zdKecReUJNjdSe5Mqa2wBbx8pLFp+uB1/UlauRmGuQ86Rt7gOzI+kjY/pxsQYefYcGqyyh98cSM7eVPLX0WS7J+HutsDuZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597255; c=relaxed/simple;
	bh=WMCl32Jca+Ndw4He83tjcyOwptAzR1B9GaF0P+SC10o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLRYVC84Gb3YiN8OoJi2bBFPpC3StrJN4inYPNUMhbI1wwgjivh566uQrRKAWwXXsbhjdgOmf+0L3lD0wrnOsMawXP0N5/jVsYRiQ1uXIqEtHvtN+XgRQRd3GfYqNkKuLT4/6SYEry48EG1U8iA7Ts/6BmcJjg1JTAiDC2Vld4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=R0hP+UJi; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="R0hP+UJi"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A35F9104855A2;
	Mon, 30 Dec 2024 23:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735597251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kI5DEexhRDHaifeoO2yldrR3aqXqXtpFHALvj2nkVQo=;
	b=R0hP+UJi5hbVtz06yR8D9rFX/JOwvUwQ7w4nIxTXgoLQk0Vw8qHNwM0D3YjmQag+O9/pxo
	mJQuu2FErTmsVHF3/H8R4FZlVpIi7ppQpZ8D+iHfFYso2A0HQCdnzxcwgUEcJwp7A8O1+W
	VcW+WOem5ync8r2efD0Rocy5gPDRYFWyInDIEqViyoGQ0ntq8BT8NttqQ1BZwFF3nYkimL
	RdhmaDt3A2kZZbF+db1p3QsfXWHDQEbSqW+dwJ/2bT99enMxx5JWXkNqXmX1hxOf6NgljP
	3aQWDkBY9xgsXpAjoyrrqudicXs3X04Uvsnr6XwlAevCvBu+jgUC57ot8tf+hA==
Message-ID: <36665ab9-16de-4f77-a55f-b7942dc0c1bf@denx.de>
Date: Mon, 30 Dec 2024 23:18:17 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: fsl-sai: Add MCLK generation support
To: Michael Walle <michael@walle.cc>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de> <D6OVE2W07NDX.2Q4AFF46TWCWJ@walle.cc>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <D6OVE2W07NDX.2Q4AFF46TWCWJ@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/30/24 8:51 AM, Michael Walle wrote:
> Hi Marek,

Hi,

> On Thu Dec 26, 2024 at 5:22 PM CET, Marek Vasut wrote:
>> The driver currently supports generating BCLK.
> 
> I'd say the driver supports generating *any* clock on the BCLK pin.

The clock are coming out of the SAI 'BCLK' output and are controlled by 
the SAI BCLK control bits. Of course, it is possible to feed arbitrary 
upstream clock into the SAI and have those exposed on the BCLK pin. I'll 
try to reword the commit message to make that clearer.

> It's not necessarily the BCLK clock. I.e. on the board where this is
> used, this is the clock with a given frequency sourcing the PLL in
> the audio codec.

Right

>> There are systems which require generation of MCLK instead.
> 
> You mean systems that use the MCLK pin instead?

Yes

> ..Which is the
> normal use case for this pin. This driver was created because the
> LS1028A doesn't have a MCLK pin, so we've "misused" the BCLK pin,
> with the restriction that only integer dividers are possible.

I have a system that is wired a bit unfortunately, I need to source 
codec clock, where the codec is the clock consumer and needs to be able 
to control the clock (SGTL5000). SAI MCLK is the only way I can get them 
out of the pin I need, hence this patch.

> I
> haven't looked at the datasheet, but doesn't the MCLK has a PLL
> which could generate any frequency?

Audio PLL , sure.

> Also I'd expect that the imx
> SoCs already supports the MCLK for audio applications. Isn't that
> the case?

That does not work if the MCLK has to be enabled/disabled by the MCLK 
clock consumer .

[...]
