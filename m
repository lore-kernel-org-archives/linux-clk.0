Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115981;
	b=hfXEHPGvLUESXmfNSJS9aM0C3qhAWvE1ZwfrXLt9RHBgJKieoT+w/1Yp0nh/hGS17s2c
	 9aYkyM4vIsudHJtzVANYA2lmC+t9OdPEzVloeQBKp9SH4ROlYk37KythrDsxjgK9ADS7G
	 dxz+InReiAUwAMlsGF6vJNQgRp0SV8XucQ0bEQg4moL/l14koYRhXapQ6/bTyagD1hP2A
	 5ivgINq9y6rCVQrhRxPvsG5p4osBtfCCm02Wjf5p4guDaWER8xdvUW12iuSTBFKB6a1wi
	 Dcp9sMOefh+JnoTFxn9ymIvZ90VpADSG7h6awZv+K4xmdBJUF43lFguw5G30/0uSTyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115981;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=l2yGCyd0WOkWatITgKbibGfxPc9WbZpzN9WO6vvnkw4=;
	b=crqF+KzlJFQat0yeJzpsyR+SJZspV5whsB1rg8byUxye2lDXs2r84qbyQwzvWTi/ADdh
	 vf95Xc5bFbbm7+zHYua3Xpiut8Ao5m/SL/Y2UzXCBnRF6839dDbPz/BuAvnhdOPXSs707
	 NHcaP+QFPZp8I0R6xmT4e3CDAffRKw41kPeI11dvX/CkTg5cPgMZsLu0mWlMcevHAA9Am
	 z1lgCNVmyT82PyNEXIn8pfsL73clRK6dt60SpEpuIRX9z4V2HtQO+4zvnZEMdeXjN+QZW
	 hjFDQeLBaVl0+/ATcjsFnEO9d7O9zlLkq8XIlcCnRgVEYQH5N4v/yNCdsQM/42CRZ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5T6wx0b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37C606A324;
	Thu, 19 Nov 2026 19:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5T6wx0b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27851F000C5;
	Thu, 19 Nov 2026 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795115981;
	bh=l2yGCyd0WOkWatITgKbibGfxPc9WbZpzN9WO6vvnkw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5T6wx0b8lOjgrFDMvRhVsk5I5tspkzk9dL51eD5ZDc4WZHBeR5bZCo/jF8+n9wso
	 VKIoXy8Tc6tNgYLtwsUA7H4WKMsDFXqF2Q7reNxzxFjYNVDbFYvcrjWs8ppUk6NKDN
	 Hg54SmxOFB0HzxLZ+MVW86IbFSkkk046YbtvDKs07GS2chBWcFoHHMQn0p+iNC94/s
	 fBXXldxHpRcBJsAlPXtGz70dfRNYdqdw/WKvBOSmHerjMPw4XcUg6c//f/Gfk6H43B
	 0kEMnnJeWkQ+vUtwMSs8retplLJ1n4oL5pPt5ii+zzViOI+bXz4dv/TnMSzUzHORDu
	 nt2ZUCv5wgWPA==
Date: Thu, 19 Nov 2026 13:19:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sunxi@lists.linux.dev, Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Brian Masney <bmasney+clk@redhat.com>, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2
 clock
Message-ID: <179511597213.4062021.4090144090706436568.robh@kernel.org>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com>


On Wed, 21 Oct 2026 18:08:55 -0600, James Hilliard wrote:
> UARTs use APB2 as their baud clock. Expose its existing clock ID so device
> trees can describe it separately from the per-port bus gate. Keep the
> existing clock numbering.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

