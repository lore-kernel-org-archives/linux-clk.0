Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C148118DF8F;
	Fri, 25 Oct 2024 06:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729839400; cv=none; b=g9yw29Ra3QsJi763YoxYMlP3g58rEcyvTCadVEREvy3W0saFEW3gGL4mQwNtY8zyAAwAddDwySRycPS+XQ2NsdJZLl71D6LXCmYYHHlmT74Gq4PlVnle+lHIgEGZl52ipbVX52+OFyNaRUwKV0FrHe9VSmUPiIoxfseG4tzRwy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729839400; c=relaxed/simple;
	bh=IdFdKHlNUkzo297tipaTO65MO12IyEHqpx22ufHv5qU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nFdYvZr+nLKNyzX3rwwYve7tCxwlApM3pbPC8cyfhhA9T4QHM+uYM4URiKMuekspIVN7tzRMj0ICZ3FcEPJDEHHk6YwjGD06FDw0CHD7niXLRt7RQUo54aIxs2iTW8Ibp8E9GSQd+R58b69NHjumbhMznFS6xT7qHFJT5w0Y8yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKzJo9gX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKzJo9gX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a99f3a5a44cso188084466b.3;
        Thu, 24 Oct 2024 23:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729839396; x=1730444196; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IdFdKHlNUkzo297tipaTO65MO12IyEHqpx22ufHv5qU=;
        b=AKzJo9gXg0f9yL5+bIdqzJrwg0OSaxHhmq6JYcRMnpY/KC//fxfTq7usRR1S/BrjTO
         JxUMMW/IzHqWhFf8vLV8l97ej4tFyHxJMcSc2JJKFTMMuGzx8M40ZAm6Qw7mqKhQfUGS
         Hn2BrZ/nA5KSXm8R9xs5BByLXUzIHkeuVI4UcA3pBP9bTFyOsX7Rv48rzVifdXffbvYI
         a4zDeV1hOObHU8n8DfUmvnZRMPtNA56qpuYeWx4TgyGacf/Jn/S3799bOyGv468jJCWj
         wRSJL16XCR/1dbaHqx34O5nzn3MS+Ha9x5PqNMR8SFcev9UcKMGXXts0A5Zu9p+My4c3
         kYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729839396; x=1730444196;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IdFdKHlNUkzo297tipaTO65MO12IyEHqpx22ufHv5qU=;
        b=X2oiZ/eq2OEP10KdJ5IaTqISwGpG84TOBCQS1gG21z9www1dJ/f0mJJHPGcp4MU8gh
         7A7paqGoB52vl/bmaiSpXlkSrwctEmsy0d1ePYg2xPOU26bghKwDIYtaB5Zvf6Uj3vm9
         AclVdYyG8PqwoS5eFhSpB4wlf4qHWPOahMa+oeXpCVHvnfqBWf379yKEx46gA6s6uCw8
         PPfuDnY+aW85shTyxq6WQZtrMTircnmwBqdaG5AgxH9AzAdx0OSuxs3pweq7fKe7D07g
         m6vAHGUrIGdRUE8GbQzloAma/ky9uLR8PF9eO69fKEpsxm1MPR0Oe6Cy40mYxEZHhH0+
         BQeA==
X-Forwarded-Encrypted: i=1; AJvYcCVDnPnhaHHHvqXbHvQP4Yc88cpdlr8ZZcX3GmafRDdlz3/Gtve1IcJri0L8c3bUYXnTymCiOrEzceLa@vger.kernel.org, AJvYcCXJgaiQKE8SSMtrQ4S1sGvI2ENkbQAX73ATnK68TnvSo7wqHvxqRsWyJ2nAYJUT++RChWfcWMM/JNtb@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgv08L33q71kFBw/1XGxsMr0IXrkArnnrgB3Nwu5XU+0p8qyB6
	O8kRIFlLpP+CrtPtJE/4rg0fUGtsQLnsvV/JGdAU2LdF5B00iaku
X-Google-Smtp-Source: AGHT+IEA6blu9tRSp2LaMJ3N2rKxoolMOERc/D+F1c/pQfGvxRdLgBXjFzpQCNvCfXOYNCezQuaT+w==
X-Received: by 2002:a17:907:7282:b0:a8d:4631:83b0 with SMTP id a640c23a62f3a-a9ad2710a6fmr421507866b.5.1729839395894;
        Thu, 24 Oct 2024 23:56:35 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:34c9:ea01:14b4:7ed9:5135:9381])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7aa9sm34405166b.35.2024.10.24.23.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:56:35 -0700 (PDT)
Message-ID: <8b853ad3964cd2b7dafc225d4037ddbf11ebb2d3.camel@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Nuno Sa <nuno.sa@analog.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>
Date: Fri, 25 Oct 2024 08:56:34 +0200
In-Reply-To: <20241024-wildfowl-pushiness-d5f46c9c538a@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
	 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
	 <20241023-tucking-pacific-7360480bcb61@spud>
	 <1e0097f6a15f47c173cb207e369909c1cb5943f9.camel@gmail.com>
	 <20241024-wildfowl-pushiness-d5f46c9c538a@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-10-24 at 17:13 +0100, Conor Dooley wrote:
> On Thu, Oct 24, 2024 at 02:35:37PM +0200, Nuno S=C3=A1 wrote:
> > On Wed, 2024-10-23 at 17:30 +0100, Conor Dooley wrote:
> > > On Wed, Oct 23, 2024 at 04:56:54PM +0200, Nuno Sa wrote:
> > > > In order to access the registers of the HW, we need to make sure th=
at
> > > > the AXI bus clock is enabled. Hence let's increase the number of cl=
ocks
> > > > by one.
> > > >=20
> > > > In order to keep backward compatibility, the new axi clock must be =
the
> > > > last phandle in the array. To make the intent clear, a non mandator=
y
> > > > clock-names property is also being added.
> > >=20
> > > Hmm, I'm not sure. I think clock-names actually may need to be mandat=
ory
> > > here, as otherwise you'll not what the second clock is. The driver wo=
uld
> > > have to interpret no clock-names meaning clock 2 was clkin2.
> > >=20
> > >=20
> >=20
> > So the way things are now is that we just get the parents count with
> > of_clk_get_parent_count() and then get the names with of_clk_get_parent=
_name()
> > and
> > this is given into 'struct clk_init_data'. So they are effectively clk_=
parents of
> > the
> > clock we're registering and as you can see clock-names does not really =
matter.
> > What
> > I'm trying to do is to keep this and still allow to get the AXI bus clo=
ck which
> > is
> > something we should get and enable and not rely on others to do it. The=
 idea is
> > then
> > to add the axi bus clock as the last one in the clocks property and I w=
ill get it
> > by
> > index with of_clk_get(). The rest pretty much remains the same and we j=
ust need
> > to
> > decrement by one the number of parent clocks as the axi clock is not re=
ally a
> > parent
> > of our output clock.
>=20
> I mean, if it works, and you can always disambiguate between whether or
> not someone has two clkins or one clkin and the axi clock, then
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

The assumption is that the axi clock is the last one in the phandle array. =
But your
comment made me think a bit more about this and I do see a possible problem=
 if we run
old DTs against a kernel with this patch. We have two possibilities:

1) DT only with one parent clock;
2) DT with two parent clocks;

1) is "fine" as it would now fail to probe. 2) is more problematic as we wo=
uld assume
the second parent to be the axi_bus clock so effectively not fixing anythin=
g and
silently probing with a broken setup.

So yeah, I think I overthinked the backward compatibility thing. I mean, in=
 theory,
all old DTs are not correct and should be fixed by including the axi_clk. A=
nd if we
now enforce clock-names we at least get probe errors right away making it c=
lear
(which is far better from silently breaking after probe).

Given the above, it should be fine to just enforce clock-names now, right?

- Nuno S=C3=A1
