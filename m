Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3C6188A18;
	Fri, 18 Oct 2024 10:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246085; cv=none; b=ckI2p/FCH8OYN8F7CFtbMgWYdX5/o7CR2V+fh2UsiOv4faMIR8cu5KOYOBIgiw6ym0whbt+7r/ob94T715qrHwSU1r3s1tsOMSlOMIStrWIrfMgQNTmqxgg8c3igHtLtFw9TzDgDCSVY7BRhY+gnHWPiAf9y8ALvoQGpkNwFoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246085; c=relaxed/simple;
	bh=BBgExb/0LqYBvdk3X8OnmkSL96FhQLCnVNqHEHQTNzY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A57UtZj2tQr8IMdAwUXGpyV5EvhtDXc0SADvk7GqHBOg1X2bks4a5P+l+DqJoo1w9vke4XiP9rcOBmCIGhkCm4PHopPi95AW9oGuP1zKNwKOnLsgj/xDQAQC4Q9bkkUshMgNB8E3zgPa9qUJIssuGr6qYn7JMiPOjw/qZWyfe+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AE2DFEC;
	Fri, 18 Oct 2024 03:08:31 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D22E3F58B;
	Fri, 18 Oct 2024 03:07:59 -0700 (PDT)
Date: Fri, 18 Oct 2024 11:07:56 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: h616: Add audio codec node
Message-ID: <20241018110756.3eeb5df2@donnerap.manchester.arm.com>
In-Reply-To: <20241008133718.3ed32cb8@donnerap.manchester.arm.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
	<20240929100750.860329-7-ryan@testtoast.com>
	<20241008133718.3ed32cb8@donnerap.manchester.arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Oct 2024 13:37:18 +0100
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

> On Sun, 29 Sep 2024 23:06:07 +1300
> Ryan Walklin <ryan@testtoast.com> wrote:
> 
> Hi Ryan,
> 
> > Now that the sun4i codec driver supports the H616, add a node in the
> > device tree for it.  
> 
> Can you please add another patch that actually enables the codec for at
> least one board? Is that really just status = "okay";? Or do we need
> simple-soundcard nodes still?

For the records: We don't need simple-soundcard, but we seem to need an
audio routing entry. So I tested this successfully on the X96 Mate with:

&codec {
	allwinner,audio-routing = "Line Out", "LINEOUT";
	status = "okay";
};

So can you add a patch adding those properties to the boards with a 3.5mm
jack? The OrangePi Zero2 and Zero3 do not have such a jack, but route the
LINEOUT signals to dedicated pins on the 13-pin header. Not sure that counts?

Cheers,
Andre

> I will try to give it a test on the H61* boards I have, and would then
> like those boards to be enabled as well, as part of this series. Otherwise
> it's somewhat of a dead feature, isn't it?
> 
> Cheers,
> Andre
> 
> > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > index e88c1fbac6acc..006fdb7e7e0ae 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > @@ -645,6 +645,21 @@ spdif: spdif@5093000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		codec: codec@05096000 {
> > +			#sound-dai-cells = <0>;
> > +			compatible = "allwinner,sun50i-h616-codec";
> > +			reg = <0x05096000 0x31c>;
> > +			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&ccu CLK_BUS_AUDIO_CODEC>,
> > +				 <&ccu CLK_AUDIO_CODEC_1X>,
> > +				 <&ccu CLK_AUDIO_CODEC_4X>;
> > +			clock-names = "apb", "codec", "audio-codec-4x";
> > +			resets = <&ccu RST_BUS_AUDIO_CODEC>;
> > +			dmas = <&dma 6>;
> > +			dma-names = "tx";
> > +			status = "disabled";
> > +		};
> > +
> >  		gpadc: adc@5070000 {
> >  			compatible = "allwinner,sun50i-h616-gpadc",
> >  				     "allwinner,sun20i-d1-gpadc";  
> 

