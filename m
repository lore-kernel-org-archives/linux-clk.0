Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62954CF42
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 16:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083543; cv=pass; b=cOuoFSnXVzQ5QSQFmUzhweL6s0Gh+5RMJ2JvY21uEXJIEnHdlCbMnwnp2eg4qG6uaYNsWgins1yR1oy3DpULTq++DIdBOPMiE2E8rwPP0j2BMe6IF9J+chWKAynGb0xBOpCoO4Nk3PW9DD4KG3sE9La4ZdbYK7DzJIiAGhEy0yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083543; c=relaxed/simple;
	bh=4m7SBHHakRxvWRxrFM8W3RjKHQwaQaOVYLNHKqhxYcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AuBhX35eKW+jJdmcnlUBSVePkERtxJkJ1uSEq3ueXadXU8Ro6huEunKDSBDbHQmjft2Bj5cDaGtlvH+pohp0Rloe7d/WLQ7RxqJXlxAbKY0SLPcV5mbH31yuZhwm8mn1gPGpesYAQ3r0IwxhMW5cHWI7ZWhfVqId8gUeFcz9E/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URfS4aql; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URfS4aql"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ab395abf79so44909677b3.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083520; cv=none;
        d=google.com; s=arc-20260327;
        b=aYvHLz5sIsVEYwiCuS1IF7i4PtiJu4328OO2BrVNwhuI8D8/ELBspBgJ/+JObsfA1h
         QeYdPl4gTYThUMBw++GuMSx8hRhIDnK/IsjPsFaB+o9b5eEEX29ovWJPuuVgCqK/dVAF
         JeYLnA5ua49AxD/3yGpqgL3oqzKlL/uhu7O8Aa3tAr8bh7MW4/gIt+5CRMHU8PbjLFDE
         CCMoYOwNs2hpYbQ5QaRuGJfoLxjmV2CUExBimpSus73a8qI+ywvB5+Z06BYJDvaJBU6P
         yaJLVB0OOtfWLhH2Xk8aWsdFLe3EbdpThsZkQQbdyYeeq64B5HNr+oQmzzJp/Cc5I+OG
         Cl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        fh=3yyKdXSHY7vUVADTgguSIP3CY9K4Sn2UHhdwPTY16w8=;
        b=WTp7edt/e8OqDJAmX/GbHMxMmzvOsT39nWKEUZ8Rod3X6QhhGp1eaTkZbucq8LvWeH
         5wAN0oFwSxmIflMg84wq+wT2ikH/DlBTpCthnwW76yXSEJpuF/ltsPa7cvW0zDfVDGV4
         EohGw89wgsJ1O5sVEsx1RzuvgQuFSoCfR2ieJgFpSu2pKV+/XU8C6gpWryaXbkOXaoUG
         H6nD1JQyAyp9SOE5QLAfzKNtIUa2N45t3U1ATDyVBBBFQbnxuQ5wijsEqhLyDJxfakxP
         YnBAgS1AKTl33R20fjM+RrZ6b0XEHb0fm7LF3w1Tei0DLtBT8DzpXa6ir5Mhx/hFxqJX
         JRJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083520; x=1792688320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=URfS4aqlAzPZx+z0yG/kn68lj30DWGRr7UgAP11G2+3dS4Kr9TwyoVn3H6JroUu4+8
         RtVRw2GE/oMgw6+M24wJQN6GZhJJ9SCzhG7EJAW6O7ZgVCf0NZC79JHnznQBzWt6p/HE
         xB+IITysDqcxQFqQxzSEJdE64Uineo0eFROrOCta+qUnOuKFcFDnhHl6Xng8lmODnA3N
         SRkbv8FtqlyzK3/1fXi4M4d6MW3G8LDOOO/AGlB11wIUrnSxaAGDV0WIVXvEAAXW5EeJ
         bNMHd4oM/c7LRJiC9zV0AOvOMtuAQlaMB3mNCMHdWd/mJ4OSPPKSr4XjoR2KUaJd7081
         0fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083520; x=1792688320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcCmfl6RTkm2LzfDS0fLA+Gp1Mg192MPyS3Ly+HKDr4=;
        b=pDoWAGe7U+FkADiPh5mlTrtvun/RFPKk3NilbPFY50tSkUYL88JqB6sZkxokxKDGWR
         IyZVd+pJaBAHyUoj2DNAmx2L4iJwsZ2e1nHkbQDgzuVSrTj6Sl2+lJet+e1zmfuXuaDH
         6OLfvLtpCjgG1oGRv/E08p92/rC5flVpW520F7e4Q+uR0iOLdvQa0zSfTq0SiD8q1706
         I2imAe5Oa5h0l0715TpofjyBHm+gF4VOAS8CEdnRndUYODaTbjCGpzfsRGRbOyBonusX
         LaJ6r7vST521nc4VPCNNWnwsnAs8yNqgaLRYZU2M8LvddZ/EkUN4kFJMikP0fRETsVK8
         L7fw==
X-Forwarded-Encrypted: i=1; AKwUvBwzEf1DkaYa8KXxUzBKSvVES3Zfz6gUc/G6kRSzZ3I4GcM/W0Pvlj9iLDt4tmheH+8K3K1+Wf/gts4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIK72OCZK2C8cVAYB5DjQZHSP/uoKgemmqwP6cUFwA0Tlj8wOtY
	Aj3opz1ISBs5DK4/8FTJAUk24SNh1xhpiCrpuQAsD17HxQ9IB9T876zh53asRQoFq41tqR091w7
	lbWzHvG9H9OdxaftnbteE6gy/KYE+ZII=
X-Gm-Gg: AYBFou3lpAm7yldMdgU2HR+H4lzbOPjym/1f3YsMhJHviqiPCbCWNF0s9oD0rL9pS2v
	/LZQe62gDHHrACSyDqAN/q7pzpqyAu+q+VKmmPEmWpXQ9BjAAAMX45kAvP/dYqoxS7OzTzymdq6
	7j75ApiccnDx8V/LsaZ0HPK0QdycoTiCTlzDbWUScx506I3RtujTclsq3nbGd2IITHN8TJklJF5
	zqjQGlF+OUZJ/DpfoKA1bV+FonCrAc703jra6B5MsqkDQwYBRwxhJfYxsSnt8OEyrTkyUWV5lCu
	h9J3nXl8QzNYHeeWExjQyaKSjCPBAc6ucfDys5LKo9Y2dxDpuFFL74LK
X-Received: by 2002:a05:690c:4006:b0:8a9:9f40:24e0 with SMTP id
 00721157ae682-8b07edc853bmr64426667b3.14.1792083519586; Thu, 15 Oct 2026
 09:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-2-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:58:00 +0200
X-Gm-Features: AclHuK9x9oH7LPEYYVfq-eVNh1cOyJug_mdtxh9957qtgQ6Mf8exPEfJOQrJddw
Message-ID: <CABdCQ=OFZw+DnejaF4DothYGX=u=pTEgc3Gru09En7ApWHpCLA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: spacemit: register pm domain auxiliary driver
To: Yixun Lan <dlan@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alex Elder <elder@riscstar.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on OrangePi RV2.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 4:58, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
> The APMU (Application Subsystem Power Management Unit) register region
> block contains the pm domain management capabilities, introduce a pm_name
> member inside CCU data to register a pm domain device via the auxiliary
> bus if that is needed - if pm_name is null, no device is registered.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu-k1.c     | 1 +
>  drivers/clk/spacemit/ccu-k3.c     | 1 +
>  drivers/clk/spacemit/ccu_common.c | 4 ++++
>  drivers/clk/spacemit/ccu_common.h | 1 +
>  4 files changed, 7 insertions(+)
>
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
> index dee14d25f75d..9e2727521916 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -972,6 +972,7 @@ static struct clk_hw *k1_ccu_apmu_hws[] =3D {
>
>  static const struct spacemit_ccu_data k1_ccu_apmu_data =3D {
>         .reset_name     =3D "k1-apmu-reset",
> +       .pm_name        =3D "k1-apmu-pmdomain",
>         .hws            =3D k1_ccu_apmu_hws,
>         .num            =3D ARRAY_SIZE(k1_ccu_apmu_hws),
>  };
> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.=
c
> index 92b930d5ff30..e895d3ee6a28 100644
> --- a/drivers/clk/spacemit/ccu-k3.c
> +++ b/drivers/clk/spacemit/ccu-k3.c
> @@ -1449,6 +1449,7 @@ static struct clk_hw *k3_ccu_apmu_hws[] =3D {
>
>  static const struct spacemit_ccu_data k3_ccu_apmu_data =3D {
>         .reset_name     =3D "k3-apmu-reset",
> +       .pm_name        =3D "k3-apmu-pmdomain",
>         .hws            =3D k3_ccu_apmu_hws,
>         .num            =3D ARRAY_SIZE(k3_ccu_apmu_hws),
>  };
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu=
_common.c
> index 56f3d081857e..38577fb7776a 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -169,6 +169,10 @@ int spacemit_ccu_probe(struct platform_device *pdev,=
 const char *compat)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register resets=
\n");
>
> +       ret =3D spacemit_ccu_aux_register(dev, base_regmap, data->pm_name=
);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to register pm dom=
ain\n");
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
> diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu=
_common.h
> index 8691698e007d..221a92117b94 100644
> --- a/drivers/clk/spacemit/ccu_common.h
> +++ b/drivers/clk/spacemit/ccu_common.h
> @@ -41,6 +41,7 @@ static inline struct ccu_common *hw_to_ccu_common(struc=
t clk_hw *hw)
>
>  struct spacemit_ccu_data {
>         const char *reset_name;
> +       const char *pm_name;
>         struct clk_hw **hws;
>         size_t num;
>  };
>
> --
> 2.56.0
>
