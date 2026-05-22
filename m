Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC139DBFD
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779458123; cv=none; b=EEXEpnheFURe80X2M5PHeg37xV+3nXWTNJqxNcCtz4frV2S4O1n81Zad4xVbHvKVESSzzS8HTQ5DVz7B928L6Fml7PJGV4FEUH/xWW0JQIDmtxS0RojdSRiqBJuZupbFiuNdg8WL+JpiA2Ua6UrBP5u3k2oGfMVqVuftw6JlHa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779458123; c=relaxed/simple;
	bh=p6FsAScfvmI00LgYGoLuomprcquQsIoplyeLI0inSTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7cPabxN+5RyMap2jj86i+X0lqZmZIHALa48B4rS8K24pJtja9Kg60mLUjfj3fpgv3IpIt60EkGCemxd6XoFsoCqlkqImpLiU9Bk4j1k3+JdwULS8jahvsp8uM7KKn2jtdPobCLtu/pBB/av5V3Pn4Fghb/PsdRfZQMh0LU9vdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-631333ee9e4so2268227137.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779458120; x=1780062920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j30cmgYlFN4mDEmlnYqRmgElSbQTzkiiS0OsZr3i+6I=;
        b=Tog8vatOijPO1Uw7lPYnma7fpKhTOPTWS0T769cqyPUezzNQu2LMQnBsAUW7LZMjnF
         taUDsDpF0ES2K6i8uOwPA4HQ+pWEE0ep3OH3q5Fz7GCxqHk7pVWwZS3TT1iU0ktjmkf5
         6/1v/FYd4yirgKSO2O49BOTDc4oyySsAK5vSrEPa+aXcQZGWFcrZ9++i9pqheWIhi1+N
         ztxEbek3ayGiL4Efw0PWTMbjm9FBvO8a5QhFfa/bpY8sL1lY0YuvgfpvHi/lvK+f2e5i
         PcbYlEztp5AApr+LjgY2Qtllz9iLLiTHGvoKvSF5FLYhi3ke3WICN9C8nUGe/zYWDP3k
         q/3g==
X-Forwarded-Encrypted: i=1; AFNElJ+KaodxIOU47OyDTcQo28oqZokDYi79Gs90otNxcyX73pgmTAiH8ZWtcG5g98AwsRvmtpCYYjJHAVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbvYoSfI1c4toOCeIcaXN7etXxvkgUZNZRFTR7le8EBHmgLM/
	kyiEDwIAmamyk9ofxnUL/zokj4nOByOrHNBsiPQsn0cVEXT7G2t7rfaiexpUeVdkp1g=
X-Gm-Gg: Acq92OGS0CikB2IZttDGpba5KBBCn//pUgKmSarSQZNjC82RO9GRiCn0ZuxGebHBiMZ
	otdSh0/jh5+1EMK+vIYPkX4cs1RzWyEkcgfV/tOJpOEoJy7PM0YzU8v/Pt9lKsbBnXEagqLmBdo
	HpCu0RO5WIsbbofb2LNZqn28cjjJ4N/9Z8SEVDnEQTRn+RTNhKeGGsdNqpGz16wZxrcG3JG44vo
	4PpSxhLZ5PIfntdHd+GVbTTsSSSuax7pd9mHNRxMe8z51+ZyrTLtGXvyhg2/r/hHkPoFkysQvrW
	wf1GuP+Ho/Ve83vemKQt7sMTUbope4zQoLkQQZKV6l6HAbmCIyPsHUZtOO2+VA9M1sbw0tBruN4
	hiBABU621GdWXCz2qgK1ktmWyET7YQ+jp5XpEgirXLOLLTMaNUJe7eekVUx2fpKlflsw/zcZNlp
	tmS3H8KfTpYS5+/kIg8jc6leyb1lyODOatz2ceXDUom8je9PtC0CxS/BvZb/L1LQ9DnUOsDNQ=
X-Received: by 2002:a67:e7c9:0:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-67c646469c3mr1551311137.0.1779458119878;
        Fri, 22 May 2026 06:55:19 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173afdb54sm1631526241.8.2026.05.22.06.55.19
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:55:19 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95cd9a5f24cso2051094241.2
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 06:55:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8hr/N0fF9Vqqt3pTIAFagrikbOL82CKFH50cEJNZyOKxw7GqfRecgMU6IDxO62rOYIJuDao46Y5Tg=@vger.kernel.org
X-Received: by 2002:a05:6102:c89:b0:608:94e4:1c00 with SMTP id
 ada2fe7eead31-67c7490526cmr1691949137.2.1779458118939; Fri, 22 May 2026
 06:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260410163530.383818-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260410163530.383818-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:55:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiJEnpfLs=cQ-j_VaFxMhLuV6YLsvqpE4bvCmT_madQQ@mail.gmail.com>
X-Gm-Features: AVHnY4LbuOPf1FKjHR7ZFR3fWcySVRSaw7vpgkocdsWUrZ7gBa__02wKZRL9zBo
Message-ID: <CAMuHMdWiJEnpfLs=cQ-j_VaFxMhLuV6YLsvqpE4bvCmT_madQQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r9a09g077: add MTU3 support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 18:37, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) SoC has an MTU3 block.
>
> Add support for it.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
