Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A401409100
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736364; cv=pass; b=BGDo6+MZXC+ZEpehK6PIusbrV/M1uzwSyl9Ij/lIW9RLYjqd6cdXo6yz95zvh7788/R7DAROhjKkacqgYTeTqnCOU47mdi5cs3Vj5Ox50ZXvg0GPD5H6DDsPSI1ZnHgmG0Me4YBD4bxlyjXGYSeI+JbmOo/nRdLWDF/qQK5I7LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736364; c=relaxed/simple;
	bh=L8JaU1cFQMm9KChrGufXeN5dKBFqD7lhpptMglX4LMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX+3UtCh2SCtD8KzdHBp3KZyiQj3+n+DMvGOx9NG5Mqg3TaoWCJbA6BkCWirf41NPAgbnZExIQ3raPpepVhNgwnAqfPKa0npuyvC5gkdP7vwN0RTIloONbAmhbu4tpqYfUC5V+XsIan7bHyOcgWxAZlItEoyHkjmojf6lWWIovc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JGuyXLnQ; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGuyXLnQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso1761404a12.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782736361; cv=none;
        d=google.com; s=arc-20260327;
        b=cjuFfVFGkR/JIkEmMhC9OWi9FumiazeERn29G/oUk0UXO20FxSFX3nWvjA+43tShW3
         OwQVa2tjVvQXX786FjDrBvxn5CpxtdWWC0q2mpXXqpjmDVyZj3onG6JKp9rCj/eBbO/5
         Wy2CeY5Sc28suGVmv9pzgBWg5h2Ol7QXfOyOuPD68v7riSauDQuSxCUqaTrwpDGDOXSQ
         brfJPa03A1bnOmNanNEy3juJbJGrSXbuc9otWea9P6gR9TP2hgGeCoGI+/luE8ANwcVX
         JfoQQkQEOAXrOyWXThVqwqfjVWgSkWenocV0tVs8whNtMumrG+m9IhBnfcHF6h2B6vb4
         j3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        fh=FwZ5U8W1E1WbYvJYnb61t0hKZMXUCzpb+5T4WE6Lr9M=;
        b=g2hyFKpcikV38NmfHuuugEL2eeZmYwZddsvwU//8gseQAoT0v1u+tBKUwVngCK2Ttf
         7EL9hOUKyAILxNGpRL6zKl7Dpibh+QTdcET9DzL1QRKhLPz/j5iQZ6mM+6CCCyxNF9XB
         gQ1SnzQYtRkTpqru+mN6ydM/gMrGk4nX2nv8ihhSG9Kxfts+TgINIUE208AqG+zVCJUD
         E3X4Cr8bR4o3VOs59da/IE1znDGWpF8KvpQqXmRMaXVrtPR2UcyYnUJqnzVKj0Rgs+6m
         XHGkDUPlf3zM15kMX13RB2HmCtNI7HGyYEg7L21bT+RjApFxPlugCwveSlv6EJixoHnI
         wGTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782736361; x=1783341161; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=JGuyXLnQL5sz9BH6+VPjvQeoF3/judbJARvJ0xkTJSpwa3rlW9fTCnYBr3mSjiI2xB
         3Ac60HX+i5+KJAoVOEBKs+x3EUrHbziQNfLPDONqowB+t9HrmkDfyf1YK0P8vDtScu3Y
         791WtF7RyjGrvlOAOBWeitOkmZzwWJkx0f9z3W9jhD4iRV1xGBbKtKyvI231NsXMyMuP
         LDLPPtMnXTbWN/mUVqzpW0vlEevdhFAu00He9KdLufz9D/UHuvLWxDOjj5tSixQ+mR/1
         8jtGvG6Bgzl0NFhPretHBnDU9dB/73TI0SSZKc3sVk/29lR2qq6KpsiAZTLvkZPSIX31
         diog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736361; x=1783341161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mx+bJya2052OeT1zYheYpJVI5drzn8BNJLEF7IAU1sg=;
        b=G54VjHOP8V/kculKmqprmWjFiN7O+4piqgsaOOT+H68J+40RwcXaOwimSbpH4l9z8W
         +UCU8MmvltRiOyoXq6EaX6D7Fl++13lP5WeZHwmCQBnScA/7OXph6vjdx0NlmZzkDF/Q
         Lx1Hij030tJP8zfIMEU6Fb/iutj7UOvQO7eJBDfJt73aVJizQWxAMKxUA7bMM/x8YLeE
         24DGL1AO57KERQSAWQ1g9qdARzsmx4Q8TI5Zz1c4W24oFKPusGZA+NrPLBQMtt7aaGBw
         xMEtPMnFLN7TDt878zGadQGds4dAA76jVYdiTNg4cW+YzIH3T/fxz1iFJrCSlXcV4Kmu
         Qdbw==
X-Forwarded-Encrypted: i=1; AHgh+RoM1C4LsJjgl522m8XVh0PLFhO8BlXeo5PoKeHKCVeumM4MPZlrrDya7dMa4fYJnLPxzUv5m1ooy7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWMowDSFbF/HMMFZk3esXgl+YTGeYgBq8aVIIloJDR2Woh/jDg
	8IH5iviFK6LnqL3OZ1uFGbmeQFo4VcWW1q5yKXrLVRBixORzHwsY1768qsb6EtO9BpD+0CZ1NjR
	QUlT74SgGdozNd646buVclqZoEQamwSL6824HwJpEVw==
X-Gm-Gg: AfdE7ckj8ucjXoJMJ6ISJ/upG/a8EOmXc2Tgw3f3Q3zh1hkP1ijMvFt2DFYaJ1X2/YK
	oYoJ/7giiOAqE7Q23/8I65z7HhedONXHxrW8lhzasUK8dRjtq1nsVXWrZU7KTseZSOqepk8JSBl
	YSLM3HhrUZhnahosV23wW44pdj+DJ1U3Gs+jjG1HvtVkALwc1qECjgatbdCgAKhm7150AhZQmHp
	WXihoq34FoFWWgrXI0GuFci1dRUll/7BiKYPgMeENd6z5fooAv1EeFvdjM/ADXB9SN8rGwPL4mN
	kmMSCXzZKc0820LjdiBCa6dn3IEr1A==
X-Received: by 2002:a05:6402:35cd:b0:697:d475:9692 with SMTP id
 4fb4d7f45d1cf-6983630b4camr4695431a12.11.1782736360872; Mon, 29 Jun 2026
 05:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-3-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 13:32:29 +0100
X-Gm-Features: AVVi8CdLbhp4Di9rmkSMap57ieyZzpxVCIoG3c1G91VB-Ou_IfcxhglJYrQ6uH0
Message-ID: <CADrjBPpNQd6WgwVo-a3Mz74d1EptPm9D9BisLEmoFRsdUb3izw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krysztof & Denzeel,

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Correct eight PERIS gate clock parents to match the hardware clock
> tree and reorder the GIC mux parents so mout_peris_bus_user is the
> default source.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

@Krysztof: I was thinking, maybe we should establish a new rule/best
practice for Samsung clock upstream submissions whereby patch
contributors should link to the downstream cal-if code for the SoC
after the --- line. That would make reviewing the patches' correctness
a bit easier, as the downstream cal-if code would be readily available
to the reviewer.

regards,

Peter

>  drivers/clk/samsung/clk-exynos990.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index ee3566b8e57c..df5928833b23 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -2551,7 +2551,7 @@ static const unsigned long peris_clk_regs[] __initconst = {
>
>  /* Parent clock list for CMU_PERIS muxes */
>  PNAME(mout_peris_bus_user_p)           = { "oscclk", "mout_cmu_peris_bus" };
> -PNAME(mout_peris_clk_peris_gic_p)      = { "oscclk", "mout_peris_bus_user" };
> +PNAME(mout_peris_clk_peris_gic_p)      = { "mout_peris_bus_user", "oscclk" };
>
>  static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
>         MUX(CLK_MOUT_PERIS_BUS_USER, "mout_peris_bus_user",
> @@ -2584,15 +2584,15 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_BUSP_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_OSCCLK_CLK,
> -            "gout_peris_clk_peris_oscclk_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_oscclk_clk", "oscclk",
>              CLK_CON_GAT_CLK_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_OSCCLK_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_CLK_PERIS_GIC_CLK,
> -            "gout_peris_clk_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_clk_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_RSTNSYNC_CLK_PERIS_GIC_IPCLKPORT_CLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_AD_AXI_P_PERIS_ACLKM,
> -            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_bus_user",
> +            "gout_peris_ad_axi_p_peris_aclkm", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_AD_AXI_P_PERIS_IPCLKPORT_ACLKM,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_PCLK,
> @@ -2600,19 +2600,19 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_BIRA_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_GIC_CLK,
> -            "gout_peris_gic_clk", "mout_peris_bus_user",
> +            "gout_peris_gic_clk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_GIC_IPCLKPORT_CLK,
>              21, CLK_IS_CRITICAL, 0),
>         GATE(CLK_GOUT_PERIS_LHM_AXI_P_PERIS_CLK,
> -            "gout_peris_lhm_axi_p_peris_clk", "oscclk",
> +            "gout_peris_lhm_axi_p_peris_clk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_LHM_AXI_P_PERIS_IPCLKPORT_I_CLK,
>              21, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_GOUT_PERIS_MCT_PCLK,
> -            "gout_peris_mct_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_mct_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_MCT_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_TOP_PCLK,
> -            "gout_peris_otp_con_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_otp_con_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_OTP_CON_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_D_TZPC_PERIS_PCLK,
> @@ -2624,7 +2624,7 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
> -            "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
> +            "gout_peris_tmu_top_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>              21, 0, 0),
>         GATE(CLK_GOUT_PERIS_OTP_CON_BIRA_OSCCLK,
>
> --
> 2.54.0
>
