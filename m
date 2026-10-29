Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793268694;
	b=ATuk1zV+C/wAfhU28XTzvpKBwt+zXu9g+tR5Oq8PubugXmWFpOB1cYhwnXfYyt3zyKhm
	 Dgvq2BKvx0fd+NZTOfHUCkjt1fbAhHMPA2YD39ECIzfTzGpQJxTk+cepouYRoNRbFuNOJ
	 BH/IHVqk3sj8nF1J7ICvcbMJAIjjUnHudWUaRLpPfKFiE8gTfAGaUSH9bHaRQUfPF/AkQ
	 Zq+bkzS5g9TdIKCOxfd5kxfrWQHk8xyG89jAQ75EZamEQLS9xm3H67qOHfJLMkBDrpWi7
	 0t2K3+Ad977KWLtcfjAr9Kk8cEjljzhBxm/y9ZX43Ane4ADRgeEEozczMZao0xTSy8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
	b=L4VcCURQ4ag9Q8/xYsQtmhqzD/XIwOcNv1XfDcx069FnL1XKz2GLa02viZjrYVaLWavp
	 69Dh2iEaO5Ac1JApnyGHpPPYhj4Dh74bbT7e3mkvcq8mJPj+14xtCg2pl+AGf4Fo1Cn5Z
	 dlhJojWpOa6TLLQP/Kqc107X90xcDA0F6563ePdIHuTiwdxNpJ8epa1QZZewza3jCwzAJ
	 y4qTFfWqK6mxInHE3BRGk0mComG9AMexVOrWZpgkvGBRk988O/EqDl6tXK/NmoktBQ6Yp
	 IeqMU2KpH4PVhEueW8Qp65YpDtzA2jzEnmj4h0cNZWJyRPfYYu8svLKpTUngOANOUxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+uDtHfY;
	arc=fail smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312B5606A31F
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 10:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 312B5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+uDtHfY
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so4204082eec.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 03:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793268693; cv=none;
        d=google.com; s=arc-20260327;
        b=BhBfdxdErM9xjji0sDcspAMtDRx8g+V7WDy1r49YB6f80zWqfi1HYx3y2GkKUpchse
         xnYOBmWNjO4/xCHX8arz8ywjhTAhO+bI3+NOO2juzcLGndhT1MiJXIDD/nYqsowVmNjP
         g+HAM5OdnUoBLngr/qByZaRAHk+9NPCkqTtEWTYJnz4fiwbjQs82zHd+jAP9okK2dowv
         16N1OS2cfjhfSSUeT5KufHpXpjMPnDeby8W/25b/1p39Mr5VJO+GLD2kX9IFOFSLTDTE
         jVJxFg2BJVh9HrPmbAGhpbPOROLIiYar6QucxNVZnHItRalvj5x5lOfOcNJy9S02rn0K
         aRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        fh=3Lo0V12h0LYwddgR8HgvD0P6/Pg9TNquVaavws14Ol0=;
        b=h2teHDCxha58VKj3fRI8EG2EF0izD+5PXqyYSwCQc6MUONvE931qKBH5Kls3ZvhyMY
         SdzUM4SNV1UAn21/JrQJnYBpymlP8mhST16+XlGGcZHdXGbY3tGCb30K9dvfio8dAokF
         fEMHDBOygqhgV3bYepxwLOSctTgvSz6h5LqN5cMYkwFFfxRmcggSGL+teYokQ5Bofa5F
         dYeqD/+mC+lKtJMZb3VOncRiExEoYY2jk7FnhcbX3Zx2Quz0gGjICC49ZQb65DtY0hX3
         A9f1XnTzEgHNScKQj0ZAg2mHxjvAk2g2cU+FSYINJl5+CkenuKgbf+7G/4FwJ3FfyRtm
         afZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268693; x=1793873493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        b=m+uDtHfYNrebraUeNO71Kwkxzuqpdu3zCHQC48XO/a+1chRZiH7mHXPDqLP8HQ2yiH
         Tr0GNTkJJBfuOJDO/AX4VaktcSnRFMWJDv5mItb9Db77+hvYsFIxDorsRWc563PDbMSC
         WFf/XcMi0JTg23ul4cIHTqnY3lIIPwrFyN6/bltmGyVtwoQ6kqzgzklFux4nuOjGKS+i
         tPeerm8onxx4BYHYLafWUxDHX2QG6ZEOT640AX6ke/L3iW4tOH5g27ApyIfQllKU9Y6G
         y8HuQZBr1vP3B3fbPuvMufo+5KSREll/cupagNW82ra5HvG1N466DCf/4msA6IkJseEM
         2HBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268693; x=1793873493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgkJopx5kExqkUv6b/vCU6btPQBGSF/P3vuAWpTWJb4=;
        b=c2kp3QzCcR2iaSWLXtL8ccnsPr7LLWdERxwmNKPPUUj6d3m9tthE7ttdIm1u7v2Iox
         ME7emj5RKBWS6dNvkJ8bnZ1/84vAl9GCToYOq/cJ7uqda2tANsL8FGRkWF2o1OFsp0Ze
         c+MsAJ/CnZ4OBwPlMOLvaLs2fQLH6RjZxl+RRnkB9oddepGxaZBrxCu/hwgP2rpH4PP5
         aflY9Z3Bn3f7ew8+uj22QhHyTA76Iw/ffjlL0DbBMs2ORT/0bAf/NYxtdlcTNcihD4PJ
         ynl5Z8Bl/xcTUIEhsbldmR30QqOFNY2Ofbjinl+8u/8ShQ0ILiXEOZbqHyhyMgfOTN/W
         d98Q==
X-Forwarded-Encrypted: i=1; AKwUvByvGGusydiKPLx61lJrScHkm7pzqqTdunxI3ACU4n1o14iu75GdkaIcXq6E4vp0uWvTTq/VoVqT1xM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjAw4GCS2CONcENm/nVe2AiutKn/2mFTHJkjIDTz+MKkMqYbPV
	2xAM3NVm/PAPfrh41Cm4dMqD1TmS1GwwFG2u/iRwXE4/VW9OVcry7YPj3B/K0MsDA+6sDTsBf0z
	fbiApAvEkUXM5njaj8iQDDR8IdLWLZijI8U54
X-Gm-Gg: AYBFou2+dkVl9UZk89fNcmNxZ4yPgu5yJcMpN4nKVLg3BrPNNuWsMoLCWHYS20TwAMz
	Opf4iZsMx/64PfX0U4AiIHQK7kLS2wg4Q/Z9iL6Qr+R0mYCrt4Jfw1xH0RR57NRA/gAQlIq+u9K
	U+6CTPkFcZISf07RJXHYoZsS6kiH1DBw6TlXt4GdZ2ObrocXGSWrJVQTZ1xxvhUq3+Bov7oaWq5
	SmObZetWgC5s1Y0816mrObSAaXMZxbIcVnAzKj3QT8GhBANVdMdXEK5856oyjDnM7OlnA2mlf/v
	RQznYo+WcsOLvk/hcBdnV+fAG0fG+fzE9+fMHgeQAxdnqwhvfLYe5ck2IXK/qNjqIs7qCisIDFO
	2xbZFq56A39wvnNBwGp9yGTVnJstidijI5Yuo2OKCQkCsBWJ4FRsr8qPaxDDbGev64Lt4eg==
X-Received: by 2002:a05:7301:618b:20b0:366:83dd:46f3 with SMTP id
 5a478bee46e88-36a20434490mr7778201eec.14.1793268693130; Thu, 29 Oct 2026
 03:11:33 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-upstream-speedo-t114-v1-0-81457cc9d94c@tsv-stahl-riesa.de>
 <20261029-upstream-speedo-t114-v1-1-81457cc9d94c@tsv-stahl-riesa.de>
In-Reply-To: <20261029-upstream-speedo-t114-v1-1-81457cc9d94c@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 29 Oct 2026 12:11:20 +0200
X-Gm-Features: AclHuK8_mii-vqm8jDLm-mNdMkH2Er6-ZHBho7KaLFga9WcAe3FyT06Xlc5Ki2w
Message-ID: <CAPVz0n3tFvEycAAhjA5ZqoBrx8MsJwDuBssAzLMrFnicSQ+eMg@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc/tegra: fuse: Fix Tegra114 speedo fuse offsets
To: admin@tsv-stahl-riesa.de
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 29 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
3 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> tegra_fuse_read_early() takes offsets relative to the start of the fuse
> words at FUSE_BEGIN (0x100). When the fuse driver moved out of
> mach-tegra, the Tegra30 speedo code was converted to such offsets
> (FUSE_SPEEDO_CALIB_0 0x114 became 0x14), and the Tegra124 code uses
> them as well. The Tegra114 code kept the absolute offsets from the
> vendor kernel, so since then it reads the CPU and SoC speedo values and
> the A01 CPU2/3 fuses 0x100 bytes too far.
>
> On a Tegra Note 7 (Tegra114 A02, SKU 5) the fuses at the correct
> offsets 0x2c and 0x34 read 718 and 1156. That gives CPU speedo 1742 and
> SoC speedo 1156, which is exactly what the vendor kernel prints for this
> device. The current code reads 172094 and 0, and so reports SoC process
> 0 instead of 1.
>
> Today only the reported process IDs depend on these values, since the
> Tegra114 core OPPs are selected by the SoC speedo ID and the CPU DVFS
> tables apply to all process IDs. The CPU speedo value is needed,
> however, to compute correct CPU DFLL voltages, which the next patch
> fixes.
>
> Fixes: 783c8f4c8445 ("soc/tegra: Add efuse driver for Tegra")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/soc/tegra/fuse/speedo-tegra114.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra114.c b/drivers/soc/tegra=
/fuse/speedo-tegra114.c
> index 6695702bdb4c..1e6c2b5be759 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra114.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra114.c
> @@ -14,6 +14,11 @@
>  #define SOC_PROCESS_CORNERS    2
>  #define CPU_PROCESS_CORNERS    2
>
> +#define FUSE_CPU_SPEEDO_1      0x2c
> +#define FUSE_SOC_SPEEDO_0      0x34
> +#define FUSE_OPT_CPU23_DISABLE 0x16c
> +#define FUSE_OPT_CPU23_REENABLE        0x170
> +
>  enum {
>         THRESHOLD_INDEX_0,
>         THRESHOLD_INDEX_1,
> @@ -63,8 +68,8 @@ static void __init rev_sku_to_speedo_ids(struct tegra_s=
ku_info *sku_info,
>         }
>
>         if (rev =3D=3D TEGRA_REVISION_A01) {
> -               tmp =3D tegra_fuse_read_early(0x270) << 1;
> -               tmp |=3D tegra_fuse_read_early(0x26c);
> +               tmp =3D tegra_fuse_read_early(FUSE_OPT_CPU23_REENABLE) <<=
 1;
> +               tmp |=3D tegra_fuse_read_early(FUSE_OPT_CPU23_DISABLE);
>                 if (!tmp)
>                         sku_info->cpu_speedo_id =3D 0;
>         }
> @@ -84,8 +89,8 @@ void __init tegra114_init_speedo_data(struct tegra_sku_=
info *sku_info)
>
>         rev_sku_to_speedo_ids(sku_info, &threshold);
>
> -       cpu_speedo_val =3D tegra_fuse_read_early(0x12c) + 1024;
> -       soc_speedo_val =3D tegra_fuse_read_early(0x134);
> +       cpu_speedo_val =3D tegra_fuse_read_early(FUSE_CPU_SPEEDO_1) + 102=
4;
> +       soc_speedo_val =3D tegra_fuse_read_early(FUSE_SOC_SPEEDO_0);
>
>         for (i =3D 0; i < CPU_PROCESS_CORNERS; i++)
>                 if (cpu_speedo_val < cpu_process_speedos[threshold][i])
>
> --
> 2.56.0

Thanks!

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988)
and ASUS TF701T
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
