Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD36489FDD;
	Sat,  3 Oct 2026 17:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047582; cv=none; b=Ub6BzsxbxXCmjnU6CLnsMaoFCAb58NM8y1q6lEczTz2/tQ0kUoLy1oDduy07AiGW7PZYmBLSQDwlIod/mXGApL4dtH42jePRh/d+JY9CW81Gcm21Mff8daPncdIkEvpXaLmYjjcpzfvc2I9IMiyaiCtgqRxW5Er7DdglgKDcEiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047582; c=relaxed/simple;
	bh=0oyFs4uOGs4H1gccO/F2s6dkScfA44grjw264DWQylA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCthOUIBPkNT7kuRbvxAFW87MN/EUX9/Pg6iKrNgAzYiPUbiCOsAF9jDxSJHPp6cVAQg5FHnTfp6tigzS7Np9nIIk5ZOxD2CSHiVe5t63524ji8Gf5AFVoT+0LQxw3bq7vxo43NFMMZ3i962l+J4EQX5N3/Uabzb9VHqJytYCcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvO8/u/A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvO8/u/A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44AB1F0089B;
	Sat,  3 Oct 2026 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791047580;
	bh=kAqQ4xinSUc4yXroGj7gCvZiryGMGvyGCvMOHkjDy00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvO8/u/AJo5x7NQgWTKQoTYjmgerBXtpVs2UYB3Bu2l1+mBxwSDC7LBTKTJnciR9k
	 bhDYswPucwQML97aQ/3FoydfM4DYLintp2HnQpPJ8oSK9DMOb6DIbepPKuufOLC3zi
	 7WZxBqQQVcgimuoJ+5Spsvvee5OXytw69WsuhNJZpAraPGVieLNUG5PgxUCbYa6q6n
	 /fxHUrQx94FRXqZW5kbTW2ENQR0FWiRf6EI+rhOMR5D8ke3HVcjMW9qesmC0IJ9Ax0
	 QbgkmBRSX/Jg95TtAwBvGQWMJTln4TSuUXAGTKIHuKPEpQ0BUOOc6pbhxGD+WKUHzN
	 wpHaSD6ZVZ0ww==
Date: Sat, 3 Oct 2026 13:12:51 -0400
From: Brian Masney <masneyb@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Aamir Ahmed <elb12345@hotmail.co.uk>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Peng Fan <peng.fan@nxp.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] clk: tenstorrent: Atlantis PRCM fixes for v7.4
Message-ID: <asE3kwpkTGM7L1JI@x1g10>
References: <asCtllTmVqc1ZDBK@x1gen8.tail89d63.ts.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asCtllTmVqc1ZDBK@x1gen8.tail89d63.ts.net>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Sat, Oct 03, 2026 at 12:24:06AM -0700, Drew Fustini wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-clk-for-v7.4
> 
> for you to fetch changes up to c64b54ddb692c30b8fb139a2ead32eb4db7faef5:
> 
>   MAINTAINERS: Update RISC-V Tenstorrent SoC entry (2026-09-29 12:06:41 -0700)
> 
> ----------------------------------------------------------------
> clk: tenstorrent: Atlantis PRCM fixes for v7.4
> 
> Minor cleanups for the Atlantis PRCM driver:
> - Set the onecell .num before the first store into .hws[]
> - Only bump the shared gate refcount once the enable has taken effect
> - Use regmap_assign_bits() in the plain gate op
> 
> Also update MAINTAINERS: add Anirudh as M: and change T: to kernel.org

Merged into clk-next.

Brian
