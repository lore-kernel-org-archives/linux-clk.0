Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3629388393
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785949218; cv=none; b=EgaKUlhAULTWtBJVNW251bAeXawg9gv3x9B7z1jXkmKg21nmMzLmL2B/DdKgVsx7zP03ytXroN9JnNjU7aTU+cDO+kffaaeGH3/8BdXN1XEpAVFWv0D1UesBxu/FYTALxzM6kE6FwvYr5JFQ8j7gWahnPMLNws3TRAfsOCWTYOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785949218; c=relaxed/simple;
	bh=LiQnpzw4HjHZBmtr7rTuwMRq/YYsi4jNApYAqojZlag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/SCKzRdcJC2JB9+vfyUpCsMwaaa3jwwRnHHYi43uPEN0BbY/imJBYubXdL0IM2cxrz2aldiU23QzLdCdtlg13y23XuGudQIhSsmSwXAPp9w5PQU/wFkeWZghuWfRBS99l/D+GfKoo7cM1Hl8XXzLEZ4x98MDC/1tnGENDEeFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMWCYEvc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMWCYEvc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB411F00ADE
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785949217;
	bh=WBGLmgn1KuR6ekaDfS9NzoAp0N4ym3eZDjfC7Q20pVI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SMWCYEvcM74kJ2TgjQBqvWi4t4taCknixxdGSZjw76yTmZQgqVCHjoSNcC7dx3lF8
	 JlG6+1yM5zXvibUGlYm6788ep6CZfz+1ar5kTlKPrZ7aujiOudwt8i8xq9HrNG5OQ9
	 ZZWSqdMBikBMNTBBXvUemGwNQ9Z92E8gukI2Gw9bzwjlsCMn1GVttbrrcRfQuass9V
	 BxS/F+1nrvQ7i2+4hW3sF4VYf8ctqZHfmE1bBfGuc2IGjf875mk8T0UqP3RCqtJr0t
	 8LGsjrqufehPnoxwzYCrJ1BZqOHDM0ixpygJhMMO72tZPVLd9yul7BPzpabN6l+XNS
	 QndKgDwiWk5HA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39f91ba1ef7so8564821fa.3
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 10:00:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RohNfVmj5Xt03HOBLWv3WtjqQX6D4eUfUDGzJ3VKbcmH6SIo3qo25TQTxn3HamabeUlwm7lj7u/D60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFx9HbeP/3ej5YI150DYfFuy4Jn8S8BobIsg4kbiTme+NhjyQ8
	U0LS6B8TckCylvLpgMF3OJu/6VKFWh/KArT/65E9Tj0fawgmNNHoBgCPreEkqiRdpMhim2/OsLG
	AImgqjA1K3bkE7mEhm0szKeCc4ZL+lv8=
X-Received: by 2002:a2e:9a0b:0:b0:39e:b3b2:e95f with SMTP id
 38308e7fff4ca-39fbb2646cbmr11047971fa.18.1785949215957; Wed, 05 Aug 2026
 10:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624123914.1767374-1-hello@superkali.me> <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
In-Reply-To: <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 6 Aug 2026 01:00:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
X-Gm-Features: AUfX_mzxTaQi5lmCrQEStGQqjdfqlwh8KWbld4ds13aZOb9Ofar8XPEAC5gsAkU
Message-ID: <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniele Briguglio <hello@superkali.me>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Ricardo Pardini <ricardo@pardini.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 3:13=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
>
> On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> > No in-tree board references these gates yet. Boards drive the codec
> > MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> > managed clocks, clk_disable_unused() turns them off at boot. On a board
> > that relied on firmware leaving the output enabled, that cuts the MCLK
> > and analog audio stops working.
> >
> > Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> > state firmware left. A board that wants the kernel to own the gate can
> > reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
>       commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac

In hindsight maybe it would have been a better idea to map the existing
clock ID I2S*_8CH_MCLKOUT to the new gates, and add (or not add) new
clocks for the internal MCLK gates.

Then you wouldn't need to update the DTs, wouldn't need this workaround,
and wouldn't depend on the bootloader to set the registers correctly when
booting an old DT.


ChenYu
