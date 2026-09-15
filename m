Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7285F396B70;
	Tue, 15 Sep 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486689; cv=none; b=cd5q1RTo0svdP6WZZ1kpa5qDgIx4fsxFQpskieN9/9qKUFyMLoM+XNTTNCrr9qE/2F+9jDSSqD3WknaAmSQyHIGZODSU8zwjGHxxGU/BOz89Wzw0AFcA7OXwz1XHC5e8pz5vQnAcg9GtjODfUCKVsjRkXbCDMiTZn2OCVyAF10M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486689; c=relaxed/simple;
	bh=nzC7oa+r/phCJ/7hvumhpU+FA2dyGXGpPMkboLtxjyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uR4pawsN8tgP+jmSyUN042Y8yGvk/Lol6kQ2nxRlLeyp3B00oiDNxbzuJXgQBUTYm2vpZcPfFme6YBaYa1KD9he77CNbCk/+lKS9C41o8OwOvhgiIRcTQEOMUWhcwaJi3pL6xHHsKdU66f7Gm3iXRnwHjXU4rO1GCOeweGC5Yg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhV2LUZr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhV2LUZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BE31F000FF;
	Tue, 15 Sep 2026 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486688;
	bh=nzC7oa+r/phCJ/7hvumhpU+FA2dyGXGpPMkboLtxjyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HhV2LUZrxpzeI/MrBTkg/qrVe/GDGYUlQXpQoKi+DdGmOq4b7dcPJ0lLeetG6LRWg
	 9MVWaGr4Fovtyj/ZLIiHCdv4j/LxmKmtr4LGC9t5YZ3iHyxRYSzRnEOuPfrxtgSqgj
	 fSIyjOj6MGKqw2ZDj7fRoYukkZnUkRZDPFlpq8D+6xWhjXFA7I4rbFbH7FF0/0Xky0
	 jO95nu5zFYj+B6THmubNoBk7YqSxRJy1ygDbVJTFVt8RCm6ervarDk/3zSY4Cdq74q
	 Z/ZCsMWDbH6klPQPi0gnWLbNuizuDD9tdd89UrPn9MytxjNmGRc8tgwfGaCNHZRmT1
	 HwL2YijEpLx6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/20] clk: starfive: jh7110-vout: Allow pixel clock
 rate propagation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, vkoul@kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260915-jh7110-clean-send-v4-14-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153238eucas1p29917a31d10ce1aa55c1dcb44b62180f9@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-14-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:38:06 +0000
Message-Id: <20260915153807.78BE31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The dc8200_pix0 and dc8200_pix1 MUXes feed the display controller, and
> the rate they carry is ultimately produced by the HDMI PHY, which
> registers hdmitx0_pixelclk as a clock provider.
>=20
> Add CLK_SET_RATE_PARENT to both MUXes so a rate requested on them
> reaches that parent, instead of being clamped to whatever rate the
> parent already happens to run at.
>=20
> Co-developed-by: Dominique Belhachemi <db@domibel.de>
> Signed-off-by: Dominique Belhachemi <db@domibel.de>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D14

