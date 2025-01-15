Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5252E1FECCD;
	Wed, 15 Jan 2025 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736940146; cv=none; b=r3jXd21dRMhKXXofbTA3q5QhgHkKtwdpX02mJuUX+bze5hECtUCQKAzE/jRLRel+fHnXvyNpj3h0qosROQFE/E7r2ITPlgxRroCRuw8YcPv//Y8cEZ+QEGwLVxEQntJSMNQcFQ8IBGN2Orra+kn7O/IZg1CkiulKDLqAoqYnIDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736940146; c=relaxed/simple;
	bh=49LxeHybSC2409bMQty5ez/OmCupExnffsBxEYvwnh8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qOARdoNqE9biiMnA4qGLs6cOjLe8jl/l0QimB9WSsn8KF1vpQZBwPtdQJ38mmXL9DydfKJ+sjoF92p+biryHIbKNUc7XkDElXS0EHPF8fN6xBGb3g23eK+UyJRW5Cqkiq7gwgH7LWXl6Dc0nXHoskgFa5+4umLN88lzjEH9ROwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwBLGIWz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwBLGIWz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa68b513abcso1171246366b.0;
        Wed, 15 Jan 2025 03:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736940142; x=1737544942; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Upt/HfMdWGKSnxZ90iRw8HV4YDvibzUnc+Z+31Ue4g=;
        b=MwBLGIWzSCwXgfgT4JJwn0iEllQqm+pwkCzQBGa5AJ1uwUGcpvjPIBIYCnGY4fyl9a
         sjwXVejXyL+nBHlK3i9fIftOaptjts4DrKXi1G2/NFPP7yW0PmNB/XIDGhVPTGb32O4E
         S561WBcS2GLfASY9v7WkFq/Vnw/bcIslBxhK7oqwKRb3XsMfx2aC/6RAvTMqgVjs32Wl
         d+op7N6QSsJR/ZtPB0XLVqzfEvAMN1b8eLX44Qrc4c9h30LuJhk2bDkWiDbgKSjBfutd
         kXagj9XCPWeQ/g9VyWA7Suhfs7zQfG0gLf2N74RwhLErJz1szLZZnB3+CqYEsTd59EUs
         CzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940142; x=1737544942;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Upt/HfMdWGKSnxZ90iRw8HV4YDvibzUnc+Z+31Ue4g=;
        b=lERLhC716oye7/3/c11XuYL7ZTYw20PNQ8TQR+9N03GlP7j5rFAENtQVnI2jkP+37+
         QQWIWkiAjj8Si5a3e6YK74EuYM5w0fM1TvbCVv0dZlOdQt77J89kKwcE4G6uwgy6kiD0
         +Dmqqj6/LH6RosV3a6tcT3O/CT/a/EVfxfNJBkH+dDMmGdVIFoaopFSRWvRYp2nWnUyF
         z6ZQembAB0/PVI3vHhztNNCBn11waIFLo4Fb9PJMq5xTN5+c88Sino5vmj6FSyqkWMRP
         lRwiRZtTP5ugzo+vFG1hL0NPPN5Q1QWMdW5FDqIUHDPfcRcokLxAOS/NEi0/gTpqaCbV
         141w==
X-Forwarded-Encrypted: i=1; AJvYcCUuDhK5CcBNxItwx/1UJJjAzjX13qpfEYDDAlupUSwH0JOZHOcGd4gs3DWKW6k6rU+imhM5/FkRR5GKeWQ3@vger.kernel.org, AJvYcCVI1JIQT3C1lY5aHjHo7UmMBNbc/7GSt4jyePSfZg/48buJ9IA0GzjSpegBmPWmIekb4Wi33bSMLMii@vger.kernel.org, AJvYcCVuvWru307H6E5/bLjbPFZR/SNQhkWTc0eFnQRLNumEmIUTkJki6AZbElyQuDb4KuOvr9jgE+OyUk4E@vger.kernel.org
X-Gm-Message-State: AOJu0Yy61cBAhwP0O3Znh3RgS5KHVkmHtrYg8i0cbD2wUHlG2qlHcttL
	KQWS+Yn8PnMSd4iKPNvOKsTiWBPRHAh50iUEOgm8WXEj7zwh2use
X-Gm-Gg: ASbGncvcdoFyDkLvM1kZGyKuZRXDes3fTH4vO74zEGw4CMQpnITkWVifVcMpKJ9NRvR
	rSLijpObJJxYCV8ub8e+fmMznaQF+Rd3szwABAzF4aqloc74rAeHTyuf2ZdDQaGnD+hhPII3KFz
	K2nU/XczJL0WyssIc4U+x+vYIS7Q480juF2pRT7kL40xpxy3xVkuqUTLvW3rGOfvs6QI2CfnmrZ
	Pmq1oPNtqJat5CZQ0OifwchnjfaciHoo2c+Jm3qOf4zSFJwKijciRN+6DwnizhuigTrINepyvlY
	CIGTL3EKOvi+luxBnz6C/IovSq5/cpJZEwf4GA==
X-Google-Smtp-Source: AGHT+IGWl/B1zVg3sTaIZCIqSaOylWRNJO6IX9a5vKaFN9b3NZrlex+SipGGEVJonU8ibV27hGe6lg==
X-Received: by 2002:a17:907:781:b0:aa6:995d:9ef1 with SMTP id a640c23a62f3a-ab2ab6a84d3mr2804550766b.12.1736940142135;
        Wed, 15 Jan 2025 03:22:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90dc6a8sm737651666b.72.2025.01.15.03.22.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:22:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for
 rk3328
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
Date: Wed, 15 Jan 2025 12:22:07 +0100
Cc: Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>,
 Michael Turquette <mturquette@baylibre.com>,
 kever.yang@rock-chips.com,
 linux-phy@lists.infradead.org,
 wulf@rock-chips.com,
 zyw@rock-chips.com,
 Dragan Simic <dsimic@manjaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 frank.wang@rock-chips.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Alex Bee <knaerzche@gmail.com>,
 william.wu@rock-chips.com,
 Zhang Yubing <yubing.zhang@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Trevor Woerner <twoerner@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 15 sty 2025, o godz. 02:26:
>=20
>=20
> This is my newly reworked phy driver for the rk3328 usb3 phy. It is
> based loosely on my original version, but as of now almost nothing of
> the original driver remains. The main fix here is the discovery of
> BIT(6) in the interrupt enable grf register fixes the usb3 =
disconnection
> detection (mostly). On occasion an unpopulated usb3 hub will take
> several seconds to disconnect. However this means all of the hack =
around
> work to reset the usb core manually is no longer required.
>=20
> I did my best to document all registers I could find. A lot was taken
> from emails between myself and Rockchip's engineers, much thanks to
> William Wu <wulf@rock-chips.com> for their assistance here. The rest =
of
> the config bits were taken from the rk3328 and rk3228h TRMs and the
> downstream driver. Everything that I couldn't find a definition for is
> prefixed UNK_ or UNKNOWN_. There's a lot of obviously used =
configuration
> registers with the pipe interface that are also undocumented.
>=20
> The only major bug I have so far is my AX88179 usb3 gigabit ethernet
> adapter (Pluggable brand) crashes out when large amounts of data are
> transmitted. I suspect this is related to the RX and TX tuning, as
> leaving it at defaults makes things worse. As I am not a USB3 engineer
> and I do not have the specialized knowledge and hardware to determine
> what is going wrong, I am hoping the mailing list will have an answer
> here.
>=20
> Please test and review.
>=20
> Very Respectfully,
> Peter Geis
>=20
>=20
>=20
> Peter Geis (6):
>  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
>  dt-bindings: phy: rockchip: add rk3328 usb3 phy
>  phy: rockchip: add driver for rk3328 usb3 phy
>  arm64: dts: rockchip: add rk3328 usb3 phy node
>  arm64: dts: rockchip: enable the usb3 phy on rk3328-roc boards
>  arm64: dts: rockchip: enable the usb3 phy on remaining rk3328 boards
>=20
> .../bindings/phy/rockchip,inno-usb3phy.yaml   | 166 ++++
> .../boot/dts/rockchip/rk3328-nanopi-r2.dtsi   |  12 +
> .../dts/rockchip/rk3328-orangepi-r1-plus.dtsi |  12 +
> arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi  |  12 +
> .../boot/dts/rockchip/rk3328-rock-pi-e.dts    |  12 +
> .../arm64/boot/dts/rockchip/rk3328-rock64.dts |  12 +
> arch/arm64/boot/dts/rockchip/rk3328.dtsi      |  39 +
> drivers/clk/rockchip/clk-rk3328.c             |   2 +-
> drivers/phy/rockchip/Kconfig                  |  10 +
> drivers/phy/rockchip/Makefile                 |   1 +
> drivers/phy/rockchip/phy-rockchip-inno-usb3.c | 869 ++++++++++++++++++
> 11 files changed, 1146 insertions(+), 1 deletion(-)
> create mode 100644 =
Documentation/devicetree/bindings/phy/rockchip,inno-usb3phy.yaml
> create mode 100644 drivers/phy/rockchip/phy-rockchip-inno-usb3.c
>=20
> --=20
> 2.39.5
>=20
>=20

Peter,
I applied this as test run on 6.12.9 and dmesg says:

[   16.368514] rockchip-usb3-phy ff460000.usb3-phy: could not get =
usb3phy ref clock
[   16.368534] rockchip-usb3-phy ff460000.usb3-phy: parse dt failed -2
[   16.368543] rockchip-usb3-phy ff460000.usb3-phy: probe with driver =
rockchip-usb3-phy failed with error -2

This is on beelink a1 tvbox.

Do I miss something?


