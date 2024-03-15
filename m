Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F2350A7E
	for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 18:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710528878; cv=none; b=Ym3vchrRLMP8StvA8D+OpxTYu4r1dZXEEUAguQbJIlrhtW9oIoqNnLyLcylldjHRWcQbU6rej+Hz/H/jQL52t2xE3u3nqwHepQosgxsTDEbwQSOKbtWgN4bIRyuvWLBy16SdKCxS0dhgJOnCJvt4/AzekHubyFhuj8/rt+GSHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710528878; c=relaxed/simple;
	bh=KW4wakcjnuKbRSjOEgZl4lW2AZACO4wTscoGG/mpnXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egWkzcoTi4YVlwC1n9h+TtG+nEXxAaih1jNYTox2XlCox9G0Opkcgv5hYwf/3Vc/WTn2AXrgNqd/L1uakdnVX2AuzEKNA0gzkdC9nJdDkO+U4TvQHUhSsgLZgG9RaoXuplh0Q0hAPDdFC06qOWzBKMoJgsB/PgHrAUx4qOyNLtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PpNcbE1A; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PpNcbE1A"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d27184197cso29602201fa.1
        for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1710528874; x=1711133674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ATHLM2mB7/uarmSrYlojtclecckho1jASanaFaAquaQ=;
        b=PpNcbE1Aiyl69XPMUeKYYt+aAhNfFEuc2cThdqgIWeCmxN+rFfWfKu+Ia+/hwzdyy1
         bNeAi+PsGnQexLigqE/43febV7WAA0l2PiW/juzBlJCMhCgUeDxNmNCv6DT+kqhEHSI8
         Bpl0WTHuL9Tg9NJfrYFrHZsUDk7UmrR9xpB7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528874; x=1711133674;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATHLM2mB7/uarmSrYlojtclecckho1jASanaFaAquaQ=;
        b=Q2Y1yEHb9WkEXg0AElCRkJSvdKWgF10XyqL9KX3qvnxtDIlC5YZk0Cv2HEhuBpMQJ+
         h/xA1k7ajYKaoGYML7zJ8VUXYZsovuUJ6VoQWHVhaP9vp5ZEo32uJq53p6rcIWo39IoX
         t0EHOIr1TmJMozszTsPCPPz6znXRrNc35hauQp7J0uU+aWZti9Jk3vSGQHZggOBd0Ym/
         K+54PGxMuAJFv/L3KFdH9hdK1HEsk4q9smyHo3LlA1+GIeCBB7wDTF4zCiZz6hke9tOG
         G1uTzbp2X2vcULG+Kce2n9JYfNqT0OcdRYhDJV/L5KV6aPefXK4JzzBVmXSTBlAOM6nb
         iKjA==
X-Forwarded-Encrypted: i=1; AJvYcCX7bLICZPegffieWFPPDHZBPrAbyI9YdWOk0Xx4tEBbAOdtYZnLSHzibnmqPtKw2DFMSkWA1ukV0zVrQsYSEIZsTJXPNy+TrGXv
X-Gm-Message-State: AOJu0Yz7vnS1w/znK2IFmT7i76FXD2bUVHZqXC1VG0wOAMVM4JaJuWsm
	9Ui4ToZi06u2iV9qcwa1DWrolvAym0ordib2TnZ7sx2Wr+r5+Np3ca3LYLWjJuidhbyJrxAFM5t
	lIwgrgg==
X-Google-Smtp-Source: AGHT+IHFm4zcIcz6bnunJWcK6Iu2wVDGzEwZD5Nfon0RGsHfFwyU5qwKADzx5if5X7049sJnoURowQ==
X-Received: by 2002:a2e:2a45:0:b0:2d4:5743:60ed with SMTP id q66-20020a2e2a45000000b002d4574360edmr4078499ljq.44.1710528874443;
        Fri, 15 Mar 2024 11:54:34 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7cf09000000b0056671c5c1a1sm1901797edy.80.2024.03.15.11.54.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 11:54:33 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so3305161a12.2
        for <linux-clk@vger.kernel.org>; Fri, 15 Mar 2024 11:54:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVf31fPh8KzdpqsFYH5VYLeyVPjk5sW5hUbRPJjvFDJwHzVLi1dI9XLY2Ht/L9hWC58uGE4y+5QB+E6Gh5D+m0+rjYZPVL5x6WW
X-Received: by 2002:a17:907:9709:b0:a46:7bd3:c7b2 with SMTP id
 jg9-20020a170907970900b00a467bd3c7b2mr3449508ejc.5.1710528872728; Fri, 15 Mar
 2024 11:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314194324.2487618-1-sboyd@kernel.org>
In-Reply-To: <20240314194324.2487618-1-sboyd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 15 Mar 2024 11:54:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=whyY_-NnDZ+GhZjJaLqORcuwp_Jj=D-Zjsk-cwZp7YTcA@mail.gmail.com>
Message-ID: <CAHk-=whyY_-NnDZ+GhZjJaLqORcuwp_Jj=D-Zjsk-cwZp7YTcA@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 12:43, Stephen Boyd <sboyd@kernel.org> wrote:
>
> I'm hoping that we can make that into a genpd that drivers attach
> instead, but this API should help drivers simplify in the meantime.

.. and I'm hoping that name dies in the code too, not just in the
directory structure.

'genpd' really makes absolutely zero sense as a name to anybody
outside of that legacy clique.

               Linus
