Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E30312825;
	Tue, 21 Jul 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640169; cv=none; b=rTxvObEWeaST59gtzcaiQzFNiqk4qjYOd1IrOllWrvYGujRrz7k9ygv56k9sSaWylhCJzREupqvJBerByFiCjqrE3ONfbPJDPYdp3FQs8h3AGBrHaVpL+rtm2+e0Tdn+6/bcrpnanF8PHdTPmj6NnIe+9Tzq7Q8YEvPRNYfWM8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640169; c=relaxed/simple;
	bh=SYHDzD3O5S/2HOy66gQFMFXJuIiLjuUX3+0ZVY389T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiFTzB0DM1OOkj0hyDwYcv4E5y8wZ45fLc8QdgQoU2RwHsvFoj+IGBmOJACjT2KorsKi7svtxDyawmZzW5dmq1pMAnQ0otBJzEvpYozOSzB90nZqWp6mJ+SHTK+ogWQ+YHgJ55r6Ueo0X3hOLiY5P5pOwG8K4yuE4DX1skTdeiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOH/vPbT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOH/vPbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D1D1F000E9;
	Tue, 21 Jul 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784640168;
	bh=Q/GjtY1ev0t9VsYGo1JpjvPnq+e0Cu93T5+uLvjeuG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOH/vPbTV2mHYRmI3OHSETWvAcLHfjbDxMx3CTYsZPG5S0+qeQgy+U77auERpHWpH
	 YH5e87iEtdtuT8BYi9A72HqnodbxhLLZJCVPPn4oqmrGv7yjvGMnDKp9UuweMLnqfG
	 xudYAzgX0vSsAZku9b7d8OaqGwGomgI78DebJFhw2tAni+BjX3ddZjLQDROtnSU7QA
	 MePNKta5gygFVYJxhAUQ4Vy6nH3UddyeNCC79KQ+Wj8ZGWMH6Rnw7BQpSp+0L4IUyh
	 KnbQHSMiCO/GE1+GU0d2xLewBvOYOWVXzpEDFH6ACzrYUglIIcwzxBKFHv9Kac7p+E
	 GYMFDoUBhMxHQ==
Date: Tue, 21 Jul 2026 08:22:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Brian Masney <bmasney@redhat.com>, simona.toaca@nxp.com,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, daniel.baluta@gmail.com,
	goledhruva@gmail.com, m-chawdhry@ti.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: clock: ti,clockdomain: Convert to DT
 schema
Message-ID: <178464016699.3250705.12302467353770093561.robh@kernel.org>
References: <20260717-ti-clockdomain-v3-1-3c263af4e9fb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-ti-clockdomain-v3-1-3c263af4e9fb@gmail.com>


On Fri, 17 Jul 2026 03:15:42 +0530, Bhargav Joshi wrote:
> Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
> required list as this binding doesn't define a new clock binding type,
> it is used to group existing clock nodes under hardware hierarchy. Most
> existing dts omit '#clock-cells'.
> 
> Update the reference to the old legacy text binding in the description
> of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v3:
> - set limits for clock-output-names and clocks properties
> - Link to v2: https://lore.kernel.org/r/20260622-ti-clockdomain-v2-1-434dbe0789e2@gmail.com
> 
> Changes in v2:
> - updating the stale reference to the legacy .txt file inside
>   bindings/clock/ti/ti,gate-clock.yaml to fix make refcheckdocs error
> - Link to v1: https://lore.kernel.org/r/20260621-ti-clockdomain-v1-1-e99a56af98ea@gmail.com
> ---
>  .../devicetree/bindings/clock/ti/clockdomain.txt   | 25 ------------
>  .../bindings/clock/ti/ti,clockdomain.yaml          | 44 ++++++++++++++++++++++
>  .../bindings/clock/ti/ti,gate-clock.yaml           |  2 +-
>  3 files changed, 45 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

