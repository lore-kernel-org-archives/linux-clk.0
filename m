Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F050C2D0C95
	for <linux-clk@vger.kernel.org>; Sun,  8 Feb 2026 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770559084; cv=none; b=Kqn7xp8tu7PwDSu7NcHGHvUTQxkuMLsXTtYtgm2PSGu/3mHvYMaXGBSFbuveIk5RvY9m+te2F4hocoZtIL9k0cJcPk30G4lcVFaS96mCg0c9uI4vGSnj2+FaSQEGBgumju3tpaA3CxhxBS599LUb7Gerya7yAXoKSm60cag6Jz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770559084; c=relaxed/simple;
	bh=YnMdYrPRmABGTA354900TUIDfcbXfaSv4jL06On68C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDxUNe442RbSTv/3kCyCXqgd7gslMgLtbJxlPtE4knTveDJp2ulRGGlJTersqNtRs0uGYwYE3xAe4e61EEzuY6cIJm9rVu2PoGlkwCWcnx7l8U6YM6yx2nvQU+Zi80z1TkSVOP8IAZRjpr1FHzlylOWNKitLtMUk9zfaLOQoqXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59b834e3d64so2430217e87.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 05:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770559081; x=1771163881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=584eDfC1mUTdyJpPvHvHXMYm+KHiPo1etMl4F2Gr3Us=;
        b=U55hJTmC6B3jKnIAoQsR5gyl1zaGLjXAZGOwvoA0hi7KF1a/NGOLjxFPOwOmIDzIuH
         3Wn4DHaHDjIsRybH42JtsL06VLps2htNoE9n+wk2Oxpbujr+Ps3kszrFK9R0LSKEGQRn
         LcX6mp7I/EuMe1wYz7FV26sZ0Ehp6fNtueecmEon9RO96hznIltFkumYUoUQAn092Kmy
         zyQzkKRPDOF51tgv0YfklVCWvwvL9Jv1DRqk/cSi2jyZ7qaD3CEfZ7D8qRrkYiJ+3Yzg
         AI6gSaQSDsYNaqZDDuNwyAJ0AHIO8saMMU40B8XO5NzkQ0dNEoemq6mFEXpEpDj/8Wpy
         twTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgsl8UcFj5HpVl84nhCQOKtj/RoJMWzNvol9H/5q/l0auf7Noq8izh1wbGnk4lSydYlF4308SeP9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/3R3HuUVFYlNH/Ps8SYusJo4ljtSuDVRodzbIMRjoJvxHSOOT
	Y0OWtKmajwuBvWiVeMsQQg6JiNhE1z4tKw2tvZTO/3AiLDO2lOvRcfAkb5neuUaa02A=
X-Gm-Gg: AZuq6aLUozgQRIUe5J8b+WJjJcpygdww9X04nK++FumjFrvz7zSVbfWc6NqYKxAc2Q/
	Igqk1IFQL3q0cqmeiUzdL03Ug4NjG1JvpwlRi9nIk9olkZvO5nX/DFAOMGR6HslgSojWETb27VA
	/Rd+w+Io1+6agqFGyAPGyOgDDObiohPcgKSilGGgYUzh4KkyNR0CorI5x0A0ztiyWkI87N+v30c
	z5Boc6cY1nxLmozAhtRa6U2h0slVlAsw86zY+G2wP34gYLl2p1k7cpY7FAlX1+QI2UJZlfge8iG
	q8AX1BAYz8nQaHOl00OTKiy7iDbZGEwbqeexHS2ARsaytbnfPnxUwEkA1J/1WfF0J+uUUXmquOe
	R2pMONjCsADp/qzNHrJjeZ2VmX97O0930MrkjVZDLvAAehojl1ERxvWVgqzU63i8sIo46l+jRo+
	Wgud2eNs/feRhJ2mLuHGeuWFEG9Cz1Y1BNtDBGsj4=
X-Received: by 2002:a05:6512:61b3:b0:59e:3e27:2cbe with SMTP id 2adb3069b0e04-59e451622cbmr2788758e87.43.1770559080326;
        Sun, 08 Feb 2026 05:58:00 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cffdb3sm1967168e87.35.2026.02.08.05.57.59
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 05:57:59 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b834e3d64so2430192e87.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Feb 2026 05:57:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXDSObnOCGedRbKAWOczpXx1lYvPbCAHZONcyq+rth8jLMBV1GvKLN5C/0IVM8rm8iBeL1ULvZaQQQ=@vger.kernel.org
X-Received: by 2002:a05:6512:23a3:b0:59e:1930:d92a with SMTP id
 2adb3069b0e04-59e450493a2mr2868949e87.12.1770559079022; Sun, 08 Feb 2026
 05:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205154202.21819-1-me@ziyao.cc>
In-Reply-To: <20260205154202.21819-1-me@ziyao.cc>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 8 Feb 2026 21:57:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v66rvs_wM-vUrMiKHGCmVi2hKXsiBhmr8ATwfXnXv24trQ@mail.gmail.com>
X-Gm-Features: AZwV_QiLLl3AbUKlP4o-7k8Poc_d9wUqBrpqUspJjZNjI39LjV85LvTD7PCo2OE
Message-ID: <CAGb2v66rvs_wM-vUrMiKHGCmVi2hKXsiBhmr8ATwfXnXv24trQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Avoid DT fetch in possible_parent_show if clk_hw
 is provided
To: Yao Zi <me@ziyao.cc>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 11:42=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> When showing a parent for which clk_core_get_parent_by_index fails, we
> may try using the parent's global name or the local name. If this fails
> either, the parent clock's clock-output-names is fetched through
> DT-index.
>
> struct clk_hw pointer takes precedence with DT-index when registering
> clocks, thus most drivers only zero the index member of struct
> clk_parent_data when providing the parent through struct clk_hw pointer.
> If the pointer cannot resovle to a clock, clk_core_get_parent_by_index

                        ^ typo here.

> will fail as well, in which case possible_parent_show will fetch the
> parent's clock-output-names property, treat the unintended, zeroed index
> as valid, and yield a misleading name if the clock controller does come
> with a clocks property.
>
> Let's add an extra check against the struct clk_hw pointer, and only
> perform the DT-index-based fetch if it isn't provided.
>
> Fixes: 2d156b78ce8f ("clk: Fix debugfs clk_possible_parents for clks with=
out parent string names")
> Signed-off-by: Yao Zi <me@ziyao.cc>
> Tested-by: Drew Fustini <fustini@kernel.org>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This was found when fixing the wrong parent description of
> clk-th1520-ap.c[1]. Without the patch,
>
>         # cat /sys/kernel/debug/clk/c910/clk_possible_parents
>         osc_24m cpu-pll1
>
> The first parent should be c910-i0, provided by an unresolvable struct
> clk_hw pointer. osc_24m is the first (and only) parent specified in
> devicetree for the clock controller. With the patch,
>
>         # cat /sys/kernel/debug/clk/c910/clk_possible_parents
>         (missing) cpu-pll1
>
> [1]: https://lore.kernel.org/linux-riscv/20250705052028.24611-1-ziyao@dis=
root.org/
>
> Changed from v1:
> - Collect tags
> - Switch to my new mail address
> - Link to v1: https://lore.kernel.org/all/20250705095816.29480-2-ziyao@di=
sroot.org/
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..a9d1aea59689 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3588,7 +3588,7 @@ static void possible_parent_show(struct seq_file *s=
, struct clk_core *core,
>         } else if (core->parents[i].fw_name) {
>                 seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
>         } else {
> -               if (core->parents[i].index >=3D 0)
> +               if (!core->parents[i].hw && core->parents[i].index >=3D 0=
)
>                         name =3D of_clk_get_parent_name(core->of_node, co=
re->parents[i].index);
>                 if (!name)
>                         name =3D "(missing)";

I think this is slightly wrong. It should never fall back to looking
to the other sources if parents[i].hw is a valid pointer, since that
takes precedence.

I think it should look more like:

parent =3D clk_core_get_parent_by_index(core, i);
if (parent) {
        seq_puts(s, parent->name);
} else if (!core->parents[i].hw) {
        if (core->parents[i].name) {
                seq_puts(s, core->parents[i].name);
        } else if (core->parents[i].fw_name) {
                seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
        } else {
                if (core->parents[i].index >=3D 0)
                        name =3D of_clk_get_parent_name(core->of_node,
core->parents[i].index);
                if (!name)
                        name =3D "(missing)";
                seq_puts(s, name);
        }
}

Anyway, thank you for fixing this. I wrote the original code and this was
one of the corner cases that we didn't have on the sunxi platform.


ChenYu
