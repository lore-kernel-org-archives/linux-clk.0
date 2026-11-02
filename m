Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605838;
	b=zV/dqR5whTnXe7TkpTE5WzlaKdi41RWvkjheyjg8jppW02he9lvNXRxJKje/1y+E2J3f
	 oZNdx/equ30oI33spmzQxTmdLbMZzK4HvHVsUAzr+7a73TwNN88Ijbx3sXojBYXMK/OXc
	 RHqBDvKmiEmZwhiu+/yU8TfGoqEQsVmhAILxxa5phCT5wdNazQFjD4dglRR9+7nY5KK52
	 KpwIxfOF/FHtiGzI2UJo3FQ7TY4k9ZjbZ1DbaoOWFJlkmHmNC0VKKxectX1SHWRlWhswW
	 kBFYBlVQqo/VKKeAohgSDFr5W5KfoJpFAzKDU6QsNhZ5Bg5gRjXWQt67X7dePt4261w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605838;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	b=ZiEJeLbaLgfv6ZTzET1VSnluOXWtJGOxeq4xcTQfvsaJKP0B0PvL74TpcErsvfqK7mhc
	 gptNmKgYJrxFFLqk5lliN3TpTY2HS0AfAVmHT9eyXrlcaEpmyWQ+F8aWg4n4SoQ0jjA/b
	 caCqDhHPBzCOY/augq+m8t5+1JIrh5LG3Anru0mEApAaBGGVSedwtmXz3TYKyu9iXl/qj
	 zCki/Qdo9f9USTnlINFetyo/2OjxLLvxgvJkcKLxwb6c9SuoFQpgPr5Vx421jrd0x12aU
	 yFK84bm5IcrjLPf0OVEMI73L4X0c852L64V111jZ3p/Xj5q4l6kpBbDB1Pw7zBufMKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kouic5Ck;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C17606A327
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kouic5Ck
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189161F00919
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793605838;
	bh=kfdLzuznSP86OXMBv2cc50+pGlhDjviKqnXgIgBSXeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kouic5CkKUn0X0KnSs1wuePb74UNjNwda3bpX00QX1ekyyxJ8FwaWU3wP6Wy1IN/B
	 rAMHTltmOUpaLKipGg6UXleSHzozKeNbk1NWDAjRo0sgHfjHsyMhSGhH6iO1dBVQ+x
	 O3wh6WEDtQyTPj0Tk8qUxscxwXYPtvvQe6M8/etT2g8vmZnAJFnozckVUM+UA4Nt6Z
	 1/3x74j4R85qqXqkQiW4oTvR8nkZat3STfaBOBrP0wQvpRxp0PcWGp/04hHE2RjGls
	 nxRAMLaE6uXGmcoOdBRq6nilE9wX4yZbwz12Gq+UJ0a+bbyBvZDW9XdMYF1JV0TsEM
	 mbsk19b5t2r5A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bccecba199so2420310e87.1
        for <linux-clk@vger.kernel.org>; Sun, 01 Nov 2026 23:50:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBykqg8GPp9knnfoNpFchAIc0QVgBCyvytoFu7f6WNK2MKdr9CjaiCimb4an9uAhRiEtMq1ZRsZ1q/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z90KRcaNK58AdK5wNdhXDeZzc+bFz6M8CcsPz45e16sWhYz7Nlq
	lfqeZZUch7KKZtgdOwouyvu1+iSqFfZ3yrsiOVH64DZq3xIIY2ORDCVSP3fn25SLh7e9IUF30wv
	v3pmz+9vB/mceIED/Hlv1CGVd511x46g=
X-Received: by 2002:a05:6512:15a7:b0:5bf:a7d2:e8a0 with SMTP id
 2adb3069b0e04-5bfd956a316mr2897713e87.24.1793605836758; Sun, 01 Nov 2026
 23:50:36 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org> <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
In-Reply-To: <CAHi4H7GOMM9K6XG15vPyFMLOza3QQ7QPxUkCi85jA_e9D6YbKg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Nov 2026 08:50:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
X-Gm-Features: AclHuK9dC-mcHphjDYNUk7hAmH2idhA5q-arw9O8qj4lPel0YZKSwwgRuar-Ksc
Message-ID: <CAD++jLkqAXYTT5Y1iXjxc-W4s62OZJidsxJc-i9YsOOHW3MzUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] BCMBCA PMB clock, reset and hardware monitoring support
To: William Zhang <william.zhang@broadcom.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:33=E2=80=AFAM William Zhang <william.zhang@broadco=
m.com> wrote:

> > Inside the PMC is the PMB, the processor monitor bus. This bridges

> Should have pointed this out last time.  PMB: Power Management Bus

I think you did point it out, I just didn't manage to change it everywhere,
hopefully I only missed this one...

Yours,
Linus Walleij
