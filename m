Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67181DA60D
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439352; cv=none; b=WCtm+eIEDQD0iE357POQamPlPkMjcn/Nez0qKMXKqfBIDIWbwOXydD5BQkGw+FSdnKQ/sHDLMD88vp25XVpuxR5xRuOTWNzN+QL/WGIKQJUll4JCUnJqnmDsOFOjR1zFH5WX40kF2c4VhLIopMvfABr5/arj/o7+qEo2Iz8WwW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439352; c=relaxed/simple;
	bh=NdOeY7lnDOPuK6VEus4jY0bG+2eiDkIJXg9ctj3EdoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sj8ZGy8mWAQE/JFjsl3lPBSWLOglYGrt7NPFcnJzljTfuot5W199RtXd2REwSXMrlD1nBdiKDNO4yO/YNuhFeMi/anGQ1s+lO2gCaGUcoIAfTEoZN3h0PoZi18VF5nBwXMgo2i1GO32ggSSlLOeLI7pYVfBL4rBJNf4QkxUVDhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so1550944a12.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 06:29:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762439347; x=1763044147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3Qbwr2Y/2kUNO17tUXtWv3yos6fo6dQ6sGg+S6eon0=;
        b=VKX610E+/5We9EVMELhKndIkiMW4kwwp+v+wP5I4pywPtVex4eohsp711DvSx9UMPG
         Ohamx89Q91mClWmD9sAnJKBK1rURTnic6SNvgVk/yB/wQyBUUIQQz5KSdlMDNgTu//xc
         nrWjt2Kv2YuHZvJPhi1v80YQvhsCEiEpRIZNjs5yXUKAEhSFkDZCD8j356HjEblB4B/Q
         aYp9ui4dWvNprQSaE2nI7ZEmkpqAVxMqLDTASUIkwlw15I1pO98CTJDeoCckl3hYmk1q
         aQDPcVbI9NSIMipcVMihfv+pV77fQ+3Ld5pmarrCQ6LfBFUMFaPp6+ZcVMnqI9WJqsk6
         mPzw==
X-Forwarded-Encrypted: i=1; AJvYcCVxGHrR/NzZO0Dyu8vDB7SPkYJjrsJADPZLDCOzDDwN2KbII0vaDz7KnslUPEGh94tUtBQI1OdwsvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5+zhrRoRUm+a96x6qHtGgwsyuj2elQh3Plz355Dv/auV6kwFn
	Fiv2Y0qxLInE0zfIdEAD+0Dq95t0IS5SgMuePtNgD+MO1fBGznlHZhatpTI2qvqr2F0=
X-Gm-Gg: ASbGncvIfMkjojoWAqeYqiOlb3Moj96NuJL0UC/ogrp3r2qeJzgSHXwVB7tdnoMnAyw
	TrrhVbweNQqMnCTbmls5UtpiHLw9DbWJQYZ9L9PYUfwCvd43GtaB2QxHiHOk70rL84m3QCfcBMd
	bSBhjjepRpA1+MNF4rg18Qb+Uf2tCuIc8x+sluDFHYMUBrBcsWuUdai0Pnq/YbIs0FheoVVxDQi
	j89G6g0N6BOt/zzZZR0MtwVgKLyrDNlqmbcFk1QqVozcqfD/klhAJyAw6r96rZ2AbKb11G68p/d
	a78aRTKbccXZmovP6FojEmRRBEx6PyMhxIaEXtQ/FpPCjpzwqlxJ94PpR1f7PqFfIWZiCvgydbW
	KPk5TNnWT2XDZx5tS59ikYwoSzhJE3axtQWJtQC/g7qEPJM7FKDRs7ab/62LWrIcGIeEQ46kcwB
	MoOI5cGPE+T0BzpVb4bgwFarXB8ss9UPhP24MSFg==
X-Google-Smtp-Source: AGHT+IGIggH/yaiwpGZDYqTKB7m9nhz19eoaK5HTHR6d9vDwHwfEasp7UXeqvf383VMacI7k87ctvw==
X-Received: by 2002:a05:6402:13cb:b0:640:7690:997e with SMTP id 4fb4d7f45d1cf-6410589b532mr7807665a12.3.1762439347001;
        Thu, 06 Nov 2025 06:29:07 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f86e0cesm1972497a12.33.2025.11.06.06.29.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:29:05 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so1550846a12.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 06:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUARHKP9rL2Y7+D+X6PcNBml0xRmeL4vS/DGWYCYD9BYrfn2fxYyKCCiXfpvNbN9rVhe64gCdR9xTc=@vger.kernel.org
X-Received: by 2002:a05:6402:304d:20b0:63b:ee76:3f7a with SMTP id
 4fb4d7f45d1cf-64105b6b3ecmr5978777a12.26.1762439345346; Thu, 06 Nov 2025
 06:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231815.1927239-1-niklas.soderlund+renesas@ragnatech.se> <20251105231815.1927239-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105231815.1927239-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:28:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0ydbmuQSi03Z+S-PDCfCniMEv8mJmyjTk+fow=psHoQ@mail.gmail.com>
X-Gm-Features: AWmQ_blCLPFn8r02Z5U7Y2OzAl3U_Qf6uQ1OKqEvZIhri73Mjip1xcYunGdvcMY
Message-ID: <CAMuHMdV0ydbmuQSi03Z+S-PDCfCniMEv8mJmyjTk+fow=psHoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r8a779a0: Add 3dge module clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 00:18, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe the 3DGE module clock needed to operate the PowerVR GPU.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
