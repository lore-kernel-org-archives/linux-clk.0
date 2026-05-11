Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBC53559E1
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514050; cv=pass; b=eAZx1UItyz6RCENOdTf6JkPAsXekNtDG9V6dZ1cXpeiaR8q8/Uj8NJWlJwHa3W7Im/ivKL9m4V3/+Jwz8YzGe6M2DqV37o1Jr6e3m7KgSMCWMHDG1oPgFMcB6qRSzhBtJFiGQe06IvP+Juzmr+8MzyPhjUqs8amD36ADfz1F9ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514050; c=relaxed/simple;
	bh=iCAqFcT9NX3fZjkDKNrQDg8D+ochKGSkZTc2/qvY8WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYuoYS/PbErwpnKB5IMbVld2XxzED8oE7AHJPaH5iu1WybgbHq1xUDBqzjx/R1RPT3ZZ4ZFAmX4BaU3gL8sp2F4/0pN+39WLce/m8r37pA2oCWbBWwAbxN+llVSIH2+6wsykAY2c17p9gT8Dn5QFDPk747o6l0eL2jq5Q7dpGgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtTNE/CY; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtTNE/CY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a746f9c092so7038823e87.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778514045; cv=none;
        d=google.com; s=arc-20240605;
        b=C51s/7fa/wiAzmPKlu/VTw4BZ2YBTarSND+Xmss/MHmYBKlUzXrF7XTsEXZ0jWTyZZ
         hf/LwFa/AiL2wUkpD6CMMylPfmkSzZfgMAltVqtiR/uViWTBy0/MNCxU412kvjxIsQ1q
         PzBR+5zXKrbnP0w8y+DYuK/BTzWSkiTSkd5Z7tXi+yD9BwbprWhQjHjPujVLHQ5G1Gyz
         Nd0F73slJKyO1nB+H+qYjpufUuTt6O3BhmprenjZagxCA40tYXtlg9wr9bd+4rwcmnhG
         n92xPSnFXbginTcTa1BmtNnmToZ8UdmEQveFH1Xk3nRZjUvqY+ZI5wVJ0YHyjGzFdhaG
         Mc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        fh=Tlte7worgTmkGyaxWtv5gA2ISvFv4DO6yMidVD1oRio=;
        b=LBSl4QTng73CCf5hRwDLTzxGA8Fsy6W1KSOsQaEfTAFuGPQsPcYKF/AUgnEPYwlC/J
         TaxJ3vwR0ZcSiBh3pzzYADSrfGhzWrY59QSEW50ao5GYmxtYUFTqlcQrdeqUGcjf4xp/
         nVjiffMo4DCoJ5SzRH7S4b6/dWD2M15m7D97T40ZUzIMeLakcl7T8YL+3einjpd9FQ2N
         0BvEBTY6QYhTciWLHDF4PKJZNmf5yqkGxWXdA4/VFSPrvd8uC7VlAv7WJgdFY2BuPLZA
         EAnh0cxcw84nvdQc2UO0EVAj0CDxhtXYhzBtrn2MswiqNTG0oL0Si1U0KlmaYE/r8YiQ
         sdmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778514045; x=1779118845; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=gtTNE/CY9GbJFWB/1LsKXb/Wpr5w7kInVcfUuphMLuS/53gvK4+hTQH9ixl7vdg/oP
         XB7SyPGemFLi3xo+Wq6zzry6vR45B/MSaFpHmXEoFGtBV4HeXo1kw6iHHnjipPU3DLKQ
         kv0q+U+LPkk5B07pyUx5P/dx/Dsx5uVcY3I5RDv+L7c0F9LfgfqOwnFihNGoqykti7Vz
         nyV9gPEgrCMFooYKB2BwtV3l+P/OqIwulxh3FyZn29Ms3TBl1dU9VLB2SsANOK1Q9QBa
         NClclIG6DxPy6T7sV/U4foTjBgGU1fV+W0WG53HeWYXAQ1Uj3zx/l/CGeCjHmVlmYbvp
         OrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514045; x=1779118845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JWMhWSTBa1St/FT9EYONC8eNpWkZ18pjlnscArsjYQ=;
        b=kKLSo6ZCaPVcOPcUJeSF8rZ/SJoJK1KfPu+33e++Mds980t7B7RYsL8WpmeKo7gEEH
         Pez1nOpzQg6lY+SNM9AIXkHB/FWJz4LVbqC3sKQVzN7mqGl1OWdV6uXgw9KWLl1214eT
         2Cf5++2CGcDkB+rjT+93Zy5ufQ0cynxVVUVmQW/HVJQl5f3ysUX5QQOEU4NZSxC/8DQ4
         Z+Rzt/L/84xtsE3x4ncljv3XPF8J5MdeEOBF0o8BblBt2FgY20eDPCW7v4L1DiTeyhX5
         E8NAhdsMgeW/+TvamVYcvCuNq7egNl9HaWpTG1BuChVZ6hKfW8xMEaMDkpxUF23o8guD
         BLtg==
X-Forwarded-Encrypted: i=1; AFNElJ8aw53p0LOSCBheBpQvNnyKCH0fPZSg3iOLXsUNnskmDodpQNoktRVft38dKp+DqmWUP7lu78QjU2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeICRZfKg5tcIcokgUI3wCi6WtgV+9N6WD+dDqoR25gFyLvIHb
	SITpk4+jR6bGAR3YoIfODJLAFEtrSq7jO6Qi14f1/6UtQ6bGNfhW5w19pn3oOgJFQPYwbYUvES5
	J+MdDnSZZ3RmnhkibJdm7rClXWgn8BVwbSVWfZkptFQ==
X-Gm-Gg: Acq92OHRV6lHakvUOp3gk1GU1wLBTqiVhVtTRvmHzXA/fymJAI3HdTFKWLsBV3iJ8bj
	KAXBfHE+DjFsZDcV3nb1mVpUr17yRZqgxol+fP3z16gpL26pdb7C+cUlYtGMj1kWQVt8b6IPyay
	aUjE1iiyDb3NvXNSmvrXyAr3uRwMraP5StQ9xwYK2BgnPc8r7FV/BdTlaCktWbTF0eb8pMPUdVv
	OUIqIxWPobJskeXmYkHtRHlVWHVI87rzrPEl0Kd5tpx2T8SsnmdLKVMCmmwnuOgYkzLdD0YAxei
	YoZp0sLS
X-Received: by 2002:a05:6512:1081:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a8e0f2ec60mr10052e87.20.1778514045188; Mon, 11 May 2026
 08:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-3-marek.vasut+renesas@mailbox.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 17:39:53 +0200
X-Gm-Features: AVHnY4LEtYRDfcFkDKKMsfq944FdAC52H0vJFxs1kLbNHgSvbuAlOvG-QOqCQEs
Message-ID: <CAPDyKFpO5RyaSGRZibAsygRcfs_En-TohTOrO6a7dUdVdzcuxA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] mmc: renesas_sdhi: add R-Car M3Le compatibility string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add support for the SD Card/MMC Interface in the Renesas R-Car M3Le
> (R8A779MD) SoC. R19UH0260EJ0100 Rev.1.00 , Dec 25, 2025 Notes 7.70.
> indicates that HS400 mode is not supported.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Ulf Hansson <ulfh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - New patch
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index f6ebb7bc7ede1..b716a518f2650 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -285,6 +285,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
>         { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
> +       { .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
>         { .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
> --
> 2.53.0
>
