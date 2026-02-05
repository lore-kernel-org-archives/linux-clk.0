Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8313E3EFD10
	for <linux-clk@vger.kernel.org>; Thu,  5 Feb 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301119; cv=pass; b=D98rXBQUrc3v/jT6Q08oTFoC4y2XV+jrd9s7bhInp5zyV6hmePkK1aLDnBcI1jSzuQBh/rWTp/AgcY3b6phO9aYXdOvfh4Zo2Hytw6DlZFeNCeKCREp8Jd/HPPha8Cqaw2DlVZCl3Utqi0Zlqhl+ypk0I9+JvW/i8pMeHQByzlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301119; c=relaxed/simple;
	bh=13/yP5sugD1T4wa1KPYaT73Fe/1mMh07j2CgQxCEiIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyH1MMVJE/DeD3LFI0SpaDlYbOFAVoCvrvYJloZOWRW0XCmOGt1L3GglsBJO4Z8r4UIWjIB1qDmWuhNjud9KN/fawOIX4LAI/00eAt3a5cYXBTNJWC3lJQNLJ1QJ222QASZQD94+VMMFcwZrm99e1IB06dlvHSUIK50wL5oSQl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=QknARNu0; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="QknARNu0"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-649f0025965so154777d50.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Feb 2026 06:18:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770301117; cv=none;
        d=google.com; s=arc-20240605;
        b=dqP4Fxxcx6j4kgu7Zf8ToKVXQHpuNDp5QvHjuwC+0bC4kKo6JZx6sLX/YW9jR7qIkh
         psJ6YNnkeSmR/tR+MwVizl3kCH+PMelUUgvW8xl+6M0UjY3/wpQDJqlnnXdPGbY8R60U
         +aUM3vaI3rK5TA5H9aFppNAtZQDfc/Bk3396Wk3ZeJUlLsI7aPRyTZOsG5MdQwd52Phf
         uoA77Fu3TDQoou+yclNBrS72jlscMwzQIaeSpSvGjnP4E9nkN1DlC5pFz/C6aY7N4IHw
         ynKdyzgpx23KPcIKhxKEqilmaq/xzK6wQOg+wLLsFHYYBFK8gZclS17Y+0PqkUl9qE9L
         r8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmzX7miFPHenGmKgTxHym6piSGjO2BEbSWKlfsS546M=;
        fh=e29yM3NGi/X/yG2uzzQLmnk9p0W63HKVSvY9X+oEC/Y=;
        b=ZkWxfoxNJTUu9dQFSg1uCQfMxwTbxph1g8OmOCdJh8M7SFOSQDWqlbEtSeb87lNP8m
         EAn8r5Spv2efAPD8FAygA/Fjs/rrU3/gIxHYSX8ZELsExjObAbLW4wsoxjzTc3iBvj/Q
         ohML0kKr6ijSzEP+t6h0RGk8DJWI3+o2QZFvv9A5MWghk+noBfc4Af0uCFKXnPdMhgHx
         gZ9Wn+zGq20HnL2KM9DwnIe+7YhuDSdM0p9IhQS/prNyJQs6Aqjk/kQ+E34Ox2SIrZGn
         3HT+pezFLzuIZ/QxJVfGRsqe6l6FiiuwPxi3gLJtNOl7q0p6YT4Bln0av7phBhJrnLh9
         3KIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770301117; x=1770905917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmzX7miFPHenGmKgTxHym6piSGjO2BEbSWKlfsS546M=;
        b=QknARNu0j+XhP/+qePBd1kSekNUhuw2gujmqmZ92bd5R3Qw8+URORQJvYFqo0UIgNi
         pkYtoFsi3TRa4cJGdC4pYSkfQzs/U725ybPsngHRqqxHHtloiBCCtwr2po4zMGfwvYzi
         fsTufLrMHyt/PKyD5yLCRM5yrCwg5zOvA/vmWovi7rF6rq7pKSqtH4Fo8YehMatJLDBj
         9IvNL36acxtJA3TcM4agTL844UY9ShK6FfiE/UFb4eASDVxVMQb/K5ML9uPeU/THx/jK
         VfBwCvPxCEaFdu5/5LZbIU51ZfMSK0NxCVR3twOfmoIWGf+s3ZGXe1/sCAQZMNw+JyoX
         Vfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770301117; x=1770905917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmzX7miFPHenGmKgTxHym6piSGjO2BEbSWKlfsS546M=;
        b=GOP3FWG3WVoMRdRDitlsPxqbFtlTlCSUdaGIpx5oo5DYZgazVeuSIXW5eA6JNsmpjF
         bfV7/TwV81u+kMIvi+TCimKr2OPE3MJfaMD+oWgbBef+lJu4l7nRHFmPOgs+kRlfs0RL
         YxYwf0OkrF23pIWoKSi7lCwWrPg9jL9uNbCTvo9TSAqyqSb1rHaIV4LSY+RNSuNpUDnd
         QDGWgxrInng/PB8VaX5jvpQCrcIjrV3cSUsAPFle2mZZT8mBtSsBxGUjG9A106UH63Jq
         3W0mJni8OmbdPCkSTtwymh2GuFd9M9l+jVfr5HMW3uba9ZuTkeyy5rxOMgDkCKdT9qG+
         0a3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIlD1BSaYDPXXZTZPSgc41HhIf5jLg2M2m8gGeE1LhbFkQqs36c1DHLwOfunKOJ7yUkLSUXyRXJL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7mpfiyvGPF3uQ2/5iDwxvMMOJVuV7iWafrZ4nL0ULSE65g/B0
	J1A6c+4oHD7eovuOIsxMotYnC0R09fYSaJMZngOGA1SnaJvk78OhleJmpIszRMhEpX99aEbEpfx
	PE2KG97YFWZvSmvSROGNckxxAsvGoSmAqBdtGl1r7Cw==
X-Gm-Gg: AZuq6aLzbEQIVB4eRMeXpkPkAd/vR9RSX1HdhdpogTe8150ymSmxlhbP/T1qVwZFBvj
	4GkEoExVbMdkzUUrDV8mJ/b7DlBCKd0XVKqfODsmp3aOyEYfiVdmLpNeV/EhLP16ca6ZQ9Sjppf
	MZerszfXuJeR7B4/lHpZXCAnaggzLMM32YMuTj4U8ZhQFIh03Bt2vDxm/o7iNdZH5HFtzoYJXRx
	eJ++/AibEpqsXgKp7KR0BBum+kht2wp6qcm0LK9Sf6cNyDdiNa13Qu3opJIgoyx4ZUZNh82bCU4
	koule2h63wWcR58H5trAumxGHISc+7BZ1Wg3Shw1ymQN3Eoa3XgpgSmx/sJr
X-Received: by 2002:a05:690e:400b:b0:649:deac:3a4b with SMTP id
 956f58d0204a3-649deac3b03mr3774253d50.53.1770301117363; Thu, 05 Feb 2026
 06:18:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-2-0922e43acaba@oss.tenstorrent.com> <20260205-spiffy-bizarre-doberman-184d2b@quoll>
In-Reply-To: <20260205-spiffy-bizarre-doberman-184d2b@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 5 Feb 2026 08:18:26 -0600
X-Gm-Features: AZwV_Qjh73GzJRPJHTYqtWlvnk8u0Q7TIS1RXBqh4qKkHh3LKjQLN6cuUSeiYrU
Message-ID: <CAEev2e_S9LYV609VmrHCqNneuTro=hbAjzgHFLAO6RD0_fErwA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

On Thu, Feb 5, 2026 at 3:27=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Feb 02, 2026 at 01:46:50PM -0600, Anirudh Srinivasan wrote:
> > diff --git a/include/soc/tenstorrent/atlantis-prcm.h b/include/soc/tens=
torrent/atlantis-prcm.h
> > new file mode 100644
> > index 000000000000..841516cbefd9
> > --- /dev/null
> > +++ b/include/soc/tenstorrent/atlantis-prcm.h
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Shared definitions for Atlantis PRCM Clock and Reset Drivers
> > + *
> > + * Copyright (c) 2026 Tenstorrent
> > + */
> > +#ifndef __SOC_ATLANTIS_PRCM_H__
> > +#define __SOC_ATLANTIS_PRCM_H__
> > +
> > +#include <linux/bits.h>
> > +#include <linux/types.h>
> > +
> > +struct atlantis_prcm_adev {
> > +     struct auxiliary_device adev;
> > +     struct regmap *regmap;
> > +};
>
> Drop, there is no driver-wide user of this.

>
> > +
> > +static inline struct atlantis_prcm_adev *
> > +to_atlantis_prcm_adev(struct auxiliary_device *adev)
>
> Same here.
>
> Do not add symbols to headers which nothing uses. These are private to
> the driver so they must stay ONLY in the driver.

The definitions in these files are shared between the clock and reset
driver (which are in drivers/clk/tenstorrent/ and drivers/reset/),
hence they have been put here.

>
> Best regards,
> Krzysztof
>
