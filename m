Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B06225D6
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505210; cv=none; b=k2QUvHWkWLWoi8TqflpGTm4UDz4glYmDlgbdoah24gfxh7nC8eUTuqsHXUPUOuo5Ud5gaDtQ0F0cNayRPBkm6SCCba+EEpvIuKRxWDwpYXh1BNJWxi1BDa+3sqGMDRyRIBrxavPQZ1jnQfIyXvYd0utSCVj374kKpwYD8yLHBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505210; c=relaxed/simple;
	bh=+Po0YDozkgmLf/sDK4Y8DM/Qe04V4LbnESG5YNdAjxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTuoXE1bxLbaoyDSgpKSTnfFPfKEclM7dB10ZX2lOWSkgVOHA9O5A2sNObBJGodU+o6QMYGlRZgBcl3xnLic4/x27zYPGi0NR9iV8j67L12/GdFw8jLZPiSdJTtVN9oQhne5ItjXvRZeNp5q6HmiS3QLlNSLHQKO16kcF3lHq64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5599688d06dso142016e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505208; x=1763110008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rMtkd2FvKVGnCA2BS10Veme/f3vf2jyvZt81k2mdhBU=;
        b=fo+vvKcTban7dCUAJXpibr47pFwoLeEmPTL87IjLqwD6DMqERCIs/nyDv5rfm/OzEo
         85F8V9LZIUMiItsqCBda8c8IT4LNOxoSmjCZQMt3yGlXMz9EvUnuELPPbcTqKvz+TZrJ
         PP6/+scKeTEDLuYhXSUm29dQRNhK6899Hf+NL8oii/ELivCiFjG0ADinCmoZcR+R6f74
         R6pcMV+B7WJA0IkouBrrolznnQHdelZSXELx54S2/2u1niwW1Rsy4mtwBVQZj4m0uXK1
         KX7S8DPaTiF3Fv2jU7RV60Q7EEYTLOi91eg7mG5CJ+RKGGVi0vn9hnN/lztujSQ2gq4X
         0HqA==
X-Forwarded-Encrypted: i=1; AJvYcCUToct/u/ieXXRjlOX5sJvxg9UN6FLP2NnqDmajHGY0vV0JdXtWmj1Y+T/EPYB7nsFWXWqU8sUW51c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6bcO4T4eKj6FcIdE/6750lptex7oA9kBEnftJM0Y0q0Gil9q+
	/Jw2CTMsN+7nSpULmhbqHOnQtIwwIBdmjWspXv6eM1lVoOJtoDRXgRqyv0LQmtfuhOU=
X-Gm-Gg: ASbGncvRFSQS625t0KitDebAtAKa5a4j4AXtIa2VDDDeEtL+7MdaVUcs8w5+07Y4AMW
	Edj/OhkYwKBKroj0yuU17DaNI2TEVuQP3hC8MmY6YuKfcI2GKPkt4X3C1vGN4OhvgkfMFWuCjcT
	2XSQVMmF206GKXMTTjOr8gYcfeLEfnCQhe23xOV7IOdNyyU+cOYK4YLk0JiL2eJBYA/oKywwDq1
	dwxRZFpJZS5r2Jy3NJZ4pXy1YMBFyocuIrnyTu5Nb3MRx2lmKLleLybMH33xGQ8XPXfLnkmV29p
	MwoFxNYISG9Aj/Q6UUUbJMg98U5ADsJNuPtzGIKuRPumgIhwxKdvepNFolFghCSzd+f9WWZInCM
	VqlFjzqISsuRA7CK5YHe+x29zTtq54H7BKImtCH8hyYwCqmpkXmp6e98fQW5A4eJ64wu2OKSA2K
	TJX427JOjsfolYpr78MqG7jUiyMFGdX45Zn503Vg==
X-Google-Smtp-Source: AGHT+IEJ3lBLveMcQbDiV1/0oz/YjubROvFVQQRbTKvTwQMJWeTPltdVK3+mzXOSLLKsC3r5ouwfpA==
X-Received: by 2002:a05:6122:a21:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-559a3be2a0dmr931487e0c.13.1762505207900;
        Fri, 07 Nov 2025 00:46:47 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55995694597sm2604696e0c.7.2025.11.07.00.46.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:46:47 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dd9bfba5bbso164774137.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsXsL+/vt//N6BhW/xSZ+V+3eP3UgZiKaYcl6uDZAJIX/QqWGDPUvRIyCsAaKopU5XnzaM5FW+eJ8=@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5d7:c6c1:8510 with SMTP id
 ada2fe7eead31-5ddb225654fmr655685137.27.1762505207057; Fri, 07 Nov 2025
 00:46:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:46:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSdXy-Xw5+mG7YAGWQAqx-kSELkKVeiscj0H9pV8a3qw@mail.gmail.com>
X-Gm-Features: AWmQ_bn0v8yL5BXNbSnZRFWTp7_mCQfJIdZYA3WvNK0EfH1127ZUHgsG4Dr3bzk
Message-ID: <CAMuHMdUSdXy-Xw5+mG7YAGWQAqx-kSELkKVeiscj0H9pV8a3qw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: r8a779a0: Add ZG Core clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the ZG Core clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - Change sort order of new entry in enum clk_ids.
> - Rework the clock to use CLK_TYPE_GEN4_Z.
> - Split addition of clock id to r8a779a0-cpg-mssr.h into separate patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
