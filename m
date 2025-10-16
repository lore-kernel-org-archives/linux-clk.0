Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887A2E229C
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 17:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760635700; cv=none; b=s+KSzpjuuZgTTYXB5V35HWq8kvdnL+lfTRYlo5qKQ+HBx/EJRKhVZwmfoTD1DUnZyrQweAJIXcAp7QuQv6HUu8bX2XvRn9Evhy+m60BbPSVKOIIaSXduF+XVSbqN27ITPIqH76eWqp20qQWG2EYFINhXYoXMl0j1gvmJs49sDjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760635700; c=relaxed/simple;
	bh=tZbgRbpFSIWSXqOxYGNL8H9YbvCuakZJM7LBaeTyqzs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=FC4COJ/fdd6IPh7PgpbeUa1krz7jGAThPJSvziAq2YPSv735331T1qKzsKrHSRsjuIU+d1f31uBClTth1jk7bitgiIWECo9QubdDphvfjdDQ/2ptPuv57O/uU6hZs0RydK52lf/v+EkBaRwttu5bNV7an2vtyj5g8bVCSf43Hr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxBIbzil; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxBIbzil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA800C4CEF1;
	Thu, 16 Oct 2025 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760635700;
	bh=tZbgRbpFSIWSXqOxYGNL8H9YbvCuakZJM7LBaeTyqzs=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=nxBIbzil8baDNcoXHk1NNy0z1eE6hL5H4OkBvT1gSJSwxevfGSWVTkLvCcBoimPpL
	 euti2Wp4nHihpDLV3eyouqapU30sV2K/0d3JMCZZt7XV3LHmz7KZqhOPHxAnXNxu0H
	 31dX1bx9+UfXi4ruFnDfTCnvWzMMZvRC3sFn6PhSVGqrjQBP0cY7szM3P+s1/UZxcn
	 9qFayXQ/8LFpvK4LCtnf+3AistRpwIO7QqRAj8DYGRBn+3mipwp7WYNNlDul0CGk2a
	 vFmK6TkSODnYKf3WqJPkLo/2MjL6sD1YhrLjFvy+cjKYKqXultjx0GJW5XN9Loqgd0
	 9zb3/vOc5iNUw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aPDEQy7M71ZKqn-W@titan>
References: <aPDEQy7M71ZKqn-W@titan>
Subject: Re: 32-bit clocks can't round above 2**31
From: Stephen Boyd <sboyd@kernel.org>
To: John Watts <contact@jookia.org>, linux-clk@vger.kernel.org
Date: Thu, 16 Oct 2025 10:28:18 -0700
Message-ID: <176063569888.11701.5380644365407350173@lazor>
User-Agent: alot/0.11

Quoting John Watts (2025-10-16 03:09:07)
> Hi, just a small bug I spotted when debugging some code. Hope this helps.

Please submit a proper patch. Thanks!

>=20
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1572,7 +1572,7 @@ late_initcall_sync(clk_disable_unused);
>  static int clk_core_determine_round_nolock(struct clk_core *core,
>                                            struct clk_rate_request *req)
>  {
> -       long rate;
> +       unsigned long rate;
> =20
>         lockdep_assert_held(&prepare_lock);
>
