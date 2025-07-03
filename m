Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CCB2AE99
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 05:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751519807; cv=none; b=TF9Cz8i+/4eL8C8lhz78llZpc7FkH1CZjNR9/ihemwmGAnqBqgYrq5SNDEqeSfA0DszPm7Ssv+tK/FQ1EClfKiwlItM+YrEym3k3ONds1WxazcVKpfmpY6wbnZuwIc/ZQkA6hn5rbIWFLKcCsxzR/utRP0kMiQ+dMGWS8pijfoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751519807; c=relaxed/simple;
	bh=5++AYJL1rr9Zw2k1O8YtBYT6eG8XMOCdu/Bm09aDZf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StRa5Zo6kA4N68bwqgr+MgNd48a7o2oa0rRWDzoTGeGIb9n2K7Ubu1QcG9yz177eUl1tr4wLjT6yU0IakgHJLERbMQKbdd02rhxizidOeqwkMBROH1JbmDfUk6wHC6qZC5sRvTFEugdH3Pp+tX42cZWbpek8oBmAeokJ5ysCs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oRfiQrSC; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oRfiQrSC"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b553e33e6so45061411fa.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Jul 2025 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751519804; x=1752124604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQGz01tJhAAGwav0P9s2fsB1+wOe9xwJQtDO+Z/F508=;
        b=oRfiQrSCWdmS2Xci+ljopcSLoXTlFX6BHwDiCehpGj/iF22bL35oYl3/s3bhmNgKM7
         OgknSu1hW0QJEWadauQzqv9h8/umdsowBzyFRn5KGgMCeaKHmIp/gXWbv+KdUTMUYtWp
         hSlSMH+0rLNGtGsynGN+oqFQIPtvqKEfarWi7/cPUWuvov5VOPi/33WJpDW+pW+StPsp
         ewADEh4nvd40m5VS/F0y7OvEvGgLKcIgmY67urGTHYjJLYrNXd1wR/PQCAWCfsRIRSHU
         9w6WfWHtUQnwol2pIdy3zwOUuQOWrQRhira0852RDQn1xeBBbjX6udCD4HvR6sX8nH4z
         fUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751519804; x=1752124604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQGz01tJhAAGwav0P9s2fsB1+wOe9xwJQtDO+Z/F508=;
        b=hOg8x5jFk+8WB7kNfF8HulvfjqiqSRJU4H3WRCRq2fTwynGQ4eLNQTDpbrMwsDvXWW
         iK2ZWQhQ3aIcMZP7IzaX8tLY2QfpmnXQmAW3eqtJTHTVu9M+mRpTlFVHcguR0jXG6wYx
         A97O898825DXrSRer1SEFH2DpV1XtaOuq/tIz8RVA5Sy6QPrVyDbtrNIsY8TD2qrvMyR
         vvpq4rVMdcitJkKdrI7FQzXz5LRyTnswp6Cx81kHOThKFgrdTw0EBsJWjzz3A/B2CsrX
         lFn9L7o7l+i7VSJSyXqVJd5ygEqAUJOb86ix0xMjxr82iHFjpdrY2m1QLZsawmx+Hrw0
         NxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeYUuY3GHUw1BQnZRtBr22YKvuJzWRsgAB4ankdtLcwBmM/rFQXFfdlT1LJ7Fv/pv9VFr1k/V8RTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNb3f64jr5U51hhxschQVZncudprSpcbVfxkGkVd/Urk1zEBPN
	DW+5sA4Xro2V8Xqdki4TGlMYIf8yvfNY5YZP9NjGHBTAVHe2SkacybxaUtOVlAVucouzARPAj0k
	9dJ7qXItpMIHW06xqA/d53BtQiOIQY800ky1SYkTTgA==
X-Gm-Gg: ASbGnctjC0GBzeLeVa5frZYr5aSyg+4/kqCu2WwdjZFZihwtBRUsr0AYHfXJlkh0Q10
	Xs4XfWsOaXRGJcOhj51Y/4vQ6+B72Zhv4KcW1iOiIYuUfTqBHZgYlRwQuE19c/7Hdov1CvMmQH1
	kl2jvWipcq20qG9UAaA2i6HLvmSpgArOuj75+c2UOy1A==
X-Google-Smtp-Source: AGHT+IHYSiHUidLGv4dXFytFZP2Nt0HvbdpSFDn7lYujOZRVAvsZkPmjzani3yVgvf24c1Q3Pz34/X6Np9T1yBQoZbA=
X-Received: by 2002:a05:651c:1116:20b0:32b:4749:f929 with SMTP id
 38308e7fff4ca-32e00084c44mr11819561fa.30.1751519804242; Wed, 02 Jul 2025
 22:16:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-4-apatel@ventanamicro.com> <aGUg3h_vigc6mq5a@smile.fi.intel.com>
In-Reply-To: <aGUg3h_vigc6mq5a@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 10:46:33 +0530
X-Gm-Features: Ac12FXzWllMhgTE9HbRqxwe6piDDOSlScwKPfW6gr6Tv5nNXJiWHPlUH56eQbZc
Message-ID: <CAK9=C2VxhC6soxHtmacedbeCU=rFi84Br1RvN2uPcBKoLhRaJw@mail.gmail.com>
Subject: Re: [PATCH v7 03/24] RISC-V: Add defines for the SBI message proxy extension
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 02, 2025 at 10:43:24AM +0530, Anup Patel wrote:
> > Add defines for the new SBI message proxy extension which is part
> > of the SBI v3.0 specification.
>
> Actually a few nit-picks.
>
> ...
>
> > +enum sbi_ext_mpxy_fid {
> > +     SBI_EXT_MPXY_GET_SHMEM_SIZE,
> > +     SBI_EXT_MPXY_SET_SHMEM,
> > +     SBI_EXT_MPXY_GET_CHANNEL_IDS,
> > +     SBI_EXT_MPXY_READ_ATTRS,
> > +     SBI_EXT_MPXY_WRITE_ATTRS,
> > +     SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
> > +     SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
> > +     SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS
>
> Add a trailing comma.

Okay, I will update.

>
> > +};
>
> ...
>
> > +/* Possible values of MSG_PROT_ID attribute */
> > +enum sbi_mpxy_msgproto_id {
> > +     SBI_MPXY_MSGPROTO_RPMI_ID =3D 0x0
>
> Add a trailing comma, and you might want to drop 0x. I don't know what el=
se can
> be here, esp. in the future, but some kind of the description of this in =
TRM
> can shed a light on what is better pattern to use.

Sure, I will update.

Regards,
Anup
