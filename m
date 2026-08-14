Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827FA35DA55;
	Fri, 14 Aug 2026 02:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676223; cv=none; b=aWUZnoZKMDQML7Bm/KSVPD5p8CH7gffrCZNcNy2tK+lJSQgE+1b0i1aeK7kYK0EIgViC5+g4zlEa5qxxVoIN40eNBYy3HF8N8TIy5/kH0XV8LUwKi8nhxVkWlUuqFhBXaixtCGOa4vV/LrZXt+Jn1yOTP2n4MpkakYj1/YqlbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676223; c=relaxed/simple;
	bh=TJQGnU7kK1ohCl7KjHMDCEuPNX/cNgH5qpvJSwb8zbM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NbJ45TlnMIFynb/hl0GYmx5641DKnxzhsin6MeKn9CxKGbu7aKvM6bCUajvX6fN2sX1HpCP0K0oFa0kILaGl6EDV5gruu3YR5oVMhnM+KvTympzErIOCFOrmBA+jx9GGVC6XrTpwnqNMwGeLdsRUB/aKtAWrOoHmh9+bJ85VOCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP6XxOLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NP6XxOLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D291F000E9;
	Fri, 14 Aug 2026 02:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786676222;
	bh=TJQGnU7kK1ohCl7KjHMDCEuPNX/cNgH5qpvJSwb8zbM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=NP6XxOLAY8Mv/eB8YCBU8+kVKiodHFA9lemmZOwmDxD0G++NpEds/7h79ytLVxSLf
	 KMT9hUw0WOKsyioEy0Q5OVPadukhHFQx9rRwoyFeZtwDQRhWR/mj1qhgK7HZPDqH/x
	 CJj+5qI3x4P3njlx/UbuGXoxhvW51aqvxNuljl0f5fSvwrvfOAqdL6evoJKLjeiTZN
	 bwKdeyGcU6nz4gg2/L8ARlv4U4Qg/8/m3AZ0OstmmpQ31qsiE9ELZ4g4VUMhWSvH92
	 XUCDn93w7cDVUtuL8mFWE91rfYm/XOudHC7iThs+iKzZu5Tm//LnBdhziLLUfwdYwM
	 yOX1Ad2ow5O8Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260811-ti-clockdomain-v4-1-3ae0c0be94a8@gmail.com>
References: <20260811-ti-clockdomain-v4-1-3ae0c0be94a8@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: clock: ti,clockdomain: Convert to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com
To: Bhargav Joshi <j.bhargav.u@gmail.com>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>
Date: Thu, 13 Aug 2026 19:57:00 -0700
Message-ID: <178667622023.5897.8748471599440934741@lazor>
User-Agent: alot/0.12

Quoting Bhargav Joshi (2026-08-10 11:54:59)
> Convert TI clockdomain to yaml DT schema. Drop '#clock-cells' from the
> required list as this binding doesn't define a new clock binding type,
> it is used to group existing clock nodes under hardware hierarchy. Most
> existing dts omit '#clock-cells'.
>=20
> Update the reference to the old legacy text binding in the description
> of bindings/clock/ti/ti,gate-clock.yaml to point to the new YAML file.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---

Applied to clk-next
