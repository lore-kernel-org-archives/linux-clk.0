Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036418;
	b=fchwUFnhCsSspCe0ktHSnTkvxaTBaDgaeOy6P42ReSiZPKozU0x2e/ocS+5n6FDdebUU
	 JIiYs2aH8jS8fi3vmqM+hExV8f7D17bjoPzQL12PCwGDwYiQPABBUSZ5UiYB+OPaKB9er
	 Jz5vrWS5CtPFPziXZdzd7JR8VALQgOR7OcTwfVT6Pd3sAmFS2weqjH/HlPJY0JyU8ceMh
	 P2Nk/vh1txgsUr2oOdmD5BP2V6NCt3firPO2TAOQftJmaeV0rIj9SH5JoRyyJM5gVFsXS
	 cHTjRT3fSpuNBcC21qzqlVLMT4pdgV16h56meEBLYN4WLZrKChwYhAZYX8ZtA+sK4aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036418;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lstpkAIMdhIw+8kIInQTbIFSQvVqWAgkCSm9ri4rJmg=;
	b=bSdR8lfxZiR1EmmrptaSLWOYObmiNnTo7DkfGkoFvpqgoyUMHN1geHrwdz3iPyfOBqKc
	 +TKkwnGXW9zBal8QW85U4zq6ADuo5U5Aza1HuEgrf82G5DbuyyzGkMvP4zzbkvv5qpI2l
	 hT4V7tSupMtQI45UFCc33hJXTFTqFgdgr45XIC9rQ4KV+YIny5mEBdqcTCjLZzXITIqi1
	 fU9+9whWPfkKQi5hHRr6HFt8lRDimgktZt68MWTNO9GVdqpldrC/zI6aisNIUcM6iM48P
	 jXCJKI1/CSEurJdp5CyTi6NP5oONVOezBX6QLb5v3+8bu4yD7/sVMxpdVGnA1lKL+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omuiVZJh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C18606A320;
	Wed, 18 Nov 2026 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omuiVZJh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C421F000C4;
	Wed, 18 Nov 2026 21:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036418;
	bh=lstpkAIMdhIw+8kIInQTbIFSQvVqWAgkCSm9ri4rJmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=omuiVZJhZM6x9teRUwaSK7YbBaY600rkORp2u2GDqoekPAKmsJ6G8Ka5+5mq4vFxP
	 jn0IR2UqCzS2BP99PhVTj3jIMgzRQ7Grt8rTmBlqCQQAhsOOMUDMK0LiLGsTXZfNKY
	 fZlV2NHg271oRxu5Fy+E0DuJKRXX7iluhp50der5q2Jp8llNkQrsjUmWGxvGkkFdiS
	 Eg6BdLRyIYAd8YjHQjSC4Z1PM7yQwpKA8kmkHQXjcl1ky5JNj4QqhKr+irC3PiyBtc
	 IWWZLuGbMwRAFhvkn42J1QNYYMEFMCCa12btmQz34oKbia9o9Mwn2dZgrRKe3Iph9T
	 LkketrxYjMRGg==
Date: Wed, 18 Nov 2026 15:13:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: airlied@gmail.com, jbrunet+clk@baylibre.com,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
	bmasney+clk@redhat.com, simona@ffwll.ch, linux-clk@vger.kernel.org,
	tzimmermann@suse.de, sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33
 layer reg space
Message-ID: <179503641576.1032413.14291544816555567669.robh@kernel.org>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
 <20261115061102.229680-8-jernej.skrabec@gmail.com>
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
In-Reply-To: <20261115061102.229680-8-jernej.skrabec@gmail.com>


On Sun, 15 Nov 2026 07:11:01 +0100, Jernej Skrabec wrote:
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
> 
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
> 
> Remove layer register space, which will be represented with additional
> node, and replace it with phandle, which will point to that new, shared
> node. That way, all mixers can share same layers.
> 
> This change is intentionally not backward compatible and the old binding
> will not be supported by the driver, for the following reasons:
> 
> - It can't describe the hardware. Plane register space is shared
>   between all mixers, but the old binding puts it in the mixer node, so
>   only one mixer can ever claim it. The second mixer can't be supported
>   with the old binding at all. It also has no way to reference plane to
>   mixer mapping registers, which live in display clocks register space.
> 
> - Supporting it would mean keeping a second, mixer-local plane
>   management path in the driver, with hardcoded plane mapping, which
>   doesn't match the hardware and which can't be tested, since nothing
>   uses it.
> 
> - It was never used. Upstream H616 DT has no Display Engine nodes and
>   the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
>   upstream yet, so the old binding never produced a working display.
>   Vendor BSP kernels use a completely different DT structure and no
>   other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
>   H616 display support. Only out of tree WIP patches used it and those
>   are updated together with the kernel.
> 
> The driver will print an error, asking to update the device tree, when
> the old binding is detected.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

