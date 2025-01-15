Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9582475E2;
	Wed, 15 Jan 2025 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736943971; cv=none; b=hhB26/Ao+63oaHhlSLp2d8xnuaIp2dL/NAhU+O/5Yu/LEJyS3wLTVklLQl2+hy/L4yd3XP8iMU8p37xaqP9eQrbs5N7P9fYeW26dsUN3iArgVmhX9oeh3kyJf+8N3oLazKUmygOlR81m7zJuC2tbr8RyACRhqEXoOr6YHwGaQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736943971; c=relaxed/simple;
	bh=5wpMhUMcmRXdyvebml5WGJTVLxDt+1S0Rr+7+MoSKco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=envkmcCJ5aqLV/iyRlEOig1rnz9UHSDSnLvaU5zePdU6l/PTuADJxnTr2BsaK0xe8TFMev3KyPpoR4m+ZjjjWy8xW8MD12j/OWF7I3rsRNQ599vnAgRgCdYCEIryX1ez33oOWokO5LSIbvvE36rsb+xoAhaAO4exl1J3QpA2nQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXXpAqlh; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXXpAqlh"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so11165338a12.1;
        Wed, 15 Jan 2025 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736943968; x=1737548768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMDth/XNkGKYagQ1DtWaoZiZXixgZHuQEB9UafKVxPs=;
        b=hXXpAqlhs12KuX8It3wSvcIXONVDAOBvvqex6K7XWWqbg/U0/2kHngWyajyZ/xWntY
         WCdjBrQJo69drcpXQZG/sQYMbGEAcbGTvheW10k4i+EubgbeiZtPXeH7mBzo6jWrve4w
         vuiZIeDuheaYzsfNb67uiftbIJlKOmebr0gES5rU8alJ07D1CV7/q8uGGxB2PR0SDAqd
         pNo133VuMlR8V6Foye1sQ5bfDCsjMrTvC2OtEuBHeiT8gLhQOpcqLq2qNZro9Ams31Vv
         /3SGa7Ki7cEQyxRUWJu2H6nrrdDQHKfQDCfdEbeuBXZLcKPOvqfE6r4PEuP9jLvJ2cu5
         rPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736943968; x=1737548768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMDth/XNkGKYagQ1DtWaoZiZXixgZHuQEB9UafKVxPs=;
        b=BEoVh3urQl3AMREBW9pZ0O/SjK6K/PdtugDIAil1puKHSfCVmfYWN/keQErqsM0nCY
         jFQiKlTZH2xO/2oa/2mlseinZJK/yHDrOMa7NkVjuL3IKXaF03J7476v94uXxV4VbgYY
         oiPeUj2YyhCyeAGLqX4hNoS5XUhxcu0K1xVm4wNNW3tcOy4Mg3J/h9hAwsnrWEZTFucB
         kxuQj/3Q0juZfU2fkAJFcm+gLIgkYm1jS6H730VF6kYTRdSkvIBRC+StRd2pb9vn0CP/
         4bDbg8Cseim+PJx0RSO0vPT4Q1hLuXmUKoKd36A5ymlDkqGIgPeN6DLsqzJtvuEVs+eE
         wcDg==
X-Forwarded-Encrypted: i=1; AJvYcCVEaShHA3quwOjt++iKK5KW+961/GmQx9i2mSQcoI1iU0YO0UpFxyxDN07byu353Mfwdv4T291CeXJ4@vger.kernel.org, AJvYcCVYn2ztqLULHxsxqvMiFRI/GCGnHHx7ZYVftGnW+c9nb38Sun0P2LVuY5xYLVSJuSfcmLWD9iq6Bg3C@vger.kernel.org, AJvYcCX56dQCmHxrW1IbiLzAyBSdSYRtKz3gDjJIlCFfox0YWrYrRL+2GOoX5Pqv2zpvoeO9EY7ROg4ya6lJOGbR@vger.kernel.org
X-Gm-Message-State: AOJu0YzMiganFEGtz1c/0CFtTMM1I670zDNObTVbbFaCFQcRYI4QfXog
	KPaGde59ZikvtiRoU7FLRS9UKMAITTzyGomybWMYYpYaiADQEx8+vRiAFX3pN+9HbtNRiRCxbfp
	3aUzv0iUeFYvEwi8WOO9s5RiHAqY=
X-Gm-Gg: ASbGncsUkiSH6SOe8lK4C2CohA8dSo72AvjImiKV/UvfX+WT6di+Wh/0y+oKk55+gI6
	nck40ABZDGRcsWgSNZAP9CeBtjag+c5V47/jtn9g=
X-Google-Smtp-Source: AGHT+IH+qvBvGoDx+jCJz+KZPOUstmywrTmIX10mbpjcqahNDzahOjIUSRJNMh25pq9DtMwv8pnkssopEovu8Dv+ZpM=
X-Received: by 2002:a05:6402:40c6:b0:5d0:b4ea:9743 with SMTP id
 4fb4d7f45d1cf-5d972e09f94mr25110291a12.8.1736943967555; Wed, 15 Jan 2025
 04:26:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
In-Reply-To: <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 07:25:53 -0500
X-Gm-Features: AbW1kvaJVj90ysXZJNFs0kxY37_GZ4QOK4IDTusf86cx6vh6a5LQgqqnUgTCLtk
Message-ID: <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
	Michael Turquette <mturquette@baylibre.com>, kever.yang@rock-chips.com, 
	linux-phy@lists.infradead.org, wulf@rock-chips.com, zyw@rock-chips.com, 
	Dragan Simic <dsimic@manjaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>, frank.wang@rock-chips.com, 
	Elaine Zhang <zhangqing@rock-chips.com>, Alex Bee <knaerzche@gmail.com>, 
	william.wu@rock-chips.com, Zhang Yubing <yubing.zhang@rock-chips.com>, 
	Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	Trevor Woerner <twoerner@gmail.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 6:22=E2=80=AFAM Piotr Oniszczuk
<piotr.oniszczuk@gmail.com> wrote:
>
>
>
> > Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w d=
niu 15 sty 2025, o godz. 02:26:
> >
> >
> > This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> > based loosely on my original version, but as of now almost nothing of
> > the original driver remains. The main fix here is the discovery of
> > BIT(6) in the interrupt enable grf register fixes the usb3 disconnectio=
n
> > detection (mostly). On occasion an unpopulated usb3 hub will take
> > several seconds to disconnect. However this means all of the hack aroun=
d
> > work to reset the usb core manually is no longer required.
> >
> > I did my best to document all registers I could find. A lot was taken
> > from emails between myself and Rockchip's engineers, much thanks to
> > William Wu <wulf@rock-chips.com> for their assistance here. The rest of
> > the config bits were taken from the rk3328 and rk3228h TRMs and the
> > downstream driver. Everything that I couldn't find a definition for is
> > prefixed UNK_ or UNKNOWN_. There's a lot of obviously used configuratio=
n
> > registers with the pipe interface that are also undocumented.
> >
> > The only major bug I have so far is my AX88179 usb3 gigabit ethernet
> > adapter (Pluggable brand) crashes out when large amounts of data are
> > transmitted. I suspect this is related to the RX and TX tuning, as
> > leaving it at defaults makes things worse. As I am not a USB3 engineer
> > and I do not have the specialized knowledge and hardware to determine
> > what is going wrong, I am hoping the mailing list will have an answer
> > here.
> >
> > Please test and review.
> >
> > Very Respectfully,
> > Peter Geis
> >
> >
> >
> > Peter Geis (6):
> >  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
> >  dt-bindings: phy: rockchip: add rk3328 usb3 phy
> >  phy: rockchip: add driver for rk3328 usb3 phy
> >  arm64: dts: rockchip: add rk3328 usb3 phy node
> >  arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
> >  arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards
> >
> > .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++
> > .../boot/dts/rockchip/rk3328-nanopi-r2.dtsi   |  12 +
> > .../dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  12 +
> > arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi  |  12 +
> > .../boot/dts/rockchip/rk3328-rock-pi-e.dts    |  12 +
> > .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  12 +
> > arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  39 +
> > drivers/clk/rockchip/clk-rk3328.c             |   2 +-
> > drivers/phy/rockchip/Kconfig                  |  10 +
> > drivers/phy/rockchip/Makefile                 |   1 +
> > drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
> > 11 files changed, 1146 insertions(+), 1 deletion(-)
> > create mode 100644 Documentation/devicetree/bindings/phy/rockchip,inno-=
usb3phy.yaml
> > create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> >
> > --
> > 2.39.5
> >
> >
>
> Peter,
> I applied this as test run on 6.12.9 and dmesg says:
>
> [   16.368514] rockchip-usb3-phy ff460000.usb3-phy: could not get usb3phy=
 ref clock
> [   16.368534] rockchip-usb3-phy ff460000.usb3-phy: parse dt failed -2
> [   16.368543] rockchip-usb3-phy ff460000.usb3-phy: probe with driver roc=
kchip-usb3-phy failed with error -2
>
> This is on beelink a1 tvbox.
>
> Do I miss something?
>

Good Morning,

That is an interesting failure. The simplest answer is the
`clock-names =3D "refclk-usb3otg", "usb3phy-otg", "usb3phy-pipe";` line
was corrupted. Please check that when applied it matches the patch
exactly. If you are still having problems, you can send me the
compiled DTB and I'll take a look.

Very Respectfully,
Peter Geis

>
