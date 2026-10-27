Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110828;
	b=O8QILsi+hgcNiNlHPHESYuCCoOFZPLtAMAi2zXdaGlgDdBtL6ofu+O3MH5dl1NKk2MmV
	 9+paIPxSJk5dti5/qW+h8iM00lIvsPjhto0+rwylnoeqCXdyfh1UmooHxeJMGPH/g7tYj
	 pBGVvyY19E2x8gGNH2nv6LUk2rliYqacCW0UPCygvfFI+HMNinFFf5sy4gdiXvRI38FF9
	 rgGKeRWmQUt5P0GjEDjo0qJcMtF2uJzBZhM7ix6tkxGbaNL+kv8lnplpjA7AUdtZ9mVHf
	 IJ8hyBTvGFytfnIbxdXDynZQQ7+AswjG+6MJwtMazOXxqZ4++KoRRSOgOiR389ZnXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110828;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	b=p/qBVucGQ2GsAGo0cPKLYlE2AdKz23R7nFB8nzwpZROkCi166ZWm+uuamiHz1iw/BqtE
	 sdyDPUTUFKMlvpFG6Ikdx64I/dt5EIGv36LquWQoL8t+lwLEpaE5t/Soi9pPD2tZVqVgi
	 FpEKZHvypby/G+TQSHSHfSHcibF1QRoQxBGawtFA4hnOou/zrJ6sNeo7zzPqlkVE9ZWsT
	 4UBStNoV3hZY/to5PDhVlZeUprE028Dpt9DC7h959R7JbZmWRC7m/DwJC6R9PcSGKmNRJ
	 uQs3cW0gd8dGP+QUkIplJFRI/wvIOLBgp4/Fs26K4uBzMZqbYA40yvdINFpyKhKraAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/3197F/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E70606A31E
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/3197F/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FAE1F01828
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110827;
	bh=GGNr41yBdTpZYx2SDxAZUmAJloAwnOll1e229XCkLow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I/3197F//5bf406jcAf97sCVxQOGKU6UQ+ppRF4YfsIIKbMuoTYo9LTj5Sjy3AD8w
	 KzUFb/HWCvyqo6L0w0RA7Mux0i2L9tlWeNARzqQCoTEuRvWNWYhZUgP4kshPwZnbqR
	 qLTdSi5pTD64Oq88TgupSzSmf5UvVYDrrasz4m671Snyp+Qd5JLlhhCzeJ6yacD0A1
	 ot3I4+kOrMBuvLutRTGJ/d8Tc0Og1ksLmp6oy4CedyYgX6NINvi1kEE5e0iYTsAhic
	 BWtWbqRrF12zvUIqmwHD09OsGL0TYIP5ow6FProRbLMo8vvbOqpDP+oG7cmSY0LqTR
	 dCULZxEgiBaxQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-49e1251674cso1490929fac.2
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 07:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByw8bAc4QKNJOLCK+0Tmqs42yHb6E1vdC0NBImML+blFhgEW7S1FY7xBPSmTzWZXDk7cZ+uoCnh8kc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIh4YHnc/LyEaafg3Uxu9udhV5xgUDVZDShsAUsWpXDwC0Ovg21
	sjM2nqzgQv7ne/MyONRsigIHPt6F0kIxYQQkyYYdgyyMnQXFBb02eCcl4U9qhcQ14yRBfK6V/Bq
	4O+t3FhMT8Cas+Lp4bwIKvjvW5Cl1rUU=
X-Received: by 2002:a05:6870:c2b5:b0:47d:b8a7:40f5 with SMTP id
 586e51a60fabf-4a83f533260mr6584722fac.22.1793110827181; Tue, 27 Oct 2026
 07:20:27 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <cae27d2d9dd17c081dcea27e3b223a8fb8653796.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:12 +0100
X-Gmail-Original-Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
X-Gm-Features: AclHuK9MY21FRxc3OT2vCWHfUpZZ9cxWX59B-lOuZ_icl7P9J24tGPdGErZiGJg
Message-ID: <CAD++jL=7GkFOS9i46WDuKHcJa0S-VemJ1OW33H8EKK-SZ67ufQ@mail.gmail.com>
Subject: Re: [PATCH/DNI 7/7] arm64: dts: renesas: r8a78000: Add gpio-ranges
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:55=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Link all GPIO controllers to the Pin Function Controller using
> "gpio-ranges" properties.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
