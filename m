Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1862176AC6
	for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721983549; cv=none; b=uV7aEFnP3QmyeWg1kSmj1U5iM4lgXUd7T36/NhK/clIs/j6j7UdfocUwyRbp19T/tkf6pANko0y9lejKAYwqefpY8PNPQckWJZW3dD113DpwvVMzyuu6OcHVd7MbP99VyKfh8oTsWv2BVhAmkeF/HT0hlvZAc4rpLjHPbOTWRnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721983549; c=relaxed/simple;
	bh=cpFuacOOU9PyOYqB0WWoaM9Cjcgmb9kMiCLGqJP8J2A=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pKNIzZhd8Wq9wKpi6R19G3IZiLAt4QXcJhhWSGt5FwAjS1V8XUfhrT534d543CPS0ITj29w2gxb9PzBYADh9xU5QhIIx7zUdOcEihoWeKVc2VgsN9r/Ohy3RtQqEBLdN2ItDF2D6v5MZ5sCSgd1jyRswl0o0Gov9FNZfOVv54/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=bO4k0fkB; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="bO4k0fkB"
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC9963F48A
	for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721983538;
	bh=cpFuacOOU9PyOYqB0WWoaM9Cjcgmb9kMiCLGqJP8J2A=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bO4k0fkBQRe173m3CGMT0PkuDlWQf0DRFORGVfmvJ6cLdIAMdDmlabedI2uoD7LIn
	 3FVUGPNjv7tIAjP7GLndUsNIxNiAyit4TuL37W3iUNKONaWtNmVqE4JXayJeCj2dXj
	 l6vutWhxz8LuSVhqnwiEyxMeC0bRScka3j9jZJn4t24hY1FQX9xq0/LkDZqednmL3g
	 WBu8On4K3XeSgnhf4grrQ1/GAYsHR93E3s4mQKpB4TybMPA/DQeI19CDhRi4BxclGk
	 t1LCF1d1yOVrHJgIX3kZ5lsy6tfVWL/GES9z5OQW6lfUFb4Yo5U9UdVS0OYHK58niO
	 wozh72TVF2T8A==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44fe49fa389so5708781cf.1
        for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 01:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983537; x=1722588337;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpFuacOOU9PyOYqB0WWoaM9Cjcgmb9kMiCLGqJP8J2A=;
        b=jr7csER0pT4NcWNELnoUh/Cj1Reh7oSF5u6+BcD9X4GJGcFL8BZJ7KU752aRkt2TkP
         AApBUtrtpJjoh+5nPXJKH5u5RrFpkA4aIdrEBs131TXEmpUn+xYQr2U9a8m/zMLBwnkk
         cZvpLqsXVS2rCrNf4wHhF5J84Ss5eacbVNOLL00rxZreW6pSZnFrb+bm33bP7wwTug/d
         CptMh+KakxxjgOBaroJr1jdOiPA46z2Bg+MEIZDzt5cjv9jBjldWwQ4VQ1qLI8/m+Fia
         wfuGFnrXp4Pb7C4rwavz5Z6Lm+P9TMrxInjWueIlsR/9Xt602wElaTxR6rIaqvzUq2lj
         ZgpA==
X-Forwarded-Encrypted: i=1; AJvYcCVN3TqFmQeeb46Rx9B/aHZdB5yt4tLK72FCvF21bq6Y2hzMOKXW0XW5FEPYfTXGdWsb2bkWzfjMMQ+Tzo4Ny6PsR8mcKAskemV/
X-Gm-Message-State: AOJu0YxRFZHFX3ZYw3hVeTVolbwmB8h3cDJTESw1Wah4/MJnohnDCuu3
	sI8Fe/kCGPT9kfUT9m4ORblxZp0PLeasgeIw+qTbRwHN5c0TiJ+t82uH7cr3niNiC1AXpstlJrc
	zO12BqErIDdPoAbHrnk8EVseGIIyVv0Y54y/4YpdjxuZMMeq7BfuZkgTMhXorP+k1JyAy2/1DJ9
	LCtv7abr85GhZWkMg8fc27od6dn8gAH2k0GbBt5LUYEGb9NMB4
X-Received: by 2002:a05:622a:11c9:b0:446:5bbd:4802 with SMTP id d75a77b69052e-44fe92731famr52404441cf.56.1721983537676;
        Fri, 26 Jul 2024 01:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfWGnnFaUTMrdZkP7xOyuSJUp3K4zWzDQyC1gqU+SG7p0SaPT/1zgZF/fTQCd4H5ucjGPzcBLx8KLTXn+dlRM=
X-Received: by 2002:a05:622a:11c9:b0:446:5bbd:4802 with SMTP id
 d75a77b69052e-44fe92731famr52404111cf.56.1721983537186; Fri, 26 Jul 2024
 01:45:37 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 03:45:36 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
 <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com> <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 26 Jul 2024 03:45:36 -0500
Message-ID: <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
To: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Fu Wei <wefu@redhat.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh@kernel.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Stephen Boyd wrote:
> Quoting Drew Fustini (2024-06-23 19:12:31)
> > Document bindings for the T-Head TH1520 AP sub-system clock controller.
> >
> > Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> > Co-developed-by: Yangtao Li <frank.li@vivo.com>
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
>
> Applied to clk-next

Thanks, but this driver seems a bit incomplete. With this applied the Lichee Pi
4A no longer boots without the clk_ignore_unused kernel parameter.

/Emil
