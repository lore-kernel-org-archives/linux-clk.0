Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110878;
	b=NDHEwoBGumRoE+2+lNxrHbPe/YVU99NdPUL4CJiVX8RHUD7fuAiG77NL+L7wWp63A0eX
	 n6+qcR5BEilAInGckLt130X2JnrVQHflYHX4m9/ydh6wQE38IUL/s0iaKcQD/s+qrfyA/
	 CdWHYb97E8H1lQEVJlle+dfJdbaFMBIMWqkQ9dCfiKThxPbdGdeXumz0HpcdasiGlFNBP
	 GwIPGG1wppS/eMw0iSrmLHJPaefjWS8XKLDC2p2ZBNP4irXOTo5DPkRGbJFpFLM3WTWs2
	 QztPn6WzTy3tJTwRXxatbNXU0w4QCunZuY0nQVIjYe2S4dQDHsErQ2RLSGMOtaMeceg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110878;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=NbaKo2EojPBVQVK7LV8aGSsd5gN1hbSzP/sBhHan3BQ=;
	b=zqvQR2O6i16axS5mMTbNSbRlQWL04xpBHuwUacf5PBA8UxMmxMAO0aoj2liwK3j/AyuU
	 ZNHu2onSQbT1zR9ernfzfu/Gwazhwfjbh+UK3LVH5DQzVB0c/iW2ZZMM2rugoytDkqNDx
	 xpONqRpMDnIExQZKwVUVXWfeyW87dUKcoalQh5Wyhl7OwTCN59T3qjqXZNiH01MV6Em+8
	 vgfoCV0gn6F0WhFXEqEcd+/bzJDx69nPBTU0rqhtms4uSt3PRFVkD9iBJNveTgvHNCZpm
	 raGaqE9FkqhTRqnUMSIlwZIQEPplIuQufJi37u3Hk43k/ltILyDhoMFjaD72w4pJoUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A56A606A31F
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 14:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63751F031EB
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793110872;
	bh=NbaKo2EojPBVQVK7LV8aGSsd5gN1hbSzP/sBhHan3BQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ofhIRjS8UEcNYvRQ7QGnfdQbpB4M4tcgf59FYC/8+tx0dVDsCcJERBhUt/ywGnGS7
	 Z7sw8QQSG7uwU6gjncZs+IwlfvhcrwE6aCGfPy4jNRVkGLuUnk63x7MGS/amO8dmHw
	 y4lQKO41tkZaNFLPiG2aan3Gg2+Zol2FedDrEmOyui0AkwlLkM7Ya49QyeaelD1Css
	 LDNOpLnYlgg2+jG0xMFwJrBzCcYuubAckbNCOAlJLP0KvnbI2YkPnBAT2eRDIRenUU
	 rxSu/IvzW4Ly/hucGVFn1y3e0XFgUnfZZ2rRXkQw+fT8W7KUEDOufo9jKr81kh6tzu
	 kTa8p1cfiEAbg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4a76f63b243so780397fac.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 07:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+naIT6EJzcqxaI545arNC1yoRXrirdF9N4peCaPYX5VqZB2rIUpQbNmwvDES7Sey1VP1YRlp+sXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJlSum5VHtIGxGCU2RHztGNkguqd9StHG/Ooi8cB3YggHIbD70
	AAzI5nenYf/66Q8GctPbqjj6HfNaoaqEl6t360lscyLkh7smkharZRCjBkjxjRX6RD8Y7bA5+zI
	eF2Bz1szmCJZk5ogb0Le2VPQyO0RKsmc=
X-Received: by 2002:a05:6870:3047:b0:49e:50bc:79dc with SMTP id
 586e51a60fabf-4a89b6135d3mr1718291fac.22.1793110872016; Tue, 27 Oct 2026
 07:21:12 -0700 (PDT)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
In-Reply-To: <f9de8214043ad4c8748fadce7fd2cc2fa95b1291.1792776697.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Oct 2026 15:20:57 +0100
X-Gmail-Original-Message-ID: <CAD++jLkrF-Fuqa_ojSyeO8ogDrY==nupNvZAUC+nPoK+PNJc4A@mail.gmail.com>
X-Gm-Features: AclHuK9wpK2sOZ4pxVax9gNRbt2j8VY4zFskPh_vnOw0mDesf_mVGe4CvELlVTU
Message-ID: <CAD++jLkrF-Fuqa_ojSyeO8ogDrY==nupNvZAUC+nPoK+PNJc4A@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a78000: Add GPIO controller nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 7:53=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Add device nodes for the General-Purpose Input/Output Ports (GPIO) on
> the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Co-developed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

LGTM!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
