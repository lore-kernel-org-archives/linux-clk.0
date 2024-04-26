Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168352B9AF;
	Fri, 26 Apr 2024 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714149759; cv=none; b=Dz2gJz1pBZrGeDeXoL4bjKtSRp9uPymOxKapTSVzH8uAAYIAAzg8LtspQVawSgAxkgJcgl/KVzvM8UDPClRdTV1TwQcCyvKzn3UyHZtHuMKKQfPQfWuvauX3Ez+yvM5Uk/yR05Q21B22MAJEznOoO7yBdyrEWKXffQ8L6AJ9Mik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714149759; c=relaxed/simple;
	bh=LoLb3vVGFbyk3Pd1kL09L2W0LiatbYP/cUPGdkJy8+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qvmkrp4sgm/nAnBVe4SbIk8lBa3kGC9Awt9xdOnUd3lzpwtgTDOIk0wGDJ85zLU9K6S3rrX086CWHfuO66+pwdQTuoSGn6t1OfvXEO0boYwazssmBN/EM5BcI/Aj48LNOmqorL/kp6/h0BUL/NFJtZxOB8QEFrYilZZgLnbymjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1rVP2Eh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1rVP2Eh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E67C113CD;
	Fri, 26 Apr 2024 16:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714149758;
	bh=LoLb3vVGFbyk3Pd1kL09L2W0LiatbYP/cUPGdkJy8+o=;
	h=Date:From:To:Cc:Subject:From;
	b=m1rVP2EhBPt7UFyw2Q8aw/0Yk3GdU7IFN+/ZdCVfbbHrY/E4xtZGyXuoJj4yPm2Fl
	 UWFKdC4tFJWmGCFh7DT8sgnmi4SVXJkLdUE6oea0NsCQJ+WgyyBYxUjRzhErX52/Aa
	 tkjS1nrb+z/eUtZSFGKmo4SPL/J5f4PA8Z6XXGiX4Tk5iR5EcxpnEHNooTnWLji1zd
	 nLj8L/TWxMH7y6mjCmkPg6JUSt6AVWae+l8izh2P851MWF4pD/0+tisRmLiBYD3pnr
	 P5ul7HNRfraKGIXmEGPUMOmONIFbNPYV38U42Mhewb9B/JubPMNBKtz8280Yg/Q0tr
	 dI11BBMmoUS4w==
Date: Fri, 26 Apr 2024 18:42:35 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 6.10
Message-ID: <20240426164235.GA100991@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 6.10.

Best regards,
Jernej

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.10-1

for you to fetch changes up to c60f68047e1996bc1b2fb386d3b383aab8900c1b:

  clk: sunxi-ng: fix module autoloading (2024-04-15 23:29:50 +0200)

----------------------------------------------------------------
- Add additional constraints to A64 PLL MIPI clock
- fix autoloading sunxi-ng clocks when build as a module

----------------------------------------------------------------
Frank Oltmanns (2):
      clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent rate
      clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and parent rate

Krzysztof Kozlowski (1):
      clk: sunxi-ng: fix module autoloading

 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c   |  1 +
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c   |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c    | 13 ++++++++-----
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c   |  1 +
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c    |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c      |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r.c       |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     |  1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  |  1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  1 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c     |  1 +
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c |  1 +
 drivers/clk/sunxi-ng/ccu_nkm.c           | 21 +++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_nkm.h           |  2 ++
 25 files changed, 53 insertions(+), 5 deletions(-)
