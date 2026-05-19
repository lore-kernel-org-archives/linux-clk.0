Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6229B3E022A
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180538; cv=pass; b=O4ztx3cr0KoIJIcHqfzCoRr3eSVdC/54d7C7OCddoxJS+IMKJ9rGs3iF6Mekn++fs0NapR9N1MJy+uSgVLGMMVxyvBC9YexX51yYC9ykQp47PqTKUmGQT/sS19KMyLZ2gzLgorWWyHtqmpddk8IoAcWzf9+GUBbM0wMdKzk0F5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180538; c=relaxed/simple;
	bh=L7Ykj0gPG+lx/mCTPBJckTP58eFqkokUf7j+TA8XaKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVd+WpEixjwStra/BTR8mjdcDs140gyYMQJPTgxy+++5TsEVEwuLkVE/ulzHmMDA/GsJDXDdPI2A1ls9lEpoedN4G5Ech/ll5PxvMCL5MrN6j73sdJZkZtuGDRui8jn/pFhA360uV5542WxKrvBH0PYw1ngV2BYtuw3EydMX7Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKyM1b09; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKyM1b09"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45d96d21e82so1887559f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 01:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779180531; cv=none;
        d=google.com; s=arc-20240605;
        b=dKQfFMAVd9t+T+8qnbTEvRdagsxqm/cmkNY/b8uovCoRok21fTNtXkMvK3NqCFOw44
         gmBUHDnI2cuJcCTLcF5KiSibq1jIW0Z8cO0alvsBGdOT0xJD7Gi7JOCkdXB1m5xhjm9A
         ensmeiU2t7/FoOTZ6WmYe0VrydTxFSbcDOlXe82fMwG7Fjo9SFMlmsvDWh4u6MNTK9sh
         onqyBWIVrrrhHY79jilDcfxZmoFn/o1N7bb13CmaB0OuA8COXQTGm7Uqyj9CL+CYIosy
         dKxrOZOxetRdV9NLvHA3bO9o6jzCjdmq+D84EA8sEegHvXrUqHA/fh/Wkp1RfTfnxJjR
         ZrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qAs7C/WzX0A6CgWn6eUlpt9XmIjo253l0QhFbeq2p2s=;
        fh=TIJKdthB+oxt0yTQ4pxQqJXYCyFrKKitSLIpifnznC0=;
        b=UFsJLbTcRG5x4/o5+2gIPdlTfMbU1SLdXxsCMxtvhDzXkEq54M5e/3gEskkgfixJwi
         8XCMEZK/lyPVo48zEIHsGkH7X2IgtdoygeDSBVuTRdG51+K+NzxiZAU0MTI9zIQAxWFJ
         tONeXLv3m2KBiWAZKKpMdTkYUEvCaRumkg/LVhB+5mzDzX4ZI0hgB9FlD6JtitNfF9E6
         VMWlkis6yKjE2kuwSC6NdxLcgBgKVy/L81OMoBJ4hOBS1QUYXuTfeX0oukLzzps5Tj4B
         l75r/8C52kPXQ9h56AjOX79xtkYR6IgJ9nQigGFjlYEs3Cv7omxBIoyK5Jakfl4BAyD9
         NQNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779180531; x=1779785331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAs7C/WzX0A6CgWn6eUlpt9XmIjo253l0QhFbeq2p2s=;
        b=LKyM1b09fGCUnNA/40fBQvHxhGDM9OHNNKinU0EJwurAdDz8+pUGCOTMr8Rk7iGMOn
         oL+/1iz1OsLaMGuPPiO9eK9RBv4O94K5ZQpaPTKp6sybDofuOIrepCSlQ3JO/bOPt3tP
         ICeWkTFUbGb0dQ7gpYukkcHx+M3VE3QoIbcYKLp7oWNXDUJGMG0fEe9B/zgyULBSP++w
         Gz+nY5dcPE5V/UKlcJlR2fiRpXqSqbEqOexhtrUS5hfhOWTz6KojUpZuYcVsWAqnHXbv
         TnpSefXOf0/7HeDvaQYrcWJWM+3O1hh/1vz64gmW6IzWNak9gJIXnKwbsf8Jl2kBcCyn
         AAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180531; x=1779785331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qAs7C/WzX0A6CgWn6eUlpt9XmIjo253l0QhFbeq2p2s=;
        b=aVEc/5CeZ4DCr0/L+By89FjvnUEIvgwR93Vl4nyqH2IWamLHCYlJJflHhZDQl36aRL
         GRAA6/c1A40uMZap2GMTnH79nmt8d1u9P+4MeIuKuWAaMwNamKauRx9nlFQZqzSUBSGF
         WxwOFsOB5LdRbjAj6HYLR2bU/kbKfIbAg14lGXyRUiwk0FNMupnq+0NbYX26oQu9ekDk
         lBz0Qs21dh0SF76wu1rbJKJg5ze5x35oJuGZxrP3wEUAkOOlQlzF6rXdx/bdSxbm+biM
         TPc7ajUXp+t7uhWy/i5z/wx611BCIMU4JaB34JRNu+nGtKInMJl7QW6lW//BV2yHWf8/
         x7QA==
X-Forwarded-Encrypted: i=1; AFNElJ8rbYBfkYKU3vmqPGcxzXszd5DPq0WyH2F5XR+h+sQ8wHhrLbV2bmxgtcj2pwColXdMxeIWLrCVNZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu20qrg3er80QGMnhq7Eu5qqrv8IcctlDXe6NiVk5spjS3RGgb
	g1mxwoZNYaJ5+MTwCy4Wx2pDyJOPcASbl4fSiWlaaCGAgnFq3RPNIgoNb4wpChkCfA1DoHDrdhD
	zfE8pbJUnc5LCZ7wZRGp2NNlTnYL2wxE=
X-Gm-Gg: Acq92OFo6eHGZRYM77ZdKbySFyJix8UDX8pG8hUf03+YaQ70LXEz47Xmk/hdynDBXQz
	lU6YMli18zfefUxOYoRE154Z5UbyPxgfkrMRDracS3R6aZ6cl4FVpWkKPbAY9rhPMmTT8XOgmxf
	2aGllGR9mI/E4acVAVW/WdyEPr1AIgFye0lkqlBZRuMVw5ZwioRA/v+twhJnNnRdFnpA67ibnu+
	w4C5RsU8szGDQxVi3wTlS+Jqs2xknc+ul2mGtGf+mPNi3AIOytTPBCtfqyQ4bueBO0JmsQa5WYf
	A9gikTfP8HSZJsyzNG0s7Dfo8G6+n44dx/RKu2eM+2IQLV5bw1C+ZFwHLvJRdBiQnEda
X-Received: by 2002:a05:6000:26c4:b0:43e:a69b:d810 with SMTP id
 ffacd0b85a97d-45e5c5e6096mr30919439f8f.38.1779180530885; Tue, 19 May 2026
 01:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 May 2026 09:48:23 +0100
X-Gm-Features: AVHnY4JDSDZKhMN8mnbfN_GTC32D7XCGPxSQ9eBFs6CYmaa2LvQkl4atf8UJel4
Message-ID: <CA+V-a8sthS1kEKWuLmBH9SwGCutAVfhvmxwAjEbp=TCFiKY=oQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Fix clk_divider_bestdiv() to get max clk rate
 supported and add KUnit test suites
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2026 at 10:31=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi all,
>
> This patch series includes two patches. The first patch fixes the
> clk_divider_bestdiv() function in clk-divider driver to return the
> maximum clock rate supported by the divider when the requested rate
> is larger than the parent clock rate. The second patch adds some
> kunit test suites for clk-divider driver to verify the fix.
>
> v4->v5:
> - Made use of KUNIT_DEFINE_ACTION_WRAPPER().
> - Added RB tag for patch#1
>
> v3->v4:
> - Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
> - Added entry in .kunitconfig file
> - Fixed reverse christmas tree order in
>   clk_divider_bestdiv_ulong_max_returns_max_rate
> - Updated MODULE_DESCRIPTION() to be more specific
>
> v2->v3:
> - Added Rb tag
> - Swapped the order of the patches
> - Added the expected value in the fixup patch
>
> v1->v2:
> - Updated the patch#1 fixing review comments from Sashiko
> - Added a new patch#2 to add some kunit test suites for clk-divider drive=
r
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (2):
>   clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
>     handling
>   clk: divider: Fix clk_divider_bestdiv() returning min rate for large
>     rate requests
>
>  drivers/clk/.kunitconfig       |   1 +
>  drivers/clk/Kconfig            |   8 ++
>  drivers/clk/Makefile           |   1 +
>  drivers/clk/clk-divider.c      |  25 ++++--
>  drivers/clk/clk-divider_test.c | 153 +++++++++++++++++++++++++++++++++
>  5 files changed, 180 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/clk/clk-divider_test.c
>
Gentle ping.

Cheers,
Prabhakar
