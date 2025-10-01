Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469E826CE02
	for <linux-clk@vger.kernel.org>; Wed,  1 Oct 2025 06:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299281; cv=none; b=lwHWxT/XX+iYDNSL1GOS175aXk5kZulD+EfLOdYzRY/nhieTEr1U39jxBPJoRuWVNDtaINC6T6ll6DHufWRJTg7l+9wg0l8oeG8KJfMKn8eFUzQB5QCVLwMCyRwhFNfsliZIf7Lif5TP6iKQ29OscGG5J2DE4b+oDFL8b8lkhxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299281; c=relaxed/simple;
	bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8G1qyuQKrcbWNgPBGgWQNiWW4p79AansELKrsWs9KkB1ETuzraef8FgejVZeesqN3PvuOaPnzTyNb63LKPL+Ef3XiSX1UN7cbkB86r4mBEOnFB0ek7pgXtznSkl17cNHjJuwLzuVdVYSNu8LZq5YLHAWRf//CMjFTNv8TTjGKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uh/fxsUD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uh/fxsUD"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so6406372e87.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 23:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299277; x=1759904077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
        b=uh/fxsUDUmuawGTGXKM3Osh5B3xk0Z/svX9F8nBDYyBWVx3CSsGuXqrCd1TYba+cnK
         qU+lz32fzQaXpaBwU/8ZoEgPCAnW9b6xLDVi7t1X52BEKgyge8Ai2m/4WHHNlKendJ96
         cTFM3O+RiFp+xa28EIvyrn5EoN76sdZzUjTuzY86aeNAKJCY3K8vAE4uDC6CyWUBH0gE
         azrZmUZxlSkeu0kbBOTdClim7pbPOVfuBBWztGIakLvFuGmGfDr7VgOF3aQzPPLkp38P
         rPPm6/z5u3rSPCjEN3YXWIsUbEA1aKYnrlep5+gn1CGrJcVM47s0MSc/JQCIZd1tcnkE
         l6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299277; x=1759904077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
        b=CHf8P2HrdrmPySMscm18LdjkR9277glcKSL/kFKFwewERQHOhRTwEVDaYXtu2/4dgU
         fCFUF1ZnGrW2Ue8h63PfTCzGn+AHTTSvg4DAw+TFbqCgEYiBiew46yn/rsmHvzgJM3KJ
         +yZ9lmr1e6jeFzWOj2IwuGosz8i8Luh1ImmsXhMp9cMEyEZ0MaaidEnhwg/m/xkB1nYc
         yMQKDgjOjNqUXcLDT5rn24+Ntu8xXIwN7tPmpUf3gMzJaKIcRT4LaCPHzdQnnINZW3OR
         tiKN7o1+ENdTQGM3SbatxCNPSlHV7nriHTNY72+pNleeuBHMnc07jFRDIwRITzPOET4H
         sFag==
X-Forwarded-Encrypted: i=1; AJvYcCV74VfZxRAR9S7D7Zn5J2Sd5hA7d+Y1nPNQiuPQWWPsJ2bdZmmUElE18RF5YERF8fEiC4i1Ws/dfSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEE3F+AvA2Rtp3i5FhYHdJ/Vauuufb005VlILe9JiMHXKJmNHS
	5BEDvMxftkTafVjsmLxShtobDPinTxwFbFbnNNOFN87nLyUfNbrJYEZa4q+WHm+7ju/vPPno2UY
	jWDNzBJur9ZKM8VTGLRiCPyC9XTriFzeieEsGNfVHCg==
X-Gm-Gg: ASbGnctubkFfqEZn8IdSIC6X+6Y+13TvLu2Ea8buGzwoefYW6W2zntP1giMPXYE2W+B
	cKRY0qGvGCIrLHIhBzGTd+S0nth3PeG26B6QnT6PRY3BjKnUuhyC2lVC5pQZ5jk/SW2VfkUxTu8
	rNbrb7dJ39uC/WbtulnM2q22Rt4MxOED8t9tku7RrHRJFJqsWAkbWraoa5ZLQ0BXJqUcWbp49gz
	ORuLoBDW0HbCN35XO20wC0m2zCnJVE=
X-Google-Smtp-Source: AGHT+IG2GQMXvM5wXsx6CzkWWALkmKJo7n9m32peMSwizZiLBt3hdl4uunMSSjoXjLkgjaoaZY2YYv9fSHpGi6xLHvU=
X-Received: by 2002:a05:6512:12c9:b0:58a:f88b:25a1 with SMTP id
 2adb3069b0e04-58af9ed287cmr658282e87.5.1759299277410; Tue, 30 Sep 2025
 23:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com> <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:14:26 +0200
X-Gm-Features: AS18NWCsR4raMo4wbunxRFTWZtDHnEXvF9gNLQU5m7trixs7xTJv_rQ_r124Pjg
Message-ID: <CACRpkdar_4UR-HtBb88dKLWbaM-p_vx_Z7RBEg5szPTMbdLN4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 1:42=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

I signed off the patch and sent it separately to the SoC tree.

Yours,
Linus Walleij
