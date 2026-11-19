Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100638;
	b=mvtQQZ9lMhME4SxoQMUQmDxY5hJTFF1MDlz/JOrqcr0UmTyXzR2r8hS9TKl82FIo7Iyf
	 iqckyGngewWW/42FY/aI0nErhDkEAz/qk/m+HQBA3omhXMZxFeWHAf5ygHPX+yX7sLcLs
	 nR2qTEfiZoGOJuVbU9irkzQfcHovqESrvT6AnUSeyBp7C/lRv0xtTsnc2Expe+LBJPbIo
	 5uCzI2dQ3/Vhm2gwMqVJBzOaasui+MoBebsJXo0ntmvVGVzXPZrwoshJEGQI/lDjF2+sX
	 hWCZh9V1da76n0vrIqVpyNyqyc1hog10Q1gHEoMgsDU4l/iWoKAgmhgsdyyPbn5PQVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100638;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=hj0mLQTbYwlxqjWQICMElpvI8PErrkWWgWwZ4J2oTr0=;
	b=Jr3iKk2n7Y116z3ZAM7vtlBX9UoekxTBQ94HM8UNwwwkdTII2PGc7BYtTBc+rpUFs+69
	 yaljSCZUoBZxgJH+/WOtn5+aJe+DK3/jwoGK+VD7sXZsW/Lny/Ps5wtbIAFeA668iwhLN
	 FMLHNo0w5rf3kXFnrIDDLDl4eJa6DvUwZm5MX6ZKbXX5REHISlW65MRsA4K4xz5ewS5wm
	 Y01H/WaLd/vlaXqvRoc+m4lkbJqhGGVUEt06yOs28vFbFfbKMNaXD8S7Rc33n2AYp2721
	 ej8SZJFCAfakkJEOR5tVAyi87ElsEiXSQj6VmiHvDnAbPF+kgAukA7zm6o7y/GCzKGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fopXDmVo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34272606A320;
	Thu, 19 Nov 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fopXDmVo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FD61F000C6;
	Thu, 19 Nov 2026 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795100638;
	bh=hj0mLQTbYwlxqjWQICMElpvI8PErrkWWgWwZ4J2oTr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fopXDmVoCTo9q4U7FaLcnpixE/r5cBKsGpAfSyLOy+q/5KnEHoJpt9Rgk7KNJFQbk
	 kfmEcuowIjFZZ98wyLbo3/09k4bskb2tZwDz/v83L470WPnLjb8ha5+mX9ejbtxG+T
	 8QzyY5sFVm6saOVGnTjWu9IPp6/x4Ve9lxpI1arjNWNNNy9zrngnmE/gE04lNMvOOL
	 P1VPxBpmlDF6wBjYs2z5xDHmqwUgL58Sigtp6ETTxyGC4wYyKFa1fmtRFPtO/Prdr6
	 6P2b1xqIPHlEGjdpMQIjPU17xixCRa5TKNc/nIKDaOCuXTBMALGOpfg3cW0skVKmqF
	 ZgxL+RPDUCDjw==
Date: Thu, 19 Nov 2026 10:03:55 -0500
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH v4 8/8] dt-bindings: stm32: use reference manual names
 for ETR and STM bus clocks (ATTN: Krzysztof)
Message-ID: <av8P26kub_rYdnFX@x1g10>
References: <20261106-ups_mp25_clk_update-v4-0-9e32b817c38d@foss.st.com>
 <20261106-ups_mp25_clk_update-v4-8-9e32b817c38d@foss.st.com>
 <179443632478.1143992.14086932638988907034.b4-review@b4>
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
In-Reply-To: <179443632478.1143992.14086932638988907034.b4-review@b4>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Krzysztof,

On Wed, Nov 11, 2026 at 05:32:04PM -0500, Brian Masney wrote:
> > The bus clocks of the STM and of the ETR are identified by CK_BUS_STM500,
> > CK_SCMI_STM500 and CK_SCMI_ETR. Now that their kernel clocks are
> > described as CK_KER_STM and CK_KER_ETR, and as the RCC bus clock of the
> > ETR is already CK_BUS_ETR, these names are confusing. They also differ
> > from the reference manual and from the STM32MP21 binding, which uses
> > CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM for the same clocks.
> > 
> > Use CK_BUS_STM, CK_SCMI_BUS_ETR and CK_SCMI_BUS_STM, with unchanged
> > values, and keep the old names as deprecated aliases so that the
> > existing users are not affected.
> > 
> > No functional change.
> > 
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> You acked the other dt-binding patches in this series. Can you take a
> look at this patch as well?
> 
> The other clock patches look good to me.

Gentle ping to take a look at the last patch in this series please.

Thanks,
Brian
