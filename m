Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEDC3B995B
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078543; cv=pass; b=sWQwNS1cFHbU5SBaVTqgsNIlSyN6v14Exxvjbvf3ZtB6ktU+T+1gqZUI7Ocqz5uFr6JGrcOnlMIo9HD9+ZOp4jvb4mP6yVeMHgGilN9m6dMeO6QTVQZAXnfquZafegATH/wiBnajYt9hMzROAPa+lVUAg52QAXC0CnGyKaY5WKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078543; c=relaxed/simple;
	bh=sKJzLSkS9E51xnBmrifkQEmkhQx5pX2W4VuJkWehw4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIZfpr8A1363xKXBKSY2d2of7KEv7eET6ThWRhzv/J11GsYsvh8jjThWj12QvSXMxslzeR8ivFP8cq0FXvobR5FNba2PFE+/z0avng8FQDKD2/Y8TMyyAH/hbdzoCY35lSofw9HbjE0kpDGERKUvGCEo5t1ynh0DZM7hRC3obQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XrtBBvy5; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XrtBBvy5"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ace427b29so800811137.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 21:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786078533; cv=none;
        d=google.com; s=arc-20260327;
        b=nGO4fTOrstsQ52Jc+pm1qGHDkusvSSyOXSiAwspO+qGHPV/wlzq4dc1Xfx9JhkyWiE
         Fph/l2RRw9vcvora5vu3rMUuGMqIhxif3XuWiVi0B+tC1vOK0ASgc622dzhUCDv0/YmT
         9dAJ00mByb3AzXBDSH+ksn6s6F10PWY1uNK8gsiwdhf8VO+4wxZD0E3x3qmeiP2LqkUI
         hsuVpv5TDHAQDhiq70/zKY2V2cbvMxEIbPrvBbUaGzOK4hIr63whSLB55H6b3OLnTFmg
         4GVVoZkvclZmBYJhQSz6wuqLnmWHr7RKlLzJ4VLZDy/cGyoL6O4Xs/su7qenMkigeiK2
         9V9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hr8qO/eFVTx9hp0usiSSQteYMYHrCHh6AB41Nwyy/LE=;
        fh=YTT94tnIpNJTCBEtux+J8OuP074JgWUGDN28PnpLbKc=;
        b=pkahd8UFTSJ7c91w8u3sG3WN/5xbNs/aPwyAem++ucn5TLLBdybh0LDnozvJt49HgO
         fd4WU0u5EBl2kik2nRsrhKdWxDoPIf8UzE9NvKifDzVaugBuP8KHGOz/GhbWQZwfuqao
         +56eGO1Xg5lyvPUsa+P2aTxwUGrDb6qM6nXScoTCmvWU0MRV/wSBpHCloaXvZ6VtqI+4
         AKVbLJ5+gtgR6B2BfYRfRQ92iruyxOIcnvtSxDiTyPd/pw8baiDnGmX2+LlcNm/optuI
         CTU10aT7G+p1SonkH/vyTqbFGmWK7UeDWpmmQiJeyI+9R8+hS9KDb9FTKf/4k1zQ7771
         /aQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786078533; x=1786683333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hr8qO/eFVTx9hp0usiSSQteYMYHrCHh6AB41Nwyy/LE=;
        b=XrtBBvy5feJ7ss/I3OVd0YArKB9zS1hJWgVbgzTe1VC8yClcSm/oyKZ5hGTMfyKo4I
         DoX7/bTDcWcAg5yZhGfT03j31DSO82dxblTy8ILFgnZIz86aUBqcld9xboajz1xEzcJQ
         xmsp6v6wYr3iNnOOiOqd4kwNJUiyY3FqMeDsZLIbXBtDKLRdRXZy2DwB5MJNP3i/qKDe
         kTo4Nr0aEsYe1pANzZWwJBXoIElzg2R/t2cc9qGGHtfAbf9yo6yApCm7CKHBvwwEVhFQ
         RsZN/mAsncF/dgT5QN0Ym3iqATZij5X3WsnrXpwVRx04EhTb262fMbSd19KBI1HPA1lE
         TA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078533; x=1786683333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hr8qO/eFVTx9hp0usiSSQteYMYHrCHh6AB41Nwyy/LE=;
        b=MMfxja6RM5po+15XaAdKe70d/YIxALV6nCkXUbFKZ0jyq7kN5q3hAYl9rlWfYVcRJe
         /gWCvQPkoV4QlUF2YcpFgNEBtGOS8csPhSNgtaL/odkfn2TlivnFPtjMlWoBzDyOGxHY
         EU+rmxgh3ArmO6/p03IwZmVgSrlJCxfHZ1Jkwpvyvqalq+iqwHCxKDkjI/CB1K87SVEZ
         UTcixcvdEvvUKOMlc0HXDbv+69iAPgmuukCpEqk+bdNUPeqXLUH83eQgapc9sgJ41gpl
         ChAU4lf05wKnNYz+X4QqTp/E7ngMGQqur6s2VIjecSC/7VzH2HwJFjofFMKlRIPIeH3n
         LcYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr62NbPgFU44O9dUtsEn73iZBuTyfpTrghv3GjU02pIbK3AscNGiM4Gi6Ir/NG9p2jvvL5yDaK4xTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUJDKe2f3kkQNExIj3dO4kmld2RFxdxqo52WeTtjek1oYCx3a
	ideI/ClGrI81CeNldXYBTQF6Hk0otilvyDvXE3WABb9A0A/dvHh0/1qQgSblcyP77PLWzlfINO8
	0zthpo4+eY6EfM/Xi+uDPcVE+CO2xHHDrkivSQYUjnA==
X-Gm-Gg: AR+sD139xdx4wZE0ReSagykhOL0a5oc4zHjq/w9SceawBZm0pNVKFqT6uHvFjE2iG0A
	7b77y202X4NRQQ+LDlYD8q677KtqsIc8b5vMzhJjo7XxP0ljXJpultAvSGfweN1Pov+sOU/gECw
	KF5xiiiaNpwB1L8dfkwnoT43xX8j6OB4VQK96So8iI6l19a4Nb9Zefa9pbYcAdutsIX5jkdfdXc
	h9c5JuRTK8Uip9jDgXZjDItEFMeo5wSkrM2Hz6u0yOuC/L0rP99yNYQp8KkuD7h628LeptWd0Kh
	3baX/3Vhhina0B3N3e6Yvv4Ly3WEH7H9esvsyLJn9dEz
X-Received: by 2002:a05:6102:54a0:b0:74a:992e:84f6 with SMTP id
 ada2fe7eead31-760e9040fb8mr5391590137.10.1786078532703; Thu, 06 Aug 2026
 21:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com>
In-Reply-To: <20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com>
From: Michael Turquette <mturquette@baylibre.com>
Date: Thu, 6 Aug 2026 21:55:04 -0700
X-Gm-Features: AUfX_mwg8uZRMciarNVr80yM9wYTUsQQ7nZach1val9vL0tanmpjaU6OBeWKAMk
Message-ID: <CAEG3pNBFyg1uWwDiy8Bd1NKJL4VMOKCvy=_VxoKw+eO_hAdVKw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for clk subsystem
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?SsOpcsO0bWUgQnJ1bmV0?= <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Tue, Aug 4, 2026 at 8:33=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> With Michael Turquette stepping down as a clk co-maintainer, this
> subsystem is big enough that it needs multiple people to keep the
> clk community healthy. I've already been doing a lot of work to
> help with clk maintenance, so let's make it official in the MAINTAINERS
> file.

Acked-by: Michael Turquette <mturquette@baylibre.com>

If someone doesn't pick this up and give you commit access to the
linux-clk tree on git.kernel.org then let me know and I'll unvault my
SSH key and merge the patch myself. I'm only a bit embarrassed to say
that it would be nontrivial for me to blow the cobwebs off and commit
a patch to kernel.org after all of these years ...

I would also propose to add J=C3=A9r=C3=B4me Brunet <jbrunet@baylibre.com> =
as a
co-maintainer. This was proposed a long time ago and there was every
reason to add him, but I was inactive at the time of the proposal and
nothing changed. I'd like to make this right by proposing him to join
the clk co-maintainer team now and help you with the load.

Let me know what you think,
Mike


>
> I slightly changed my email address to help with email filtering on my
> side.
>
> Link: https://lore.kernel.org/linux-clk/?q=3Df%3Abmasney%40redhat.com
> Link: https://lore.kernel.org/linux-clk/20260729121640.3864006-2-ukleinek=
@kernel.org/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Note: I made this depend on
> https://lore.kernel.org/linux-clk/20260729121640.3864006-2-ukleinek@kerne=
l.org/
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 07ffdec1c8c7..b9b01a3b70a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6448,7 +6448,7 @@ F:        include/uapi/linux/comedi.h
>
>  COMMON CLK FRAMEWORK
>  M:     Stephen Boyd <sboyd@kernel.org>
> -R:     Brian Masney <bmasney@redhat.com>
> +M:     Brian Masney <bmasney+clk@redhat.com>
>  L:     linux-clk@vger.kernel.org
>  S:     Maintained
>  Q:     http://patchwork.kernel.org/project/linux-clk/list/
>
> ---
> base-commit: 83adfb8e0c0e26f451564779c90798d1d4c13347
> change-id: 20260804-clk-masney-maintainer-7b4349a0f004
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>


--
Michael Turquette
CEO - Dallas, TX
http://baylibre.com/
