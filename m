Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5FE41C6D;
	Sun, 22 Sep 2024 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038342; cv=none; b=sjUkWLed+vRshEEfpKxYBGAQYZQE25P68sB4HCtLZZY3bRsroij6YQpnuyKRg0eJjFN+q/sdigu92mtJLw4rPD5MXi/CWc8nzoFtMqAFoNRGaEu1aJVrOYq6p/BReTNSPAqxR/f7fRSS2Nx8YcLXsM4OSvBkLL7p6YYIj4z0Fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038342; c=relaxed/simple;
	bh=uN5prV2zXq5e0gOnXEUkWyF7g1wrmftUQs3tUHdtCAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyGTVuP3tAkagK/141WPjk3LqY8xOtkI+cmK7z9mLqirGIsnCuSlTez/AnmHWay+UK3AasALUaJEtp5oHRZU5wyy5srDBrTVSLqQLoBTXYMof6H4DEbCdWqSEDaJPJjDEM8XHQIXgevbkmusUDQ28GFIRbh7v8ogpYCTVsfuFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tN4JMxKE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tN4JMxKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856E4C4CEC3;
	Sun, 22 Sep 2024 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727038342;
	bh=uN5prV2zXq5e0gOnXEUkWyF7g1wrmftUQs3tUHdtCAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tN4JMxKEdLst5ymxG9/DaCuXUErphUlZc60D4paWVBR3bpr+Krqw001D1qEdmcmIw
	 r95zi3RBY1mA6kfFBTvNlNbk5fnErDTDB9I0p4NcJYwc9UMcLI5NhbHBqPGCWT+Czz
	 nkJbHRUSpPoDQi1WsSRrzL0jaTUEa1Quz/pc5FTRKqp2itg1uPAiPOcki/TszvZStn
	 wlU7arMOsNZASOOThnHXB6sW4ZFYqOX+iq+SSqEZ+iqVYunwn2mNws8AZOLeBCxKhI
	 DwZHmYTL3DQDmcBY+hnEIxlf+jZ8HZvdJn7pPi2DsCasQ8DMGZM4PSHuo4oSWvFTL7
	 TBRhiWkdK4kLA==
Date: Sun, 22 Sep 2024 22:52:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Chris Morgan <macroalpha82@gmail.com>, John Watts <contact@jookia.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 19/26] dt-bindings: allwinner: add H616 DE33 bus
 binding
Message-ID: <qxudqhcsulj2jfewhi32ymd4dhds34zk5f2mhks3bckhfqhko7@wzj23fkatjxg>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-20-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-20-ryan@testtoast.com>

On Sat, Sep 21, 2024 at 09:46:08PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> --

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.


Best regards,
Krzysztof

