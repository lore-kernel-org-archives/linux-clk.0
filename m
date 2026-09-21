Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387CD43B4A2
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976488; cv=none; b=H7FNzL51aVfIdn9GWqYv53p0gjTmSIGX0F4n7/ZWQgbCV0Ckam8prLr+cFNk7Xg7vMPU/nSb496o9065uiU6x+EdKQzOKSftdJY34BslzJVV+jqj1TkbrHJp403XpEbF2hiZ5QGiiEfi+x3EBU0jeS60igpdCpeID4A0ps6kTwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976488; c=relaxed/simple;
	bh=nRr2NwONb5MDiY74TwbEFnamWl7CEbEpARCJXKG89CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5ki9c8calfRsBu/xtk4IuayeFwVDQHmEJftVpXlDDg5ycNQrtpxoWQnAyagRm2ElB6BiglGITA5wc/m7brXPH4jtvxTvKcTceMpo5qx7ujn+4ocv3d/FkeyAH/aPGWRjna8lv03g+3GzwA0YL17Qf0zmFmc6k/8TXvUmBIj/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso1714363241.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 00:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976486; x=1790581286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDUPsKvRHny4pMpTXrqtNbtll59mp87r5rbb0L/oblw=;
        b=xc3QskuYqsT/ih494WV7QfmMGNfk9hlycXPqXxP0F1SyGI8p7B3zz1VPzRIotXGwCL
         9+HymLkYEui0/urBJM0i57Lodfbex7WUWZVpRXbRxjnr400jUhmHQvHFsTdkFZhcA4sL
         or0WgW3W7eQl8g99221FTKXerysfioTYJyZ1TCIUsLnPZsNpiPxlWpzayX16AOnzi6yl
         zwTNs9gzHoc3x649f+iqoWFd1xvb7YxRF5MYPWepf3gXktyuh00KzxrZWUXjwZuh4djX
         yOVphcCS1bxlcy0SK4eStpp85SU9xuwFZZtGK5PVfUhyj2D4ZOyBt4at126Qj9UwcTBJ
         +SWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLcap5QUNLZ3BnFAPHczqfGG2+Wr/Ns+mHckT3gWwDwBEBS9ydZXecHCU5xV7KupfLhRk3GHAZze8=@vger.kernel.org
X-Gm-Message-State: AFuF++nGjfV+FbTvtj7dAXEPJ/ZzPEx3Q4BW/pLjMZ96BgDweRtOjWJ9
	A1jnqPIG2bg31qQVgv8oIo9wMgFnJJyWlfgUqhQ9kpzkWuOkf28MxAVglkiSQ3DJ
X-Gm-Gg: AYBFou0NYTAgClYQAr0CMdbsVqTuoZRoRdmGpcu+qziTqHo39lfUWp92bMGaHT1vqnE
	794foSY1K4pU0N+/On6TdnBWIfqGnEm1VzQ+RybFf7n6BIQMHFtjAn+za/QFd2lPIJ4l+sZ8Agc
	4NI++GbVHDunqKvItUxZgchaBrQrm4wPllgGXMRT/LOSfdI6G7pQAcQn5TXVivT793RnjL8+3c0
	r2ixidnBWZj6sDmliJgsVMUoJjLKuMYVwSwbEuJMxWGa6sifTqgxvsuQFOQKDIPzUfbifS+pZIp
	loves0R7y2UQHpq4P9zCATFUbZMEho2dq3NXcc4n/iuNjAe93gR0SHwgysB9RWTPBAv3lZVSThu
	uWDW6w/rL2fPaIQLU9NoFv03hGYLrogcL3QcRD+nj0i79BgZwRiQVJ6S9r7mwJ2kUmLBq6tGxJL
	jxNXXbcVTZFgyGxlCCqKxIW0+o5UNAXG6UUUMFUmzIpKNSZava9FOdT0I8njm88+Nsw43EIOhft
	fhnQbRmhW0q1e1IB270BIfihDPpMwogQHXR/w==
X-Received: by 2002:a05:6102:8007:b0:7a1:f7d2:e817 with SMTP id ada2fe7eead31-7a55ba4d3eemr4108710137.16.1789976486201;
        Mon, 21 Sep 2026 00:41:26 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984d55d25b5sm7447341241.8.2026.09.21.00.41.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:41:24 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso1714334241.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 00:41:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwAsbkyyADMqeklMUkjnhirRJa/Fg10TjWVrN7p9BocS7fAe6fu9VM2ARq/C9POFU1Wd+6Bx+EPGDw=@vger.kernel.org
X-Received: by 2002:a05:6102:83d5:b0:7aa:17ba:3dfa with SMTP id
 ada2fe7eead31-7aa17ba42bbmr32910137.31.1789976483444; Mon, 21 Sep 2026
 00:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
In-Reply-To: <20260919-epaul-v7-3-rc1-x5h-vsp-fcp-v2-0-dbe9236bfd22@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
X-Gm-Features: AcwNN1UjZbDPnIaj-fYRvcBoX7YE3K7C7k2z9bWrLFQVkND6DSGXX-e-oumCCsA
Message-ID: <CAMuHMdVC2vNp2nTHUi3saTZ8UD4ggeB_aBEvN9XP+EToOr7G2w@mail.gmail.com>
Subject: Re: [PATCH DNI v2 00/11] media: rcar-fcp, vsp1: Enable on R-Car X5H
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Fri, 18 Sept 2026 at 19:07, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> This series is based on Geert's
> "topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v3" branch [0]. A
> branch including this series is available here [1].
>
> This series enables the FCPV{B,I,D} and the VSP{B,I,D} blocks on the Renesas
> R-Car X5H SoC.
>
> This has been tested on an Ironhide with the vsp-tests test suite [2].
> VSPI:
> 145 tests: 138 passed, 0 failed, 7 skipped
> VSPB:
> 115 tests: 104 passed, 0 failed, 11 skipped
> VSPD (a):
> 114 tests: 99 passed, 0 failed, 15 skipped
>
> VSPD (b) hangs on the tests, so that needs some investigation.
>
> The first couple patches add clocks that are used by the FCP and VSP,
> but as the upstream X5H CPG driver is barebones at the moment and we
> don't yet ensure that the parents are enabled, these are marked as DNI
> for the moment.

The DTS patches use DNI definitions of clocks, so they should be DNI, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
