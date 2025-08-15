Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F9C277C8E
	for <linux-clk@vger.kernel.org>; Fri, 15 Aug 2025 03:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755229405; cv=none; b=jtVJYORGn+dxDPg0hAWxvuACevehQJgigO0qC+ucxaEiiHRhzZCOHrIpsLiRuYwxodkDj4zqGDNM1NQQoPkK1UJ8Op14pMBPxnNh3SuUsH0CYW03inlx9ecY4Byc8FPdWvtbiuWBbi5wWaqFEAu12HNkZn52ENlolgp2pke4RDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755229405; c=relaxed/simple;
	bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBZvltLGftfY07M3C4UElV6vOpAx+5iGlfTon1f7S6Zmm00FYXSa/rmC0bHJgsnKJGY2s0Od5C7osw20wr+OypZvPNiwB5fSB0NmoWTk471QgAmUqj5aDYChPFwGFJK5Ljy9lx+grBjatczIy2nNkS/JzP3f54Q12WUsf7Uq9zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kwvNuP2C; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kwvNuP2C"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55ce5287a47so1451706e87.3
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 20:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229401; x=1755834201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
        b=kwvNuP2CIZOJMuv6JQVxGZF7wCgfvL/cCINTMjR+jI/e/I80srcqTzD2IdB5OTKOMh
         EjKdYYT91g00ngvRlnd9VdncuLw6ZyCiOPuAYcgMit/ol2jw6VcOU90uXEEYkqmcO70+
         g1GFtDCE8xJdE7Nmm3IKuPmbxweVaak5KzfD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229401; x=1755834201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
        b=TU1PMSr9Wrst8Er8vXPD75bcC/zf13vc0HvQn//rb8BKmtYNL9MUN9xngUCncqcE9c
         +tdmD5v08K+LPLfq6qbnAoLcU94R+14zjSIqi/p5zOa7VBMGzmVyaaUDDsFAXBqWtJ+y
         ujS6yivjR7fwdX7muFBDHu9C6qyxPO7Z9a6/0kjCAisYfFRWw2wpBrQUIZjJ6q7DRPTR
         c2a5qSFCZrQ8rOuD+JiGDJ/2Lnh5Qz+0CxgeZyCOvguEm1Li04N0ais9r81A0i+vd/4K
         +r/9cbPXGLZhlbEPtLWlOhpcCS9IuxEU6UEhw7+mOCDj6IGngqQefr0HG/0oCkDgR4+i
         aGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/8KjZt83/juHxCeFQd8QgOEz/IT0f8beM45xV3jtCK/9ku/3ASy6sn3mlcgQLqgztwFiQ60W7C/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjR7EGhX+sqEw4ixlfEGUR9eFjL9lsytZmqFtemql5UGn+JjGm
	7sduPTi5Is4Ds/BkM/STblqo34AJwFtX3C3oj2y54sbK1cO21FLX99XnncnOxvjr6Jn2xMDRcxo
	LWfP6I36Ll6phLAzyga7W57cyz4vB+xPW+cqVYPcM
X-Gm-Gg: ASbGncuoJkiqhfL32/pA6aU6Fv3n5R1TgRRj8joyz/MLhA3oGAeXK7O3+O/UzsCCmYE
	N3h4bYom7ndjVGarBysn+tQ5OOqovMPKC1Dhny/0+d35vcs1CrOqcnPFbQXvvuWyyeF1hJCJkdg
	Ek7PjXC8IOQ+jXYi6qWPihj0Uu+6GJCkJAHtK79DtWEsNk2kKVLenSV2uCyxvtqD6b1RFdOGOyN
	XSj4FoJ1xlOk3f2xB1De5lnSqsA5WCN8ClVFw==
X-Google-Smtp-Source: AGHT+IEqCwdjtNotzKv7k6sNon11epPQ9Q7yaZt1pImrKpO8J5PSviVGiMjVATClFXgSR2SA/yoBT6p78Ov7Q+2gotM=
X-Received: by 2002:a05:6512:3e0d:b0:55b:84e7:e14a with SMTP id
 2adb3069b0e04-55ceeb42b0fmr131122e87.25.1755229401420; Thu, 14 Aug 2025
 20:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-9-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-9-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:43:10 +0900
X-Gm-Features: Ac12FXzyZO_yczjiRVwJ_XiOUJ7K7LAiS8kN-QE11MKfkqUjTCK5j2sczcKt2tQ
Message-ID: <CAGXv+5FwV1YuBoefMAX1UvOd1=cg9Ld1ZawyNts1BR8YMezhKQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/27] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, some clocks use one register for parent selection and
> gating, and a separate register for frequency division. Since composite
> clocks can combine a mux, divider, and gate in a single entity, add a
> macro to simplify registration of such clocks by combining parent
> selection, frequency scaling, and enable control into one definition.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
