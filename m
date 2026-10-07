Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDC93D813E;
	Wed,  7 Oct 2026 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378430; cv=none; b=c/EdHCHec+vhgkjIooTyK4VIJHNh4iNfCKIRoNZ7H30fcw3/eF+eSCSAqjcwFZ6BPnNSGzVgaqHo+1Tem7oXQ/l01Lt2sJCq3CIFsAA6L2eLdRhNgZBh/xPOVpqghyl8WlqCjiKRzZb37l5M/nvsuor/G/R8FR/+Fa2TxpneVog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378430; c=relaxed/simple;
	bh=ayPSE+Y6CAfKuyH1Ek1gEM4Hw7Gq1/HwDAqp8sPGsaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olIz887Fo5pADwNthxzhJTgVE//Hxi2R6Rk2JT489rLz+G4UYfBctWZTaSLuCj3dZ+w0W9hg6Rw0QO8jznQ6j51TJTe69Nvzg1WcRoXZj0hPWrXYYIrGhWcenpbZ8Y82XhFKO396xJBE0KQA5AzhOU/cF/QT8SCMFG7ygXIgKCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajMiwFDY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajMiwFDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C881F0089B;
	Wed,  7 Oct 2026 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791378423;
	bh=Uq4+gSwVCA9riGGi/ppitQyXRBTdaQE5mWOuNhAJjtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ajMiwFDYDqKVhwZy1GL8/TOAtxXo2jffYvMKf9f57XZ6HEwpoPQ9qD08h8uWRsoD3
	 nNpPyLFDUaBf1Nx23T8mDOLujbS7aN5hD2cv90Lrjzm7AY9Fyw9jadFJXIH5XOGw3s
	 Gj+Ivg4MJfLH61TO4RGkNNNakkMHop6Hbueh/iRPwJzOjaanMgucgg8t1g7TCxlhzk
	 Ss4k8epI341uyzkQ3uryGR/tIvXBZv3XCCIrxaFFk43FF3SardgHnV9lZzMQhnS4qh
	 o9B9YXrzh+qokQRyIyNArImyu0lCqUdCvIkEtgNf0c9cFCAVKAbTp4G2mtE0/KFg25
	 Z5YfQKIa3KEAg==
Date: Wed, 7 Oct 2026 15:06:55 +0200
From: Brian Masney <masneyb@kernel.org>
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU serdes
Message-ID: <asZD79RRF4u5OJdn@x1g10>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
 <179000484817.707534.5059164498545591038.b4-ty@b4>
 <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+_ehUzrL9qHe92tE0CeaOMAD1LXGuK79t5mZGv+bp2sCas_sA@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Tue, Oct 06, 2026 at 01:23:36PM +0200, Christian Marangi (Ansuel) wrote:
> Il giorno lun 21 set 2026 alle ore 17:34 Brian Masney
> <bmasney@redhat.com> ha scritto:
> >
> >
> > On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> > > clk: en7523: Add support for selecting SCU serdes
> > >
> > > This small series is a split from the Airoha AN7581 USB PHY series [1].
> > >
> > > [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> > >
> > > Changes v2:
> > > - Rebase on top of linux-next
> > > - Add review tag for Documentation patch
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
> >       commit: 11952173d8a180ac05641775f80bd6946327478f
> > [2/2] clk: en7523: Add support for selecting the Serdes port in SCU
> >       commit: 4e39820b601221997cb2220edc830f92367cdfc2
> >
> 
> is it possible to have a stable branch/signed tag for phy subsystem?
> Commit 11952173d8a180ac05641775f80bd6946327478f is needed
> to permit correct compilation of a airoha usb phy driver.

Yes. I'll have to rebase the clk-next tree but it's no big deal.

I'm at Linux Plumbers right now and I'll send out an immutable tag in a
day or two.

Brian
