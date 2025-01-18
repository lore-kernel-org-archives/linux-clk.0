Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23752B9A8;
	Sat, 18 Jan 2025 14:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737210925; cv=none; b=ko36pQ9qA5d7IvojvjGHN4kEujuR2NO3mzoGhiaF7ryozrIQpOGbfU1aeiR6I96YIOSMplhvQ1Pk1taZfYX60A/jJ1SM8C9SguJdMlRGd3XI7FYj92Nhr1GCx4uZuv4rZAP2NQ+7JgyonWE6JdWW9oHvXYlOb3qrzCLoaxeiroI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737210925; c=relaxed/simple;
	bh=X8S9ixEcY8abMh6hBNRFz4AKcSH2mJNqJhoZUq3Q+OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvpO4dxyXMv0FpemQpKC5F4JWBAObQnNrnGGUsUfZiJvmgI54Z547uTTDz+gWTNOGuuMiWN6QDLlt32dtwVD4RPE1cGSl/2zmIRgk62jel7hhTJRTfEsqWbU/QaxKet8dLYGQsDsugN2l0WL/oEEtrw2RotVfRMJ9Z69R0LrFe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nE7/1Ni0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nE7/1Ni0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so4060508a12.1;
        Sat, 18 Jan 2025 06:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737210922; x=1737815722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8S9ixEcY8abMh6hBNRFz4AKcSH2mJNqJhoZUq3Q+OU=;
        b=nE7/1Ni0fq6sN2HhBmRSloQ8lhAQZ9ZP5qzqNPBDd0qCn/6DSGQ/ZYcbbWROWrtxX5
         TlO6T9fNq6yI3qbcvX5my5Aal6mARXCgwldmeEepXhgut6TcjsZ1x+q6jrckapndOhyC
         5NoHj2FnBGMscN5IhPyZ/PWWMDfc8wo1aAvJujeAowS8BzpVkTLLmSjFhNlBaFhWIdnE
         MeFCV57B1A70UMecAWe2EMVm9L2xvCLcJJJ9a7cqdSTXyRF/641IPmmEksibGfp2Vhbf
         jemnEOSNaq+Myw8KMcH19eQaYWD5mndT8xuQrr2AJ9C1tbWIyLkNh6TYxB1RV6gXl2Ds
         HMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737210922; x=1737815722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8S9ixEcY8abMh6hBNRFz4AKcSH2mJNqJhoZUq3Q+OU=;
        b=lMNpE5DUPN5HMXkGuwgfpO3xEXPsXHdwZUE1Vgd/LpDKvf43vd8JlAUgpFA0NHowzg
         9sScigfAG5n7iKMMy6CNlsze8w5lAwhaOXVSqew8wjfYSrRcAjBs0/BS8TuaHvYsNEv8
         hG4hXCBQvLNeAfkOivxFRUdyOsIa9Evbao41uMBSfnAPcfXhTVOjKMcZmMzDWUt+katv
         4GqKDJAIXKECRMPE8PgxGbYjnC6kriK1uyD9lab55wziW6c1nFei8DFFVKvA5JyDt1CT
         otT+zNxkrZiGoEmiOLcwp+OEqo/bXcZeaUWE9WTYXVz5r2aDKLFsNusvYIfkJMMrGGCj
         ngvw==
X-Forwarded-Encrypted: i=1; AJvYcCV9u3lAeKtcsCixn6P8hXGAlC9Tqu1c5lRWMxulGtbvHaywWoe9lZqPaYPWvdSRX88oWiI33dp7yqzjBspy@vger.kernel.org, AJvYcCW8q7pmVQaW8YwoxkgQRuXZRvBDHLcGCUvkwCt5s358fIB5gokH3hTd7XAKbBDxdUGoZ28Z2OUsauXx@vger.kernel.org, AJvYcCXAG8mCoWJjAydaGaT4YVmZAxdFntbcFb36x+T/aancIxzGkrkcIq8Ba3Yl+Nk7JQ+pKdvRoXOzwUvd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NUzbcpJR9+LND8IIvAOmciqxpdSbacbK7Mr/8QNo3FQlet9Q
	jnGp7H5SrxD8rvrcRNPyqUec7G7xgFdpTw5MBXpF8FDiVA4U9FfWcDOnYYmPlp3U+nJbTbsOxnh
	eUtXkbwgNOM+bDEXlT2CeJLPx8OI=
X-Gm-Gg: ASbGncu9TV++PFp8iMirBNed5VvDXBdIR4VhNLidhMZsxEusku7wOafLN8D0STDMgT0
	+CRic27ERZcSeg6qWdToGvW15o0GhQG5MY9l37g2owWF0c3ISxShC
X-Google-Smtp-Source: AGHT+IFDZpftdKqBFqBjBkAeeMYE15CR2JHURmc/olRPtILwjDfNNssQSQSY8GDDreU8V095+cJIkrJgg1PZfxTj8hY=
X-Received: by 2002:a50:8d17:0:b0:5d1:22d2:8965 with SMTP id
 4fb4d7f45d1cf-5db7db2bff6mr5038044a12.30.1737210921703; Sat, 18 Jan 2025
 06:35:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115012628.1035928-1-pgwipeout@gmail.com> <00cbc2a1-b4c1-46a2-8234-f66edc19fac9@kernel.org>
In-Reply-To: <00cbc2a1-b4c1-46a2-8234-f66edc19fac9@kernel.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Sat, 18 Jan 2025 09:35:08 -0500
X-Gm-Features: AbW1kva6DFr1RzjQp9KXMYYlhacM2koJu0uBfxOzcSRq7CyYw1cACxFrw_KEa_w
Message-ID: <CAMdYzYoE54PSdTH9JPBFLggDy9CZsj47N6qFKJFZz4xe3VVbBw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] rockchip: add a functional usb3 phy driver for rk3328
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com, kever.yang@rock-chips.com, 
	frank.wang@rock-chips.com, william.wu@rock-chips.com, wulf@rock-chips.com, 
	linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>, 
	Algea Cao <algea.cao@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Dragan Simic <dsimic@manjaro.org>, 
	Elaine Zhang <zhangqing@rock-chips.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Stephen Boyd <sboyd@kernel.org>, Trevor Woerner <twoerner@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 4:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/01/2025 02:26, Peter Geis wrote:
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
> BTW, RFC for some maintainers means "do not review, work-in-progress".
> For some means "review, but low priority" or "review, but for sure I
> have bugs here". I usually review and then someone responds: "it is not
> for review, it is just RFC", so to avoid my wasted time please always
> mention in cover letter why this is RFC. What do you expect here or why
> this is not ready for review as normal patch.

Thank you, that makes sense. I marked it as RFC as I'm aware it isn't
a perfect solution and there's a lot of undefined values. What I was
looking for here was:
- Review for code quality, so if I'm completely off track I can get to
work fixing it. (Thank you so far)
- Sanity testing from others struggling with the issues it fixes.
- Feedback from USB engineers about the issues remaining.
- Hopefully someone with access to the IP can provide insight into the
magic registers.

>
> Best regards,
> Krzysztof
