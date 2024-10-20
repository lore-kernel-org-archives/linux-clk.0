Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772993B2BB;
	Sun, 20 Oct 2024 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729420132; cv=none; b=Jt8ZkIUBqdH6tDWjbtErUT19QwcAfHX86WqQef3Et8w83WoR82T0KowxDAV4Ph8pCLB1nVIwztI5ksSr874Njm6cx+j/f08iU82QzrBycAR65pyd49bskIu/tGUa+NCBpWCVyx7+VzobiJcHkvO5mZtcCNVaXYDCiy6zV/Ggn8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729420132; c=relaxed/simple;
	bh=xLP/SJi+vAowattNETxHJ9sz4Dh9GA6prR2wAX+ANbY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oVE89ynamtICizmWjfzQWySJkMKKAocKvtqMNGY/H7lG0CkWm6VduykWEfFZQNwAgGCe7cLtXI2OZaNxoz76YaCkIZWSPFIR+TmOVIiInrfT9y7ZhGA2oQHEe5J9tYJr3gJYTJ0LVxKtgydOJHXuqV2NNAZYpa2JbdnhS2ARbec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81248DA7;
	Sun, 20 Oct 2024 03:29:19 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 070153F58B;
	Sun, 20 Oct 2024 03:28:47 -0700 (PDT)
Date: Sun, 20 Oct 2024 11:27:53 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Chen-Yu Tsai"
 <wens@csie.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: allwinner: add H616 sun4i audio codec
 binding
Message-ID: <20241020112753.39e29cbe@minigeek.lan>
In-Reply-To: <3588e904-a511-4e6f-83fe-8be9856ce081@app.fastmail.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
	<20240929100750.860329-5-ryan@testtoast.com>
	<dwp5z7ioahw7hb5celwhmeooaku2sgj4srzq7z4xmb3i3sa7y6@27rnjl72a2fo>
	<3588e904-a511-4e6f-83fe-8be9856ce081@app.fastmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Oct 2024 19:58:21 +1300
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi,

> On Mon, 30 Sep 2024, at 8:56 AM, Krzysztof Kozlowski wrote:
> > On Sun, Sep 29, 2024 at 11:06:05PM +1300, Ryan Walklin wrote:  
> 
> >>  
> >>    clocks:
> >> -    items:
> >> -      - description: Bus Clock
> >> -      - description: Module Clock
> >> +    oneOf:
> >> +      - items:
> >> +          - description: Bus Clock
> >> +          - description: Module Clock
> >> +      - items:
> >> +          - description: Bus Clock
> >> +          - description: Module Clock
> >> +          - description: Module Clock (4X)  
> >
> > No, grow the list and add minItems instead.  
> 
> Thanks, turns out the 4x clock is not actually required by the driver so will remove this and the clock-names change for v2.

Please note that "...not required by *the* driver ..." is not a valid
rationale in the context of a DT binding: it's supposed to describe the
hardware, not a particular implementation.
But I see that the *hardware* manual states that the codec only uses
PLL_AUDIO(1X) as its input clock, so it indeed seems to be not needed.

Cheers,
Andre

> 
> >> +    then:
> >> +      properties:
> >> +        allwinner,audio-routing:
> >> +          items:
> >> +            enum:
> >> +              - LINEOUT
> >> +              - Line Out  
> >
> > That's odd, why two same names?  
> 
> These are the input and output sides respectively, the LINEOUT is the SoC pinout, the Line Out is the board connector as per the routing description above. Just looks odd because the H616 codec has only this single route.
> 
> >
> > You must restrict the properties you just changed per each variant.
> >  
> Thanks, will do .
> 
> > Best regards,
> > Krzysztof  
> 
> Regards,
> 
> Ryan
> 

