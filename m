Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283A344DBF
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 21:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770586791; cv=pass; b=NwUr/nxmCbtf48XZG/WbU1FZBJDDyjV2QtIZoMq+ie0JbGm3OYR6GGeVIW+euAyWSVZ/YazLMhs7o0vaypVrp4PUzdu2dbtdLR07APNlng4JTB1DiY8yYX1P12J+QkeYoate1YklwiOcjLWMFujNqv3lyDDfEhOd2F04j17RtzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770586791; c=relaxed/simple;
	bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJFkP3t53u2QSgWKmExgQ+BYReNdfAQShsM25Q1GCF4H63Os/KaXFRknLxXcdslsuSGtFsWCIIKu9sSvo+27sTlupA7yxqlwa9IA4I4W3A58OAb7j9uF7ToPmof+i3aRl5nuN6/rYGqHyVnpfpQtMe5VIFK/Pz/s23KrGOrCf9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ISNt0Wcb; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ISNt0Wcb"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7945838691aso60297767b3.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 13:39:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770586790; cv=none;
        d=google.com; s=arc-20240605;
        b=jev6S4l+pF3Aab3mM8y3aJy2BVwDJvWbcstGQDhWnXIH9/teEgVldZ6Vs186+QaoRM
         E4z9aEGeCNzDhpWNyq2MUZFhrAAvJS2XsWt4INhPH2SCGZ+CMWA4REfU8z38YpeuEAwS
         tbqM3f06SDe1QZgk/X5ojcsgRyibZTQhlaIVQEWMQedBsDopcjTewIt+var8O1k7s3fT
         q/aTagx7paEUlAVChPqSfZR1RcyQFbb8tNYUiF7U5SJvcYt4PoKJTrnY5gMTVcsCRZFO
         0aqkY/j7ol6xj3APB3DiuXuD/+Ldc3qVHChEqyc0fnKTtb7inCb38qYxXtJMZkr++5B2
         yn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
        fh=2RjucZBdwekNpHdGrsZAysXjXfTUW3ZwpJPD9uwjzwY=;
        b=FkeiyDZZZe16vfgrQc9tdwcyW2gz9RPGSn71nW/AjUfLVJwnHv4FbToIrSp7Kxycgx
         xKKqWbUioHOXtO0tFyZhmoSc9SbU4yWIFEWIxkn6gWJWjsCFlOw8uvTtJrBc9byL+GWq
         2RTef4MdlPj7gmrfkoLzjVPAe2C4Bp7ggPRG06IYQsXfpyDsHvv+Uy1N78QsoK9HK/lV
         +zEGw6nlSM3fAkbaovQMM6diqqsXfJxXrem3Mxv2wOGHRfELauK63vT18GvhoFAVeXW8
         z6xT/E1qYFC6ZeN2/RycQLy39STj27KI0FAA9n50nBYpRZxCnmL8UnnWSMI9vt8pNZDG
         CqpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770586790; x=1771191590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
        b=ISNt0WcbRgPjx3kC/9pbRh4YChVp5vK0PmK8CQJXxPJUWWxNwUrXNhju+4zhQKeXHO
         hPzQ1hjwY9DFgQiSGXOcxSccfYhaqhYO2AqDAsr453CUlXpWHSoFMj5ekRUqL9/vZsfe
         hoy1WUiUPAQ6r05j7VXC2AeFBD2oT+a7GtP9wTzNljQ3SDSL9GXs0X5PiSosb/KoEG/L
         7/aYslmWH6c1db9BTeaSGQzlizP15komLGRH5TFT9GNtk6SYzQs3LeEWWsiko/Vgs1au
         TLdh6h2tm0xtF6lZYR1XlpRg6riLrXcB8o+6zY8ChZJjIJ/AmYSO+yeJfsIYtxBqiZfa
         MBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770586790; x=1771191590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
        b=w6bYDw+SS7SJJrwvGiJmabxZwaYyDJi3/nevqITX/uPe26KuYkj+j8mRllcP9oK27Z
         XsMc1q2SIcxlIKkNwbvaiLLohsilr8KmURANls3YkMLxX17DbMSiWm/lYRr54sD8ClVS
         YNRSn30o5UeNeoXTnpRMxOJTxUUtJJO0Tb3nRDgmpA65Ihu1GlMMaW67cdTE9ARL8MmQ
         V1fPyukj2INkP7FtmoU7UvKLqrIVysj85RvYzARX3ijtYMsLPQbzksbB3ucEghOpK8JX
         84rcGBxc0yp3Hqm4DN2UAm1LSq5mFm03psJ2NN5iQJieKa5yc4ina40Scrla1p9HeVE2
         mHKA==
X-Forwarded-Encrypted: i=1; AJvYcCXcB72Xa4L7mYsppqo3Fw478Bzlg4Ji7w4b7UYUE+3vVkKL+nlL3kEt4hRjCrmJKItl2m/7mHrwgzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxII9KcF+fD/NxwIxzEepXfZ83YURjkCXK8P1EUAqPrl/IPAPgQ
	7YcoCZhUQQtVIl54xri/5glg0gG+aVc3Z2F7ksX8cbVtiftRLEgeK/ZWUthuPDHwBxfSwAn1fVV
	ZMgQM0gge1XcocJ4k73qge5pHg1Xf8DRNYdjvx5yyrw==
X-Gm-Gg: AZuq6aKJ0jutUKcK5idawXYn5opVMvzEeniHHgKfoWJA7APB0enr3YAozw+N89T+0rk
	FKY76pJfkWrsMpj0hSGAcAL5HV9vdMWmVrBOiz3Phuei21sgC2IDPDt5sJSOQhUEP4Uk3SckUAK
	q9gzJN3hzahsPd17Vt5FL6kAClZumCHdH4F0TMMp1h0XmZFm/KOGRLmF6IrOeLM6WvqtbOLGhSF
	EwqITKm3AN6Dm3bpFxmE1HzWeIc0k6dRCs3dGmTx9rgMK4AcgtVR1x64bAUoOSrcHepzThx0cor
	gsAmSbDWu8m41yfODy/OX0WoEAoSSn+F4OwXe2Gw6VtcsGB8Jsq0fjvbmg==
X-Received: by 2002:a53:cb85:0:b0:649:b062:674a with SMTP id
 956f58d0204a3-649f253441dmr6382827d50.37.1770586790136; Sun, 08 Feb 2026
 13:39:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll> <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org> <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
 <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org> <20260207-stifle-chowtime-8502c0a57f70@spud>
 <6ebcb1a9-78ca-4734-8723-758f79e6819e@kernel.org>
In-Reply-To: <6ebcb1a9-78ca-4734-8723-758f79e6819e@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 8 Feb 2026 15:39:39 -0600
X-Gm-Features: AZwV_QgkEwTCiwXuHTTQ3WLCXuNOfifaUxe6wncI1nA-Tus6DJ7O3arSqaM8mRM
Message-ID: <CAEev2e9ukBSgWc5WT1xcv+G1ZzOWAnuwp9kaJcKKe6mbtOtoFA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 7, 2026 at 12:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 07/02/2026 15:54, Conor Dooley wrote:
> >>>>> suggests picking a more generic name in this case, so isn't
> >>>>> "tenstorrent,atlantis-prcm" okay for that?
> >>>>
> >>>> No, because I don't want to keep guessing this. The docs clearly ask=
 you
> >>>> to post complete bindings, which now became less-complete, but fine.
> >
> > I don't think it actually is "less complete" without the other
> > compatibles. The non-rcpu prcms function differently to the rcpu prcm
> > (they seem to be consumers of clocks that the rcpu produces) and are no=
t
> > supported by the drivers in this series. They're different devices and =
I
> > think should only be documented when support for them comes along. v4
> > had problems that were caused by trying to document them without
> > actually having driver support figured out.
>
> It's fine without them, but then let's just name the file after that
> only sole compatible.

Okay, thank you for clarifying this. I will just add one compatible
and name the bindings file based on that one.

In the future when I add the remaining compatibles (and driver for
them), should I add them to this same bindings file? Can I rename the
file to have a more generic name then? Is renaming bindings files
okay? Or is this something to worry about for later?

>
> Best regards,
> Krzysztof
