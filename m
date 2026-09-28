Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712A4ACC89
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595496; cv=none; b=i5YcoyrlI+5KPxXbNJJ78p0/57ijibkbF/LvIR05q5fUYsr6PpmJ3fZNhUF79hRnS/MmYV9q9aRnDv3n3om25YCRAQTUK1c46xAhioh/3kmaIxUZqZOZqV5GkIq7gfqYWh25yVLVpf8KMCHJIqW2isGqHSiCNCEu7PrbIhsx8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595496; c=relaxed/simple;
	bh=tKvl59UVQolgo2gX344Tqkbysa6udLoFwYeW240vcog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIsyszK/VYEuJX7ft6Ix4wIwmWyt0NpbHTrUTYK7tRX4bAqws0Oeb4s0lRtS45LV6xoALbWHiC0Xp2JPzwN1Qi0xThcdz/Xq4aAyTTJwCfHyqkuEQrKnJuaYZceCAvt5Jed1X6jLXOZH75/soEj5lokcRlHPN7OGunvZdBjAr6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1289790241.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 04:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595494; x=1791200294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i6Axo3HGXtx4M0ZdgmZ+9VJvjH8NJrRWcx2B+NzBV5s=;
        b=qxeoJoa5QYFsyDf5Gciuv7L3fg/wuknfbgUb05Qjl/msgMR8BAyKc2KMyV8BhsSP+t
         7v7UdtcZylr/lskdbMB5bNANHvVTza5ggZXaDunjk/qsSlYfbBZuss+wZWrf71DTJfSo
         AmN3OU1DwwMgnQQ/YU1JUhC1RBVw70LBeKBM+S2AlOiAkqHMyA/ueKnm9wYwae+PqXq3
         vs7jql4BL7c+DAzxAeOLG+ADB3n2Mzfz5eQAW/Lyb87Ty5vVR47Igfu0lL6UEK9CBt47
         B3i9rQjRT2c2V6KXuY7D49pqXVO4l2q7rhE+4T/9mM9xyIkdgsnlWcJBdlPTzTfJfpmk
         qhcA==
X-Forwarded-Encrypted: i=1; AKwUvBw4YZEzBX1SkRoHOHDrBtrq5UQLrrSAF0dqB/evoEcfP4lTw+bqGDbU3gY31lQ/S6dgfgXlILnKTJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFwY2rnkf3JG8Sny5tPrHTiezulECLnVEEFW2Vabv6XlsUFie5
	/jltFJGMBZudKNB3Bvx8fHSQfDormXv/xAvy1aFKBsjSxVfcduIxYNIBNTKSwwGV
X-Gm-Gg: AYBFou3KHQFpjCE3vn1RRobR3ap26i17RuWJlcj3Wx9lwTN1/Izu7Zs9iCO6ItsBwx9
	GzSF7Y6dpGrAh/ax8SHtDm6KG4rZGB0W9HrvwYy+gzOyeRx8KDB5Hw5+eDUjiyEtXfX+rznkNK3
	6ZmH9crDV1R48kSq7neOSj2GK1trvWRdcdpQhzOKDJIW+jQZG6uEfC1wgpHEvTm3NB8n0tRHYcI
	hV+bVhTdj4XA///A99v67a30g//wHXJR5Xh+82hvdeg9HJhDhJXQ2QR4Yux8tZJXwIUpLf/eIqx
	vpjUay0swjYdPxNPJxInuUQPZZ4x5Ym1QdbnoHZf30CytZgj27J15u45o3ru8Qysb4bE0TsUAV7
	4mtl2nHRbJcHsDnDK4JhmPWaZUYKfptYR40scRy5Yq4FjJuwGliSc2CS9KZoK0LWuHpVNdFQkLd
	oijOL24QazdOu8n084Y/DDatoVy4yzxKznZLGL9buPkibFLI2CPJZVe0vlYqwLF7tTm1nFkE9l2
	v+uPaqwFgSekWM0ROTNx3BSFE9w67HwMf2b/0vpbjt2cdti
X-Received: by 2002:a05:6102:4188:b0:7a6:dfec:3643 with SMTP id ada2fe7eead31-7af1ebf3435mr5362051137.27.1790595493697;
        Mon, 28 Sep 2026 04:38:13 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde664c06esm8507897e0c.16.2026.09.28.04.38.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1289760241.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwnTWEtpMAQMd3PEHgN1MNGAjUxFk2i2jYWoefE3/yLCNomeeL2+pmzBohSkQMEpuDvJ373aga8PmM=@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr5035987137.0.1790595491034; Mon, 28 Sep 2026
 04:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790325809.git.geert+renesas@glider.be> <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
In-Reply-To: <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 13:38:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
X-Gm-Features: AclHuK_Ipn8bslrHX7mMK7Zs6CdI4c2l8ME7s7cvf6MpMmTS5OEzqaHYWA0OcRE
Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 10:53, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
> (MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi | 104 ++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> index 9a07753b221541ed..d75a9e43f772f871 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1000,6 +1000,110 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               msiof0: spi@c1700000 {

[...[

>                 mdlc_cmnn: system-controller@ca410000 {

Hmm, something went wrong while rebasing.
Obviously I will fix the order while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
