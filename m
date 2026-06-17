Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493AC3905FD
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700995; cv=none; b=Kd0j0jGUwIH+D528MwwCiaQMpXrp1pI56kHM2TPomX1SNTElt6fPKndEHGxdu7wzMMKRivAsz9IY1QJsvKePJPv8IZG40gYWqSJNxtB7WGvf+7dhJu40MjP4JvNZQhB7q4Hqmrzop2x41TfQkGJyZ0DezVD208Vj8tWJ6DFhVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700995; c=relaxed/simple;
	bh=PL5/8llaxXKp1ZYIbyg6dYocdzD5Zpdtpj1ZDkD1n3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+NSku8rsMR1g4JTOU1QbiOo91WHUi1QKCWOX9grmGm3qb4oDYtSw4STxoSk78THTE6WnQ8beHTW7JfxmErRZBMCVNWAPQM1UMvbtl3Cos6xIHGY6LdYgmolfb0R8PCE7LKJmem5jkbgKMuZX79LwBICrGXvrjjcDpX5XZxa8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso3961223241.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700991; x=1782305791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yHUoF18qh7x/sHtaF9wChZK+CqOBTzk9s/hEXD/IK8=;
        b=d4anMoAVFRSTp8R3Ej3w5mBQ/tb3T9HD8sIuNe9lZ2NEk36p7U5XTQ/3ABOCnEjA//
         FzaEYwqrKxy+BGRn5UIzOtbLknEA/DzK3wkdccUqec/P8/4sei+5Y76JZxNzCZ5ntxys
         Y1rL+Et2bn+tiSF9pu9qa1DeylvDPHr5NjlbFIpRPkZSgii1O67z7SAiSDtw2+4wBQxL
         3a1h+NyLWjdjSW4by13sxoAqRc6oOY1VLS+y6dlQMqxM6cxTrdAH9Q6bSEFWW0sQUTan
         TAPirC2aOhR4K0rRztsYXuDl9GfAsdgwYf/ryEBjc9FzgswztxANpXUUtzUveY1wzL0a
         MlGA==
X-Forwarded-Encrypted: i=1; AFNElJ9b3/dUGc+RMQlqX9IAqmZQgT4uOAK3emsQyH5ti/JyqFtWICAbBby81Ik3ixXtmxq7uFYWhrzuMwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdSnQKkp3nvDi1WAJ6qXY0LM2ag0NVrQOvhQvSttbmzNNX3DJ7
	vrTFDFB6Bzlyj6tQJo3hiXh9A/uCBy49yY/bu9LmchUiFy+UGHEeJ1/1toBN0erO
X-Gm-Gg: AfdE7clRnCp0SA9KElUbwhKIdmm3DZ6rKwOEPcXbuZpr/M+QdHi9K3jpJrHfd/p+5D1
	I84VSQXT39sQvmhulHEzlfvoGij6Tkh41U96EStFuQNjsIfRrQzsYZKzvsU5l6myCqbB/k6rfrl
	R9youz8hqnX6uUfbdXdLi2BEi9oJ4ulkSgRKnPT/KSOn70ZtiZuum/hhE4ctbH1QR0uG4jLXEee
	gNS2ADH1bnq+k7aZ4SDvDMMsQndRavkS2jeJ3EruYsPc0QZikC74G9MbQ3gaEL76zxLHK5VRLWU
	b07LAmONyACWjZ7dIaCvYmGIm0wc+jLv6s8/uVaZyivPjeKdoccd3VBxaFXshYPshi90ao9lKy7
	OvaHzxDJMiCd/WlVmBZYOR+eyM8oX1FEm2MBc4NgvCUd9lvRq89MpYgZePSreCeuCllmVsL96XR
	oUCjv6ZeelCrykY0tRD3gfl24sZCGqQhoR1uemS3sgafsMy+rLZA==
X-Received: by 2002:a05:6102:3f0b:b0:6cc:16d2:30f6 with SMTP id ada2fe7eead31-7245da96ad6mr2007590137.7.1781700990937;
        Wed, 17 Jun 2026 05:56:30 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-720847c1525sm6937911137.1.2026.06.17.05.56.29
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:56:30 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-966c991e6b1so800367241.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9/RpL9xrhFOOn6RTAIisnpM53rYKWNmdF4cxegGWlnaGvJOnge73myLMzzHYTJhUiqZpHIepHdqTs=@vger.kernel.org
X-Received: by 2002:a05:6102:290b:b0:631:2a82:111f with SMTP id
 ada2fe7eead31-7246c9990f8mr1845428137.17.1781700989579; Wed, 17 Jun 2026
 05:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com> <20260604151855.307772-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260604151855.307772-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 14:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW07FsPEJA3+3cvmruO0OvOU9+CnTDK5_xCL1z_P6y59Q@mail.gmail.com>
X-Gm-Features: AVVi8CeeeCpMRB5a4gVFOmJfA8zq-2oigbmQ1zerFZYaRtkwkPoVdp4z3phpJVg
Message-ID: <CAMuHMdW07FsPEJA3+3cvmruO0OvOU9+CnTDK5_xCL1z_P6y59Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries
 for GE3D
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 17:25, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for GE3D.
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
