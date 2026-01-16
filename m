Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE8314D19;
	Fri, 16 Jan 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554031; cv=none; b=MJqyfYixdF8DtDcrozbM8Ni1TgmRBNWMgZOfe4xHdFyZvneVGqf4kgVJeHoy29lWNyzk8Ke78yCUez/cf1ubJb47HiDZUIixRRRpvLdlGPulXs3/wLwB7wIb9Z4AKQdahTL2zEJf0mout8C+YNvzDJqMic8hzNA86MimsxeCtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554031; c=relaxed/simple;
	bh=nY2Y7tuo/irtFglGsNVs/lN0qhnd0rOHIAhJwfKVSZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLWGXQ06/QExvgsCmOdZDLHj7G56talMoBEPAkwtxSjgu2RE+fsaqTURSOU6oDEHYGbAa25FJSCeeWtq9urRd8iuawXCFupUjENeiDzJ1AtEAT518mT4zXGNjyIScc6dJKS+Lis58gZmMt2bngwnx58PW4dy1v/Abse5QWUO/9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfQT/2XP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfQT/2XP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46881C19421;
	Fri, 16 Jan 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768554030;
	bh=nY2Y7tuo/irtFglGsNVs/lN0qhnd0rOHIAhJwfKVSZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfQT/2XPLf2n6v0v8lmdRiqzk1J6kgQmhNK8JFgYZPhfIi/O6AM+QYHl/d1Tte96k
	 56LjniEuf8lroBL0GZE8qW8MRf1le5xs0Rdp3HJQiEQpyiiMhkPp3vBgGJ/y9GpnmM
	 OAFneIl62Kj6EXsvCZR+fO+PjT42c1Dr3SKgVrWNpo1kSkOSp4WbUDPkF6J6vCa1xQ
	 ZgUFnB1UkTZjNWZSs6oMgNAwf8k17O9hNeYB+z45+IyVS0FfPffo4C/lsuOdoECOqs
	 hr0aO+/eYgfgkdoOyQnrAEU3G7W8zZOEGM0GJ36uqi45Gjn5Y7UVXKcZaiS8lX5mLt
	 9hWoPDd4Nsryw==
Date: Fri, 16 Jan 2026 10:00:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <20260116-frisky-heavenly-pig-953fa4@quoll>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
 <aWmc73irBAM8DZwF@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWmc73irBAM8DZwF@redhat.com>

On Thu, Jan 15, 2026 at 09:05:35PM -0500, Brian Masney wrote:
> 
> > +static void atlantis_ccu_lock(void *_lock)
> > +{
> > +	spinlock_t *lock = _lock;
> > +
> > +	spin_lock(lock);
> > +}
> > +
> > +static void atlantis_ccu_unlock(void *_lock)
> > +{
> > +	spinlock_t *lock = _lock;
> > +
> > +	spin_unlock(lock);
> > +}
> 
> Are these abstractions really needed? Why not just call spin_lock/unlock
> directly?

They are actually harmful - make code less readable and introduce very
poor (lose) API accepting whatever pointer... This is exactly code which
should notbe here.


Best regards,
Krzysztof

