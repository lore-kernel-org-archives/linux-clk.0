Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B904E3FE668
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577823; cv=none; b=G0A9TGdqid+NWidYtaDq5dhBBTBbCTDjbfg9w6/wnwhuUvX7N8LEqvN9PHTxa55/bq8KImgclQ3U0KYTQRGSZ1ppc6iiVCpGZ/AaSk9WP8dVEPkX1mEIHd/5uzz61T0HSM9ijXPwd6kll3CyL1VCItRQvA4T90u22qBVInF1ewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577823; c=relaxed/simple;
	bh=/us1vr8a5z11BxNxG8w0EOK4mYuoD8wxJHeVXKELP2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSG/EheUrWBVL0c94Q3UZx2V2iyyJMy+SgmFmutrvb+QugmkhBVwUH/T7I8hGHDHj0mW7S2PFQIHW1kzkFr6u73dFo8PDUPDgYCjn2A10P/b8avrY67c1Jc7n2Ysca05zWOpuXEJqU+XL1Tq6/LPimtPCMyk/6LJt88U8+gwqSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6d2f297f4so391643a34.2
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577818; x=1781182618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXcg6gYzrpbGrQNaU5i/n/QDTFmGYgHfcoYdrRVlWKk=;
        b=FUNWHeR0TF7Fh/Ybgsyr4vsE0ql71km9pAJliI1YoH2+QskO8+TQYgqahrwzgstcU+
         1j/Msqx5yqCkb/nX7d07yGxHVgjkqnrinUeXpAC4pIrS5kIyjHItagKhukuWq1ECHLyU
         xOcRnxRbVcFEINBp0JUOtGKkzcl/NeBnG9BzgSBtQ9CqzBw1WJ+AG7/+x2k8HGBzz8Q6
         CQ4sVKDlcW0j7dtrWrtHUSLS4uFJPrfQ3u+cBEl1jRWiui+Rz9UVrtbWG7J4rjPhRwqX
         tTQxIil8tveyUZwPcGpQnSbPpF7MNd9tNvaCUV9/o0A553PNfin/x+8lwG+Nz7rUHZsV
         XyWg==
X-Forwarded-Encrypted: i=1; AFNElJ9dsgIKPFvm9hwAGlaLt6uXhKEfoX6pK7lPORKuIV1EC5j0VcIInji2IhGVnKOloSFFWJ00gw3w5qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMcf+WQ2ZQEcE5BK6oVDtbQXMB1kr9Bq0KqQad3e8r6x62lrFp
	UW9f1BV4Pv5Ho9I/+8wknWldmZ+1AFRZ11u1RoEBfiX0E9Ik0HfdexqPROjLHBzksII=
X-Gm-Gg: Acq92OHyLUJ87SGjJSVbiVCdl5jE+OEbC5gih1KzE258qFgjaGe6Rl6Eh4/vtpIsBPL
	ljvXlMxuNDwmpL7YYWS9XDw9+18v9YDODaqywG5T11HWUcGfze6OFx69ZblNcrmF5kjKHIhuow4
	zSh7H+2AwHo2Chjgub8An8lHkrZSg4Zu+v7zQ3RDgsgUO+QcHoyCE5SFayHCAd1fucWoJR00UWx
	A4m2ivusk8rjWvuNzlurbxzxIbOpzQxyPEgdbnIaesthP7jdCmlBN1Vk3fFw/UhVq9wMzQ0h4+S
	LcRo8KHVDnt8Z8bm2wZ1hAPVwbqdMxWQ0foJSI00eNXmJx/W2TqZtInDGX9zBd3TX8QiG8R+d0/
	Nl16usYV4WVhYwPwKT1g9eeUReDN+ThAEPxJtm6CXY+otDoQMI9cwv8Br62rr/EjhPltC/ZAsGu
	OaoL4gPrQuIqeFPKOCqiCi8qrWEeq5sN2L+WLMXQaBKXaVq84UXx3zF3aJRjURPNENjgscG50=
X-Received: by 2002:a05:6820:c0d8:10b0:69d:7a88:9cdf with SMTP id 006d021491bc7-69e47ec7887mr3436747eaf.15.1780577817601;
        Thu, 04 Jun 2026 05:56:57 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4623cc02sm3333929eaf.4.2026.06.04.05.56.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:56:57 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e6dcc22cbcso539630a34.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Jun 2026 05:56:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/yVHzzco4W3PaVdAmZzWjia8kwbF0tm7qDVQbZmy6n0GTiKhW5ya0FOh3Dz/7XnRNQlsjC7DjRduc=@vger.kernel.org
X-Received: by 2002:a05:6102:c06:b0:650:967f:fb32 with SMTP id
 ada2fe7eead31-6ec2978d496mr5106431137.3.1780577366377; Thu, 04 Jun 2026
 05:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-9-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-9-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:49:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0-pf_jcKTfLCDrwj_ezqrLyO169Pp_cQFzipHnG0oqg@mail.gmail.com>
X-Gm-Features: AVVi8CcDFx5qXSuegazwE2easrqw_MlaWBK-wBRkmOsQBF_Kpu53lNXiO8RHuTA
Message-ID: <CAMuHMdW0-pf_jcKTfLCDrwj_ezqrLyO169Pp_cQFzipHnG0oqg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
