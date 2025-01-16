Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285024A7C9;
	Thu, 16 Jan 2025 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038127; cv=none; b=WUSN+BK/1EpVBBjr2kFDt5r6pEPCfR9dhxBLGdMcA7K097uBtyhnFhjOjmGCTUVExzjcctLqosfwxLRKZv5ZAlR2TdsA9s28QWbxrPG/mpSytszCM8dcVyuh3RKyy711UIohAUbLIk0PrS0uiVqPu+MHaVxVj8KZNdtKOBnAxYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038127; c=relaxed/simple;
	bh=+McQPymEmOdhf0WLe0EFmpoE0UjFeiDotGFY4kS0D0g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=i6Z8Bqse4dSE1pcASTkbeaYQoo7yQZXAuFqoCeSTtBAG1WKtBF9B4+W4MXvYxaEnxKiC9kEMcVPwq9e/E/tC9v/7U6vSICkoREkbHRfenuk90x6antM9fRmchTSfXyusqVy2rBVHEUhOX2z4YItUocHdDi50DR6FL3Wgc/CffTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dyx04FN9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dyx04FN9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so1682200a12.1;
        Thu, 16 Jan 2025 06:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737038124; x=1737642924; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+McQPymEmOdhf0WLe0EFmpoE0UjFeiDotGFY4kS0D0g=;
        b=Dyx04FN9acZ/AWvxBcwMKY5byHZoLjMSwj+H2dXXYduS1wVu4di6WeyJFx2DFT+d7e
         7AqhyNvNxMmumhitzjCBRktISPZao/SzXnweMXXtR6G9qaLJUKp/6772NUeHtDXHnGUi
         xb1XanmodUIuxTxwETzd+8XJibo57MeXvp2R+fTqHmsRVhQhL2th7fiRIqiUpBEHvTHm
         BBR36ZH0qZQnnoh+MFsulgwoweFkgeKbygpsoe60JYhWlY3sG3yXX93KcCN2fj0e+qWK
         l+hXmP0hnwwrzfq5oZxNbbPL3CLc6L5OHiMFR6vnA1ye/THqwmzFkeKuwAkBEnZ70ww9
         0aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038124; x=1737642924;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+McQPymEmOdhf0WLe0EFmpoE0UjFeiDotGFY4kS0D0g=;
        b=lPXniafpTXOPGLaQ1rOOuGjAKPGnextA30Qt5uKVetBBu14gGh06eQl3rh6J2WG54h
         ysa56pzAWGATl94LtliXqClQCxsmOOPDiDvN4PCWM8fMdeQWVz6AXG0mDuGhiK6iAqeA
         Uke3h0/xHpHSDB49JDiYmp3fLjSQr1wfwyKqqhLz+wn4nqrUxX3ry9eipME9/ZMUDzQR
         xCwUaUI8YrB3kz5lbSgmBxSBG2L+1+13AmJ7GxIW8iOB51r4amYWgH7EyccrqG44rEXy
         j1meLJ+XbznWVlwFJtHWMZcq2szwYro/oTtiiLODhHybKy0qT0Hj4h5eh2oPOirstLpv
         YvwA==
X-Forwarded-Encrypted: i=1; AJvYcCUOpSNaae/q0J32RIW3frUNP3Jb9ZaPaDhoreJf2SKvFGiMDKfUptkPZp0AYhbydyR7gWPimYc+MtQoqU54@vger.kernel.org, AJvYcCVpks+MBboOWqhFqaQiZgTnZu3+o0rPM8IAtS+Pemgp98m51Poa7oFkqmPwtERxGG5qgvIOxSa5ZGDV@vger.kernel.org, AJvYcCWfaBg0RHvIEBttMC5ipBWN+sCwu5v83poC8IgaAty2+qGEntqCE2ePAoTE9WGsgBVUwL9HqaCjltaB@vger.kernel.org
X-Gm-Message-State: AOJu0YySaOM1HhGeHqkEQzDxpFcqAbqpGn8LR9cBmNNxQaDxkUw7I3LE
	S19cOXZH6RInIjkroJnv804zY/p9uXYeX2w+31EZeJXWJblnlaD8
X-Gm-Gg: ASbGnctTNvn03pp4w0CK0BDaxzeKUkZ+aR5mq/PFr2L8c0n7jK48rQQKE8Sxp9vtuZy
	VxwOSHiEub2xj6aJUZorHiBLfndsf8nQbvaqauKUvBf42yd2QvwgvQTSATCGPam/8cPZCDnXQqQ
	m1KYJkDRJeVy/Uc33e+j6suyy48D6UAp0ZYdzrNU1sOXPrs+RMOQJ1HQjiI9xvOTT8kfF2aTsGz
	qIeq0XFicuZD2xOaj6CgjzedDOe/ybxjdIpEnciItvN1QKIe66a467hHpYBxTf8D+SfUVnK32Gf
	tEFxwset2ekjVu9UoElMds78JKgYu9hEv+ZciA==
X-Google-Smtp-Source: AGHT+IF22GYVRQI+1Y1KzRsqCWEDA0Rkne28OZTlDzi7yq1Grymd0Rj0WG4k8w+WrzsYR8ss+QgyYw==
X-Received: by 2002:a05:6402:2695:b0:5d9:f70a:47ec with SMTP id 4fb4d7f45d1cf-5d9f70a4a74mr10793460a12.15.1737038124352;
        Thu, 16 Jan 2025 06:35:24 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db7364272esm19585a12.12.2025.01.16.06.35.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2025 06:35:23 -0800 (PST)
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
In-Reply-To: <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
Date: Thu, 16 Jan 2025 15:35:08 +0100
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
Message-Id: <F69CE715-C0E4-4FCD-943C-89CC1D3E848D@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <2EEA8028-8E4A-4588-A480-E5FF0F7BE82E@gmail.com>
 <CAMdYzYo2W1hLgiH697AdRSUbhBU4rU2uB=N6EMWMD2-0R+VLBA@mail.gmail.com>
 <B1C9DA16-F285-4AD0-AE4E-AF1A5CA20932@gmail.com>
 <CAMdYzYrxX=RsSZja-3+zLZUSpyLoRz8Zm0w0hTfL3RQ9cjqgOw@mail.gmail.com>
 <3536B507-8658-4377-A1AC-2C5D9093BDEB@gmail.com>
 <CAMdYzYoCj9FsyHdTQAOV4DFpD7OdMDaJ0R=BBxXG-SLguy512Q@mail.gmail.com>
To: Peter Geis <pgwipeout@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> Wiadomo=C5=9B=C4=87 napisana przez Peter Geis <pgwipeout@gmail.com> w =
dniu 16 sty 2025, o godz. 15:02:
>=20
>>=20
>=20
> I'm at a loss here, I applied the patches to a clean 6.9 tree and even
>>=20

oh maybe issue is in kernel age?
6.9 seems a bit quite old.
i=E2=80=99m on 6.12.9=E2=80=A6.=
