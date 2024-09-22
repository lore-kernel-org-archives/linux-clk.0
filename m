Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8FB41C6D;
	Sun, 22 Sep 2024 20:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038327; cv=none; b=jJVdkGMi0cf4h1LSA7KqBRXFXwuX6/bXxQ1ou5a8ZYuv8M0oQDDQ3pCGm3ILWAxtoUcgKXJLGRgNlAVtkDoRWPDq8ZpwdScz67j5tBcCbt8kZmllxNlBt2m0KKo+TSWSJ2+aHcjQpFiDbbT45i2z2/+LtthCcKvHtAlYL5WQFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038327; c=relaxed/simple;
	bh=KwpcBLZJuz/IFUx3YzGkLkjPmwp09+c4661du4ZCO0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUd7cO8jsGI83JyjERwzzcymcShTdh3++O9aMzUuKzfaEYdlGhFpJ+ysb8HD8DqTBtk0xXx9GzPnOUUxPs+qi8SygSm0EA12SirRrVeXs3bPwbJFWkun0fy9GOODiJ82smoVx45DEO+21VSVWq+aq3HvghVDZtcKKnWtDmRoiE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvO3jHbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvO3jHbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5E6C4CEC3;
	Sun, 22 Sep 2024 20:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727038327;
	bh=KwpcBLZJuz/IFUx3YzGkLkjPmwp09+c4661du4ZCO0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvO3jHbsSazItW/axOaPAiPivUaWzqbEewfZixUk6sJfk3MfknzS5Dw1gDDiXgeGQ
	 yMxO6T3I1VrHMqxeeaJr3LfaGdroeDP2XpSfqsP9evyCFIR6SO7wxtRXoVKz1aZHGI
	 s4y0LyQs3ewWJYlrXvwZVvc9Oac8kQm1g5LFdqTJQ2ZHF6xZDddn6wuvLeMQYBV5F7
	 2+lYys86MW6ihh2Imn/BnP0KlIQaxVNnpr7G/6fZOt33FVW2czEoX68+GxyjvLkk65
	 n81sHbVGIer5fSucbKGggOQagcU0YyBYQ3ZTQO0toqkGM6YFb6a1Rr01MekAtS/QmC
	 dFg4vmcUMfoPA==
Date: Sun, 22 Sep 2024 22:52:02 +0200
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
Subject: Re: [PATCH v4 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <wma4hpidn353lsika3a5t7qf3ochmtbowhp4g4vuqrvgzthltc@yfwp5qastn7f>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-22-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-22-ryan@testtoast.com>

On Sat, Sep 21, 2024 at 09:46:10PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> --

That's not a delimiter and you would see checkpatch warning (because it
is quite confused).

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof

