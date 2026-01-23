Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30721CC59
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184929; cv=pass; b=l/+qyIHxaMCQ26QpJnHPQAxjyxJplq3O4EVnBsatj02NyOECMD+Z8AlJ3Li0ulyCmzdQXFoNy3FhaF7ohlwSE03XGHuHUxaHQy5djLIJM/si6H7Fis+g1Xs8J+F4lmAJd2jhqinr289P67RzvCs6noKk/BtjY5wrvlu7fz4cdhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184929; c=relaxed/simple;
	bh=ULo9/7nEk6hL4PrJCYwZVROHGT49nj8c1aEMZ+/vAQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErhaFBYYrS/7+7AvrH6BlvR3YbsuFGTy1xA1xWgqn7o+2/NNt7dP4lkPl8vOxd24DWAu4gNaTzl+1HICOccGMKTU0egQKPxNHLJXecrlMn8568YVaiNcEnBC0AnYT8ObWbvmNjbCX/ZFThN9s009QzMFAbnsve4jG9tg5szMmMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=d+knp8cN; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="d+knp8cN"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fc3572431so23085307b3.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 08:15:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769184927; cv=none;
        d=google.com; s=arc-20240605;
        b=H1KeAM/tD9QorYOCzOMGUXBWUQQKpnJT/cGlFZmC5gGzWiDivdyU1ASY6Q01e61psS
         MLZ232K/JW1qc4qvYBebtGayoek9yPVYXA4xtlFOznwqURrNdhTsRuWoy1OLw5lbk+6j
         iYzSQjRj3Nei6gPMT21XA9116U5dZA5ndQBxvUtOeL7jBoSqz6q0Enf4JS2YBpeON3kz
         UOKeCFrulmtOZmAyM+ocp/mOYTf+/4QyKwA8AorSeDJSQ47lzgKOgfK6t7QATv1HddjP
         aRu3TEWmK9xVfcBDm+SMT/vTL4CLfehSzAN3QiYlaUCgEI09g0HvIjyOWp+bwHkwlp5x
         22TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+bZRUnNeGrRNpaGcouolNUcM8xSpXsG3h0Z9VUZ9+Rk=;
        fh=RgMRn/aD+tKPs36jBgbIA9fKL70D/i+hN5iTVoDhLIo=;
        b=lUCUuSQRuz+zxmn2sCgTRNOMwa6/T2wTw89iMPtGlb7NMpkZkgAC8E4Hh8THEwddEG
         mXK6flZ2+ddMqFQLjnlDkzOpV5X9tGWpt6gXXmKR6W46Ij8/nsWjr2juA01vbVRvFJFu
         JzP7FQzOCMskbInDjD3b+bWEqGSeaeOkhQ8eo9UXXcxfdqO6GB8I4hbDaeeQdRlp1Qg+
         JAic+yCdddXF8aaw00Irnf/LyNRkuKh49TkMoknx2KXWMLcVnY1dKrAJcZI+058ASYSy
         P/GS8QUHrWySotAvKImznclGpaA6/PXd7MywNdadMD73xrsZ9MACB840PdMp9OcxzF83
         5fKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769184927; x=1769789727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bZRUnNeGrRNpaGcouolNUcM8xSpXsG3h0Z9VUZ9+Rk=;
        b=d+knp8cNgo+Bgqmt1xea3LtlSLSQxgY8pjIfn4Iq3rhX4dyqqUe5VLwjt22NOvZ9VW
         J4zoPFDES+rtO41V/gIX+icd3geIWrNZbBM1k9xDrzQxsXhqZrut4+VGNowBecOyl8gz
         vHJFEKsswCKSZYRUTM4hycKl61uTJyankKqncQpoPGefQ/X/BqCLsZDvWVZc0qmtbDzw
         7ZIhhLrpJiilf1Ok1huGDu1tPfqqmmhHVfmnfHsENcWLC/syHD9kPnRDPBdqLE3EwqiO
         Jyb4P0dYNnCCdtwr2F7Gi7MyaR1dhXLuiQjQOJSuspGxixPfxaJfzTnpeb04TTqBrBY0
         ICVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184927; x=1769789727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+bZRUnNeGrRNpaGcouolNUcM8xSpXsG3h0Z9VUZ9+Rk=;
        b=PwoaQ9UDAn7IrlTCcmKa8BRl8YA0ZDo4tJQVEcxwWePgbNynWxKJxUxtITNTysl6F9
         AzfF6Oes/iJv1piXTNm6a/Yd/8F5K+4cLY9JEfEk/vYZYpX1bNEEASZF4515JUve6Wql
         UdyBH/IIBqHkRyICCY7ZxtMJTVJH0F88VM3putzk93c0QSiyJN2LVZxS3qTv4/GsXg70
         YSXSoe3LVlPEle6gG6PnUyXJFfv+FuelcG6nJmRu1NMUzAZm6q6n5Izq+XLr4aK9U3K7
         egZ3bYyp8BpzRo+gR1tU9UIS05eBfMphYk9eKadmYjC0opZ+sjS0FLLC70OKUm7m3vjS
         Rx0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSSj3xHmC67Zjn9upkUUcfBs7HUi6AOOuoXCNF5V4bKLM8OvRbWzoqN4TtT0od5kSO/BgKVtnHQ/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoapUdHsrZxZuXGq5Lz31Bp0rssZoZcgukKjCodd64NY7VkSWs
	oZ5dK9WNKdUepRF9GebuUIfyIrSoLwzq8/hQ/f1SvofNZVA9iJ0I7gES6GX6uzsToZ63oRDh69L
	zZyL2zs4pY5eDmE1Zql0+wQ2Ujz9RQ2IxB1YGoLLElA==
X-Gm-Gg: AZuq6aJMSueCx8VdyI/p0DpqISj4d9a4TPsHm1zy6G0F/zmt0evMIKHUsIAoPx+wDUk
	fzN/x8cIRYOwamvwp56vt1sBKtqcqvtmUymeKXZwyKcUxmR6crPcnqUhm+L7Vh75mkX+TwLYDVJ
	5uBRspjgMdETud7df5WpqvhnqqvWJfxUJSNdsjqfX6MStGBVAaum7JP9Kzdk5rKjKwafdSz6LH+
	ZgptDltaa7SAFM9lsVJ/G7Hg01gRgQVzqpphmMNfpy6BcI7FjBBJ9Ifsm+4pwSOZS0X+5MpLohW
	xazwaEudW81CV1EU33N233dVQx6ZS+ugaBF1+xWogoFOCN2ILgTEDcd1Zn9oc2p3/wIngeM=
X-Received: by 2002:a05:690c:39c:b0:793:bae9:9295 with SMTP id
 00721157ae682-79439925edfmr27856807b3.31.1769184926791; Fri, 23 Jan 2026
 08:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
 <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com> <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
In-Reply-To: <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 23 Jan 2026 10:15:15 -0600
X-Gm-Features: AZwV_Qi6CqkCPOD14PwEW74h_hED-jEGhbBNZe3VbRvLaoqSVWwFH86aFXA3uP0
Message-ID: <CAEev2e_6PePu3omq-Zf1R-8TYikgz9V1cp6cwn0nZ8LaPHaJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
	bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Fri, Jan 23, 2026 at 7:00=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Do, 2026-01-22 at 16:36 -0600, Anirudh Srinivasan wrote:
> > Adds Atlantis Reset Controller and auxiliary device definitions for
> > reset to share same regmap interface as clock controller.
> >

> > +     if (data->active_low ^ assert)
> > +             val =3D mask;
> > +     else
> > +             val =3D ~mask;
>
>                 val =3D 0;
>
> The ~mask bits will be ignored anyway.

Ack. Will change.

>
> struct regmap;
>
> > +
> > +struct atlantis_ccu_adev {
> > +     struct auxiliary_device adev;
> > +     struct regmap *regmap;
> > +};
> > +
> > +#define to_atlantis_ccu_adev(_adev) \
> > +     container_of((_adev), struct atlantis_ccu_adev, adev)
>
> Please use an inline function instead of a macro.

Ack.

>
> > +
> > +/* RCPU Reset Register Offsets */
> > +#define RCPU_BLK_RST_REG     0x001c
> > +#define LSIO_BLK_RST_REG     0x0020
> > +#define HSIO_BLK_RST_REG     0x000c
> > +#define PCIE_SUBS_RST_REG    0x0000
> > +#define MM_RSTN_REG          0x0014
>
> Why not move these into reset-tenstorrent-atlantis.c, they are not part
> of the interface between clock and reset drivers.

We were considering putting register offsets like this in separate
header files that are dual licensed. In that case, is it okay to put
it here?

>
> regards
> Philipp
