Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE6307493;
	Thu, 18 Sep 2025 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212089; cv=none; b=NM+bxoSfvPscpEUTtJtfE5XS+fjnDDX7NQBP94tAfUbEZZYEcIUj/08wgyy0ELLxYyJlhL8SC00kt9td3DiH5KpX7ibvmkV67n7b9go2vghjpELYnjIY9/tZ5JO3cs/E6Bt3aE2dXODlIHl0bpefcsbyRVovadZ8LEERkXEa3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212089; c=relaxed/simple;
	bh=in1bAb9uGw0oSzAMJluHolGFvN6cEZ3GnDv9C1qdVe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VidbCNaxZEsfDpXPNG/XbFl25Yuetbkr6CsSrMdrHJK6407Hxtm4h+xgjlIA08e9CcykNBA3X72evgqmycl47JvtZ3qqi1c2jrCoQHCyQTR237U5/LOfEcvu8ZZjLAu1xd8pwQZfmNL1v6bV70YBfvRvlX092M1jsHz8O9ChYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/VMJb0g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/VMJb0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB61C4CEE7;
	Thu, 18 Sep 2025 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758212089;
	bh=in1bAb9uGw0oSzAMJluHolGFvN6cEZ3GnDv9C1qdVe0=;
	h=Date:From:To:Cc:Subject:From;
	b=e/VMJb0gZe5Zl4MYjok+86sOoyj0WhwZdQZRMQk3P/QZulsKTNcQ3O6CkGszugL66
	 wewg2CEjQAtUQdsPOBe5+E1qsfbajYgW5QPKJqKbnX0JWUK2xzRi36cH9kNd1SHWFd
	 9lXP/4aXJf0DDZYQQ6YWMiptUr32S2dvKdklfPDK9PIRK4Y73nLDjDWTUxGoXcvQrm
	 pktYheC0TGtTK0/w5NxQnUJlzZNumE5XA4HWQkClglYlghSvIWJcM8pPdpYmaPengA
	 OT3d/RT35kAsraCAbp75p44u1YL94ZFJBq3kTkWT3wsYmcGmqO7QsWrwNjd0Dnve4X
	 52bwOibV9FzlQ==
Received: by wens.tw (Postfix, from userid 1000)
	id E1F965FC6F; Fri, 19 Sep 2025 00:14:45 +0800 (CST)
Date: Fri, 19 Sep 2025 00:14:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 6.17
Message-ID: <aMwv9a0BjBfEsL-3@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.17

for you to fetch changes up to 25fbbaf515acd13399589bd5ee6de5f35740cef2:

  clk: sunxi-ng: mp: Fix dual-divider clock rate readback (2025-09-10 23:45:48 +0800)

----------------------------------------------------------------
Allwinner Clock Fixes for 6.17

One fix for the clock rate readback on the recently added dual divider
clocks.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: mp: Fix dual-divider clock rate readback

 drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
