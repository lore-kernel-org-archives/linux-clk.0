Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B7481FCB
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668590; cv=none; b=NPEy3b2BclR6RMM1t4Cwx/BfWy6wzt6bMltYf5QqIDnn2mJ4oAfUd4fggK2a4DgkrAOQ6s/mqHXmybwwuTzW8DOJLwrRfdW4mfFgIl56AeSkWudGw47Mbbiuyyb1estDECbkdIINUkcoozGmtwajOsDJcXfxXvbJ4fQClO7mLpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668590; c=relaxed/simple;
	bh=NtDNnAxS9JCqoYNY9CXizA3YxkktQlBKy/wbas23ZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+MMftjg+zV6gEwugobsp++K0senqRY2hrVUpCo36NFuMGKHjNccZD4YE3ojOD9cX4aNUvddOEADypqnLG2hD1DkTfe4KSScmfM3wpxURhxOry/Wm6gHBbzTdUroKZqBjRzhhYBsV5rdV7SF48gdvVb0WGKrRUbUBV6ZiLKqUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so2358479241.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668588; x=1788273388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScdPB/HWXKyLnSzbxD6GH9YFmqF5SuqSigLbQv0OKqA=;
        b=Rwtt++IXpBn+dnNbDV5EI/b92ABNGfific0cvZiKhNLE/M5zJM32JFmKdlXWob0Cue
         ZBrXCfhjwrO8GPxlUkE5yNAREoh2fl87IhJ/mK+gsyVJcCqv+1OCzRgiKJcOyDWLg9/B
         beZIcZyaaRRijVzdHKlmF6T7WaS6MvfJ0IKcDNK9LqjGBk+Ajh/T0JrY4YjK5njAVFrO
         F+aTAvJeILP61zA4KYHX9P9E0VPqCSZxRphmOFAndYZRUdVxdw0YEKXLIJnMnx0Tzuii
         ImpXNxBrX1q6mrjBk0brO85xAsudYgtA4dEusCOcg4xAeVp+B1NE7MpJ9kWJTEkuSZ77
         MDDA==
X-Forwarded-Encrypted: i=1; AHgh+RpdJCOQXJ3rcPtM8hrtQqcCFqUtBLwmnSqZrLtKyd4mql7XjnrEm1s/ck20KRkljSn5codcJwqSMGY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUhCIqLZglNwOBic09zyGfcRQKk+tsyJea3t8ZPZrC5f8tyISw
	JSbodZ7c/Zx5LTR9BfuaZ77bz1PBdcIcrPv7vLZNFqkf9jSwkza728iZcxzGjTqGrNA=
X-Gm-Gg: AR+sD13cSCzU5jK6bG6wxUVQZYNj2/Ub+lWyKNg3nqd6N51frubNr5wifsQJEaAEpTn
	ipujJI1NYk1VJ2h/DMtIKLQzM0aEddJ7tzyHexAwAKmAHTvmNMICMst6WnlZv6Ee3Y25wZ1VTs7
	9KF2TEtBAUXeqry5yQV9Y0O1RKUjDyRDT24TpkVpkWVN8qOOIGXeveclUmsbozptlo670p1hZby
	gZoS4u0upHobUw/q/ZZbpIoWVyCPVaEeULLL2WcpQtZzlldacHlQoaQzvb2Tf0CcqVzzsIlyhN6
	DMU6ZCBLE4ERgq5HcXKCDxm98fsmeyIW9Gz+g8n7PFW5P4mrsV2mjvqdkGGgNQiihqNVdXawjTh
	g+aTiNOJbc6iNI6k8E4s5fGJDOy+0Y3VWpEp2uDasW+ym5jwq1voQTXwfwhTUyH47f0qHgsTESF
	wgyXmASvILsrCtasmavuQXJLdzxhW5smSBxxvMrwehL7VRyL1JIXasBiTLUIhUjNGfUMPe4+lLS
	lGY3PUGOknny+1Yi6rcTjTbvlLrJ9k2qoHJ
X-Received: by 2002:a05:6102:508c:b0:779:1f8f:b6e7 with SMTP id ada2fe7eead31-77fe61557a3mr2999515137.3.1787668587544;
        Tue, 25 Aug 2026 07:36:27 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cb3970361sm1123157241.5.2026.08.25.07.36.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:36:26 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74dceb46291so1997927137.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqSG1jbmRXxpU6QD0sP+BUi6Ibd1X2g9CFk3Yp1S778h8/QPWWM3IAO4OQBjMKD6/hYjy2iIoazQFM=@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:77b:4bee:6a8f with SMTP id
 ada2fe7eead31-77fe84dcf5dmr2940768137.9.1787668585576; Tue, 25 Aug 2026
 07:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ2MsMKQj6gA_4pPwdn2VmyGgzTUXHF02=3hVCdRWC+g@mail.gmail.com>
X-Gm-Features: AcwNN1W_bbmZVeZ40Fyz6-5WTX8tm1gBDARO4xiKfvf6z8u1u_UqEYooprtkdMM
Message-ID: <CAMuHMdXQ2MsMKQj6gA_4pPwdn2VmyGgzTUXHF02=3hVCdRWC+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the Renesas RZ/G3S, the CAN FD clock can be sourced either from fck
> (the peripheral clock) or from an external clock (can_clk). When fck is
> used, it is divided internally by the CAN FD controller.
>
> Adjust the existing canfd clock handling code to support the RZ/G3S CAN.
>
> The existing struct rcar_canfd_hw_info instances were updated to address
> the request in the Link discussion.
>
> Link: https://lore.kernel.org/all/1d9719e3-10ff-4cd8-b729-55fea93c37ce@wanadoo.fr
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
