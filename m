Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="isYC2PmK"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3D1AA
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 02:16:49 -0800 (PST)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7B1304081E
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701857803;
	bh=fPFWRVi4UC1wxgK1BZ+tE5lPscptXMAGgYLtmt3rvb8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=isYC2PmKdzAAB5oJwhwXgVDRu+Y1RZVLOZhnDKW7QH5r+iID1C8zNrI4+5yfubuPt
	 bCBegPaA+FE5ruOkNPZmMsjOYqLejDqv+Hy23maXLctVIthCN8ROs4qNzLoDJ/yTvC
	 67Tuy9yO6yWyWeFbnEAqrlqbk2cNqgEhwR9MEr4Euf7LJIj7XdjDz4mvExPILXuJdv
	 IQDelEPf8rYDtH7bOQw56uAbzT5RDaqHCNveivVHbp2X2KC4T96Ap6gm9rOSPRUkp4
	 uKT3koms1WuHtq/a65JC9Uk3eGwwn7Nj8sWR/WEowYzltFp3XHBj43tuHKJPKPy2uM
	 enzwJfOzAX4UA==
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2c9b97a391bso65184641fa.0
        for <linux-clk@vger.kernel.org>; Wed, 06 Dec 2023 02:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857794; x=1702462594;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPFWRVi4UC1wxgK1BZ+tE5lPscptXMAGgYLtmt3rvb8=;
        b=tRjoHTaKQQ0aP9FuWy8xFM7QlIAGkxg7NmJgIhXoqYnLplxdYYLwYN5FtxQZEa7CQT
         WIs9vyI+jxTQXRgJ6jbGIoFO9GskbnaJ+L1QDqPdL/s3DnbwCgUDLr7ZVcnuxBsvuKZk
         5aVi/V3o1SmcVgaYd4PADAOtOD6GoPl2KDZbc5QfB2rLx0mam4ogzS+rL7+3mc4NUyol
         oEyXkxzy2uN5/c0KkhEej0Ek6ibFmLrf3GvoKrN0z0pb6DvE8uMrhs4l+gSezRRRTHbc
         lMs92XnlJdSkLSeeU9Wn7SIC4ZfVy6DgAYFIFrqv3SOVSxRHgjUhMCZ66OvAEwGbzHKC
         +p9A==
X-Gm-Message-State: AOJu0YxzE97vqbRIKbkfpat8f4SQlZXB2q3djBPWZZDRxeV3gEj6SJzH
	Urai421uNKiJ0nYjEijbHa0ETYz6cpLFLzxtiHTf8kq3fOZjmwEv0M3PvqEAEk/ZvKY8Yg0qYmN
	pjSXjdWnlFs5FB95scZFP6Ez6bkrVvHcDdg+JVYouhLlDM1Cl4boAQw==
X-Received: by 2002:a2e:740e:0:b0:2c9:f925:df0e with SMTP id p14-20020a2e740e000000b002c9f925df0emr211953ljc.34.1701857794552;
        Wed, 06 Dec 2023 02:16:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEq781bpnuacD5QiFiBCg1mUOnOOSBbtHNvzHUW70ZtF1hR2gyBittWXfHSvEnQsp0nEdWGwPsBBWgtAAGiL6c=
X-Received: by 2002:a2e:740e:0:b0:2c9:f925:df0e with SMTP id
 p14-20020a2e740e000000b002c9f925df0emr211946ljc.34.1701857794264; Wed, 06 Dec
 2023 02:16:34 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Dec 2023 04:16:33 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <IA1PR20MB49531468A92E2A7670F1EE0BBB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <CAJM55Z9WO+0Yb-at6CAR6=UP9j60iQz=s7MK-3qiT=w-8N6+Zw@mail.gmail.com>
 <IA1PR20MB49531468A92E2A7670F1EE0BBB84A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 6 Dec 2023 04:16:33 -0600
Message-ID: <CAJM55Z-hCzuw+eQ-ABXoBYX7oSScXTKHwUzEe_2k6eSyy5HqKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: sophgo: add clock support for Sophgo CV1800 SoCs
To: Inochi Amaoto <inochiama@outlook.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com, dlan@gentoo.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Inochi Amaoto wrote:
> >Inochi Amaoto wrote:
> >> Add clock controller support for the Sophgo CV1800B and CV1812H.
> >>
> >> This patch follow this patch series:
> >> https://lore.kernel.org/all/IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com/
> >>
> >> Changed from v1:
> >> 1. fix license issues.
> >>
> >> Inochi Amaoto (4):
> >>   dt-bindings: clock: sophgo: Add clock controller of CV1800 series SoC
> >>   clk: sophgo: Add CV1800 series clock controller driver
> >>   riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
> >>   riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
> >
> >Hi Inochi,
> >
> >This series seems to be missing patch 1 and 2. If you did send them, but just
> >omitted linux-riscv from those patches, please don't do that. Having the whole
> >series makes it a lot easier to review without having to hunt down all the
> >missing parts on lore.kernel.org.
> >
> >scripts/get_maintainer.pl does support muliple patches as input
> >
> >/Emil
> >
>
> Hi Emil,
>
> The get_maintainer.pl does not give me linux-riscv mail list for the first
> and second patch. I have added this to the second one, but the patch is
> held by the mail list since is too big. Anyway, I will add this mail list
> manually if you need. Sorry for this inconvenience.

No worries. Yeah, that's what I meant by get_maintainer.pl supporting multiple
patches.  You can do something like

  git format-patch <starting point>..
  ./scripts/get_maintainer.pl *.patch

..to get a list of recipients for the whole series.

/Emil
