Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44944BC87
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710995; cv=none; b=j4Ecfhc9F80pBNTDKpM6VhG43Av+sCJHHQCsguHj02UvcXYo1KECeZzFb+NnpxEZLTwWdVZ/sGYG0ZyDjQZjNB1bEy5Zv2R05MTDYPWJD8ETWZ1UEPE/klXATraehcRQKW30634L7lbUOU8UOrSA6qI4TzVbbT+iqykF0B3/yaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710995; c=relaxed/simple;
	bh=MrFHslOLHgT8fnDyLbDg++nK9hFiPwAURdyQS1Wi248=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um+MZq7gmdIiMAAPos172aoqdv6vxQMBJ00iVCoVsFNd/CO09cLDZ+PGab30SMPZ3E0a1ZG8Rw1WUC2TBNckP3Mz6JznZdCQSUztPiABCAbdYj2B+wUO1nQ03CuzEhFtSvPQU5MYLKO+KsUTiPxB+6vaaRcrOsNJidGm8hr7qFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso140190066b.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710989; x=1787315789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0QUNwVkihe2pSIDKt9VJtZYZJZMWuAg4EeSK/2G7bRQ=;
        b=irW4ehspQs5gTn45H8OHLxW2sq4KVwAv8NptWhX4oK1a+wOYrt55talKhBiYrLDRda
         YMDVP+T141De0uhfQLO0bVUpSHON6SFjIj9l8Vy452CtLHj0EdleYoBIZeyiQCj49VTn
         ykfkdHnfiKFlyErw9cPd3evupy06lFtJSZ9qh2H0dzkK8vlD6WlKYpTmLeFPvl0ZVHmc
         TGZz228f5TPcc123/JUqlhea96p8djw5OAx37fjbUMsdrmy39fn8gauEqXjLpN8nWD5D
         j+wo1i8lzD0rAJlxtpB6J7jocGQmuiIbQFHUONsVLTJcrH76fw4Q1wgTFt+aosoRufuU
         fh0A==
X-Forwarded-Encrypted: i=1; AHgh+Rp8xnOs607/LDUIE5coo2oPkNH2oQTTkcWXHNAg+JYD0l9hlsR3/dmaEnk20K/HuePx31Gfqo1V5Uo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBZYZdgSGj9c0bqRS5pjSHANOAzrvNSeYG6Q5wkG9PMRE+ghV
	rgg0pSAE+Mf0NgMM5MXbD2n4Qmfr7FczzJzwKJ2o4LBlsRSMr8QEDAyU7DUajxlY15I=
X-Gm-Gg: AR+sD10mTo2LtghBOg3/n0hAIkTjJFX9S+qhhUmvDbqux+k8nAaCbYkflmfRlR3QhVz
	ZbCWJ90GHQRlrxSWEicpw6dJINpmPLeH3qbbIZ2/FPTxMn4d0VZ4lB3Tnq8F2uK/oEn16Eq4Wvp
	EGcX/+Z8SpIfIB/WDfr9eG4JJ6Irm61q5X+8OHozNlY+MdyUwu2Z+u+m2HRRmocOqgt2B7PEHuB
	9gJ6/Mw9ExcR59bLjRSGzjnxSIh1ApOv1WxmRIeY/sZSos6yh/fH409j3Gjm+HJyyByHVpeOP1C
	mvhCnBdwLIR/6GFiXmbfM1rls+VM4iH1YbxEedvJ6uZMmv0gO7aC49zbvI7it3gK11cqdYqXubf
	E5lfWbYAybhDsxPKjhi/LEdQdwrsueGEPNTOjJ6GnADr/UP/ftuvp5LVkO8okheMEOsqVaJ6I3w
	ZbsxMnT+GmCi61K895E+oxaOHaPfJuxDIgNhAC+VpDNHYImROlUkzSQQJ+FJsujRUrXxlkyNw6E
	MarehYQRsHtQW5YvLMsOiY+kA==
X-Received: by 2002:a17:907:1609:b0:c15:f4bb:e663 with SMTP id a640c23a62f3a-c212a0ec540mr244588266b.10.1786710988944;
        Fri, 14 Aug 2026 05:36:28 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c4b03sm99027066b.17.2026.08.14.05.36.28
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:36:28 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1281405a12.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqH3pLwIAHNIccW58IHWYZXN2w+GX/Yt72CVn3HU8uiOEkrPmbepIAHYM3J44ICtQXTRaLIYo462OY=@vger.kernel.org
X-Received: by 2002:a05:6402:a0d6:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a38a96b778mr2182799a12.11.1786710987833; Fri, 14 Aug 2026
 05:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWsEJAWZ1OYN68RVmaNgSvRQ3_Ls6cvtNq1MszH=BUHQ@mail.gmail.com>
X-Gm-Features: AUfX_mxEbv3viGA41CSDIdwwTblZHW0n_vHRycJVLugqcyZZkwxPSnR1jInQe8M
Message-ID: <CAMuHMdWWsEJAWZ1OYN68RVmaNgSvRQ3_Ls6cvtNq1MszH=BUHQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a08g046: Add clock and reset
 entries for LVDS
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for LVDS.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected the tag.

Thanks, will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
