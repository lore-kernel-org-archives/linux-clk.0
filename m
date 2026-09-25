Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7423AE6E2
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325462; cv=none; b=EqiMFQMU773Z6dPOME9PFyEJwFWZzGvt+7k4oVGeZ7XHcBqjrRJodEsJ7v73LpyyfUY5GopTDvHwO/A/GQG4ALWmMD4opoWsnrqF7feF6Cl65yZjstvJ1pAsBFJqCmYW/9gYCpB3QAUxfswlGaMDzsj4mLbFmYc+VGgyALH8jnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325462; c=relaxed/simple;
	bh=JZBIQTsAk1DNNel+ytB+3i9q0B4+GJoYwfLXJu2QfP8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UyFjYLv/AmAb4b3H/owTHPnk4M82tNUVOTUah7wum3NEMCWIwaTUQ9dPVAVVXEk/CUucWdtE/XfbJMpkuh+SY6XMXyyZNTDbdCveI6+34QmrRNrmHClAxwNJBe9cwop0gB53WDmQ50puLkSvve/vhJr8c3ZxvMqj7+FEyk5QSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ODTu89AS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ODTu89AS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso4072015e9.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790325457; x=1790930257; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7HAeSClA4TtHwYptuwFGq5l3M68jp8nsLZYVXycvvE=;
        b=ODTu89ASkJErY6FnXxtlklg2xzPotDarUuFdumSvZCNr2vr8L0z2EmCMsaB8dkU0zb
         qOpM3e+AGnKpTV37m0/wMvNSCTPUUQkG0RCajzY/cRR1HTpkMhR55NclnJEtZy2468ma
         c+W9q4H2tf3rYyjBkPIpbC3bYQhZ2aJjpdp+MfWjz4GVpPhI98x/B1DXVpK69fJlH/Fg
         Qx2+wg4waK+A0IAtw9PPrC98Lr+YqSRFu6VgC5Sr/wGdOd1koMSW5zgDeQ9RsEP0GDgY
         wKyWl5XLOnruMiNT/S7OtZwioyOmgXmeY0jJhblWSKxwC0Mpw15bXazJAnJTQUva9vfO
         IKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325457; x=1790930257;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7HAeSClA4TtHwYptuwFGq5l3M68jp8nsLZYVXycvvE=;
        b=bbJoitpIy0EznlKuj0jGeOhFvl5S0MXjm8aJ700k081D8n+Cev0Nu/BlXyFxS7vAnB
         Pt9s7tBDmIEnOyRindXV8ZmzeHtLW1Hc5bz41Uj/7TjkiaO+bzmmh8wyt2Hp+B4YqxBD
         gij8eBmr5RBOauZ9cBtg2+z96uDfRH7Ueb2sdwddcYnbbC2hddxRF5Jx6i21JOTXHV0z
         Fh//noNWSRt2GkKBGUd5+TvQkiBEj5qB6Kqvd7oIrpxWnTdeQDUJ7+0NNL8lm0AykjVY
         s21iDkf9YXNkj5pef0CqAKIvnePTzrSpw6aSkZm4g1XH83NMNnw/+Xa2DDo91DhYjzxr
         qUpg==
X-Gm-Message-State: AFuF++nBocwStsmtbLmRqSnhzU3aIPFCEwttLXFnk34+V//i/tNvXcKy
	clXPbygvGV/mR5BubwVwE301RIb6TqBiTM6GpyAaB4+2tHvwmC/h9ZROn5Jn41VTlgk=
X-Gm-Gg: AYBFou2dyM3uz1SjTnaSaoNe7+qZBFHHU1xDGpTIVoQrokyHKp3dWL+0jUJY29aHGL2
	OlPVe1TeIoHB4tiBGZmhoH0bZuUBSqXqR59v1fmEw1xU9rdkZSnRuG3I/5bIWj2LikmJbsKCeSU
	poyQOwlo0XI58bvtBatnti+yf/l6btN2G+TUUZcgTv9kU53SqfA2w9bNvaJEC4R9NZL6zGosrrt
	K87tNVFCFI6XloqBl5BJAHfj6Kjb2OQbueI8dHVAyTGswt33C333lI/w9rbU8PKcyPxYeouhs3g
	yb9tIATUZztO4il/bFfqXSKU13eQNvCHdQXyEgVlTQwVEvJjYmy9rcN8t2tWuci8PESghk0Zq6z
	8ArXyuZ5sv4BFD9FFH5ELwnwTTXMQQz9OAhfSk4JWICptczJi+oU33AemvKujgQxeoDEp0TWVtq
	GhWkR6doHtY1Nk2xP9yLqmDUGP9jj1QfXb2KawdQLpMPZWUcjvB5uYIgpb3NZvWO2J4Bd91nRHt
	OCl5soCHiZNhpjmBg0=
X-Received: by 2002:a05:600c:348a:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49fe66f4ce7mr83895355e9.16.1790325456705;
        Fri, 25 Sep 2026 01:37:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm209104975e9.12.2026.09.25.01.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:37:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Matthias Goergens <matthias.goergens@gmail.com>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: name the clk/linux clk-next branch
In-Reply-To: <20260925054943.2964129-1-matthias.goergens@gmail.com>
References: <20260925054943.2964129-1-matthias.goergens@gmail.com>
Date: Fri, 25 Sep 2026 10:37:34 +0200
Message-ID: <1jmrt59169.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 25 sept. 2026 at 13:49, Matthias Goergens <matthias.goergens@gmail.com> wrote:

> The T: entry for COMMON CLK FRAMEWORK names clk/linux without a branch.
> The repository's HEAD points to branch master, which mainline already
> contains.  linux-next merges the clk-next branch of this repository
> (Next/Trees).  Name that branch in the entry.
>
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
