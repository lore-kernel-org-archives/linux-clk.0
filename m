Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22DC270ED9
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997944; cv=none; b=ATNTOc9bWoykiQ9y7BdqZFAjrjdIg6ckZHDW4KDWihYWOWRhRQNz9nfn7aRP15qQHzk5gN+ClVOcOmKsjCu4o1/RkXkPe9RVJDL1AwhihrUSRC5S9Noq9j9C8YQKabuIEptmhfxRBdAk5OxJxD78vqRIp8oKq8YsYEc1+pqW86s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997944; c=relaxed/simple;
	bh=zB8TNQPA3Wzg8xVPOTBwKcKKHslhPzrMFME5cZusnCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az75qE6qoeVVtVP4MEiEcfvJCQfLvz0pALMORweW3OpQ0c8oul2vxxUV4EMprQhodtYi9cfo38d/Enuq6XEJM585srh7QV9EjykbhxN2+M6gX6dXj1E8lL+atO/5l0t9BUcSqer3tDQK05W0mALr7soONfrkyxFIuz2MX0npALI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fEmoujei; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fEmoujei"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-279e2554b5fso5905565ad.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 01:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759997941; x=1760602741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=;
        b=fEmoujeiO8qeJU2AGLVkRPeVGgOlbhq+maEo7w2FW+DlADD3pbA+CH/6T5wL+lQW/z
         F9X0cy12J7hwMab9W7YhVJJZ9gbannF0AcUWdXcmCP5XRWEPdsht74B9AlXU6f6LVrYl
         RFTGxUjRKyoLNJamf20TsqafyMmbpOZi/9Fl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997941; x=1760602741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faVDqKCdKWIn3NWkm8sNO3VSI1X3h4Cs5MtO9NYvbBo=;
        b=DTN2HE44TG8CQx61+yQlA4xNjtDMf8xDGkSUcDcU4CqEFBod6DW0HpWhZYOPss4sUU
         nPxDz2QZAjTqz6QjBfvegRJdjFXLNi8Ublo0MWd+1mTxaof3XsTVy0+u3oGsz0mZNdl8
         lgKkySC9+ICaq6Pnta9dPlXC1W7Fk7LRzACGldsL9nV92nI90rpZ9DdIr9brsIdTNwrJ
         AWJSTW+516XrFQRlNH525N3ZgMbx+7U3u+PtMK8tTaupmVgvLXlttTRP/oZUM1oFHAql
         BWMWm1+adFASlqAvMpkNF+x4tERSESuKKTWAvTiVEnQoWVvqa4YFlbJLbmRFMRNafmAA
         phrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGDL+3DB4WyR40Y+Ss6yw5nrFXVJNQCin5oLQMDXWFnWUCYVYE6jXsw/w4LdL4hYuOeThf/bXG1tY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+GeZMsQe20SdEXHp8lfw7NSg7XEQwylNn4UlWfWobJGZliKK
	ODHYRTQevkaOhRgXc9aF9o8agcuvXSt3gOxZS24AUEoqT74LL1iG7h7ZdKYMppII2qiKljuqY5N
	BfId3RHWMz7fyhmoRaxujlSDEfZ5Ropl8M1UManv2
X-Gm-Gg: ASbGncs+TxQGh/QJHHME1hAUHeLWs+vAiNfE7iCSTTAY6+kh6yWKcq9kGesRkwhSh4Y
	NXbMzlhcDO646fNkyMlccWpLkkie4kC5KGcqPYxLuS2TF+TYdO79dWJxFjlztZxCFzmgSk59Qr4
	CeeSkkofaPURYdem34poCdgEnYLjpOjV13TNeGzQbx177PtKLiJdCX9cRftgd62dUNAEvGayH3e
	3zFQ2YQo92fBzZ6R+31yjKys8pB3jSuhN/8z6/JR8k8JjU4IOSkkTDKJGZg3g==
X-Google-Smtp-Source: AGHT+IG8hUHTkL+0dXNTRX/4yTjjacHxUhJpfIwq4JvXFm1KYIbTsH15Oh51ajo74tr7nKhGrgMAEZfz3BlrBGqWW9I=
X-Received: by 2002:a17:903:28c:b0:267:8b4f:df36 with SMTP id
 d9443c01a7336-28ec9cd714amr123635935ad.29.1759997941215; Thu, 09 Oct 2025
 01:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com>
 <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com> <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
In-Reply-To: <2477df4e-c89e-408f-bb2a-d5af51f78ef8@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 16:18:42 +0800
X-Gm-Features: AS18NWCTXFo8_XU732GoC_EADGZOvbHUHoSmyBMCpLqt3ZP7mbYJfRNT_Vg0jY8
Message-ID: <CAGXv+5FTg3VXpbav5c2Gx2vRgaC=jYURRp0b5tQGw+ScACRSew@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 4:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/10/25 18:05, Nicolas Frattaroli ha scritto:
> > As it stands, mtk_clk_register_plls takes a struct device_node pointer
> > as its first argument. This is a tragic happenstance, as it's trivial t=
o
> > get the device_node from a struct device, but the opposite not so much.
> > The struct device is a much more useful thing to have passed down.
> >
> > Refactor mtk_clk_register_plls to take a struct device pointer instead
> > of a struct device_node pointer, and fix up all users of this function.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 4 ++--
> >   drivers/clk/mediatek/clk-mt6765.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt6779.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt6797.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt7629.c            | 2 +-
> >   drivers/clk/mediatek/clk-mt7981-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt7986-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt7988-apmixed.c    | 2 +-
> >   drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 3 ++-
> >   drivers/clk/mediatek/clk-mt8196-mcu.c        | 2 +-
> >   drivers/clk/mediatek/clk-mt8196-mfg.c        | 2 +-
> >   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   | 2 +-
> >   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-mt8516-apmixedsys.c | 2 +-
> >   drivers/clk/mediatek/clk-pll.c               | 7 ++++---
> >   drivers/clk/mediatek/clk-pll.h               | 6 +++---
> >   24 files changed, 33 insertions(+), 29 deletions(-)
> >
>
> ..snip..
>
> > diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-=
pll.h
> > index d71c150ce83e4bb2fe78290c2d5570a90084246d..0e2b94b9cd4b56adceee3b0=
4e9ab24c2526471da 100644
> > --- a/drivers/clk/mediatek/clk-pll.h
> > +++ b/drivers/clk/mediatek/clk-pll.h
> > @@ -78,9 +78,9 @@ struct mtk_clk_pll {
> >       const struct mtk_pll_data *data;
> >   };
> >
>
> There's a forward declaration of struct device_node in this header: with =
this
> change, that becomes unused.
>
> Please change that to a forward declaration of struct device instead.
>
> While at it, I'd appreciate if you could either:
>   A. Remove the forward declaration for `struct clk_hw_onecell_data` and =
for
>      `struct clk_ops` (as both come from clk-provider.h - which this alre=
ady
>       includes);
>     ...or...
>   B. Remove the inclusion of clk-provider.h and keep the forward declarat=
ions.

Prefer (B) since no APIs from clk-provider.h are referenced in the header.
It is up to the implementation to directly include any and all headers it
needs.

ChenYu

> After which:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
> > -int mtk_clk_register_plls(struct device_node *node,
> > -                       const struct mtk_pll_data *plls, int num_plls,
> > -                       struct clk_hw_onecell_data *clk_data);
> > +int mtk_clk_register_plls(struct device *dev, const struct mtk_pll_dat=
a *plls,
> > +                       int num_plls, struct clk_hw_onecell_data *clk_d=
ata);
> > +
> >   void mtk_clk_unregister_plls(const struct mtk_pll_data *plls, int num=
_plls,
> >                            struct clk_hw_onecell_data *clk_data);
> >
> >
>
>
