Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963137;
	b=D54YIXord3kcdhocRTKVtfhBxpSdIU4u4oG7cAhakwIITky0Kx5WQ3to37nOsAobhJ4f
	 ouHwtpP7sItekweNYtSRInJeiEfQwqfJjiXoquhxG4nEQsmNNy707AMoFcX0nwuHQK2GB
	 exXOjGz6kcqZoV8M8RW+LBYPxcnJhDTuOy/ayl9T3MlDWP/jbNPR9XcN1Kq6Q31FDDKKT
	 XXI4h91pgNtE99uXfc0zB/NQkgFMBPNEjlC/fTt0ZLmqp1XYdN6AbJYMXoGSmj7LfBcB+
	 Y0IQuaz3SFOkvu282mqSIjZTMzz3GWIKmHeOICEVmWUqy42ghw/k0hSUI4UV4MWWZGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963137;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=++HBOF+kCz+VVIlw+glqyAPaVDTlCd+VNyUS7SFDn9s=;
	b=L8YqokT35Cp8pe69mnYyK2Thq4EkFna/JEriPrkx8lt0Yw/GRkFKq2GvJIVG+EVEGKTf
	 eDGLJr82kWf89wUOb/cLsEwbtKNQveXWFI/s2524V8Jazvrx+6+1L9w7wFFeBLrB+W14D
	 S0bmgBRFGD0ra9gaLMHnkHUkMZl2Y7pdKPvitfh0gr5mXgcPQq9A9NB8btCrCzNvSKZ5k
	 kBvLaONScJkD3Azh396gjvz1qjfCt7gQqXZmmlxttMAirpbaEyev4svvhgTs3ac8/CdsE
	 /jT27eP+rXCZPAxf8O7FJzM4cABZiK1mV0THfJefR778QktO08z8dkPVWyqYvBIvLTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+PWisuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6608606A32C;
	Fri,  6 Nov 2026 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+PWisuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2321F0089F;
	Fri,  6 Nov 2026 11:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963136;
	bh=++HBOF+kCz+VVIlw+glqyAPaVDTlCd+VNyUS7SFDn9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f+PWisufDn/+cGdsVe6bPdVS2FsYQ4HNnxCFh1lFNx+plNeuH4c+bqPA6eDWJyjjL
	 H2hmVoDWMVCvHzV4IsLCvcrK9EFb166aASX7plbBp6TkgoD5wi4G/s5VMZmEZUZUR5
	 AHg3gTy30MKBaNeeRYRpvv+B0uygvg74trdBWKiH3tPq56xIcDZMizoHvoqm/gmZbD
	 p8O/ImiDuPB7pGsEw45Im9BZcA6JrLs/t/jIZHIg+28QRCNdN8WlnbJw/WvARMj1kj
	 Fj39HAslJ8IwZQz+0fRT28JaLG8jYGh70z92bN/HKqXIBXq7d2afvSWr2wpc5kdhRt
	 ipLHae+l/Uxgg==
Date: Fri, 6 Nov 2026 12:05:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 07/16] dt-bindings: nvmem: microchip-otpc: Add
 required clocks
Message-ID: <20261106-rainbow-eagle-of-climate-f11b33@quoll>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-8-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105110715.2486432-8-ada@thorsis.com>

On Thu, Nov 05, 2026 at 12:06:43PM +0100, Alexander Dahl wrote:
> The OTPC requires both the peripheral clock through PMC and the main RC
> oscillator.  Seemed to work without explicitly enabling those clocks on
> sama7g5 before, but did not on sam9x60.
> 
> Older datasheets were not clear and explicit about this, but recent are,
> e.g. SAMA7G5 series datasheet (DS60001765B),
> section 30.4.1 Power Management:
> 
> > The OTPC is clocked through the Power Management Controller (PMC).
> > The user must power on the main RC oscillator and enable the
> > peripheral clock of the OTPC prior to reading or writing the OTP
> > memory.
> 
> Confirmed by Microchip based on vendor internal documentation (see link).

Your commit msg should mention this is ABI break and its impact, e.g.
Linux will stop accepting existing DTB.

Best regards,
Krzysztof

