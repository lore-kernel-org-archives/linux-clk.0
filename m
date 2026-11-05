Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890042;
	b=qzDIQr2/2NPNHuXHzio6yPtQBQi4b8ZWTiFTnvN0MlybaA9IUSS/6YrFpvLiK5sH3lUj
	 skjEVkeajHDT5KiCk8emgK2a4YvRBADzBSviLd1/Xj+hTBfhDDbpzeQq5YCPdnJB9Dx6z
	 rb8Zc4bt4WzzA4EZ9pKRKSX/a97//FulJrw7Q4VZZSTTSfqt0ynRaTRWovE9oefm0sJew
	 uSNLYK+8igGXqgEvrZWeMx2Q0jFVgKdbjaCS57SnFwBI4bM7XiO20YGlOcfyHlsRM48zW
	 ulawtz7G21cIM4S8SDbrvB/MISRK6lHAHoB9Rt/Jb5sha5HfY3jXYX/Io8J2CdZqXeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
	b=Y/QxWUtbHerWAm0kXV+jMld2unlpuuRQ4jcw+Byipj0x8n5W/mvIk+cLTq8WsGSlvYW6
	 8zW2GgivW10qfvESqiMASqdpZ6FSInIsxK5+iD9qG1XcAFgYr85mUWU6FWu5/8kd5Mkj3
	 Bq69FkyLKshSVEvPYBJfPKMfI0za61xMqy6G7xrWNnxRsl+lppq9UCJOsevF1O4jDxeZi
	 zVOSCf6/aeXoDnY74X468UBhHPExUYqCEGIYHaDKTQdRL41/F/+nDwTurtNzpanxddNQp
	 I5wjxC2Md83lHuZmsR34bS3/CiaThrSeis2vFnVMeW8AAd540hT8K7LVyKSjotnjjJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=h41ijo8V;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90D5606A329
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 14:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90D5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=h41ijo8V
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so22658375e9.3
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 06:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793890039; x=1794494839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=h41ijo8VLcdthRc+9RgmvYx5NsDst/AzLIN0l3Rh3PfJaoqgNrfZ7zT2ggC+7lc2kI
         ulT7MbshSrv49Xb5yr+Pch5PAkH0NCtKrPwmJWCokIuuvMfmhEHq9E0R5eCGTcKY961y
         HWm0H//LKYNhJ17tsnxjo2GgUSIAmgFLif7rtAfz5XgU6RY0YnmPbv099YuF4GSseCJi
         DCQ0b2oQEMYtnwVE72KyQZ2bY72UDOxriGGd7OWIwF2ydRTeV3k5ERrR9NKkSmuvT5K9
         RVW0/iAF69WrD8RYuNDgiU4vbm/+J/ta9DFrKDcRjRPoYUDCQ/DfNsmtIudR+h3dpxr0
         5Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890039; x=1794494839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhh3rOfmt9+8e7tXOxSG5bPIHbOH/EzZ/+Q3I0eOuA4=;
        b=bawIsbP4RNOQeMssz+vteXHzCktnkIi8s43YpG6iyW5X7mGiP74DBHbcD3M4Fpp3Ma
         QYSB0+V1BZIxRaHxjW/mrOnerQIto2RYHKkOIZmk7laOMNwmuqCzBC+wQrHebBlP0qxo
         s9RjpTJV2UexUwrt9KNlSRDi4nZigRlaeMSNkdYwSNwwvet5zH6hdM51D65XPFTEkmv7
         iPQfTrCAGReAeqXCuPtYhAMdzShHwTJoZQpxF6vvGCojYMM1Kjx8OszVIOFsAbGGzw1n
         2pg2MiiSG8eDE3mESWZj30xZVbeFeAPZj3+N+gptK19crd3raNUSIDE5aT/8xO3cQqqI
         X/kQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4JjMZhtmyJIzJXyUs7/mA0STGTvmVRCU2r79W1sLjeL9pY3FXP26gwCJSqe1mwT/TqnBE5Zo1H6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wjHzS4lui8xBQBhYCo0VgvUiIZLxdv73jJYAZDExcBFuSc2FP
	iq3zUlM7+uBNBbHpxVG8rMAxCCa4I0hl8j5palZs52JS9NosbdAbMb9Yt3PSiC2Iorw=
X-Gm-Gg: AYBFou1ZElPGMSkkULmCbJRpzHWiE6iS2GPiuDw/AajBbT/mRoVHUfQCaztAgbfvHgQ
	mX+hyCXrC4tPSsysIyjtEm9RUEaB0Y5euchITMwtoRh7x2PhqVCNGYbZ7s0eyBnJfoKtcno1bze
	2MPRcl9sH+ZwJbKpgJMgi+FPtBq/71eB11I744LGo4s0P6/PnExy7whqg6cmxVYTy31v4RSEO2m
	0vFyNSAsyhsUOsDzJOPO8OxH53h1KNeSZQtU/+RA1aZY2eAZwxoAgAeNxTxNwEMHqFxkfUT/pI0
	MmxMi6UV5E8EGWXkgM32oS8NgOu/zp2OrdIrR7qHiERKf5T7PT9UPTqI6WBZcx7BHVO7oO45k7n
	BP7JHV2Z0iW8bHaudFlqIo2u480W/wiMphnQu2Q1Oh7WlNWs4XfTkNji+fL0PQaVO1rS5/THhpo
	KLFQx+Ma+0l103DaHlhbOop7tWAvFsk4csZXtaIcabbrWTc7F6tBjiQ9gkvL7PU8YwA+BifRofa
	SFwW8K1fAFvhehyyzx7k3jtcfPD7xeqo9IzF7+Sh3aFo4QREVd2UpqNPORXNLxeG2LkaIYjcsLf
	HoaLVjqw5NYYNRTw4e/EcfE9IjJdjCp42ZIvCCsl+wW6DTR0MCNqhkY=
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr460893955e9.19.1793890039475;
        Thu, 05 Nov 2026 06:47:19 -0800 (PST)
Received: from localhost (p50915710.dip0.t-ipconnect.de. [80.145.87.16])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56eb4da1esm115774655e9.6.2026.11.05.06.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:47:18 -0800 (PST)
Date: Thu, 5 Nov 2026 15:42:56 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
Message-ID: <auyL6UF8WWwXsXrS@monoceros>
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mag5oduzqhp4hkyd"
Content-Disposition: inline
In-Reply-To: <20261101-xg6846b-bcmbca-xrdp-reset-v2-3-455fe9eed5ee@kernel.org>


--mag5oduzqhp4hkyd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/7] mfd: Add a shared BCMBCA PMC3 PMB transport
MIME-Version: 1.0

Hello Linus,

On Sun, Nov 01, 2026 at 11:14:36PM +0100, Linus Walleij wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides of_device_id. Alternatively
if you insist on full iwyu, include <linux/device-id/of.h> instead.

<linux/mod_devicetable.h> pulls in many definitions that are unused in
this driver and thus introduces unneeded build dependencies.

The same applies to several other patches in this series.

Best regards
Uwe

--mag5oduzqhp4hkyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsle0ACgkQj4D7WH0S
/k4ILwgAu4/aIJ4jmqqXgp8ctE1FUWAaormLaedGkha0tPWWUWZFCWXzzflrAPQp
x3SQdXc7pbe9QPylO/FE1FtFum1V1mELFB8lRrsWaexQxDdOJtfgg9sa2EtNyzON
d0vLNNlqRg+eDysFNiyOOcwYa8AN9IWbE+14HBuzIKAdtfixCwirKoJ07ZKtQEsb
FghiifffoIz93iEIJWklhWkMmMWHCyo7KwUjlW+YCncCdVnLfqR8fbdBo+58IcXx
2dgAHS38lq0GpaZqg7vx8x/QrRgOxOqj6KgK724ffND0DJzxlFGTTLCkDD4AgELB
fCGGyZ3gyhvkLj7YEXBO+Gb9upim6w==
=fVHs
-----END PGP SIGNATURE-----

--mag5oduzqhp4hkyd--
