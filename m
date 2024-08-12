Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A743AA1
	for <linux-clk@vger.kernel.org>; Mon, 12 Aug 2024 05:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723440179; cv=none; b=YnhtU1jdTcBfV4obUvtFaC+P9kjpDEYnBe3V8Qy0PkF74YLpXviWhvHlnkPiVf97T9OQKo0VpYroSUiTqJL3gQMB5kYUYAC8POTvDtY1g2w3exiZFIUCzQEio4xrtTriaY/5EOXFxLLK0Bj9QZKn/3PsI6w+obFvdC78/Nbpjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723440179; c=relaxed/simple;
	bh=Y4VvfBU4XpsXpLMVk1V14jxg7o6OqLGZr/5lm6OGv90=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GB/uSbnTzb4JSxxBl8Lfnl+9Q5sBKI37nYovH+zCfvtXhmRQDRkWP9K8McPDLQkH7te45P7yFx7hspBHGNeCkH14vUdHiT4cCAoBpRJkZx2DJ146RuPDv58OXSIEqit1k6ul4F+Mj8DMkPTl0KH+QVVmcSn7/M4cC8k6LuSvZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tj9gvqyI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tj9gvqyI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42808071810so29772455e9.1
        for <linux-clk@vger.kernel.org>; Sun, 11 Aug 2024 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723440176; x=1724044976; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y4VvfBU4XpsXpLMVk1V14jxg7o6OqLGZr/5lm6OGv90=;
        b=Tj9gvqyIZXru7efpi8eIL3C/jI6RZSCkrf/D7opbetfq1tKXkOTgewNecQCyAQ+fKK
         BtblCiZ8tmWY2tNNigRUkntScqQRvfYNYyqX5UWoXyFWgmVeOUKIc54GUVzvPD3UTKXZ
         BrTLkD62uMLUJMBXgXs0ogqLtuqYWt2LlYQ8CW79qI7+sNNydRQBDdT6OmtuSU2gUheV
         CKOoNZM9JsqmsVxQOPc+ppw5EmXHbkIZ4aHZEdHq1vGA0/kYlCblUkkMAfR8iUoqFMdV
         YASq1srGBUTE4jc2ng9X4WV7Lmn1omnPGxFAcPAmyhcHJ780R2760bdstot2BKfLPeO2
         4/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723440176; x=1724044976;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4VvfBU4XpsXpLMVk1V14jxg7o6OqLGZr/5lm6OGv90=;
        b=Wk8dw7rK3Yp59wfKwZX1hNsOzBjDCfokX2mZdGrZFEaCIgrUCHe3LbpZphriOlM7vz
         q0ZeCej9rJE/AWPEa4icFKCzzsQtFR2KVCWjdRCZh+9ZmSn2emWgx38JoxdvhdWCxLFK
         bGcR36JPWrgKgYQXS9M5Jf7/+UjTSBitIHshxNH8XqAHty8LGar/ZiLO7QXhdibyX6ze
         vYx1oAaDcR50xN6Qpm5gxKL8b1tYVlMZaUMXrERPf1ccD/fzyU4WQGGGGDEUmLvfejw7
         bRxM06+GQXyHZXVKeVqcJa/Y6FteXh4jL03FwKrc9aSUDoise/clq+sjpQHAfOSLXEW7
         EssQ==
X-Gm-Message-State: AOJu0Yy7yzB4pfE+j1wHKT+gM1jkJgME386YK4gjDwXbjcqyhs5Lhb2F
	bys2mVKoW32Av3jXuDhBBi6J4QoS1igQNtIPE48IMNMIxH/Ue90r
X-Google-Smtp-Source: AGHT+IGP2I40aKBV6c+0AISZxjffcjzPnjT1724lkyUhOB4rBQRx8dm4mlyOcchdKZ62PjY6oWoGWw==
X-Received: by 2002:a05:600c:524a:b0:428:150e:4f13 with SMTP id 5b1f17b1804b1-429c3a58ffamr55729075e9.33.1723440176102;
        Sun, 11 Aug 2024 22:22:56 -0700 (PDT)
Received: from nsa.fritz.box ([2001:a61:34fc:f301:5967:ab45:b87a:b14b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c9ca5cfasm45656455e9.1.2024.08.11.22.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:22:55 -0700 (PDT)
Message-ID: <43970fbcd1871823325121d255af117dae8107ee.camel@gmail.com>
Subject: Re: [PATCH RESEND (again) 2/2] clk: use clk_core_unlink_consumer()
 helper
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-clk@vger.kernel.org
Date: Mon, 12 Aug 2024 07:22:54 +0200
In-Reply-To: <3b5b22e21cdc184a9f74db4ff9167a58.sboyd@kernel.org>
References: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com>
	 <20240710-dev-clk-misc-v1-2-cd9d960099a2@analog.com>
	 <3b5b22e21cdc184a9f74db4ff9167a58.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-08-06 at 14:50 -0700, Stephen Boyd wrote:
> Quoting Nuno S=C3=A1 (2024-07-10 01:40:36)
> > There is an helper to remove a consumer from the clk provider list.
> > Hence, let's use it when releasing a consumer.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
>=20
> Applied to clk-next

Hi Stephen,

I realized only this one was applied and not the first patch. Could you ple=
ase tell
me why it's not being accepted or if I should do it somehow differently? Or=
 it just
needs better look at?

- Nuno S=C3=A1=20
