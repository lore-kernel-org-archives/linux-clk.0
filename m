Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A862F745D;
	Thu,  9 Apr 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715707; cv=none; b=duoDRsPh+RmxnPeXJqI6vuBtyb2K6WTmiNr1wTzCVpI423MyGvER90IWKPPydioyEc2vPIUu74gyNZR5YLUk3uuoQW3mNDswr9JYyE4cBLzOFOdX13u/e2r7vnmSL4hiKkmPfe6he0Eb0ai3b4qkgPPNj4vhxLqJf9rrYRLyoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715707; c=relaxed/simple;
	bh=Qn4JZaehpW1D4FzWvGTsbu71VymBqoJqc9XDf7PqQm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGEf4uWAJgz1yUjrjo9XqeMtpx/i12qzBavfRmgj6k9a0r0zuHoOHwHAI2xOz2hjO8WhjFVufdrKjoSQ0nJrMRAAoRxWpSEYruUUXKbrA6F8QL5BXObe8vLglZsto7VLyN6E2zisWqDdnxwzH2srTIXuWzi0lyb4TfMFqeDam4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tecTUyot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tecTUyot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB46C4CEF7;
	Thu,  9 Apr 2026 06:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775715707;
	bh=Qn4JZaehpW1D4FzWvGTsbu71VymBqoJqc9XDf7PqQm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tecTUyots3nMLbmUJFf8QGczqvb8m49GlohSdWpE6TQVqQBaKhF+LsrxTM4w4hlrT
	 x2jzV+6L6pV1L+La6z4Ol34UMLrqGcnWPjyufepfm7SP7pKlyHFPJJatEjEDS/3Pz7
	 ARypbiyDyCPoY0EVN0gTlgdy1Nb/HyIyNf6PPfR/W5usmZ4GO2QWxcWfjz8K8u7aRU
	 gc/rjBgmykAR1JJ6Z7bmNnGiuOOqnNHu71T8f09cRG1bjAB5MDsfXZzNBOgepTIqmN
	 SCsgzvt+uDGzWCLe9l8TVM95rEH4EAepBuZrVQqIZHJQZ2focPUyH0fXqRXhEQzKhd
	 HdGBHZD58PJEg==
Date: Thu, 9 Apr 2026 08:21:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org, 
	laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v6 09/21] dt-bindings: display: renesas,rzg2l-du: Refuse
 port@1 for RZ/G2UL
Message-ID: <20260409-stoic-accelerated-stingray-fbe025@quoll>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a3dd4df30a6d950e5f38d46f4d9f396da67aa71.1775636898.git.tommaso.merciai.xr@bp.renesas.com>

On Wed, Apr 08, 2026 at 12:36:54PM +0200, Tommaso Merciai wrote:
> The RZ/G2UL DU supports only a single port@0 DPI. Explicitly refuse
> port@1 in the ports node.
> 
> Fixes: 2ef7cb1cea7d ("dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings")
> Cc: stable@vger.kernel.org

Please describe bug being fixed here in such case.

Commit msg so far explains none.

Best regards,
Krzysztof

