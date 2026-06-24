Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768703A782B;
	Wed, 24 Jun 2026 09:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294102; cv=none; b=EcgfoVBuUqXKOqZE5HqjfkPvjK9e4Jw5DyUf4D8QbWnm7MNPMMj7vZHlK2K22xroT9/4GwadrC40UT1x5HTwu75Rbl44nN9S5QcUYecxK4GdU1qP3aNLtGyusvoNQFCqHpOXZTIDBsS06U7b3ymuTLzNX8AyE/3fllVsPX7pBVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294102; c=relaxed/simple;
	bh=0ARcy57yhCmFwp8XBYd/7T5rk11cP9t+HAJcbxN51jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqXAjziXFkuwpRsZpRAt04BGc56/xDj+CAwjXxnYrdoNW6Gh/+j5YW1fa6vsilN3Gg64nL8Nw7/bRP2sW5FsTP5271UAkYNUs5sXeD0hDEW9YlslHk7RSmQLPFR97pK01lyDX3Ff5ysmQP4pYi8q4mYquiwaINquet+ULlA3xOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJshYpNX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJshYpNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E611F000E9;
	Wed, 24 Jun 2026 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294098;
	bh=SiKhRMofp8HLMU4VsMK7pmTBrxy4O47vi3cOBi0Af28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CJshYpNXSFVkYq4KPkj9C7cJxRotU5Vqe819FM9T74tX4InFeZfNa1On7qw0JuEoF
	 eB37t6x6nXmhefhLD32WqqE4O7ddLOOzmJDvsCTDl/KJTJJZ7j78zmL+PRcI4vR95n
	 9GpfhYADcxcpUqUpRRpNgCjn/imae85+QepUBCtwdza6R591yMVVKM8NHlCPYHuEpi
	 iI10bcTxn1WlYNOw5EoJMUwukpwlStMSb9CIN0ripxXp0bluT9CcjRzete0u7xLGI2
	 zqurpkby+5u/bfR78JODIRiVIxtU1O+hnMBITvbPV6CFAR0CRqC+yYm2uAf+evtXny
	 gnMsC1DeLSNgg==
Date: Wed, 24 Jun 2026 11:41:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Message-ID: <20260624-advanced-pink-dinosaur-ebe720@quoll>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>

On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref [1]
> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
> ---
>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please also update MAINTAINERS file.

Best regards,
Krzysztof

