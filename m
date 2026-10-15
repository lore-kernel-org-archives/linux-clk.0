Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3745199D
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083444; cv=pass; b=TxP2BVdQ3jlEkTkP250EKHngEgXyNx1F16Hip7sqWFdULl3g5mWdB16jNyKRnkKroh/TqKqgggKbSdhrM4ONn77l9DaEp/W3UixBj934BJx+r1USd5fiMoIC9qzpUDugEArxbnQ9tj5cS4+LsMgsHhIFR0RuJ4FvdWJqlMOo+R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083444; c=relaxed/simple;
	bh=Wcbn2GcvtLQUEORhzyW6dd22VWzNNL8fogxMLhwJTug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw2bUHsmIxSNFacdwAQIUUgTXukCkvoUFlR3mjR0Lg1yvQumiGRcDoGEpZV1dOAhVdjjGnaixJyCAFmgRleCY89dhi8p/uKMXxDnmObeBNjhxFNcMU8Mnm2PH3hdB0M6f1XxaEnQKvWnDVQu5khBQTObZe5V0h+80Sto3VNLLmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br+RCbLR; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br+RCbLR"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b0a28a720aso40153557b3.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 09:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083433; cv=none;
        d=google.com; s=arc-20260327;
        b=ADBGxkR6sEXMZ2+UaGxY4DDgQQy4Yyq2+ThkQdE2qYOsC+y7FLQ+CaV53oANBDzx0W
         GrfhNNMFFq6It2nCQF5RlYnubogmRYP9Cv6jJQ5747O2Dtk9cwSzN+3Li+Oiw6xUecL7
         KQN1AAq1HTHGIV1vjtdsjyPIUtPwjAwWqrK2qEdmDqzpVgmuQb0skkCN0TBgQg11w0V2
         d2UsEc/S6hyvbosRddm3/OugOd+STig/sv7xNAHjz0O7gZGXWIafTr7p4RvVjQPVSSUO
         lxVn6qHTIvfiDzBnV6mGYwAtJ3n3EIkIObmC8gLQQsQ9zaU6H239jREIOI/hOVmsHsVw
         9UwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        fh=ZMCNM0lbZpu8RorTO4XbWKz8XCNReo9DpIMQFvxj+U0=;
        b=HEyplm8rW57G+HSkpb2Q/lVr4IB28+8LnWaApwkaE0UMV+ncCDM6F74cxPlL5JB/yL
         35lntp9sJ4AmzzZdOI5aaalwZE0QdBwLQ7RlLFP0+5wmMHL71D3Q0x03txqr3ZEEQU3y
         HPTvF52oYydSQmmqCQrxhWV44wbUhW/h0yOdxpJbl/OQH3HISPPQ5PKX3DhBFVLDaFfq
         F/LifZPsZP+7olpU05qacf/IVvWM7n0X6NHW9tek8e1MMeEW9fEL7teATRg8FLlktlhg
         kvGhh/HKe94HJM9dQSKPJbW2doqA7nCCIFVEhRDPOi24n6w5EE9SHBMFOoVW/vRrmG4b
         qXRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083433; x=1792688233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=Br+RCbLR/6rPCXJJg4Oo88Zqq8MXiDJVoz2Ueqs5o4orhvEftl2XOsWOQKNpH3NPhs
         mDI4hXSKyiKvNJoFIRtL1exi2pqxKZ5fsSiN1hn/La4gzq/sKV/H8q31Dle0FIYlnrhI
         vwwdiTy8pOze5g/73tJWlCBuB3nObg4CN8byXxh+YH2Zy/d2EkDWYbPisLVLggRJuZy4
         jYQyTfH9w5HiFTZulDhkbmy7Ghw2IEzRrZhOJBiejB9S7lC3O9A36CWEIOFULKu6QmkG
         UbKyRTbAHEcB/K+kBqmcCKmGtKhrArb/X1FPtORMf5P/ThH4/gsAjzmQMOtSZe5JfBLi
         R2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083433; x=1792688233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=wbqLuMwYuD32LjG5CKYBijibDwDkRypnhcyLt7UARg8tb4eoVa/RCCyBB5ewWY7U6E
         zlJIgoc+9e6c0TPwkFNkevCmPdVvovflbg8HWSEev9to4isRt6VDYT+N9R9lN2Xrr46q
         c2DFHpoBDe/l8N2IHkICAIfax1H4ZMZMVUxcmHS9ycFps9/j9SALIOSBRjsWIcmQWMqW
         a+Jr6MRwarVr621DhhmTFek/GS8zJQHjsLwSWxo+PSTnBWXj9lv3dHuJYRBXVB42S93n
         h8Eh74byRxyApmW4uyZUdFfMCDoEeysqLzaYu0f13CBdoSN1c0mI1Nc221phd05+/lhO
         f4mg==
X-Forwarded-Encrypted: i=1; AKwUvBw/1lCVPpitldrGR1dwxeoAgl4wtq5Yqmm/ec2TQSAuW3aFTqmjR+1FOw3MUEHP+HH33IttvpY1SEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLMpBn06am+RfeB7UM3415SIsChfV6cBg1qZq6o1LtUSAcMr8h
	Bw/fnjS8+cOBou/pKFu867Pkg53Q4Vmfzzm2UVXKJ4GgJJ+EjTL3ypBUJYHlSn9IagB6FxuSUP8
	QANYBcv82OIAD75m+8lMaH+OLbACvS5Q=
X-Gm-Gg: AYBFou374EjvEWZ944okJy0tLcJFTcRLQ2Il7b8PnuSCLXwqWfDpotRR+sUl+YIppaF
	pUzGBwdYZ9A/HDqf0Vr1Cpe3EUmRAZ9j7zACPfqlwXc90NjwsyTFtLGSRRi2oL9ak8VuNZqCtCA
	gnpNJFebNw5cJovl+s25RwVFTwlrY63KJ2Jl1h1Roqc4jRx+89V0j67agykpAMKsq7y5QTZ5J+H
	ppZADydTgQBzhIwFfIh6fyxnj5LHzdniehiXLycF/WZrh9MR6QhMOE/912eLj6iqUTjowZ0bHcH
	EMs7lN+i7tfpH/n5SBULwrnwOY1X41u3SlHqHhsardvXPt3auDrzz/rq
X-Received: by 2002:a05:690c:fd1:b0:8b0:dc44:9258 with SMTP id
 00721157ae682-8b0dc44944amr6439537b3.10.1792083432951; Thu, 15 Oct 2026
 09:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:57:00 +0200
X-Gm-Features: AclHuK_UaTV6-y66kPO6og4udDg5dfC89mcLvyhiRip0upObtlxnkinWliLQi1M
Message-ID: <CABdCQ=P3bTmc=DX9zG6ELV=zsTmzDFsZyWhLCWnSwSeHP101og@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: spacemit: rename to generic ccu aux register function
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
> block not only provides clock and reset support, but also the pm domain
> management capabilities, so function of aux registration is being renamed
> to a more generic one, in order to prepare for future addition of pm
> domain driver.
>
> No functional change is introduced therefore.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/clk/spacemit/ccu_common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu=
_common.c
> index 8696bb9cba2d..56f3d081857e 100644
> --- a/drivers/clk/spacemit/ccu_common.c
> +++ b/drivers/clk/spacemit/ccu_common.c
> @@ -79,16 +79,16 @@ static void spacemit_adev_unregister(void *data)
>         auxiliary_device_uninit(adev);
>  }
>
> -static int spacemit_ccu_reset_register(struct device *dev,
> +static int spacemit_ccu_aux_register(struct device *dev,
>                                        struct regmap *regmap,
> -                                      const char *reset_name)
> +                                      const char *name)
>  {
>         struct spacemit_ccu_adev *cadev;
>         struct auxiliary_device *adev;
>         int ret;
>
> -       /* Nothing to do if the CCU does not implement a reset controller=
 */
> -       if (!reset_name)
> +       /* Nothing to do if the CCU does not implement a reset/pm control=
ler */
> +       if (!name)
>                 return 0;
>
>         cadev =3D kzalloc_obj(*cadev);
> @@ -98,7 +98,7 @@ static int spacemit_ccu_reset_register(struct device *d=
ev,
>         cadev->regmap =3D regmap;
>
>         adev =3D &cadev->adev;
> -       adev->name =3D reset_name;
> +       adev->name =3D name;
>         adev->dev.parent =3D dev;
>         adev->dev.release =3D spacemit_cadev_release;
>         adev->dev.of_node =3D dev->of_node;
> @@ -165,7 +165,7 @@ int spacemit_ccu_probe(struct platform_device *pdev, =
const char *compat)
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register clocks=
\n");
>
> -       ret =3D spacemit_ccu_reset_register(dev, base_regmap, data->reset=
_name);
> +       ret =3D spacemit_ccu_aux_register(dev, base_regmap, data->reset_n=
ame);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to register resets=
\n");
>
>
> --
> 2.56.0
>
