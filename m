Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417474BB269
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 11:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163959; cv=none; b=HtybDOOF1YIWvxlDzkkZgAixNuOZRJqtRQpyqhFYz8z03nbCXR7sbG9GWTaWFYeW4DYSAIF7A/puBqX1MNUd9PwsDpta7muJa7YppiWQydwviSp1mzJ31kuq7TH1nQVIYYrU5/mmoUre8XtwHSlOuqplUwB3pXnE6BoGDwFAH4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163959; c=relaxed/simple;
	bh=qBZsBwNLRX+g5XOly40nZlG/H+p+IdNWLBlhUC/CHn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMxVpYmbSDx8a+u1urK2vXxQ0SxnSeEvoXLoitBKhQbvVMP4GhQGa+YHlrfHr1CCO2MRQttVYONS8Hv9PCM11lbMe5XQWGjSgJz+m79lYNn6+CRGYVtAK2v+IoP9zNiBzLZjx2gUTnozZ82cw3INy4PY4wGec0M2wACrCgEzqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfebso273910241.3
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 04:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163948; x=1790768748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pEC4AigJ1rNzvkNiOygWPr/6PCYaFxhpSnly8JjX1tA=;
        b=NdiCsZvbgttUlPxpr96P5Tf4ibEF9AugoCcqZFR28vjGLmftLlc/pYt6Q0UaV3Xs83
         aUfM7BAyu/1pRFeXL+D2wFqo57pThcl0S3KvPyQW+l3Zvy/v/4axsh4UevUtXCUocWwC
         JrkyhgQcj1ROf8Sm/QrHFA7F0QFywlcK+BQyyJNXhNrEo4Ba5cLokmGy2rM3cvhJ5C//
         tWF7RNBH84gM/rUzVDmto3FfTXEavAGaal5aptzyWu5HQY66OO2bjgFmiAAekhH+f16W
         QDMZC+RBYrmSYsY0nFPITeBHX9kRQ65pHX5AcJUfFFhX2LbnnABzAeTnUVVpUhpPBZHt
         6Kzg==
X-Forwarded-Encrypted: i=1; AKwUvBy46rf6uQ8YuTiRHoy3JoHPNgeMGsUVb9Ve3jrzAcWzjdd1yo00jyl/Q23Qq8HxQKb2LBk0e93hUBo=@vger.kernel.org
X-Gm-Message-State: AFuF++lQFLfVUzYdrCjvNEsexJsv68jykEKRQVnCJOIaLETIob1sWVxG
	kwPfhixQjqWPq6mlPN3vqkvpI1XFHKIXK4MdP//lZWpexMU9Y01tnCpK0HDEgINR8IY=
X-Gm-Gg: AYBFou2iTtsvPUMwrRVk+1U+i9LKSiy++nutJYFE8IYIHPfWCd09xYhnw1eU7RP99v8
	gnI6ylhYHxbhlVxyN4GOmruRJeqyHI0MLWKyXiwkDZZv28L8V84ngc68pF0fjyKZzcGc+ErBTJs
	jql0ceZsvr9r5LVEIpXOdeyqwt9jMI1n2Z0ZMM8lHGa8q8+yet5jlH6hKucsrkHjuRNUwL380Nc
	JzlD+7HsIReLYcuYey6v4syCvmYr0xt42TjotPhFHr2xX3ocPftTasVxKjzMFGZviYTYgGJCUhf
	dFAbNolnLIwn0TPt8v7lE8vIBIvYcmDuws9z5/fpggKmPNQdbERgI3h7RHq4erEfeBLIuVFccnQ
	n8U6A7cVvzMFDXu3fccHgrQIXtH6lKcanhNaOardxv/FxDlVOKKy5JQyMz04wpYcXLhfKcQzwjC
	VI/B5LcBIySlsfHZt4dt9VUVOvcxHeouBgeiDGzVpUlBhwX5uGwuUDbdGtHAj5lPrwdMT9mCoab
	W4StJkpZG1kO/9ZGsVP0roqX6G8hzHRY7HNs5Q7B5c0o2o=
X-Received: by 2002:a05:6102:c12:b0:7a7:198a:c2c7 with SMTP id ada2fe7eead31-7ac1eb9760emr1813089137.37.1790163948369;
        Wed, 23 Sep 2026 04:45:48 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf6087f6dsm3607197137.9.2026.09.23.04.45.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:45:47 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so325989e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 04:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1N5aU3jsWcosWDa5lcbgEPGxE6e2EX9whvsMedSVY+nHN2emsRP7GdzCddJRyBvqaA7g+NSOsREg=@vger.kernel.org
X-Received: by 2002:a05:6102:f85:b0:7a7:198a:c2c4 with SMTP id
 ada2fe7eead31-7ac1ea9919bmr2233594137.34.1790163947325; Wed, 23 Sep 2026
 04:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:45:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_jhgBFpUUBzYb_U8sp5u-M=h=4g87iSvgBK=2VULGLA@mail.gmail.com>
X-Gm-Features: AclHuK_h5MxsrDxhcMUS1bBcJVK5M781CZwgtQ6JdKTzUMPjzqK2NUlscu8dT_k
Message-ID: <CAMuHMdX_jhgBFpUUBzYb_U8sp5u-M=h=4g87iSvgBK=2VULGLA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: Add support for RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC,
> including basic core clocks, and SCIF2 (serial console) and INTC-AP
> (GIC) module clocks. The RZ/G2M v3.0 CPG is similar to the RZ/G2M v1.3,
> however it lacks some modules such as the FCPCI.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated include path to CPG dt-bindings
> - Added Reviewed-by tag

Thanks, will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
