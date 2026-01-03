Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3382823C50A;
	Sat,  3 Jan 2026 22:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767477612; cv=none; b=LVBf4RnqAuOmHmIrMlpC2xXotf4aKUxL/+4v9GzZW2h21LuOYxMrmsDWm89qQQvWOVobMEi/sn01Y63nshca7r1R5XpqyUm4XioIlMk5pHCx5icLgvj1hDjMlEQ3uW5EeO7PQPUgN/l+RQlf43M8Aov0jnMHtChQfg6g81vHzjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767477612; c=relaxed/simple;
	bh=1qfvbOaJT1rI/jOnELZtoU2y2KY6/wZyQHSfEUZTTDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsN7T/cfHrxfTpVbdtdhSMzegBp2K9KV/jASxzBZlQiDRAfguH7J1MMauNAUq1hszosAs/UKcAymzQLC6+WDYNFg6TUAYOL4LqmFvXH+TgpHQpF0wdMz4UMfRZSWr06jmn4Y4LW4W0YHqu9Hi+w7Nu2K0ngXLO0MAwAullxzvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0ABC6341050;
	Sat, 03 Jan 2026 22:00:09 +0000 (UTC)
Date: Sun, 4 Jan 2026 06:00:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <20260103220005-GYA2070627@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
 <aUYMjAi8YIqValwb@pie>
 <20251220025926-GYA1962618@gentoo.org>
 <20251224114848-GYA1993014@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224114848-GYA1993014@gentoo.org>

Hi Philipp Zabel,

 I still need your opinion in order to know which direction I should
go..

On 19:48 Wed 24 Dec     , Yixun Lan wrote:
> Hi Philipp Zabel,
> 
> I'd like to see your preference for this issue, see my comment below
> 
> On 10:59 Sat 20 Dec     , Yixun Lan wrote:
> > Hi Yao,
> > 
> > On 02:40 Sat 20 Dec     , Yao Zi wrote:
> > > On Sat, Dec 20, 2025 at 09:11:20AM +0800, Yixun Lan wrote:
> > > > Due to the auxiliary register procedure moved to ccu common module,
> > > > the auxiliary device id need to be adjusted, otherwise reset driver
> > > > will fail to probe.
> > > 
> > > Does it mean the reset driver fails to probe with only PATCH 1 in the
> > > series applied? If so these two patches should probably be merged, or we
> > > will get unfunctional commits.
> > yes, it will fail with only patch 1
> > 
> > and no, I do not want to combine them together as they belong to
> > different subsystem. it shouldn't be a problem if they are accepted in
> > same merge window, or if people too picky to worry bisectable breakage,
> > then I would ask reset/clock maintainer an ack instead to make it go
> > via clock tree in one combined PR
> > 
..
> I'd consider above approach is less optimal, would it ok if I create an
> immutable tag for this single patch, and send it to you? so can be shared
> by both clock and reset subsystem.. eventually reset driver should go via
> reset tree, and I also know Guodong is working on new reset driver to
> add support for incoming K3 SoC, which means potential conflicts or
> extra dependency..
> 
see my above comment

although I've updated this series[1] to v3, the problem still exist,
for this refactoring work, taking this single patch[2] should be enough

but for incoming K3 reset driver, a shared header file[3] also need to go
with same approach.. as both clock and reset driver need it
(we could postpone this for now, and take action once things really happen)

[1] https://lore.kernel.org/spacemit/20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org/
[2] https://lore.kernel.org/spacemit/20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org/
[3] https://lore.kernel.org/spacemit/20260103-k3-clk-v4-4-4cccba2360f0@gentoo.org/

-- 
Yixun Lan (dlan)
