Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598F1321456
	for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416560; cv=none; b=cCOclM1y4EkVg0AS8RIaH+1lEF8ofbGt2ARaFv3CP1iw8o/PjCHYGUzzd6gsZcKbVy+K0+BMqeAl0tKl3bUad4jO+xet1KNp9NnsTw8rthaBKAajg92RlflLGZluXqvDdvv7q6REh4whQL7irVIBwZb5m/yPdFieQwofvLA2JFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416560; c=relaxed/simple;
	bh=O8pZL4NMYK531cx9bv8WY7RNqg2T78nYqG16ntxwKiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3oFvdLVtUwHTFX5w1l96ZrGJC5+YOADRyhLYhkJ2fuA55Nyq6Yz8lw103DwmzP+mlrrRJOTSuzkaQmazNyzjVsbaAkvgF0cu1wsLGiVi8AYJMP6m2YDo1fGIR68mKO/GSGDnqZzHw+6RbiJMHkkXEWCstvgAJWYtTQutmGrxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55ae07cf627so1068087e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 07:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416557; x=1767021357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlhlbeiUd/10GzJ3WP3xjFNu241CxnEqVnyuXsgKZIQ=;
        b=fRglYegMJPcjpkkelj+F3RAggL91C2+EiYoF9jgcEHBGgdTAnpMHraK8jmH5BYw+vz
         6UcMfjq6K8ShVbKSXv1KHNvq/F3sS3HkcRLwrXK5YlJ3iCvB7Of+j59yM8iTTvlqX0J7
         5yCet8NOrVZj1qGLWAIH+TDDVqq86oHPin/EaTdo7eVx2JdL5huhBjinuqHe9oLDv12p
         oiGx16uMz+BNvwC7Hd3aDvIfcPQzdbcfmPrHffQelrB1zfWxH8ySth2CaXjOxmwbiBaK
         5UY79t+UvEnn82r0a5Vwk1xnXOB5j3gMCVeZMv7CQwz7StllQmWPIgLivLxYHbKYpaNw
         I45w==
X-Forwarded-Encrypted: i=1; AJvYcCX1X412ocUdu95dKVptYatqz/83l2F/m3a2VhRGIB+zIAiOLVEwNfTF1zGyjemCj6c2rhO7NXlA6DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZXec0WCI68rQVMDIUeC4UZQpiJWI2EEEXKVRq9Qnn28Vwfcvm
	kFjznH0aCmMmeNRB/UgrM4B8bk64FdJW5zl5MP4a5Dm2g1NtgmefO2rkndES9FGB
X-Gm-Gg: AY/fxX5/eA4llOpIJHcZY1TShe5I2k7S6jXVXK8WiZi6k/S55IwRMLKLKcIZ5BrNTOq
	AfkkedUIK/dqgdkgZY9W+YUOZ/D/hBy6dhH04ado9RBffRgckzoTPp4z5qL3eKerm8W5cJeqrXZ
	x9YDySM2ZyiPktsG/q1w7FgcxhL3UZMcEjWA47/9JQ0E7q/3yBUnvhyZwrIqT6OL2hw4zpTnZ1/
	HWUSpzCFTmd8nh0e/neaql0z5cD7VAQL0it1hzNnk5/BmQg+q7UqsWw+jsSYpuL61t7jDj8l9D9
	2Ybc0RWGGJeh7eAb4rJ1Vr4TgRy7WPWQQhcB4JG5z9ZxIpukaLJ4LkyKebCy3oF3Int5ZEtp/Wg
	bqrH8Vx9jnlFM76tWgD9fvhuuthak32LqnT3D2cvJYqy3PEk2Aji1nY8Dbk+CK/ANpIQ/3+9jJY
	+bIOWkGr2PenWaGezdEr2VzBrmAiIGkhRhCkIcSym0DOkzvBXWIbeV
X-Google-Smtp-Source: AGHT+IHZRa2Fqv2ZOwJSKRmfjjyS9JYpNGEvIb6tI4GPMyg8m/uXZTeaRjnadg75WpXREv6Oekl6+w==
X-Received: by 2002:a05:6122:4019:b0:557:c467:7994 with SMTP id 71dfb90a1353d-5615bce6afdmr2879807e0c.2.1766416556842;
        Mon, 22 Dec 2025 07:15:56 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94341681906sm3035803241.6.2025.12.22.07.15.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 07:15:56 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5599688d574so1076371e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Dec 2025 07:15:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0bxnk2u8v+0IYL/puT2y8zyPHeyAT+d1aeLNKJ89gNjavMg+ekx45va/nZWthiw/nweH4veV1xfc=@vger.kernel.org
X-Received: by 2002:a05:6122:919:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-5615bd39a1cmr3491501e0c.6.1766416554473; Mon, 22 Dec 2025
 07:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203094147.6429-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251203094147.6429-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251203094147.6429-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 16:15:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgLRdA5j=u5xopiCyd8vYx88yezAU5wd9u75PZWiZaiQ@mail.gmail.com>
X-Gm-Features: AQt7F2r38PXbh8micxeszgW106FS1E00O11X8Kf-sb9w1K_riyWGDkyvjsedcb0
Message-ID: <CAMuHMdXgLRdA5j=u5xopiCyd8vYx88yezAU5wd9u75PZWiZaiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add entries for RSCIs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Dec 2025 at 10:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for the RSCI IPs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
