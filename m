Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9C1CD1E4;
	Sun, 24 May 2026 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779658436; cv=none; b=cgdSffNM3zm+6vsJsOJZSCDxMLviAVMII3j1Cm4BqzyCX/QGJ2Llu8q5LsztCrrWn8OCTG8c/P+PCnNOnqZVfoPdzpWIPSn9lV7o5H5T8K2pNezdnLfMlQJwN0maOvIE4CSU9GaiOfLLEVS+fhjGILLmHuMrOJcgpQrrZlCygJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779658436; c=relaxed/simple;
	bh=U2bgs3hxq/b6hYch8osYnasgSoV5kG2hhrESAk4/vdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTLRmjS1BkjjIyL+dF7h7/txj68e6UPC4fAZh4WTlx/DjFGx1OTsJ/cv8AIUolBfQ+DJCsFATW0KgF96cs7/k+Rm8slIfa/zsD/Cj+7+ou0thFnOvKwrDYcAoTHjJgp8G5Nz4fQXbeoYbWZTuLu+tgHm4U1iqWynE0ZVfAEMkh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwP2+gD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwP2+gD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BF51F000E9;
	Sun, 24 May 2026 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779658431;
	bh=U2bgs3hxq/b6hYch8osYnasgSoV5kG2hhrESAk4/vdE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=XwP2+gD5BnemlPnX9mfPqISPgLuz7K/mdva6FOhU10kHMPA7wU+BjcLE6qQ6jUro/
	 vDbZZzK4MFzWmZUQYPGDXZY558lp/RLoEvLVDvUdGhLph5yod5Vtb5wi7LmXYIZQJJ
	 Iyn0kffNxLwXBCezu26RN0q5OpR8qvwO/ROjyIZGap6h3j3L1pUECK0x3DxBoa0u3U
	 JHoFFMp+WQYlf/63ct6pAy45hXVPWF9ZGz/JVOxkB64PXxxsLTyyWQKrkmVWll0yfG
	 hTjVFYMfxdHzZmioqFcPIan6qaUUjqrkFSVV3rZ0i69iEgVxiDFGjF0O5kJG/fVS5T
	 1xwt/y0klJuuA==
Date: Mon, 25 May 2026 05:33:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, samuel@sholland.org,
	mripard@kernel.org, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
Message-ID: <ahNuuaVlDl0KvOSj@home.wens.tw>
Reply-To: wens@kernel.org
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
 <20260509190015.79086-8-jernej.skrabec@siol.net>
 <20260514-valiant-ape-of-discourse-a4f5a9@quoll>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514-valiant-ape-of-discourse-a4f5a9@quoll>

Hi,

(resent from new email)

On Thu, May 14, 2026 at 2:04 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > As it turns out, current H616 DE33 binding was written based on
> > incomplete understanding of DE33 design. Namely, planes are shared
> > resource and not tied to specific mixer, which was the case for previous
> > generations of Display Engine (DE3 and earlier).
> >
> > This means that current DE33 binding doesn't properly reflect HW and
> > using it would mean that second mixer (used for second display output)
> > can't be supported.
> >
> > Remove layer register space, which will be represented with additional
> > node, and replace it with phandle, which will point to that new, shared
> > node. That way, all mixers can share same layers.
> >
> > There is no user of this binding yet, so changes can be made safely,
> > without breaking any backward compatibility.
>
> There is user. git grep gives me:
> drivers/gpu/drm/sun4i/sun8i_mixer.c
>
> which means this is a released ABI. As I understood, the old code was

We held off on merging the DT changes so that we could rework this.
I can't find the actual request though. It was probably over IRC.

> working fine but just did not support all use cases. Why this cannot be
> kept backwards compatible?

AFAIK the "planes" block is shared between two display mixers. As the
commit message explains, this prevents using the second mixer, since
only one of them can claim and map the register space. And on the H700
(which is the same die as the H616 discussed here but with more exposed
interfaces), there could actually be a use case for the second mixer.

Hope that explains things.


ChenYu
