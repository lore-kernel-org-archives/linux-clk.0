Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9F2475D0
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 06:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408785; cv=pass; b=k3JjaWi59aytpfrX+hLlnX+j/nYhg7YUF6T9PZAnQFxjQiIE/S861QZZJ6agHhuU56heNHItHUgsYihfcEQXw5Kg5QI+XPWjtWW6Qz8+p5TLHu2gKQNbKWFhjV4tgXr8jMsqyt0yah2gaQieNSDGh3khYHcJu5bhFm/KoG20Xq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408785; c=relaxed/simple;
	bh=RCRjSgJm3KwWFKtPgSKvfy+sw1dQJ8qsB6Bkm6WrNVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iX9sG3wgYwWBvjNdG6h5UEOEiCyBJ8ibcmOvGfwhq/1SuMvvDZC+8vQfhr3NQhx8gWyR0nTBXu2jzyJTgtMXF0EDcnYkExAZ2UolFFdesT3g2sVOMNiE8W7fy6937SVa/X62U64i8NRiun676UiJ2yxzYjTgxJFPfD0h1bPlRQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQka4rSb; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQka4rSb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488afb0427eso4070435e9.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 23:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776408782; cv=none;
        d=google.com; s=arc-20240605;
        b=OKdR48H/5dyMRskp4u1bfm73xVDmiQGS/4gk0cGoOLV0QNLDMaTg9PPA1C1S0YPtA3
         /0kJvootApBf0TeIQKoDYj2k/58WqUxgZB1PSfKAaF0kE2pQImlE4IgIUkZZEQd/xjIR
         Lvcl9L8N6PJ19VKGQhaiV6k7HlaxH0Dq870uz1x5irSC2PEZKClTfe2M0CDiVIYwJb3l
         Z7PcfeNWbo6KGwPSKnDeUcXejKfStN2ZztjH2hsjkVrt/3+s/+y4hhODuf7Nw/rNB26A
         dVvfHEXPTMk2I/1jI2lXOiTXVaJbRfdDN42Tr464evXK5icHg96ySCoFAwb4S9qx+0YF
         eekA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8U+WOJv2yvWPYUUfMhDGPMV15Mhn6imfX8H3e1n54UQ=;
        fh=Ly15GtR83QY/tEV+awGJ5dBvv9EGNUOwKlPCU68YdEQ=;
        b=VuAG3Ah8gG/ozzQbcJwqzvjWu8wcyMGGiDPyOkIQb3dkSHG2KF9UJddiQaZvvnbyKG
         B0LvoYLUNRN3cdPoUlx4pKO9f6id0lIeQyjL5QFcT4Pr1ZqYVj86nJPLXmrLJphYMqT8
         MuTWrrLTuG+fLTgWaOCw4aNBQgEwQfKw1Y0DkcywpLL54ycGZU5Bcm8MP/66zNzVzh/D
         GRdQ+6MtiebMMZc7CCgowWjdtxNExTWJ9v2VUpRB+A3EMNyw0qFwU7TDGrgdDtioOkZF
         kGM6fLVR0/MdGG9LH6wDBT0HkKh7dJSd6TMMTmLqexhsMiEjQguItOzq/XK3zvnoXgYc
         97PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408782; x=1777013582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8U+WOJv2yvWPYUUfMhDGPMV15Mhn6imfX8H3e1n54UQ=;
        b=fQka4rSbVdhgCX1iSRmAfV51QKhKJtmL4ReNreTu56aortp1j6aahTJsN9MeeP11rj
         GWMgUEJ+jq8Bx3UtggnTVInCkuRAud/yTlI55vUOi5IdVgjDGsK24/RLMYgB3gHyBuMi
         Gzovgy/YifbjwDk67ZSfvROlLHgQERQF9/oF7h5edy9xy/qp6Bbmx55DWKPbRAkVJFNI
         lll3ydBogNECustdy0lcgVK6MSixh6HZkeAGjIAQH3IE1LUdNb3eGiI1aE/5Ht78H5C+
         CsRSMhluTwCeEl/dYOaOEVRMyIRAO1yhDudnayP+GGLLpekyqAdH9W7kjXNwweNaWjDk
         g1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408782; x=1777013582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8U+WOJv2yvWPYUUfMhDGPMV15Mhn6imfX8H3e1n54UQ=;
        b=jaaC2i5vg8ISGyYTwbKZDN3nI8cAKQsrtLNk4EQQJbuOGFXVwHGCJTZQij+K31TEx0
         yn82zw9uP6cTSE8PqMx5VeHhgP5YVAAiUAXYJnBEx01hEXUNN5NqYtOKymbyLu0pbVrN
         2zaLl29uIXwq2puIOZSapkW7w7FzY3j/7xrhnfEO4LSzOp1LNNxmJ3tZIBejvjL+eNYU
         LbWFFqQxY+fPslQMUK7ehU/9NuOUtWP960xN5hi/NotpkyQX7shv7UHND+CquId0k8a8
         GiEsBoZofNqXV5fP+vLmuHmHksmg2J6SxfZW1v8EH5cxIeqSE0uxHuw2gEghoQvcfbEj
         Ic0A==
X-Forwarded-Encrypted: i=1; AFNElJ8QG/4idpiq97n6og0/jUwjJRbjpr+SnnyirOydMfA9STReYdSoBOGRieoHj5g99RyQQI30PJeiFiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTVLU23etA2bqQpQfbDPNeeqYn3n9Lh00EJXr8PbYGuEMHuRy
	UxI4jb03E8wkEiT7kWCafNd3v9zMrLWbH8BCpSnb+D7PxS5vN/ZDNwifv7qdIlzFh+UsK5TeaVX
	+HGJKgLNnQNFtDcBmMVawDT/vcbxclDg=
X-Gm-Gg: AeBDieufRvJS0gqWWnUM60eT+e4FStW4RGuTOCaIHt2ZrPrTokNXq0P0IiqaJDR0oPH
	v3/KFgGaUinYAbd9IpCkeScYWcRC20rbunW04KV6PhpkkTDHwftZBWt92RtQvdi+IakTL/Cq6bl
	cmGamLwbDNZ5I1btCoqJlaA/jgZ39R+MqrUoExXbmg4oM3vYDbO4wMndac7pBmjOI6dePSswE5U
	NDXZ1teEqStAkgm3bwtw+jB+P6GSQBYjdDbKR18vQUInUIdrbjzHB3wSW2m3XYb6O9nfkct7kKz
	yzlxZq8Pv2Vc82Mr/0Y=
X-Received: by 2002:a5d:5f43:0:b0:43d:73d4:b27 with SMTP id
 ffacd0b85a97d-43fe3e1575dmr2125969f8f.32.1776408781948; Thu, 16 Apr 2026
 23:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126185818.78003-1-clamor95@gmail.com> <20260126185818.78003-2-clamor95@gmail.com>
 <acadwXDbBi4y99e2@orome>
In-Reply-To: <acadwXDbBi4y99e2@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 09:52:50 +0300
X-Gm-Features: AQROBzDJUsv0c10KEk-OckCv0HeNslGwyNfIIEYLdh9v3XdESuYcNKHmFmVOi_E
Message-ID: <CAPVz0n3SXHdTTE55MvwZeogYaTgg9mD8Jh3Yy3snnSkjgfcyJQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] clk: tegra: set up proper EMC clock implementation
 for Tegra114
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:10 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Jan 26, 2026 at 08:58:18PM +0200, Svyatoslav Ryhel wrote:
> > Remove current emc and emc_mux clocks and replace them with the proper =
EMC
> > clock implementation for correct EMC driver support.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 14 deletions(-)
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Hello clock subsystem maintainers!

May this patch be picked if everyone is fine with it? It is pretty
important for Tegra114 EMC driver to work properly.

Best regards,
Svyatoslav R.
