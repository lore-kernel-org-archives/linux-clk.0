Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="smIesrYJ"
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCE7CF
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 04:05:20 -0800 (PST)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C6E03F18B
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702469119;
	bh=ed/4z9K37WF1+ypqnAItmB7J3yVCg6lzXveMVJNIB+I=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=smIesrYJpscZxloUefgTPLm9pjHmYAbyliUxqFWNWExa7S/6j5I28PBlgJJ8x7USl
	 3O4ncWgyzy3F22gInJTSF4tV8xphNY2F/CC8E6Gxa9yEAwDdowosPnVylryN8B3jTP
	 qdcvA8a/x9R93amX0mO3JnkMHXl5RI6iPn8LPfQrrNM9zlcaE6e88i81iOAkL9GIFp
	 J21Ui9f+PJZyEL+HJJ4Lp4P+GyK+WXGaq2O+Xe+FdUeDOnBajvEbnUrBLNjkMX6eN/
	 jZuuwKw2lhhotMenNnjph5wJkeJAyVstLE+DPhA/IQ3E/T5GmKggVOygQP0UxkSyp1
	 ROZxhDtUUnenA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-421b20c9893so89747381cf.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 04:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702469118; x=1703073918;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ed/4z9K37WF1+ypqnAItmB7J3yVCg6lzXveMVJNIB+I=;
        b=uOB0FqOan80ppg7N5SqQfQqFLx+JV+GgpWr9bS8oJhu+lx6f6Y1/m8z5p2swlDUZiy
         O0r9ecJIu/L1xczOSnqjkkfjMuhec0YS8w7NiRTNwfjrUnNz1NcT3zzUpzuivY/iGKFy
         npz67FCrZ+lMEnx7yhD0wNcFEkDQ5bC8NsE69/wBZPT7KGiyZcox+/9OMf1zcyiq7HrK
         fxRPbKpenBmYRU2z/kntIHsWZLvOBcae+Lm6osQIImfq1Fg2SPT8TtCZraGxehpX2IZd
         Ldk/8T7O9uKbOXti5Al0cvlf14OKWzkaE43gq+WgSn/2GUWjpL2HzgPo9kja65hs/ZZS
         74fg==
X-Gm-Message-State: AOJu0Yxgg6Ecosca/Z9ASzL1X+NaYg5BdevzQJezykFbOGs+6M5RvT7z
	uzbDHjSbD/XMsGp8JJAv3jqMXeKcNs6tZ38N/CISqjFVMXM3n302eTKNYdGX6iG3LObuixzc1En
	ol2M8wqsJySXf3KaCT4/PGyIlvoA6UU3y/zkwYRchRBHFjhKK2jNXHA==
X-Received: by 2002:ac8:5cc8:0:b0:425:4043:763d with SMTP id s8-20020ac85cc8000000b004254043763dmr11389699qta.101.1702469118714;
        Wed, 13 Dec 2023 04:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9QHKlpfiHiwknItMSza3ZGQwZtx+b52QZTd9pTWAuKsITQLCClWyurTTqXFX6DTkIy2rCL/jyIwRxWdAltnE=
X-Received: by 2002:ac8:5cc8:0:b0:425:4043:763d with SMTP id
 s8-20020ac85cc8000000b004254043763dmr11389680qta.101.1702469118472; Wed, 13
 Dec 2023 04:05:18 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 04:05:18 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <a554a163793e4513b25766c21ddc3f02@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com> <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <a554a163793e4513b25766c21ddc3f02@EXMBX066.cuchost.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 13 Dec 2023 04:05:18 -0800
Message-ID: <CAJM55Z_3Mty2LftPVkQC1wbwtGeznMMAk9mAjH_GoNuL7CKtaQ@mail.gmail.com>
Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
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
>
>
> > -----Original Message-----
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Sent: Saturday, December 9, 2023 12:25 AM
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
> > Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock ge=
nerator driver
> >
> > Sia Jee Heng wrote:
> > > Add support for JH8100 System clock generator.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > ---
> > >  MAINTAINERS                                   |   8 +
> > >  drivers/clk/starfive/Kconfig                  |   9 +
> > >  drivers/clk/starfive/Makefile                 |   1 +
> > >  drivers/clk/starfive/clk-starfive-common.h    |   9 +-
> > >  drivers/clk/starfive/jh8100/Makefile          |   3 +
> > >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> > >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++++=
++
> > >  7 files changed, 495 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> > >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> > >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
> > >
[...]
> > > diff --git a/drivers/clk/starfive/jh8100/Makefile b/drivers/clk/starf=
ive/jh8100/Makefile
> > > new file mode 100644
> > > index 000000000000..af6a09e220d3
> > > --- /dev/null
> > > +++ b/drivers/clk/starfive/jh8100/Makefile
> > > @@ -0,0 +1,3 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +# StarFive JH8100 Clock
> > > +obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)		+=3D clk-sys.o
> >
> > This will name the module clk-sys, which is way too generic. Please nam=
e this
> > clk-starfive-jh8100-sys similar to the JH7110 drivers.
> Just realized that I haven't reply to this comment.
> I can't give it a longer name otherwise compiler will throw warning.
> That=E2=80=99s why ends up to use a shorter name and keep it under jh8100=
 folder.

I'm sorry, how does that make any sense? If the compiler can compile

  drivers/clk/starfive/clk-starfive-jh7110-sys.c

just fine, then why would it have trouble with

  drivers/clk/starfive/clk-starfive-jh8100-sys.c

/Emil
