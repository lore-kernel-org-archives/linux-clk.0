Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFDD341065
	for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776786357; cv=none; b=WxV6tH1jdBSoZj2VThKC6Evh06pjKinAPNl4GgbPPdUgX92EJe2M+KRrXHtOHoQj6Aj2FKc2+c4aa2GWhiwdR3ikm4HMrn17kNB/RCG3KJObk+/oSLW7p3Z/WHq8seDXbk4moTfezGMsLy5IT9Yg1Vpwwa/A9275jab4nMy/6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776786357; c=relaxed/simple;
	bh=hcNZMeNB1znQ+ZtH4lMrooaeaGHq0Vo8IPJt6MCC5Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j1f5SO054DTUgWlnSQ5/RKfXMX6Tqx/0MH+yuTbtSjy5pXdT8I0Mj9+raI0HFQL4t02JgQDsEpwCzfVSWZfzdAzPvqAZIjQPhYG/hVzjFIeIcNoyL8+1fA7ByiYuv1wHg7HbamqYAXz6FnOyzXXJi4P8flNgeeKzzgNPOWXqwws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LvxXQGwo; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LvxXQGwo"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6714fa8b955so7960137a12.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 08:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776786352; x=1777391152; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AE8dreXJhj95HF1iksJS8cjNcGdNHAdhP2BzfSMqmc4=;
        b=LvxXQGwoTJ5a5ytCOA6bx3rBY7+qzM5TdtlCfIywCicaADgx0mFzH0Mx2aUIE386Rk
         KJhLiWWEF0nEHa2xt4zmVsAYQCQux9OKYlEiy0NjyCpzkoIvfiqqYd7qHcjAoYvUn021
         Z3TNipfcB8sUIKfL/zebjOBWvrA+ZxBHvsDGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776786352; x=1777391152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AE8dreXJhj95HF1iksJS8cjNcGdNHAdhP2BzfSMqmc4=;
        b=oojo91Z3QppEuRjzEp0vPE+8Cm8T8XnbGk/ngYKHsBV/15qJ+qU7AwskklYN0lfmc/
         EIcQ35gp/UHzXyJGPWKxVcnmWOO3vEyDcjpkQKJuzKWC62fpGeFsb5MHyVtWRooMylOH
         GJiOFw6QZB0ZmG9jOhIhZUZGnIyqny6E4CGbjwDYFw5wUDLZM6s6j0YI8DsMdbmRE0ik
         BSaLBKnc8FbzclDsNzwW5bsfbLZdf8UMaErHBBTtEOfz30LStkJP5gO0RAlqh8SXQ3kw
         QQeWEvbd4Dphlen3wanSReV6EFMo7fCsrp4PaRJooGNRAe+hHdKxNVJaYqcmJuyIRmFn
         l1AQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Nx8w8izNyUxxaAx6wb1rmlBMe4eAkov0CeluO1csXf0yTtDBGAbeF9Vg8IN+fUZ6rxOGG//R7vJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU4bxWhNkqtlSsYAirG+l6WTmUJ0a6sz2WSGzH9N4DLvjcGmI+
	BwumkeqxN9onn5XVqypcyCI+olfUjANcXODEa3tRiAZJJR8z04+LwqkWURqbwVoq/7V4zKIpkE+
	a3rTunvk=
X-Gm-Gg: AeBDievkCa3L9iQjl28YWEn3px7QgwWWVXwdn68kV039igOfiGC8rPyACX4AuTu0a7/
	IJ3vmbeLMphBbyTeRMk1tMCFPLh4Q4w0/s96IJ3m8aDHPky+SSWIAx4di3YNzzV/s9OEr9AOkb/
	W2J+yanaXMlmRbNwN4YkTsGCh/66DatzCC+Ki2gKKmKvulD2ia0nnV1mpAkbJOya/dK6NNSBnAt
	WUFqspqcTupt8dYGwvKDsFeNBBWMjsL02fiZUE4Xddm28zyzOs6uuwHWOkzdRNaaUy1VhArYF6p
	r4WudYXgIiLn5X8iwdXO4j+DrcoY6LvY07gXjZU78m3Q8oC3Kj+54YtAtqXqSrizmCHaR8WCbK7
	egof+QJs2GDZVQ8X8MRg738GkY84lxKC38O+J6Cj9Ex+BQY/4+zhn42kfKCVOSujdMRLjknMSvg
	HuAxsUCIOwk5HXyncGp5lW2SXXSWJ2/r3H3EUfIJMtc0NdxbsdhYGLwcjTWuhnRpANFsdUfT3k4
	IxTYQudaio=
X-Received: by 2002:a17:907:2d0b:b0:b98:50b:e94a with SMTP id a640c23a62f3a-ba41c2ab6c0mr916496366b.16.1776786351890;
        Tue, 21 Apr 2026 08:45:51 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b908sm457913366b.34.2026.04.21.08.45.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 08:45:51 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6714f678bdaso7277372a12.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 08:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/qlNXhNFjLecqxZ9+kVMxUPRIsXiW49AAhAJRind+jpKVDqy/X4ahXJ3wwBUbALJpen5Lj9fW2xFo=@vger.kernel.org
X-Received: by 2002:a17:907:1582:b0:ba3:6377:860 with SMTP id
 a640c23a62f3a-ba41bad0175mr613945566b.3.1776786350816; Tue, 21 Apr 2026
 08:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420183208.2287306-1-sboyd@kernel.org>
In-Reply-To: <20260420183208.2287306-1-sboyd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Apr 2026 08:45:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKrwKPye8PRhvHxY3DB6cq+_Xby-OAigJOrcPHEZbDjQ@mail.gmail.com>
X-Gm-Features: AQROBzDHmwsd_pF2ehgMCD0fwCYaZ9P1MveO2PDEeoO0IgsiKEjSm7RKu7FhCvg
Message-ID: <CAHk-=wiKrwKPye8PRhvHxY3DB6cq+_Xby-OAigJOrcPHEZbDjQ@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Apr 2026 at 11:32, Stephen Boyd <sboyd@kernel.org> wrote:
>
>  179 files changed, 19422 insertions(+), 5066 deletions(-)

I get something *completely* different.

I can approximate those numbers with "git diff -C" that takes file
copies into account, but your summary just then has "create" and
"delete" lines, nothing like

   copy drivers/clk/qcom/{gcc-milos.c => gcc-eliza.c} (74%)

to indicate that that's how you got there.

I do see the

   drivers/clk/qcom/{gcc-milos.c => gcc-eliza.c}

in the file listing, so that must be how you generated this diffstat,
but your summary is then very misleading and just says

   create mode 100644 drivers/clk/qcom/gcc-eliza.c

instead.

How did you actually generate that diffstat? Very strange.

             Linus
