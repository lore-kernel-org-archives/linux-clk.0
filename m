Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5A28E0F;
	Wed, 24 Jun 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306620; cv=none; b=N6CNoOZBHf9qvEle/S+oJHi91ljicUb3/IfH25nWylbgF429+dtvdDTQ/4fTzOvM/HTZdqGBD/2s8h4bN4aAatpOHMlah75xG+a1+WIf/26yLj3LlgQe0nsQylFDnSG3D7OJ3FCcRXFDc9tOtXSAkPemKCLl2bCxp0aU+haz5xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306620; c=relaxed/simple;
	bh=ZbK6nVA1ysTxa8u/JHp2FMaHKcnkB9wdMeMvpPYsm+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfA1YPBXdE/+8+SOPSCTAMeKHGlKUGj/f2o/gJbQMO/l3aQ8BS75xoc/xQ0DVFc7wxAyiK8MCG1t0eUEshPnhMl8dhgFBowzKybVgogLIzLKENhRhUjm/b7ahYRvznavUiMwilzmayvWNuItlhEmvVkddltuHzEKycaszxja18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJmZbtJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJmZbtJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA02C1F000E9;
	Wed, 24 Jun 2026 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782306619;
	bh=gQTOfWdw1qdEOgKqwNzVR7Pe01y3HaMQ9/zsv/ctqT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UJmZbtJFiDGZuKk+oxyxHxmOVjjwlf2PrzJBQ0W/VK8/shpCklgAx5ZSiowjXEDNP
	 lIMFdlglSHIJRenUx0LhvtJuMxW27HGieQKwwZcVkQ0gas6Ug2+RFVq685c6UIjqMd
	 m+CKpnotDFCJUZRdBS+ABSHFoJ136FK11xwJt0LiKy+2qS8v5Dx7/CvDWtCMbamktE
	 AHlAMOdMw9BzgIwZ9XGXhQtlt94KIye1QWJ0pxgoj7KQlgow/eBiPPDM5/hyPOeYI7
	 zA/8OmZczX+lw66yiKAZyPcQ8xA6Hde98vt5CtNRgwL/HDm+WPkkuG4xpXMiqi5v1o
	 YhX6/RZ9J94KQ==
Date: Wed, 24 Jun 2026 08:10:18 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: renesas: div6: Use ZT/ZTR trace
 clock in R-Mobile APE6 example
Message-ID: <20260624131018.GA4064376-robh@kernel.org>
References: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523192622.56605-1-marek.vasut+renesas@mailbox.org>

On Sat, May 23, 2026 at 09:25:50PM +0200, Marek Vasut wrote:
> Since commit 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks:
> Document ZT/ZTR trace clock on R-Mobile APE6"), the APE6 clock node
> expects two additional "clock-output-names" entries, "zt" and "ztr".
> Update the example accordingly.
> 
> Fixes: 2abdc3dcf978 ("dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for rc1.

Rob
