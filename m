Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3261A9FB7
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 00:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791764537; cv=pass; b=VfkwhO8AIZsPM8gfFXtrCOB54Cc3aXVfJnNHRZuzboKkwvSJXMPNY14TKqzQQVDxveMPEi3iyHdtI9kyTb/X/stH1FicZuSvKJdjsmVbeQJ3+QW5fffMrdFFArf5h158T7tJsjPKtu61KJuQ40fSg9ckj1D+wMZQlbyPjmYcfbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791764537; c=relaxed/simple;
	bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRdfABlqBnA+QnT7/D63WhITQayy2BlepGiI5ZS//1zCt5Q7cwixmTB3SJWK3hs+Es6cgiplKSXtDnPRwkxl7Fa02+CTqhpKPlJO0pKiHUagiDOAKcdPUFzEmOTqAr6G+Yi2SAvLEPcRRJ2hPxfKPn9yARiO6aI3la19lRdLPis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWQMGmPP; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWQMGmPP"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48ed0b68895so908432fac.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Oct 2026 17:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791764535; cv=none;
        d=google.com; s=arc-20260327;
        b=XMU8NEQPRqiCkFj6KujAiQeCJZR6i0MBJPG6y42B7haPWos1rCbcsPg4E03Elh67Qf
         h3nAjflOb5vR4XH7v3wZG2WNhp14Wxptmqa0dFqsKL0Ki+OxFLN6tm9YzROKz64NFTjF
         LuJbcdJ8y9EevEIFtfyl00aEUqX9keyAYJ5apYAS4SZUzKxYqtWZ/+b3CGxhzH07bKwW
         v9HQtYgA66I66HhYxhUiiHij5K/Pw0X0bvcwsWTo/OXCmx882lL4o8f2CeDiAaBA51HF
         pFMWuIUcO6t36sDrASK2aZz8SB777NFf59tI4kKFpw103BFVV1fVcd0T3nKaTNIMx0nZ
         NIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        fh=W9Pgzz4XFBjpmVQurL+9ZtAsAmd8geGeLhenrCaQ8/I=;
        b=a9zdhhrZAMJK8skzP5wwZyr1UvWhi70niezjo1d2jFxDW5ZhfFKAemC30QwhMKcH6x
         DqbndtgCXwjpW4BNCzmmJ4CN5ujIHJrk0LTFNH6c543IBDRNmSGxlb9Jm43qFWIDi2+z
         vMw3hVXb0F9AbMFBSoBLAjoBSFin/pSDapp4SlYieOqUGmHeBTuIahY3yzl8niVa8g6s
         ZQViFibYaJC4sATC2yYKeUYV20jyNXmGXqVVU4w/8UOAxrKBTDRofQUXLeBOnrbUSm7B
         V4uRu/zA//hLdurXdHXvht5cW9+/0Rk2nr14nUvE1khiN+tmeJQ0Ot3nj6AIT81kqNlq
         zhxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791764535; x=1792369335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        b=DWQMGmPP41YpckfCmNzbj2dc4kzFvxEd/CD+AH0bUt9W6lIf6fnkZ9PoVspLNpYcMG
         k4Ug7DS056vqK5/jEIZjyxDoXQlBFSl4Iek3xqfkDJIXGMi5ezqLAFsFgVBBHrXG5eur
         rkd/HMUz886WJLQ62ZplZA2B6pAAfOoGdzaf6o4Xp02ZgQkyb6vCQQWlCLGy0zxxxAnH
         t0UEpGqBH3wQBY/lbEkuSiIYz//6HgGxRQ1hCilavWT7mkf50z6QNFeSd+TGcqNolz2d
         3zOXXgbbFvZp/BKN6zUkgd/8gAsVCOvs2HLUhCLTg2yzi4aNVoS/E65u8GAg/JDuFXim
         kuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791764535; x=1792369335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        b=2XkZooMT54xEWkFeucv4sYjWtBkxEu64wZvZpRhSFQ1bzkN75SEQ/7JFaprUikFmg1
         YIuX5HFeatcCnG51qeSbOVsGseN+hq1gsfJNd2SvYam4pG+0SuNydZFdiSz9GrDbjpy4
         lXaOAcaf6oUHBy+zzY7QqwBHPVmgiJs/sHRhpWyDcgxHe5tPC85gjiAO+6rLfRZfUbQe
         7xlwO7NeVVfxpSQ+ZVacO1cDP9/ALzv7OMoYtum0XGl2BUwnTaQkWY+dJHeIx21jUtJ8
         MTWbYjUcaH5/SILwuEnVUMGwoykeZ5pPQ2Uk4sbbG3z65w02fxG8XD8aLJE6sR/M1p42
         apbA==
X-Forwarded-Encrypted: i=1; AKwUvBx9rSAylDkr7hG2wDSWtqzFDwCfz+6XbY72FnfJ7WmsbuzN+bYlQTe+R95Fl7JjMcmIds48g4S+f58=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJb4Tn/fc6vj1pD8X6z8L6kC8DpIQQopbDfNx+Js0GZgW66Upt
	6OWPh3NLP229QYKRYAkNPSfb5mZtpSI9y/5yEEwgYCtsVnPHsKH1oYZsmIjzwHP8Y6OBmPj++Lk
	5x4XjrivndHziQ3PUcVjhyrpoU/G0BVM=
X-Gm-Gg: AYBFou0tm1mMwy1rHqLBdd9t4JrmEfPS0+UPe/qXZp7/T3mEls1yuRoXjcWAiQKZz0n
	6NRQ7PhmR2avVidICCS+e7NcEIaH4a1oSxY+ZURXP5tb1Ws81cKvx5xwSv+e7Ip4EnEj2+ayP+S
	40IUg3wHj7X+Cyl6Pwd8BZUn7IIC4eSycQd60BYUzQlc2s80ki3Atrw7rGD3MzNv1+7lfX9tT6v
	OwCTeIKDdJF4SnTOxspo6dL7ciGE77S7zKl0MDQEQWqQxeTDsTrBabhv4T6arp63kJ5ZKXt2CfV
	x15L28Wp/HZkpJGvjDXREX/WKJVm5CKOcMm85DOgIfeFPr9wy2OHF60=
X-Received: by 2002:a05:6870:810d:b0:485:d1ab:793b with SMTP id
 586e51a60fabf-4a2a8865dfdmr6554627fac.28.1791764534961; Sun, 11 Oct 2026
 17:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com> <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 19:22:03 -0500
X-Gm-Features: AclHuK9MkudB1B-eUbBN_UM98-qj6k_wTx4wpH_rFnm3lLlunJHjpC-2zIymSsM
Message-ID: <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 10:06=E2=80=AFAM Anup Patel <anup.patel@oss.qualcom=
m.com> wrote:
>
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
> Some mailbox controllers can complete a transaction entirely within
> the calling context, without going through the queued TX state
> machine or a TX-done interrupt. Add a synchronous send path so their
> clients can request one and wait for the result directly.
>
> Controllers advertise support via the new send_data_sync() op and
> clients opt in by setting tx_sync when requesting the channel.
>
> Channels bound this way must not call mbox_chan_txdone() or
> mbox_client_txdone(), and mbox_send_message() and mbox_flush() now
> reject them, since only mbox_send_message_sync() is a valid
> transmit path. The client remains responsible for serializing calls
> to mbox_send_message_sync() against mbox_free_channel().
>
Seems like you want to use mbox_client.tx_block.

Regards,
Jassi
