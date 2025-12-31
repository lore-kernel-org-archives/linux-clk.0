Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711EB17B505;
	Wed, 31 Dec 2025 02:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147005; cv=none; b=GHghO3pWHjzSeZdMED6/SiKeE4mNSjqxa3sDakGXCSPpE8oR9lVh3Hd26G3b4k+cAF09z1SiBszhYmCM4nzEXVzZoDgU48JUzKAnJnJFYwbMbRSMtlDiFYG10xV1/yEwtlUq/vXE5oG9j4Byt1zxqo3xCLtTBQ9rNTyZ93XCcpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147005; c=relaxed/simple;
	bh=/z8UFiJt6hXfRaXhksX1v+WlN6k3OSaQoN3aZg3xXmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThHFyh8YxIXtd4V+y5FQVxzlpkxXU45OGsB0GafR7MGYrtJMN3bFzSOtARXE5qQYImt1BsazvZtZlbscBKnYNEK1dZ2xaDht7ZOvcnuUYrlJ8lXgGKWMlhRTLNU30PX6ytTE90I94Cb91n9pZQAR+PlrdWOlcArQTEJ+fnnQ/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2B55B340C98;
	Wed, 31 Dec 2025 02:10:00 +0000 (UTC)
Date: Wed, 31 Dec 2025 10:09:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
Message-ID: <20251231020951-GYA2019108@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
 <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>

Hi Alex,

On 18:50 Mon 29 Dec     , Alex Elder wrote:
> On 12/26/25 12:55 AM, Yixun Lan wrote:
> > Due to the auxiliary register procedure moved to ccu common module,
> > the auxiliary device id need to be adjusted, otherwise reset driver
> > will fail to probe.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >   drivers/reset/reset-spacemit.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> > index e1272aff28f7..8922e14fa836 100644
> > --- a/drivers/reset/reset-spacemit.c
> > +++ b/drivers/reset/reset-spacemit.c
> > @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
> >   
> >   #define K1_AUX_DEV_ID(_unit) \
> >   	{ \
> > -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> > +		.name = "spacemit_ccu." _K_RST(_unit), \
> >   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> >   	}
> 
> The above macro is named K1_AUX_DEV_ID().  Why don't you
> define K3_AUX_DEV_ID(), which could use "k3" in its name?
> 
that should also works, the idea of using same macro '_K_RST()' here
is trying to explictly tell users the clock and reset shares same name

> Anyway, if you go this route I suggest you drop "K1_" from the
> name of this macro.
> 
or could further refactor the code, to make K1/K3 drivers share same macro

anyway I don't want to change this patch, my goal here is tring to fix
reset driver after clock common driver refactored plus the modularization 
introduced, it's more proper to leave those refactor work up to Guodong,
since he did a lot adjustment to add reset support for K3 SoC

-- 
Yixun Lan (dlan)
