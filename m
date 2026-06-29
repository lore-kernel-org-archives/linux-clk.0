Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EEF3B9DA9
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729861; cv=pass; b=DpdCXWPXa1qSCaTF3EOrq2h+QuOKFM7AEOUJtluHIy8I6YXBtiK2ZeYgxmooPyG3eefYb6Rko623J29z+IzAnqxptfZ6Pfx3M/x+FyJ/df7Aw2sEmAQqcYL8fi0tE7swJ2USiU6IGMOsJg+pQXCQt1FGhbD/yGh7W2BnR0KBGSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729861; c=relaxed/simple;
	bh=iDO4j2JAZZI6/SJz0ZNmXzlln8bKUKTt/Dj4jurK9p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmXxy+0+t06iWeSoCzJ14qikVbnf77hZ1pnmmaWTpmQGv47TZOnfN9uyk76SK1nCmDE9cAMLaBUplTgdkc0no5ejYL+5QQaaOhiKlRqWa0SDmQNcpTTqWvYgmr1xFiLRYkfhUe/cwyyN9jfmLWycEh7zfWwWl99ADLzdLWUrA80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vYwkTSNy; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vYwkTSNy"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so5474998a12.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782729858; cv=none;
        d=google.com; s=arc-20260327;
        b=W3B/D0QkSUVuwU45piGiaeTe9oBzAKJUQ6I0xkLvu5a3ItkBK8qBhoMo7qkeQS7w7c
         D08s39jrEmsEx+4BgkmruYnqm1U/qnlUL7oiUHF9qn3uFFDRiUA3pQ/xb/Y2zDnkzoqC
         Zvuhhml6AOtAgqb7fr7vxKuA0I/4sZViNLfZaRTORnf6atRt1nIv195LUMLkWD4V7Qt4
         1aj/akwNdxYOwcyQkgBDeYKAv3vcJXBuM5TO2Mv+KCfiEgeiLc7L+hUNh+nw/N5dFRX3
         Bdq6SVoZjpy0Y7QPKvXdG62Ga4tBWMGrYZ6YhcFZ4MxIyY5FNfWMTeXTNtvVep8rMs4S
         zpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        fh=plPJnHZmVbGfqRwn70JQABBYLU/fxa1ucVk2lXAgvRk=;
        b=dNsRat0ZCyUIeTKdYTR7hd3ux/bH+Br+A647Z0HEIdA8d6QTSaJOXxyLK1dO+vSkcO
         u1pLnWBJD5fcDsuAoFeBQj2Zxkc0CODVZ7bSJVDdl8tW/7x5zDy5ibKSw4n+QzaEz/Tr
         2MR6Rke9NOUiWZul5YBW2qB8J9S2fts4xFcBrLijxjJagjFZ5ayVQhKqj591HLSYwpv3
         Pu/8I40XwmjTkvhaqwgMYW9FBvQASvon5mdMVjYS3V8dHSh6MNsBajeoHVonEgXpQCas
         iiCn/hpW5CR/4VWEEx3qriqiGD4WFSKi0vdGryIgvlkpkPGF1sigmkKaSJO6RV0Khmyn
         pTkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782729858; x=1783334658; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=vYwkTSNydHDJMWhbVKWp3I0A/xVS9T1wUnB7DRi8/z1KJKysqwd0m+tNU6a7mIqter
         81qyJTlFztmPfCOU08vBZ6TLf3KmdjYKvrh0PNSfr2FVMEpPBlvHSPjAII0F5FhongtE
         lCLvfP+yYvcQ+KyYst5BxA5MVAeuPx9EIorhQD0rwKrduR/aEKB9/0Bjuwstj8EjVETg
         I/vsZOnVgQxYvnhMPv0MG6WoNRUdo+TS/wTgAxNxH6TalLxH7uZsaLJ+aajCSxXgfwg+
         htXJAluBwnzF5sQed2QkKuHsFWARL6sy1lD2FpKWCc3OYlGND1J/Swh3ME7e4cXGLQ85
         8kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729858; x=1783334658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmnqsRJKYkgjvaCA1bs99cASP2GQp3sADe+ZeD2I3KY=;
        b=mADgIV4nFev5dxomLpECf9fE0Z8qe7uZkS373Rll8w8ueC/8TGQ5gTeM7gPVmwmHOM
         mN4YoJRd6iqjq2N2GUmA22/JSARzH/XfgFxOFOgY7RtdGFJnnONnI0Z+rIp2LCJf6KaB
         tD6ZxJ3ifzR9X+X4apuvBqADGvQxEdhNDKtHgXbTYExQiOwLlNUWcZdA66h3P3o5E03J
         m1fOMeuR7vDBJkzr3GPaFUqFGbpuHm9XyfX2sNsGjEcV/rNHg2/VRYqWVgsUmviS8TXG
         mKQNox7yWPZPBV7rpk736Uz0pbjy3K+hKhDAYyMcR3VdmGuGaAlacNM0yA02QdCsikzl
         6tbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqdu7gjux5esoND/Qs2Ry24UHUVlmDQeZgMgHCR4/Q9la4rE7G9LqV9xQX8LY5/v0/Ikph02+U03GU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+RAGpacIAshQFroQ8k1AjIBAz+c520KGHr3ybl/g6P5jJd8c
	plJ+OnG0GEetCMfzARf5RhDnHjMANgcPMXoMDqgVYfR4QWdZ5wLqvmDmePBRhezqmFa08sqFhz5
	4bhYfUdaFPHDO+nCR+hvImAERECfzYclgySO5fManxQ==
X-Gm-Gg: AfdE7ckMmiGWONj6oq5vSVhNumNR5Z1B+kI/q+1lvPWZpdd6bQ1hHNcj+vV1Y0R3uwZ
	Jr5XCPETwxE6jSUsRHxUtgsshvAVG7WIzwZpKsNLqylwBYOqarc3IQbT9tXbLtwHuhd4s6PqN5k
	X34LjG/vhyMXzdCjq8V6IG6klWsRyAChpshxR5RqE0jM+zkKu5PeIEC51+tbikizOPvUlSQIzsN
	8+DYwKM0iHw0kLqANWB6X5ORZoegAxEHFLBxRRFr8osqeY/2jAOvNJDTikPnhgVqF+sES38hzfo
	gPl8orNjC37SbDoUTBOny9RTl/skxg==
X-Received: by 2002:a05:6402:400d:b0:697:8d48:7fa7 with SMTP id
 4fb4d7f45d1cf-69810ae01c2mr5980595a12.22.1782729858308; Mon, 29 Jun 2026
 03:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com> <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 29 Jun 2026 11:44:05 +0100
X-Gm-Features: AVVi8CdUhgADG2xSK96hAWTQ9tVWRhtK6fekJr5xsrWPfeyuxnqLTd7JZu91VDg
Message-ID: <CADrjBPrCKS-_FSFaL+124cdRioGOEvk+6HFfrJCGt7HB983rGw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jun 2026 at 13:36, Denzeel Oliva <wachiturroxd150@gmail.com> wrote:
>
> Add the missing CLK_GOUT_PERIS_TMU_SUB_PCLK gate clock for the Thermal
> Management Unit sub-block and update CLKS_NR_PERIS accordingly.
>
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/clk/samsung/clk-exynos990.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
> index 4385c3b76dd6..ee3566b8e57c 100644
> --- a/drivers/clk/samsung/clk-exynos990.c
> +++ b/drivers/clk/samsung/clk-exynos990.c
> @@ -21,7 +21,7 @@
>  #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
>  #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
>  #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
> -#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
> +#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
>
>  /* ---- CMU_TOP ------------------------------------------------------------- */
>
> @@ -2619,6 +2619,10 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
>              "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
>              21, 0, 0),
> +       GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
> +            "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
> +            CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
> +            21, 0, 0),
>         GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
>              "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
>              CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,
>
> --
> 2.54.0
>
