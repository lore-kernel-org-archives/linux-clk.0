Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110BA34679C
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052815; cv=none; b=m/X0F0HBl11iObFQx0JMTeQ47L8pC0D/5go6RgNV0dKVB1P/vcAWwTH2kwmyAPyP76XZad5S18iDT/PUEENZ3pUzzPRfQpXNvPqr3D6+kquwva3Clq+WYOpW80xPgH5OfYH2/lazs8B+HZyA0smqx6srIpheFLfNb9bz8piPlgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052815; c=relaxed/simple;
	bh=Dbv+NvA54eQnU138bJCOz6IuOnEx2OSaA5K0SN9S/FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKIiUsgw4TeTM2QAuglAcMDOiNmPoiWX5qpD7NJkMB5umk0z8/noImJsl0R8w9HCQTB4iCGlwT5AeRqX69/v1AgAPlx/Dd4iVmA0PZesG3ZUbPGRfyD/fP4ObAFWieT6aE6VYcmxTtIKcE7Qmq/XKOgJhCRdq+2hCw7YRP0MIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559748bcf99so789142e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052813; x=1763657613;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbQvAYO3eNdTVb0fT9wjAGvduLlBPUoVXxd3qKsckAE=;
        b=LIfeUEjkT1+agKcP6eY+rTptpCIotP6p2h7jcN6tOLBXP9DB29MlrFCWeEwOWI4gZ/
         pkmycmyEh1/4mMJDXm8eY916bojvWJBIZlnY81lgsjkbGY2a3tvRrr/5W+0ZagPnf9V+
         uU0XoUarpV/k1q/7jJnbL5sixC/oROTSlIQnm20tcAV9SOW8MbMDcbqE+ZHqXLSHDWmp
         CIUuLWEs4vVBbJcu+ht6922BeM5j9XVr7LaC1NOQcs3a2/9yaFZF345WXS6Btv81YQkE
         RwZCIJktcA//EQPvuWXdkN2SEu0JgT4gGyDC0IvI03qCtqiJ8xJEZq538hyHw+55hk1l
         1RmA==
X-Forwarded-Encrypted: i=1; AJvYcCVmX9F/B8X1NcOXuOFggUx1RfhBInW5gtSSLmTyYuDucx5JGpgv9mRfkxIXWUsg+uTfYEXSe0fJgTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1v9ltakslkD0tdKKeSuy5LMI0DE5w+b2S8w1M9449VOUoUC7
	ymlqMRT1rmyldFNChfbWOwbwdwWXbN+p7dm67M/NtPRcIhY2Tz32DJU462GzqntgO2w=
X-Gm-Gg: ASbGncuyyjyWFzG7cI9SbcRSnBlcjdNXb3L5ohBOk6KYm7YetTG66KGxEkJBA8r3f9/
	eBMi3h+Bgk19druaj2+COW4tjNJ9sZMN0smX83yVwHz2m/+uqPSKvZOmzrtYxqU7RKxYewoWuSe
	A2GalbgBoMo5ojM7FgyL7CSBx9hG2fNWYiTgU7aouDZOQDfcvxRlPyCIfWR+V7taUy6hELXSgjy
	/mD01AVLFnmlrc3juN+mariak/a1TSV8BH9vUvlpC099bFLP+OLg0BACZVyWjw4dkdVwyvFN3J9
	fhNExsHPY7E5FvRSufAuBzgBNktUuwpSJ9YNYsPhmvBoI4Oqa6XY7ATrJLFIMcgaQ08VIhpTHGm
	aK5MrA1n5UnxFHcupsjDjMH1WjuX0cas6jb9LES1Wj9q9883wKBG0e0k0EUeVuwoLovEo90JlT5
	ChVHPnzS3Y94+9tcH3SP/zgNJQqcMJm7Z5cV91CA==
X-Google-Smtp-Source: AGHT+IFkSSs0Xu9wmzYwnG6gWYGXoo1GtD3dA74TIwVr0MLqmFl4GvAJNe+8BOpoVw/oQGnkfy3vmg==
X-Received: by 2002:a05:6122:4582:b0:549:f04a:6eb3 with SMTP id 71dfb90a1353d-55b1be64f5amr181937e0c.9.1763052812628;
        Thu, 13 Nov 2025 08:53:32 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f331034sm842395e0c.3.2025.11.13.08.53.31
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 08:53:31 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d967b67003so707759137.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 08:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNR4iX+1rM2jhhIvGIc9AXcbaF9CudivXy/FJY6lL+bckmPqYWFSfgoG9GucULlQkSWluxcHrciL0=@vger.kernel.org
X-Received: by 2002:a05:6102:2908:b0:5db:f5d1:5790 with SMTP id
 ada2fe7eead31-5dfc5587ea4mr226528137.13.1763052811529; Thu, 13 Nov 2025
 08:53:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251101050034.738807-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101050034.738807-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 17:53:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVo2DGVm0KMx10Heytif4aQTRU1OcXb-xSzLs5SP7Me+w@mail.gmail.com>
X-Gm-Features: AWmQ_bl5EDLinjz9IEQUBnCdqQ9y_TsmjBBKKZa6y0pw8az6LRSt_Iws6T3ZPNQ
Message-ID: <CAMuHMdVo2DGVm0KMx10Heytif4aQTRU1OcXb-xSzLs5SP7Me+w@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0
 core clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 06:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add definitions for USB3.0 core clocks in the R9A09G057 CPG DT bindings
> header file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by clock driver and DTS source files.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
