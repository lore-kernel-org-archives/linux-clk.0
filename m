Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDD38AC85
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235650; cv=none; b=MEH+jsoYQAPI9RA335R+0/XnAjl6IS2etOqNLWtNlzr5CVjK/UEZyVoerEGNpHVKVk/xZBSnkCTUeokyO92grMnZIEpex8sMu8TMnJQvx6a0SsEvqSOKGyjSBU+zkD8ae5CPDZli5NyUtCfngX9hDNL2+L/c6uy4zl9ooturKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235650; c=relaxed/simple;
	bh=vgfeiR53zUTqL9wCEjuNbQgZ56wPbSXK33ZlwgtxoP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stOA1yuVAwVRpoURCjMbLID/In64Fs+mqLmMYIqi+qDerqAdT1GwCIFeeMnMaL3NzDQiLOTgE1GESkml/8yV91vQ3afcSMqd5CYqJrcO8g9F4OJ31HqalFMjwh3V14GoIxYWn2MxVnNsRy4ZJWWeHZPmk4RO5GSADy62LbXAM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bbf01bcfb9so58645e0c.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235648; x=1782840448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Muh/OMSDZ663MN4xoOU6DnOJThUhytQ4BDNNdsQmXS0=;
        b=L0OQuFygvPz1UDR4o5gwII/mDGpt5m5RvoDT5gX5Z8QBaPCkNNEfJZFjh4m3MYAErH
         vUT6TM+ANhexctR/K6q+pPgDBcG0SsUJG267VCJheX+TKXUUJDniNWJCtUApnBZNH5tQ
         EUVeRZTNnVO2kMX8GocAQdhi6oNLPY2qLuOCZ4Lrva44irhwunOd4G679CRqMLHiDx71
         bSYbQ+SpOdulkbuujUqeE+TcIapHkfrxK3QZFjSUkhaAqZzBpTvgtaYdgpbGOszAGjP6
         S9KQk34SDLoaEkTHpah9FWWrPf765Uzih3fMn5i7V29rPvWQ3dNi8NWUxOJEaO+51Jqo
         7pPA==
X-Forwarded-Encrypted: i=1; AFNElJ/2k5tb9/CN+5gJ2EaOwVMUYDk2Jwa4w5eirwz5Fq0r5DHM92Um5OLWvmCbDShFVpsALkGMIPE7v18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyxfD9PrlCEvDry68BUc53CDC6v0eYkv2BnUMpgounNI+oMvOP
	3Dg4fU8Jhm0WVxdoFkRXLwyiwyKu1zbm9qICly3eWWy/+riE4nNxfK1T4BjT0X03
X-Gm-Gg: AfdE7clf3anWKpRdJ9UIc/iaLQuqj/AqbzhypkKOFQEUz04yMvew251GSwrau+zxlST
	doPiCvNe3+Amfs2GYcXMrQOo9zidAy+umm2qan1uk01snacz6tvEgxVXEt5bd63HDgagCmG1VhM
	iHZPQkMp8ATJdsuODRa5Pmgu+htzX99kWUPmW8Dt/FZD26kqFmIRscAeoqNkOCvi2YaREktSOyM
	m4aKpUXadDc4XsHW1HHEpzcbseW+ZDvkPdxexPDic5/1DvzxmgvFYV593HDlucdFeRyOgnVheeX
	3kOyzdvIDEKhR2PkbHWs2XhIUca3JuPVRkmhVQPKqvrJVUYzYc5J6WUIjxRfkfVPomge7RVAZOY
	afVoj9ZSA9kjtltXFthQx0kt0v6DPUsLHT5vesKXmVQnABsv3tsOVzU6KbrUza8H2FrR+Nuxmfo
	dDmJG8nAHkp9/e05Hb/sv4oLPks534f4frOTSVAO+TxHEs8E+BzA==
X-Received: by 2002:a05:6122:922:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5bbebbcf5f0mr11667738e0c.4.1782235647727;
        Tue, 23 Jun 2026 10:27:27 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfbab451bsm9134705e0c.18.2026.06.23.10.27.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:27:27 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7269038ad05so95010137.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 10:27:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9g27F6fRLtC656GICqozV67QzhrzlOg2xA15K672+RNwPktA+SAvuUocIRObKFQHyS2tSOW4zduQM=@vger.kernel.org
X-Received: by 2002:a05:6102:dcd:b0:6c5:d55d:c091 with SMTP id
 ada2fe7eead31-72a1f0afecdmr13056221137.14.1782235646896; Tue, 23 Jun 2026
 10:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2026 19:27:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjvjckPSBtqvWy_WHZZL08KeNo1xeL7jaTG+5rKyWiTQ@mail.gmail.com>
X-Gm-Features: AVVi8CettBHPDtUTsCGKpp8vAn8Psn3jekUVojmzhnZ0gc3_U3cHxNpDSHwB5q0
Message-ID: <CAMuHMdVjvjckPSBtqvWy_WHZZL08KeNo1xeL7jaTG+5rKyWiTQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
To: Biju <biju.das.au@gmail.com>
Cc: Alex Helms <alexander.helms.jy@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Brian Masney <bmasney@redhat.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jun 2026 at 18:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
