Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91C3537EB
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141170; cv=none; b=iCJA4LTWjjlsSY1BcWYUoPv66k3jQ7dWiF35xsOzGpvCkaVw6tPwDgUjW2Q64R9UWncgXhfUzBk9W9Op8ZqPc1X5f+9S93U0OWctM+Eg2r1cjRacbG0rG9qnlSGnGTmnQeREqOQ1oWbDDW73F/uuHskMbgXsPyB+B1s3QLb2k2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141170; c=relaxed/simple;
	bh=7NI+kyEAuv88aboJndPXVzSWW6x8YPO26PFJcyR5N2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Af1V+umT7crYg0i9XcmzKa1atgCAWMBgGwVQZ2+rdU6Bso+/5aPKg8jne9fN7y1O974TMdp1k9gLn4oTDJIURU17P8Lhs2GQeMMevqJJZr1i+Zjclg/H6B5d+i1kjpizq4JgZXKBHRwilcBSOCAStxeZoxbNeEn9LsRsn7ZEyCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y89TVYmA; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y89TVYmA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso9961613a12.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777141168; x=1777745968; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KIgSYeBMSxdwk12mHWLmmWSRABbpmkyXaWtiAj6PwkA=;
        b=Y89TVYmA6weXZBM6lB68EpWVLa9qgXG/o8qCi9XOI68RZ3UB15fnW9O4GXRNwXl/Yg
         6wNCpDLlcjygcnGso0n1pGDB7TF0zf+U9y8J35ITkKifBaAj+5Y3bLCUXuREBcguJNfz
         sR4GzgAVd67cSAG5d+hMUDskYzmdHZE3rKKH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141168; x=1777745968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIgSYeBMSxdwk12mHWLmmWSRABbpmkyXaWtiAj6PwkA=;
        b=JuJJWd8ENZVJpMMhEcihLKWLcxkmCuSQGjw/3HTy5ljegjoEbMfwec9rUrGltW1qSq
         Qz3/3wki75hknFtpiHMmNYdDoV6C7guAeGYLOkfnk+5Eko79Hlcexkq89wFZLuuJ7xCG
         /dhWOIdJA/HP1+DsbJ23/NUo7uXTlJZA1p1/0rkSHtK6kV79VmbHqviWrn8Rj1SDPaXN
         ch9Aom0OK4QyYLlT2fokgLsAz9piVpu1qiTAYqTgFO1g0yLMfuX7qZ0L5rDx8hNpq+eP
         0fGgS/OTybn/eX+fAoxeYaub3pYgvDytNP4OJj4oEgXYeVp2V689EgtDHGjbDimaYTAF
         yMTg==
X-Forwarded-Encrypted: i=1; AFNElJ+njJxvGJ3pEp1sqy39CnDykULOHY8Di1hpDKHB4xUH9NviGB1aRFU9H467HtaTGYQrOpCFP/z0vEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YypHvGJAGRg5cbIVnBSyV49iWki1xb1YclhmZ63UoJ8mJMvhjWE
	99X80Huf6DgDwiXg8HAon/DllYBGI1Es/DJBs3TVoVnSbd52wbm3t1SUd4/bc+DfmzduarvhtY5
	BKizPRNI=
X-Gm-Gg: AeBDieuCaz2HeOMSt3pMHMkK1CCvVNPrZuvppKcjBSVW5uazlnFZL4KYB2UcYoTGPhG
	Ml0nyzVwfVBRd/3/bvkc9WSA3yfJnon72DC4BqFQHieRSvL277aM5f1Rx9qAA3sFq2rGU8THKI6
	0ZilhSaH+eJ/VP3iGHlX31Ut/3OVIOUA1PG8INme5YzXPT0WKvNaoJau2z2xWp6wRifWx6JmL3z
	wcEiACNefWu6evzMuRCMeWS705/LaEUCobQ3Nepx7vzNZIwlGzvVR4gWaO6FgMYe5QPzRSYa1hm
	B1DVccdT0bwXN/seUku2KYe/F7s56gzoQGX4TZU8576v8oNQTdRq/XA6/S0ibxyEM/vZYattZYa
	AhKvR+zgor8yhZtpn+nlGmGiZYFjwB9ovePT54+cWYYy8iZKxFAjt9IQ/egtxFfrDeiaSuJtem9
	p/cNwduTDi/LNJieSkVgrpU8t1vEJouNTzK450ietGz4IOqOY3k027x+TqRegaJxb0kEWgRFxVc
	dBaiIaOz2s=
X-Received: by 2002:a17:907:980b:b0:bae:456f:fbb2 with SMTP id a640c23a62f3a-bae457f483emr315366466b.23.1777141167647;
        Sat, 25 Apr 2026 11:19:27 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455045652sm914332366b.51.2026.04.25.11.19.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 11:19:26 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-676fec7e946so5863983a12.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 11:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9d0ZSm4HtMx1EHoxgAtTwEZRd7AT8C8eNjxvdGIBGOYizC20B3REn8mpIObNW1LCGzlEqPEyTlvd0=@vger.kernel.org
X-Received: by 2002:a05:6402:1598:b0:671:4f9c:f664 with SMTP id
 4fb4d7f45d1cf-672bfde1bd4mr15623685a12.27.1777141165834; Sat, 25 Apr 2026
 11:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420183208.2287306-1-sboyd@kernel.org> <CAHk-=wiKrwKPye8PRhvHxY3DB6cq+_Xby-OAigJOrcPHEZbDjQ@mail.gmail.com>
 <177713823341.5403.13182816167027469071@lazor>
In-Reply-To: <177713823341.5403.13182816167027469071@lazor>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 25 Apr 2026 11:19:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmNv2gvfLVM59LbTSzUQf12Ss8JfJ5kYJrKumGPn3xxw@mail.gmail.com>
X-Gm-Features: AQROBzCZOmDPRngJ5tyvX2atyM5O7olvfss5gFMYlCMfSu4tBON3AXCSDZGQQ5g
Message-ID: <CAHk-=wjmNv2gvfLVM59LbTSzUQf12Ss8JfJ5kYJrKumGPn3xxw@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Apr 2026 at 11:06, Stephen Boyd <sboyd@kernel.org> wrote:
>
> When I used 'git request-pull' it gave me a super wrong diffstat. I
> forgot to add --summary to the diff command above so I didn't replace
> the super wrong summary from request-pull. Sorry.

Ahh. I tried to figure out how you could possibly have gotten that end
result, but mixing two different diff runs does explain it..

            Linus
