Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403B3CD8BF;
	Mon,  8 Jun 2026 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931069; cv=none; b=fsFO5ZzQtJrs2oHvjQW/Nr6Ddbfeapm5HE3QO6Ou0s0gK1dTmFZkyTyHKOsiq009yaQYQ+M49t1ScXknwHN5dhSPkfS3goVr0ge5ouycoGINgAYdo4sSHoRn6RH3cgAhqUwwHf7tTM5k7Mq5aJQ7kYbUxukvy8V1bjusW+lzQts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931069; c=relaxed/simple;
	bh=CVoKgWZ+ub1WXLntPwtTto+oaVQCNMeX/4B9ZsAz0y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICrrZ7RC90rSBgd3lp6bAIfZhI/Ta0osTfzBVNoWupYTIrRELnlSIO+BdBRhZ6YywFBxNGH/X/TcQVCPjMd7Ac4u1b8QzPoX+CbDoJUrh7mDvmXOnBMUgW0PEieQTVqKVcCYNMpTPKPpQHWdxem9kFCmrroQHw/xBJ5sRHKCZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeM/Cyp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeM/Cyp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282B31F00893;
	Mon,  8 Jun 2026 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931068;
	bh=YbVuMNFrxqonNhSqkk1WADPG0zY295z5cgBosjf/o8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GeM/Cyp+0qarp6IBled8dKyC0JTNPFpGBy7L+bUKeSf2PxB1Uj379W9mfIF9y15k8
	 6HzTzBptnr7OasS67h43nZHEC5rjQUlcZqT5klOmt15exzVIOpWGXBazToMLgefxWE
	 T8f6rp4NPGi/cze6g1KPGvInyERZ4S4gkhs76YDMQmpVr/exgj8b7Sqb8+wMcm/6zw
	 7h/2TniXwtQdhsWZ+vAMN3asaIX0olHR+BWeuvusuaJwRWSG44Y6kYUOqgF5VxmwwG
	 obvV/hmo/UBsv2ZZdedldjtGAbINeWM7mRoIYfE38iiWXQXAD8VJ/I75OhAGOy7Exv
	 0eDrpkX/PRkCw==
Date: Mon, 8 Jun 2026 10:04:27 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260608150427.GA2682771-robh@kernel.org>
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com>
 <20260515-rcar-du-dsc-v3-2-164157820498@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-rcar-du-dsc-v3-2-164157820498@ideasonboard.com>

On Fri, May 15, 2026 at 12:09:27PM +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)

Conor reviewed the one you sent 2 hours earlier...
