Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829132;
	b=WzClr9ag/o9mqTp7XYwKjaRQz3bGO6pz7vkj0rkroEu87wgwNHr5vVgUDQlSHMDH2BOq
	 m7uSLHW5vt/ItwVNqfhWiJ2PaIATbGNsl22N8EnftFSN1Y39fpd7Ra3HB2kfVaiVJUaOW
	 uX6Fnv3exOUJZkWnXeXjEM2sUJZHi4j/XYP6eq4Lfoq7eXzzU84+XCXcUwlahau/9DRQ9
	 zo1fxOXMJT4/o7o/GLdTwe7fd94isvo9F0CWXeRIxfOwc+EkoUuFCC84aQtAAAOxXi6IS
	 RH/O29GpM5Rw+oiU2orbn67JQXNggxfKoRGLF3GdE0XcD9ZGLv6inCOnEkWqilxZkeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829132;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+GAO2m0uVkw1jeIvSXJ80vINS6yHayEPfU+5IgqKzLY=;
	b=QbZWxBsPfTyt2egZYVjObv7Sw0fyWj1bWp/ZFByd+CpOJf4Pi4H7BVTnJjfuk23WU6hD
	 NRpU8LaEM2Na2HNJCEeW2tacKofvIz2Ya6E7ldYNv8p11w0ixsH9B7maUV3nwhNIy6mme
	 IoogK28b0IJMtuCRxsBE0Tl/jjoO6UZta/YQtEZWgxxEmhAPoYaQDb558QK6eU4qiKa6F
	 7VANB37ja/XGGH0MthqYD3Nl3vi2Sx5YWHlP4Hl/Lar2/Mc50ejI16Um/i4OD3jWMisO4
	 6TuZG+rVjVqjXqp6AfN5r7oRwEQmFsnh5o2fA+oRRDCAt+VPDYVXeHgdn0PyEfJSqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDxiENgP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465A607033E;
	Wed,  4 Nov 2026 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDxiENgP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194E01F0093A;
	Wed,  4 Nov 2026 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793829132;
	bh=+GAO2m0uVkw1jeIvSXJ80vINS6yHayEPfU+5IgqKzLY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PDxiENgPGZOzSU47+QbT+QoHcnONbeeCVcZOxfwusHWXrOkPUOtSWyT2hwBkBTtXI
	 outeJLs2ilcNX92MRoFOoRwrbWmnjx+CL/be2I1UTs5WWGe27e1x2OVp3hk0Ykbg4a
	 Gw7qEHdXxchyhho9hawvdS0ivJYusRHD8+IJEXONJYk3BSqarvYVyICuC00X6Qc9yE
	 copf27WUScqaBrA7REh7JMGeKxiuXWiHuNjjRz8hMHc56Lx0OINwH5SBtWPkMSAaA8
	 HPqSFap766sBPF2OX3YzVte4W3Rn8b6zrGlTs5+M/BauqQKXurJpJrHXm15zb0PqET
	 ajTEUPnM1gu7w==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
From: Brian Masney <masneyb@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
 <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
Date: Wed, 04 Nov 2026 16:52:04 -0500
Message-Id: <179382912410.620422.14715602424648962218.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=705; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=vSwWYvCAr6DiTNe43P0oz/rh02U0vJtb+dYlIdfEGuk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJer2RNqK2a+tniRPH6FdzxS1csCH81ZfuMSVVyggYzv
 wkUXdzc31HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBErnxk+MN9V8lT44CVicWF
 C98P6crZJS1+mf6H85ZJB0+PyUblfDaG/xVnsz6/eqzJl5G69ptNkaS2yJ2GjL/Tmt33/Dr2lHv
 jM0YA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> 
> Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> 
> Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Brian Masney <masneyb@kernel.org>

Since this is a core change to the framework, I'd also like to see what
Jerome thinks before we merge this.

Brian

-- 
Brian Masney <masneyb@kernel.org>
