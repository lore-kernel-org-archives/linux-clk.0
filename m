Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492B12153FC;
	Thu,  9 Jan 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413330; cv=none; b=twekdBLQmWQ3Km092il4e/ssAxhmIYQI/B7XcUIxMfuOiOY4JOV/quOqeKE6qPQfK2tY49IWJ+Mcrtgx+IIslgmUxa2uSzHY3lbmx8FtT2SOQpE1jogRK7TAp924TZsGadId0P8mqOvCzQ7UhLus/CMzXdx/4+hSuNb+zo8bnOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413330; c=relaxed/simple;
	bh=LbMP1cxyodyElRexu6bEYIVYMSructjCAywnIpRXVfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9H2BBycd13a2wih+ZwJbkETtvn6atmVv6TMc2YZIahnMsrmSaPs/KpFPJGs0YOv7rKgpCO2Ae5W+Bg3XHvLobLVvGconSvphbQdq9Qj3l48fXrmbscURoCy6D8XE6GPKjESbciz0KUP7fQodzFUFRnDhqgfc84pJ3J9hFM56j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANd84GOG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANd84GOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF23C4CED2;
	Thu,  9 Jan 2025 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413329;
	bh=LbMP1cxyodyElRexu6bEYIVYMSructjCAywnIpRXVfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANd84GOGtxe66kPVbYuxrO0yRLa5gmhb8R7mKAxzbEjLcbNebETKpPmcMQePUcQdM
	 Kw+7DtrTySPlcrK5QEcI/RV5qSWjAw+FgjiooIi6IUsaTZtmOdlYc9f7C4FU4aX0pa
	 NuqLURUzOa779wC8GOY7R0Va3VDrDaTkMGLJUahvb87RH37xORdLDPelxhHLIAZQrd
	 WtAkvfKQiBSimYHdAMye6LODhNh/jsJKp0kFMVECcK/oPxsQFvUBZBpnm3jn/iPyZq
	 /hsqKgmXC/qYvqNErThm+Cda24+vny/l33xzESibjyWzQaHo3U/2sJfDwAZHYS3RfG
	 t9rJ6JREvCZrw==
Date: Thu, 9 Jan 2025 10:02:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <nvfvyy7vajbskfn542lxbvfkxuhasmnyni2uudy3cdybzlddiu@u46fcydzgxsw>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>

On Wed, Jan 08, 2025 at 07:53:07PM +0800, Xukai Wang wrote:
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reg:
> +    items:
> +      - description: PLL control registers.
> +      - description: Sysclk control registers.
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

If there is going to be any new version, then keep the same order in
required: as in properties:

In any case:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

