Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B431691A
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285737; cv=none; b=TzCgsFNGiYbx/aELypjSltQQ7BKptk+tMCkyfEnVbSs+o7KhW+VVVfXkpE7X5cKqCPZUPhkZ68sPelaehDhR3CaVorMKM+KLmUIMIZsQPhgYaHrJO3VcsNblL9mZBSBOijuDFU3r6qK5oCRHD0tja1PZ1llg+Y/ASSEL064rD58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285737; c=relaxed/simple;
	bh=49Xtuu1beNUg9QlwNiHN6EBbAr4oftfRASjMhDj6J/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7b3jnVe048qPSIiAGNs/uN/4W6RW3AdkZd+eeiRdQ4FBghCoIQ/W/bLyKSk6gSY1E4wKctyzFPZR6fvsBbQeQ+NyIXn2Zm7FFCPlIqjDgPmsVGA1UfiQ+P0j4sdKasLFlq0h3Sx4btYCo75cRsnNbXEF2bkpvsqVWUbwS0z6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtrD6kXt; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtrD6kXt"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38301bf7864so53465581fa.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 22:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768285734; x=1768890534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiUmV1eprmnhg37r9cMuLPaBFu+xlgYzvvvG7aZcdkk=;
        b=QtrD6kXtgDPukrxP/rH1IgFE5ZR8VwmNR4vA6G7gppucdNYoxYVIHf6rDmVi59m7B8
         qhrqcuXP1/2Tc9jr/Ihp9T94WyllHVUj92E0xJZ8Mx3oqsZePHHeepmURRFmKvAME2gQ
         1vVP6RXFt+cg2BBSAmH+9pLBs9p0uLVfX+BdZueiWkWb2ZUa0jwdMkdHXoh3uom9sH87
         FCitru2fghHG7tAB0OHlslGsZHW+nhIbgzz8S15+takbiYy0kynnHmT9twdY8mB3J9gE
         iLXImB9ySbP6Q9is9UuqlwiPV9A8sJ67UO6pk8JcVNHbsvZ3rUjgUEZ+aocWZI4oD16U
         IeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285734; x=1768890534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JiUmV1eprmnhg37r9cMuLPaBFu+xlgYzvvvG7aZcdkk=;
        b=obng43MCTDuBCMm5q3EXZ0tlSimv1EzniDX1bseSPuIcqIbLqAWdnXpf5sAcmN8V6J
         hZoDyhVej5Pg4vnIqb7r66nWchmJq10GQMrKYPNeVqrGd2cfj/wmhhWlPhgvyXt/JPOq
         LlICuDqWByg1Ics5iO9RlxVvgi2aFtkOiEW8FFdGHMkCLDX871K0TJYtBFxR/Wci01wS
         fVjAJc5przjs3JWvVtFmNhf7WfscBeiHghxwBi2pBK6o7TJg7tpt2drJxxB0Va3ZV8RO
         JHoNiyN4pptwa1197ep6FtvX4lvGWxB10sUagyJWA2VEpGHM+SlGXOR9LWkOCIc6LtqL
         3T9w==
X-Forwarded-Encrypted: i=1; AJvYcCW1Rzda8SfnUHJwfLU8KBpokKdubnuzFVqHsrSr68oATxczw8WsKFZL4nTWUV/2V/LTw4+g7uvH4ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEGooVf4pPkbW/xYrtcQMmXhUWgV/6FwoJv+TdHi+Hushxn2nr
	2bQsV+Spzob7LIa3ahMmBBMm+36GHJratGnrhqHlPpmAeiTKZMpNmy7m8BU+dbLA7+ECWiBx48P
	+MhkhDsAfYdlhKm41rBVEB6YNAoWnYms=
X-Gm-Gg: AY/fxX6lRWdttW/Wrf7r333rWCiLe6POMCm895G2aqWo8w8AXdE9AupX4PQE+NgfYvQ
	ffbxalyizbw8hV8Th4WTJ1/EaJMBhez5B9tuf7T4Gx8zf8jP13em7sUaT8wVNC28GmxVWUrhIaC
	2kkN4RDLzgXQBfIH5MTkpWrU00VukX9uPpjRhhFKP3lN+TDTSDviY/KJxhLnu7WCBfT4xngPWtw
	Qt5BYcEKc0Qi5XOYiTxECJgoGmxALNb7NDEChKqT50928T4FiWw82T+rNSvY1vKos759biq+WCD
	ZgmApAruuWCYb7Kz8GhXFa1hjb4d62XW7W4G1QMN93PjoG50TTXDVuDA8UBqNwlgCQiu
X-Received: by 2002:a05:651c:31d2:b0:382:fccd:f99b with SMTP id
 38308e7fff4ca-38350c03886mr5317011fa.15.1768285734277; Mon, 12 Jan 2026
 22:28:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com> <20260108-clk-divider-round-rate-v1-9-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-9-535a3ed73bf3@redhat.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 13 Jan 2026 14:28:17 +0800
X-Gm-Features: AZwV_QjXA3_FExPm1PeZJleY4KCWVtWfl5lLiACQHtAnheJostrobrRWjaNB7bU
Message-ID: <CAJhJPsXG_UKnVk7RypkKuM8M87+1DNvJND1PRxoPVzAm=P2Rbg@mail.gmail.com>
Subject: Re: [PATCH 09/27] clk: loongson1: convert from divider_round_rate()
 to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Fri, Jan 9, 2026 at 5:17=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
>
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
>
>     req->rate =3D divider_round_rate(...)
>
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
>
> Fixes: bb40a2ef4fc9 ("clk: loongson1: convert from round_rate() to determ=
ine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> ---
> To: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/clk/clk-loongson1.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/clk/clk-loongson1.c b/drivers/clk/clk-loongson1.c
> index f9f060d08a5fae3291a9408c6dc93531b435609f..1674181a1107dc4f30e78ee41=
0a55a49b6d0b4b5 100644
> --- a/drivers/clk/clk-loongson1.c
> +++ b/drivers/clk/clk-loongson1.c
> @@ -99,10 +99,7 @@ static int ls1x_divider_determine_rate(struct clk_hw *=
hw,
>         struct ls1x_clk *ls1x_clk =3D to_ls1x_clk(hw);
>         const struct ls1x_clk_div_data *d =3D ls1x_clk->data;
>
> -       req->rate =3D divider_round_rate(hw, req->rate, &req->best_parent=
_rate,
> -                                      d->table, d->width, d->flags);
> -
> -       return 0;
> +       return divider_determine_rate(hw, req, d->table, d->width, d->fla=
gs);
>  }
>
>  static int ls1x_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>
> --
> 2.52.0
>


--=20
Best regards,

Keguang Zhang
