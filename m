Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2B828A731
	for <linux-clk@vger.kernel.org>; Wed,  8 Oct 2025 03:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759894636; cv=none; b=u1V0uAqgq/QZt3peh+zlStNwHbVB9rlrwB+7srdNTAIGUnFjKq5nNtyUrgl/cZaBfscyGTMzcPau50zrFaFHrLwXaX6u2/U67Ka9SlphgI0lQjaFyHMSfINK7Zf58gq8h9QbJofilrI5tWnPIgWLbJUezLjmcCDhZWdl3UAwLAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759894636; c=relaxed/simple;
	bh=Zx04ah/IYXegpf5FVcljzAJSZIUmnHslBnom7Csei1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TW9cp2LEZlXSkteE0xs/GIiO3E/CfRaWVGvE+CLWP0Q0r3eFtYyME6zkoTflNAt9KWpnJJCO8IC0dLCS/JZLfR7IhK0N9YargM8wMgPemvzirFQQ0I8084frK7bqW8YutXuTsstETuhoI+WPUFR16lYeHcjp3t8K2pIsYNW8fyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIxnlv6m; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIxnlv6m"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso1206191a12.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Oct 2025 20:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759894632; x=1760499432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx04ah/IYXegpf5FVcljzAJSZIUmnHslBnom7Csei1k=;
        b=YIxnlv6mCJ6ehncdiXVji8DOVRDffpIvwwovJ6YMRDPAxO5DOyRfJkP8eF0sFFNiJa
         wmztyNwzya6ckbQNK1VLqfkH+AedpxEVKbPD3gUrLJGOmVAVAJE6bn7f7i+HnUPCvTVf
         gyMdKLsY28D38z6JsrJoye/ZDpWNthN2hsmpkwHPopyZkY75+eYaxj8nJVE3nzvdz/Zd
         2iCZqir2Jet0OI278ZvKdqZSmPKVNtI5gJKtAl3/w63gIrjZFC98FIrfhncVLWoMI1gg
         H3DV21yHajGyurWsR8S0Wvdovgnb/b8UM88uckQYGjkMpxrWjula9Pz8DDHPPYyhhOcA
         PB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894632; x=1760499432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx04ah/IYXegpf5FVcljzAJSZIUmnHslBnom7Csei1k=;
        b=nHcyFTJEC07MWN2+U3ekuAJsVi2L+0ay/t/SZU5/nGK1kxGWtPPRAhXofxgKJ7H3XD
         cRuWw8OeiKahvo5HKbDBVGzOMBSsTvcTEUkJhEXmlSF3ITcNVQhhc6WmiWZCWzjdsk4G
         EoIkEXr2GMAmmt1juJSAC2zVmgYQp+JexAbDsZDdkIK7nJcudp7uuWyig5xyjsA2SR36
         9GC4Lugoc69/9RSzpQlylllM++1wP9Kwj7cyPEZ15/lzNApcxX4INTIZTBCvjdcos0HF
         ToUbovQCMLsdk9igYl99SubMrNm/iNnVBSRqo+KWVmJFsJnITQD5L10u3O/9pAJYr0VK
         OWGg==
X-Forwarded-Encrypted: i=1; AJvYcCWLSt7Prmlg/Dt3Qk0FYtUHUG+NdeuXr7KfJCeJE8g8lM8CzWnf/hzzjIsBR+5IUJ9PqCU5d7x511E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDcWZYgwN/wCTithZ70GKeunGsDtc8B9c2qhgCLykTslM7nqm5
	V+3/KmXlh3urBeMnBuRDRm3+WzM2pg9YC/TwQrdLz7cq15RltDk5zpm1iA3wZeyRaRZT0y4+6p4
	VL68ep4KCRSeUbBESx5V96Qbnf8ORn0I=
X-Gm-Gg: ASbGncung0XIbAkWUQtCsEO96xKNSf4IWDVVOTcnoJeU1nuwT+I8rXJ/a4xcp+m4/A2
	70Dcp5jauBe9OUMALPBXQAhJxY2mq5a/jMKeSV2SbiceRjB7rSJippIHB6T1Q3RGKopntlB+r+v
	jHPvuhUGWHsapmkAE9+sm5t5WzWpicTfXO8BDvaODqQHE9VJ5hruXimV4dXpGsc0N+7ZXQYMONB
	UxzF9kWRhMGVt9z25jng95t99dzJKtXfcwC+xeMtkcIJyx2IxKATIBize5QOI4U3g==
X-Google-Smtp-Source: AGHT+IFdakwpHCbhBv8L8ewQ8YL1xFOcXFkqwuOUaP1m0nKJBrxbVsaF6mhz+pLN4b219pRES/JDwQc0A3VoDQDnZvo=
X-Received: by 2002:a05:6402:4019:b0:639:e04d:b0cd with SMTP id
 4fb4d7f45d1cf-639e04db5bdmr313287a12.10.1759894631994; Tue, 07 Oct 2025
 20:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924145552.55058-1-sidharthseela@gmail.com> <c87d45dc-d545-4359-9e2f-11e43a45859f@linuxfoundation.org>
In-Reply-To: <c87d45dc-d545-4359-9e2f-11e43a45859f@linuxfoundation.org>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Wed, 8 Oct 2025 09:07:00 +0530
X-Gm-Features: AS18NWAJtkfAkiglYcQF83q4sQMGaqHzh0wb2Unau5kJ3UCJfzcYdxQwGuDuKzM
Message-ID: <CAJE-K+A_xFPPDbPFQiOwH5nUJdrrGHxvV9xVppXWTNJ5g2bUHw@mail.gmail.com>
Subject: Re: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 2:36=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
> This following line doesn't belong in commit log.

This was one of my early patches. It won't happen again.

> Can you add details on how you tested this patch and also how
> you found the problem to begin with.

I used grep to find instances of kmalloc and went through the ones
with size calculations inside them.
I did compile testing, My mistake, I forgot to add request for test.
I would like to retract this patch for the same.

--=20
Thanks,
Sidharth Seela
www.realtimedesign.org
