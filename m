Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PEysiXbr"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680D7E8
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 04:00:32 -0800 (PST)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 914C73F18B
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702468830;
	bh=d2k9g+CDQlS0u/Axm3QhPzDXMJCmIzyDAkyUWJItYfY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PEysiXbrq77iErl9Dy9xuktY9UE28lQ8J7sAyn8ziwf6BhVlpWHFHL0J2+bJMgjkT
	 cvk+7dBm6jDSJLzQYrmkNVV2a75kbTn2ycDZECJmYqMSUzR0DI3rXNsOkZTEq9/EKW
	 e477U8PijvoUOROR+evBYViExVZ/IZHGtbqAjAjWn3jKY/0504aIzwOPFuWLCjTr2+
	 JjA3FuAFC6uWpkp+Dp9njtWDixEbQB7JUSlhLT0Fv27P90kZsRqw6VjQ6Xuh/T7Gsa
	 /1TDcWlq/vE76sxQGtymrRelxlE/QPvpCi2Qcm+mATGi2E315cpf3zZbYX5Gpyr+jw
	 in2SUmvXX+awg==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77f4699beeeso845912185a.2
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 04:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702468829; x=1703073629;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d2k9g+CDQlS0u/Axm3QhPzDXMJCmIzyDAkyUWJItYfY=;
        b=IeGSl6nrSPqD0n5iI+f6qCMcWeEwzzW15CbWqTTxHT/veZGA6MFKHtW3W2+Sa1wNlM
         sQ7I34ECgyO9qWzmBsvty+IleCWvm5LLQPBBxOu65DYY9znEnKNXJifRRWRqVLRhYDXt
         8DNWYZBVzUkv81rYsXhuJEuOANp6BBOLUDADozb6Z0BWd5sADWDnNAozO7Jgb6Kpz/re
         0ztZgf9dVHWMxbI+DkWBM1g7XEqBrexYR4UVCNawpzycO5BzOuaS5K9TCmlxEdsJF1nP
         f9wRIy4MF+ZuqIjXVM33mqq22vC6Yj71gyK3tKvBOePea1Mk7YJrn+od3iMw+sH7wgT5
         BwbA==
X-Gm-Message-State: AOJu0Yy1564YAJZoxqk7QQ+XGhbL1W0ZINnvgShqq5AdaYUZa2/AVRNF
	/vbdw/h0C3hHmiKoSAahzsTkRdEAzWt5AW8ob+4uRGeS9xk5O1q7d8z5HsJmU9MIqzxhrpQ1/hi
	QoSqYRtGQ+KvtzgwxcWZTbtCfXd2c0GplIJdLoeLYVbWd+yF4redUtg==
X-Received: by 2002:a05:620a:1d97:b0:77d:88cc:e759 with SMTP id pj23-20020a05620a1d9700b0077d88cce759mr9425945qkn.44.1702468829686;
        Wed, 13 Dec 2023 04:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQyE19HlHZoU/6ZbCTx8+T9R2+zaT+Qju6cnML0AE3RTJpk0HMKR1T19a5ApinlnNf+jiWW68wxrNoj0JLy3s=
X-Received: by 2002:a05:620a:1d97:b0:77d:88cc:e759 with SMTP id
 pj23-20020a05620a1d9700b0077d88cce759mr9425929qkn.44.1702468829479; Wed, 13
 Dec 2023 04:00:29 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 04:00:29 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <56031a2fadf442e297b1e0ea03777e5f@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-8-jeeheng.sia@starfivetech.com> <CAJM55Z-FXV-Go4yj_AJyU4pRC0msHqTCT3q24HkNtBTWW9rAgA@mail.gmail.com>
 <56031a2fadf442e297b1e0ea03777e5f@EXMBX066.cuchost.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 13 Dec 2023 04:00:29 -0800
Message-ID: <CAJM55Z8ndFEg1gqk5=HydjN93iKY-f0k=FDpcL-hYH+_GA4Taw@mail.gmail.com>
Subject: RE: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100
 System-North-West clock and reset generator
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "kernel@esmil.dk" <kernel@esmil.dk>, 
	"conor@kernel.org" <conor@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

JeeHeng Sia wrote:
> > -----Original Message-----
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Sent: Saturday, December 9, 2023 12:37 AM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@=
kernel.org; robh+dt@kernel.org;
> > krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dab=
belt.com; aou@eecs.berkeley.edu;
> > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil=
.renner.berthing@canonical.com; Hal Feng
> > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-=
kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>
> > Subject: Re: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100 S=
ystem-North-West clock and reset generator
> >
> > Sia Jee Heng wrote:
> > > Add bindings for the System-North-West clock and reset generator
> > > (SYSCRG-NW) on JH8100 SoC.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > ---
> > >  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++++++++++++++=
++
> >
> > The JH7110 clocks, the JH8100 system and always-on all follow the Xcrg =
pattern:
> > syscrg
> > aoncrg
> > stgcrg
> > ispcrg
> > voutcrg
> > etc.
> >
> > Is there a reason the north-west, north-east and south-west breaks this=
 pattern?
> > I'd have expected them to be called something like
> > nwcrg, JH8100_NWCLK_*, JH8100_NWRST_*,
> > necrg, JH8100_NECLK_*, JH8100_NERST_* and
> > swcrg, JH8100_SWCLK_*, JH8100_SWRST_*
> >
> > Just like all the other Starfive drivers.
> Understood your concern. We don=E2=80=99t have the intention to break the=
 pattern,
> but the reason we skip the SoC_ prefix is that the SoC names were already
> defined in the header file with the SoC name.
> However, I can put it back, of course.

Yes, all these 3 JHXX00 drivers are almost identical. There should be no re=
ason
to name any one of them differently. Having them all be as similar as possi=
ble
will make it a lot easier to maintain in the future. If you don't like a
pattern then please change it for all the similar drivers and don't make ju=
st
one of them be different.

/Emil
