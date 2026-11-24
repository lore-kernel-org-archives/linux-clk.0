Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514201;
	b=ldvo4NH6skGlQxsIRtorlxBmNjr1gipBzpao6/kEFjwkxabXolKg/gRb6kwr+XpQPgKC
	 y8yIkNipu+qFHP27uwjUS6EQezXDPxV5iVwc6sGHTDDRq1/TcOSyHYf0uLt+7SY0UYyUN
	 E81zf+1hJ5VQuxVdIV5lIKTkizS2FLJCgjZ7MR53rUsKdLgqxAYunCjceuVM3fYNHOPym
	 JSk5upZFDaRpQ2w+HD7CtV4oPrm5LoGlhJn0dR7v1HTCiHAomaHSX0Y8vMxGwY4h+GYcn
	 8ZdwHVdz6CTJOuKsE81LyO7sfjUJg6IeYFZZ+MM3KQbGmkuHRIV4vkL2xmxY0vuSygQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514201;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	b=sKoKrzo4YtbF7n/oB6EuQn6Q8s2fdpYOowv1tSOVmgljjHcW0rjwXyxt2211aTr3/lTU
	 QXCuoWQWvpNUpusJaSk/JG/aTrolhj/K+tdQdzauZp1bwEgIiYMfXDMt1v82yHvGlbTZ5
	 dw7/tT6ehXdgAZE2R773QQSoKXMrznYDp5JX5iTCHVNCEnOc4iAvupWdDWkim3LlGAoq7
	 ZBqZZB6fJFgZTgbauzLozTnGUrkgcM6Qt5f5MHGuDGGQknnRVdSO0ueTUts+O7JUN1s4+
	 3+sYkcUVZBnzNO3dnc4+qb60PNHxLoRjH2BO1D9sQtGj0USGClheOG0RQIM7Oy/kdhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA0D606A32C
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B531F000E6
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514200;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf2VEmI12JFLEgUGjVFCTv0QjW3DzCel4nyHoZURtSOyTH4f6ATQ1F9160ju0vvcJ
	 1PxA6UlQXZt13PWLF8DKe4G2fyNtZEfkNquipMkfq4cB4Vyyt9Vb8QLIjeBylBY68V
	 8fkdXxi2Q/3e9CgZNUHA8x8SIhVN3xZ7Go/+IbWqCEQoBiEztDO1QPeqv+6bOeCBfl
	 eGtwiPdREEoZEEaGpzvmpTVcOtD31t91A/v5X3KXjPTtvGx+yrS5sJKsvgO+GX4oTb
	 OlIqX7l7+ISlIVFgCxMWp9ns6b0uSX94naPiT/WMszXh8HjzkH/+81WGhZ75t3GckW
	 FxW2yjPsT6HCA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14a204305so2824118e87.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 01:56:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFf54Gic9o+Ntg1j+cGE1lsRytkkF7FFxWWYIfckcSfWDlYahF/UZH/rg6+wFKvUJvzZHUoru0DABk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wV9HSvgJFcFBonrEm2R+HsoKcT+41B7xkLZSd9Gq1hOQ1LOsJ
	E7OpyhT+9KYdzeqJwSv8jCz/bacgA4IRk1+/DduWtR8lwiQoIrHWIj8ONgpk0Lt9AKyJu64iAcq
	HIqKQqyMiG9rIDcPjHKJoehJmQ7gIWpk=
X-Received: by 2002:a05:6512:1048:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5c1bc81c49bmr3664194e87.55.1795514199208; Tue, 24 Nov 2026
 01:56:39 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com> <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
X-Gm-Features: Aa3M54pJBPNtS8HBHNO_8ov-NITzhFzIUmDM0dw5V6Dl7sMdZPPnTtRSJZShNYc
Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
To: filipp.dunsky@gmail.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:27=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Use the global syscon regmap for the five GPIO mux registers. Each
> bit selects GPIO when set and a peripheral signal when clear. Support
> GPIO on all 160 lines and the six UART pins exercised by the OpenWrt
> port. Do not guess mux settings for the other peripherals.
>
> Use masked regmap updates so independent pins and users of the shared
> block retain their settings. No register changes are made merely by
> probing; only a selected state or a GPIO request changes a pin.
> Register and initialize the controller before enabling its own hogs.
>
> AI assistance: Codex prepared this change from the existing OpenWrt port
> and GPL vendor sources.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
