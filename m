Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A876A3EFFD0
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879562; cv=none; b=Jtl2mQ531eV5OGfao4ZkascZPfl37uDDYOGlkN7rbNwkhwP0D6L0xg5QiZ4snsMUBGze/IB84qxTFRdv7vRSNfc/AmPMEeXYH92HVSSe+57Grul3LcY3sab6+CQRBajqHpv+c3PR+K9XGzGoRk1IYZQ3QwGmBVTXoD5C+fsBhd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879562; c=relaxed/simple;
	bh=jLHyjOxl5RN+EeAG2bOgVdUtQ1t6XARnJM9A9fgyjQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SJ9IPXRx8O3pNf6+v5pJECta4C7W0kNJN1he5BzcEK91jBjhPbKNqJQfXtDtcQircEeqShI6ov8adFKoq06U2dvnBHXN9b0yFN2e9vyh5eYBHEFV/CKrwc4nEAsSbT06fVdvT6DNMc+0CXF4bhwtSMdbhhh42os+9TY7T6vIujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-57754ec3462so7752731e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 03:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779879558; x=1780484358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGrazzxeRDGIU/r1E+qrR5xkaxHzvbTfJG1/y7af1Ec=;
        b=WUsQb+ar6RnBB8hSsd2R1Kf6mFTxQHub1iE/yL1XwZKEsKUMr2LoQ0WKpZ5KJibDB9
         yQVMdNfm3XqZE+CTMrznhNRa8q6tuazjFnNwbiCZpeBrO+LFqpEp2l9rEfm+7W1Xbcj3
         Img2mQo1bS5om83snvm6ItXhzg4nbfYUvAwzCsRFi+m33RW5nKZNPX+qMa8e1ez91zAB
         LsiLHIYBx9USAbtRZW8S6JgqOQi92KdLJP0dbFagMcLCiPqcIdT1k7qPETp6xuUG30fs
         bTKQIyqtIUCKgniPFOsqK9LKQLK6sW2OPAeh0kg0rACoNC2iBCHrgp1eweB2r14n9ZiU
         BQDg==
X-Forwarded-Encrypted: i=1; AFNElJ8SLxdzvfn+qz47FbZJgexzc6YUAyYX9uEzg9tAWj8Kp70uK1dtycUDKwEyQoKbsMmE8ZlSn23LFAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVZF8FvnayvVzHm0IQT6IK+ecCIzMYu63cUBf8M77j7pUjNJx
	vQdQuqCKX/aeBf9fP5PSR+d6SMY9ED1CH5g6js6Xfv5v6jJPBpVQjE+uXk2fFXb2gDY=
X-Gm-Gg: Acq92OEi9j4SQGoJYmoBvKEYktYgRvgA5TU4v8y6frO/hbuFouhQzma96PtanlsqNnt
	b/94R+aTIdG/1Iy8hFCecdpWCc6nhEsjrixZY8efSCoTE/xrVRtL/1W7bOEczUuzyZVvE8lK3Jc
	cqR2qIRZYa9vpAQY03fdVv62vl3mxTVT9AosIDkbIJlcRA7xYQ+3DH3WYIG46HTo1oQUlOY29Ze
	2UHJ1ZkVl7W8IPaRb5l6EVz0wg8wLpQZZPE/gDslJoRNZegmTUzk3uMplrJU3t4mA15uZMqI9gz
	OkniauEvkNY6bTu1F/imFJdywsF+nK/ZP5mvnqKYpYdgUOkujyqkhhy0MQINnLL5Ny2zLR0aQVF
	CuXljZ9eQk4b8/dPbg9QWOeV/wwe0Xmz02W8s98ffChB84XsNofA9uF1In4HPg8kId+LAr2bRDE
	XqbAy0TuycRInxBvC54Zxd0h648mXu0OOwOvaUgXn8q7/jN81dd0bOrw8Dhr9HV9Fu
X-Received: by 2002:a05:6122:3a0f:b0:56f:8f5:b135 with SMTP id 71dfb90a1353d-58664038c9dmr11851413e0c.14.1779879557854;
        Wed, 27 May 2026 03:59:17 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961737bbf42sm16451254241.2.2026.05.27.03.59.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:59:17 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-57516bb40b9so8014965e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 03:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pcn4Q3r7oNGOTGbM7S2wyEdE8ayp9DP0J15vpQn1qCssfqf6zWnqv3CPzRJ3BN1P+cxloZ8n8mGI=@vger.kernel.org
X-Received: by 2002:a05:6102:3f4b:b0:631:9366:da8c with SMTP id
 ada2fe7eead31-67c898c33e4mr12526499137.14.1779879556821; Wed, 27 May 2026
 03:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524082657.19335-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260524082657.19335-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:59:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQCaiMV2Oqc05OB7EQg++0gj-cbGYjjdy8vM0uvO4qnQ@mail.gmail.com>
X-Gm-Features: AVHnY4LwFhicj5_5tir-adZ8YWCLaBs_fNGP50ccLA8lGaFPhJJtQHDMx2r0DRw
Message-ID: <CAMuHMdWQCaiMV2Oqc05OB7EQg++0gj-cbGYjjdy8vM0uvO4qnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g045-cpg: Drop unused pm_domain header file
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 May 2026 at 10:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The linux/pm_domain.h header is not used in this file. Remove it to keep
> the includes clean.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
