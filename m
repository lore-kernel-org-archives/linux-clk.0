Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9041C6D;
	Sun, 22 Sep 2024 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038351; cv=none; b=J/3Mv3aZ6BlT0ikEnBosh5mgUmzFqyBa0qOmdghNz7EfbnPFTjDtrB6NBjd1wcAvJFREfUYnbKq0KWFTavrDN/BnLFgN1V7+6u3+egqlrRJxJiGHRZKCI06xT6SOSa0sZKaOZnPaswbVnQYoNyBAOCd4QQEv0xi2WBb/znXAuFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038351; c=relaxed/simple;
	bh=8JrG0Uk0kZt0pPnpYEAf3tP6cQIGfmWcka0ttvTK1t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNLVd+8xz6Y6v5tHIHbF7jqmHdP9ah276fD6QC6UL3Bf8ylJgNCGCs5ThygWzESQYus0gN8vysWXQHWUXG2M0o7hrvS2mcrqzsNjZVBhLpueAo69CcCXPmNcUIFBQtnkcroL40vDCx2lWuIEBc5BTK45BVvis7GG3wHiOoy/wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAkQkxL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAkQkxL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D30CC4CEC3;
	Sun, 22 Sep 2024 20:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727038351;
	bh=8JrG0Uk0kZt0pPnpYEAf3tP6cQIGfmWcka0ttvTK1t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAkQkxL4rcNHWlT6M1CEWN3M+1s3E+OXtDX6LlnCnYtx8bG81bgDEpF9o55hD0Sqm
	 32rXi9dn+AL+LCIkwPajLCPIIy1R43q2PK/D8UpKuxvOkvHZe4l7wBorGKE8d9MXTb
	 RBN6wJB35L490ZQiDJwm5yUimwXUnOgnz/RugSi7cT4Y2wv7BQv7wjniUJIEa+aaj1
	 f1LbQdTM8BP8PKa6z/sYi+aeCNsOESZ15/4iBuYaSxwOMIh/BRHNcoigUKpYuhXftK
	 WhiFt7JgdLBc/eSiJ/Tvt4OFmvgJNJ+hpfvGPynEosVt7lpSG607REbER+hk5HOOUK
	 Vc038O5X8q7xA==
Date: Sun, 22 Sep 2024 22:52:27 +0200
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
Subject: Re: [PATCH v4 20/26] dt-bindings: allwinner: add H616 DE33 clock
 binding
Message-ID: <stdck3whwhbiyryo7uwv22piaktfr6ibawl4ckjnbuxanpcmsf@7o5hybvzyrnw>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-21-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240921095153.213568-21-ryan@testtoast.com>

On Sat, Sep 21, 2024 at 09:46:09PM +1200, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a clock binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> --

Ditto

Best regards,
Krzysztof

