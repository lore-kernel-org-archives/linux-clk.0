Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096AE1D049D;
	Thu, 24 Oct 2024 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729773343; cv=none; b=BQPCm78NLgaXk1aUVD2s66zOtT2eGcZj2oY3679F6/Y8HQkdaYveuJgbyVtcE6YeOcCYJjlSPLO4cDhiDJsorOWEziPs/jQA2LGD85wghySA3PHtnEwT73BUaUp0HZZMrvtCQ1suwEfXYlO8zj4lXXJzbnZD9ZkP3zWnHZpkb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729773343; c=relaxed/simple;
	bh=E3E92tat9CbOX0TNJBER6hBNO6vwI1J+Y8AONn6yclE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WwfVPbQ/G4yn4IWRvsoDGGwfRazjKA44GBmfZIxxlmP4iYRWQEq7XdcViJTyJ315UqHR8a7ERq6y/whyIoX5Onu9EBLTqHsWBWsqwOWc9EmfDxLs4YmjiUByB5NoudQrcmWOgMiUBnoJ4G5hvWNaCoIAiPuUrIjIBdVt9pT0U0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecOVga9l; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecOVga9l"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a5f555cfbso52796366b.1;
        Thu, 24 Oct 2024 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729773339; x=1730378139; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E3E92tat9CbOX0TNJBER6hBNO6vwI1J+Y8AONn6yclE=;
        b=ecOVga9l+yahZun+3uEJSQlcfOcTIdkcL9x+jiCDJ44cgG6HSUGa69+F/hdMKxUiv6
         dtRPM82t72K+b5kBpO0ALDhBFy37tv5Nz0zKrrvoC80uzAg+Gvocents11IARK70dKkt
         VHG85Nih4rT5eE8lmwsl6OHisor6FiELwoGo8N/zquhduAjcC5ldVfFtO7VguJvE6RfM
         HfHAY+BiSgnXN3Nkz337Al2iXueQTBaebcX0ZiQmO+v/TgWs/eYAfyjVAOkUw1uDar6q
         eP9772OgczmqZaMxHK7MEewVWpmLJLG/OAf4WbO23EuGxrqvbJX20xlJK/Teq7f98r4K
         7CGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729773339; x=1730378139;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3E92tat9CbOX0TNJBER6hBNO6vwI1J+Y8AONn6yclE=;
        b=p13dW+xH8MWHjdxoJq+JDxute0azdWPhrsgm6KIjyXFIldkYK2dVLPcnNWcmVPypR4
         p8HxJ1AErWkR6oU/Y82djqjycSU5L0cyvt8q7lykmR62n6tgqsBZlAXfAhLJKrxUMdoD
         2yvbgSQtIg+Y+VHuU7EcV+4h3o1CKneLzej1T+ss7jt0C+VP+Q/mU6/GMOKhnBZ/NfnH
         oy0whAuswMycU/cgb0RCXPZwjmce7D23tzmlq6EdbGdoFMc+GY+i8yi3P93fcZIfOXhw
         dM7GT56fxLv4sKZ38OHvMx+BQK/ZJUmK2U0xLM+RhSdjSpFC0P+KusyeP5HHng53afMY
         jE4g==
X-Forwarded-Encrypted: i=1; AJvYcCVpJE3qGeV5uUjks7yLFGYgbwnZfRKtkI77I28aBlcQHtN43Zpdq4Tnl0Rjxu6K7lTIdSHmJd38BIZN@vger.kernel.org
X-Gm-Message-State: AOJu0Yybefz6lz3/q6lu0iWnXu4fLZvgeVFGLdgCR5/TfgkqVTJLCzUk
	gYvX5XkAdpohiQZ4sGZJS0zi9vRXRWZTN1A/u2Suu8pTOys6DEux
X-Google-Smtp-Source: AGHT+IHGLARm2ozMgjg9BY+ey1UHdsbN/1bmDmuDiducGLzYACM8tFv5Mr6VRCk4hXqTOA7PA2BCxg==
X-Received: by 2002:a05:6402:2685:b0:5cb:6841:ede5 with SMTP id 4fb4d7f45d1cf-5cb8b267f63mr7481636a12.28.1729773338716;
        Thu, 24 Oct 2024 05:35:38 -0700 (PDT)
Received: from ?IPv6:2001:a61:34c9:ea01:14b4:7ed9:5135:9381? ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6d0besm5680417a12.57.2024.10.24.05.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:35:38 -0700 (PDT)
Message-ID: <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Date: Thu, 24 Oct 2024 14:35:37 +0200
In-Reply-To: <20241023-tucking-pacific-7360480bcb61@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
	 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
	 <20241023-tucking-pacific-7360480bcb61@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-23 at 17:30 +0100, Conor Dooley wrote:
> On Wed, Oct 23, 2024 at 04:56:54PM +0200, Nuno Sa wrote:
> > In order to access the registers of the HW, we need to make sure that
> > the AXI bus clock is enabled. Hence let's increase the number of clocks
> > by one.
> >=20
> > In order to keep backward compatibility, the new axi clock must be the
> > last phandle in the array. To make the intent clear, a non mandatory
> > clock-names property is also being added.
>=20
> Hmm, I'm not sure. I think clock-names actually may need to be mandatory
> here, as otherwise you'll not what the second clock is. The driver would
> have to interpret no clock-names meaning clock 2 was clkin2.
>=20
>=20

So the way things are now is that we just get the parents count with
of_clk_get_parent_count() and then get the names with of_clk_get_parent_nam=
e() and
this is given into 'struct clk_init_data'. So they are effectively clk_pare=
nts of the
clock we're registering and as you can see clock-names does not really matt=
er. What
I'm trying to do is to keep this and still allow to get the AXI bus clock w=
hich is
something we should get and enable and not rely on others to do it. The ide=
a is then
to add the axi bus clock as the last one in the clocks property and I will =
get it by
index with of_clk_get(). The rest pretty much remains the same and we just =
need to
decrement by one the number of parent clocks as the axi clock is not really=
 a parent
of our output clock.

All that said, and FWIW, clock-names are not even being used in the driver.=
 I just
added it to the bindings to make the intent clear. I could have it in the d=
river but
I'm not sure the extra complexity would be worth it...

- Nuno S=C3=A1
