Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC446AF21;
	Wed, 21 Jan 2026 07:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982171; cv=none; b=fY7qzKIaxBNyFqqNHD9UZ6iGNHTY30bBulyHwQMNhcq8nU8nIqyzA85NIWIJcniJEVNMcVmD6JWsaCpODC0hHxwUGcgrXOyt8UuKhnNVfIvuj8mVy58o2ShdFmd/M0CqYguqBc+46n9/b+RXPHQtXIQ7CwCNTmjpChl+u3eLSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982171; c=relaxed/simple;
	bh=bGS3DYFuYzc1mQZhuBVKOcCjlKpV4bvavaupi72/plU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3L9SnfkZ5tPpUUbejQXxZf2ZAJcvRccZOZusSaBeVfEtd8Xy9To/TDfJn9A1zTHaAvV4kUjQIEtyQZELPHSjWY+j0/jyT3B9dWq1p1x5Jkf7TOh/D21SmrK+jMwy1bp/y+xN1ws4LwDXpWEjqIHPCrFdGNexnYiUTgJbalJTOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ai4aS2F2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ai4aS2F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1C1C116D0;
	Wed, 21 Jan 2026 07:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982170;
	bh=bGS3DYFuYzc1mQZhuBVKOcCjlKpV4bvavaupi72/plU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ai4aS2F2x1psS1W0ckXYGK0Z0RUMdhLwfJZgEp7on9p7Wi+TeHQ3GiYGf5MMfLAOd
	 VCVO/ZSKGhp4qzmo3Bcljewmv79f61fSEmOORwt5SZRsypQa8XYtCYd5g+X6k4+65l
	 GSKSoPA/WMOziPbpwzKjkFfEO6V34l7g64XOoJQiJnESO4nVnH+N2fb9+o4qbSBE0U
	 2bOSMy70CEklNqF5HCe+vpDKm2UP3A4n9AuiFYA5gedkCIqkv448CQmZ0yDXYjHQJ0
	 daAOPHfRTqNAYsI+miG3lGx/+ukXzMV2YmqBQMo+ziSgNlE6jc5gR6WtnTkbotYrFC
	 AIxwVCZ5Sheqw==
Date: Wed, 21 Jan 2026 13:26:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 25/27] phy: ti: phy-j721e-wiz: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <aXCGlW4lgIImN8Eb@vaman>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-25-535a3ed73bf3@redhat.com>
 <aWelbtaZjS4SZGQO@vaman>
 <aWj3LPq37Dr9OLU6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWj3LPq37Dr9OLU6@redhat.com>

On 15-01-26, 09:18, Brian Masney wrote:
> Hi Vinod,
> 
> On Wed, Jan 14, 2026 at 07:47:18PM +0530, Vinod Koul wrote:
> > On 08-01-26, 16:16, Brian Masney wrote:
> > > The divider_round_rate() function is now deprecated, so let's migrate
> > > to divider_determine_rate() instead so that this deprecated API can be
> > > removed.
> > > 
> > > Note that when the main function itself was migrated to use
> > > determine_rate, this was mistakenly converted to:
> > > 
> > >     req->rate = divider_round_rate(...)
> > > 
> > > This is invalid in the case when an error occurs since it can set the
> > > rate to a negative value.
> > 
> > Acked-by: Vinod Koul <vkoul@kernel.org>
> 
> Thanks for the Acked-by.
> 
> However, this patch depends on this other series of mine that's merged
> into your phy tree:

Should I pick this one then..? If there are no other dependencies...

> 
> https://lore.kernel.org/linux-clk/176661322399.4169.14248756511703978007@lazor/
> 
> Stephen asked for an Acked-by for that series or an immutable branch.
> 
> This will allow us to remove round_rate from the clk core.
> 
> I also have a small series to post that's dependent on all of this that
> lets us get rid of the noop determine_rate implementations that only
> 'return 0'. I haven't posted that because of the dependencies.
> 
> Brian

-- 
~Vinod
