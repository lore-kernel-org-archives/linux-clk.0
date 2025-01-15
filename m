Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26924224A;
	Wed, 15 Jan 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736947546; cv=none; b=n/eDAw0oC0GyW+zuzFdrz9CyLdGtjI2BvKFYoeLhtA0oGTA1IlImmPYSi6BqeEgyvy/7g4lK6zDE0vj9grbg3eFzooYAp3wYQKHYb4hI+UWB22+yGgUK/2AIbrJv5a5yc7T4kGcyJnh/P9q0jK1I2nqUdklKHJd7w69eabvf1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736947546; c=relaxed/simple;
	bh=UjNNY1RAg1VhVeqMnx0ZsVoNrsHpT5I/EJbXCXYxP40=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UDMT0E49A7Xr1qGe+203aNLrPbOjQTOFG4drUe+GToj+ZLUehFtKEmuFyhR3gv3vKDqHPTO9/JuewNSBUDW4DwY3Bqp+Mx9GZ2m9eLL7sUySRykjfzQr7PLvpMAw+ydpZHJgpjdTOy9FDyTCZcjMtsXvdKxlyObWHKxeDK6zNPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS0hRMx2; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS0hRMx2"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso11151447a12.3;
        Wed, 15 Jan 2025 05:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736947543; x=1737552343; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J7daUrtsODw4NkaaLjzd/s3pUHtf3ua4xDuRfkTRUk=;
        b=PS0hRMx2EQGgIU7+VuDmitAzlZkGoIDljZmuq9UeLrB5Jbxp4gDIPZKu1KSUNdz4IX
         zfuH9yTWipDvMtbeBjqhlQEWe0CPVNAA/HkJ1PaPinYG8CL+JkPtEm9lNMYMmF1oNh8M
         2mvOCdK3WEu4QSVzyZpvQxL5miMLJXKPZOM+dKyvVD3z2jScRJS+TmkZnBlOSiA+petD
         clcAAElCMYMzEi3l4cflKx8VD6TOCQX37Ml7+DtEH8JQ8ppw0fUjX2EiuIQ8FMvC/+wC
         fPBptZ0JjBy0BCirlEcMAYZ0ePdPRTqMJ4z2aBMFh+gZqduPktTlOXd0j9QKZkzgweeP
         wjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736947543; x=1737552343;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J7daUrtsODw4NkaaLjzd/s3pUHtf3ua4xDuRfkTRUk=;
        b=X7K05dt7/r8adgraXxBanVOyotTWFO28nAW4fuxbX/ngNZ3esamXAtDzxxzVRedvHC
         FucL+DJGfILsi0vj35hsH/aeejQqWgQvHM0iWLjRCOhFAGGcJlugJZSaJy6UT6PXDteG
         x90lKkPc7wQ6dIoAhaR8M589Sg2PFGDFBidFAgXgIyJjg/tuAZB45Sjg1rRphpdjDW7X
         62s6IeCDLwh80nFCJERIEgaMcXyJHD4FsSgkgYbWh4/ZfTTS+S+jekkO5+kWtbqeqrve
         byb7BrInALnm5RBtZ73GeiI7GDXrqg8RlIux7jVSM09yAU5sZJe8q51T9clKFLEYMeBh
         GbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Y/GqgU6rKcjTQ+BpZsvJekTkECpGneAT4pjcvR6QG+mdz5K4DsL/IpKhcB5lANr/c3dHp6a/hHBWV2mb@vger.kernel.org, AJvYcCVzYbVBdSKCceH9J9MLMiqs5jG2pezxN/J61oH6mM6uem+PhakAPh4yWGPsLmGF7g4Psod159x84mM0@vger.kernel.org, AJvYcCXpYRRFwAW0SzqN9wjfGqBENysVGqHWdsiXtkviRlSlEHT1gZcz3sVii8262ekFtLpev453ejG7q9ox@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiso3Y4Ai5a7bOJNjMURO5aIdYGSg5NiR422aUlW+1uxQymtGM
	fhFchALWQvH/BgfiYMwSKdcTw6K9VIEARga6Iyya+4UytoEb+RPg
X-Gm-Gg: ASbGncssPFmJ5uufHiu/afU87dkc07VD4ulLPlhexSaCNfR+Lr+YzLvzhDI0f6J+60M
	peAYDzscWBnd88NQyk9jOEy+Nd5HBBPJe4MM/kiPxvQH1cdUleq7Z6oAOtrr8LKaOcohU8vmaxf
	dIstdseDdoxfL9GYrC0FXo0pG6pN3xzlVQkCGP6YpTK/PhkjT+U3OjLgqi+GdGNqFlAtGzL1WHf
	IV+b6bCbEKv5rXR2jYQ0vU/yXTehT+YihvqpOvCxHb33xwbaGjR9m84z3zD2D5bKCNnU169U3ci
	bu/Ki8uDTdAtURxgmgeG+i2WIO6AkAIwpYq9Ew==
X-Google-Smtp-Source: AGHT+IEJFePPg9NnmpiIivTBGg+UDQYzhd1hyTCg3WlD4AaxxxCknAyEcJXeSZ7Quwxou31mkxCDNw==
X-Received: by 2002:a05:6402:278a:b0:5cf:ab23:1f07 with SMTP id 4fb4d7f45d1cf-5d972e1ad09mr24730872a12.15.1736947542796;
        Wed, 15 Jan 2025 05:25:42 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c496sm7498120a12.16.2025.01.15.05.25.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2025 05:25:41 -0800 (PST)
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
In-Reply-To: <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
Date: Wed, 15 Jan 2025 14:25:26 +0100
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
Message-Id: <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
 <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 15 sty 2025, o godz. 14:15:
>=20
>>=20
>>=20
>> pls find:
>>=20
>> dtsi: https://gist.github.com/warpme/6af9e2778fb06bfb47b64f98fe79d678
>> and dt: =
https://gist.github.com/warpme/79340c54c87b2b1e52f2a146461d8c9f
>>=20
>>=20
>> and compiled .dtb
>=20
> It all looks good.
> Do you have any CRU errors in the boot log?
> Can you check for the presence of clk_ref_usb3otg in
> /sys/kernel/debug/clk/clk_summary?
>=20
>>=20

cru errors in dmesg - seems no any.
here is my dmesg: =
https://gist.github.com/warpme/ecf38482cc88fb68471355d011ecf974

For clk_ref_usb3otg i=E2=80=99m getting following:

root@myth-frontend-e67a8de4c815:~ # cat =
/sys/kernel/debug/clk/clk_summary | grep usb3
    clk_usb3otg_suspend              0       0        0        30770     =
  0          0     50000      N      deviceless                      =
no_connection_id
    clk_usb3otg_ref                  0       0        0        24000000  =
  0          0     50000      N      deviceless                      =
no_connection_id
    clk_ref_usb3otg                  0       0        0        24000000  =
  0          0     50000      Y      deviceless                      =
no_connection_id
                   pclk_usb3_grf     0       0        0        75000000  =
  0          0     50000      Y                     deviceless           =
           no_connection_id
                   pclk_usb3phy_pipe 0       0        0        75000000  =
  0          0     50000      N                     deviceless           =
           no_connection_id
                   pclk_usb3phy_otg  0       0        0        75000000  =
  0          0     50000      N                     deviceless           =
           no_connection_id
          clk_ref_usb3otg_src        0       0        0        37500000  =
  0          0     50000      N            deviceless                    =
  no_connection_id
                   aclk_usb3otg      0       0        0        150000000 =
  0          0     50000      N                     deviceless           =
           no_connection_id


