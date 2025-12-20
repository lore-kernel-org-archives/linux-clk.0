Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3323D7CE;
	Sat, 20 Dec 2025 02:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766199574; cv=none; b=ow20Dg6xREFDx3CqKYr7cl9cMZYOb930aVH0wyJuECXJ9xNQc0Iqrg5wfFGzKaAM0lru//b9ytMkkouXu1tfXr8iG3NZ8zTqaJZjPVDfI6l6NSy70Anj9Lm0v9oIrsmGk7rB3bolmJpbFmu4aQAs0eVCEZIG0npEtijcPIJFa1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766199574; c=relaxed/simple;
	bh=0EJ+zTtJqRf5xTnMW4/+hYTujivSmGucbg6QhbKMs+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snlOJUwxSkoROHl/LATPlCp75Ge3V6j3riZ1XYMUie9jDodMNVJjXxheUJldni2mPBqM+F5xQ7LSqekPDrQNIiJaqCs4f9XAFTKR55Mmox8Snm39eWoHQ7WVGl5D5haPaGit+QTlKDQI5MJgmsA9Mzkceyt1F4ydqqgpNUcEDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8FDBD341A5B;
	Sat, 20 Dec 2025 02:59:32 +0000 (UTC)
Date: Sat, 20 Dec 2025 10:59:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <20251220025926-GYA1962618@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
 <aUYMjAi8YIqValwb@pie>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUYMjAi8YIqValwb@pie>

Hi Yao,

On 02:40 Sat 20 Dec     , Yao Zi wrote:
> On Sat, Dec 20, 2025 at 09:11:20AM +0800, Yixun Lan wrote:
> > Due to the auxiliary register procedure moved to ccu common module,
> > the auxiliary device id need to be adjusted, otherwise reset driver
> > will fail to probe.
> 
> Does it mean the reset driver fails to probe with only PATCH 1 in the
> series applied? If so these two patches should probably be merged, or we
> will get unfunctional commits.
yes, it will fail with only patch 1

and no, I do not want to combine them together as they belong to
different subsystem. it shouldn't be a problem if they are accepted in
same merge window, or if people too picky to worry bisectable breakage,
then I would ask reset/clock maintainer an ack instead to make it go
via clock tree in one combined PR

-- 
Yixun Lan (dlan)
