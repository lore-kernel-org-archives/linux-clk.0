Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E37237180;
	Tue, 21 Jul 2026 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784665912; cv=none; b=sqgiqJcVhTK5yYiZby3xhtFOtYHJTXnS2lnftGLISWE73IHfZd8HJNdrYb4WaBhZVAeZ1xalHTMMkJc6nqD4DnbK1Yq7NT3WzlUvCchEKCHVE499/b0nVdTsSk2QV7yeGEANG2VowvqBuPZw7FxGc+eJ1Hzi9tcYkluysEhfDDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784665912; c=relaxed/simple;
	bh=L7CGoaV6Hl7hZVsrv5nq7cJoEHdEHmBJlPdzSG9qGNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYZ0azazAYDVVxbFdKXGi0z9b5vzOIoAALNgaLjhhe85FiFGOCPGqpQ5z/kVU7AGsbm03mMP7l2l3ws/v2lry+8diRMiYQmn+yrDalVsALcx9w2ZOjgzQO98L5QDw3WXOaoNkDFrjmBOfe17sYX2wNh3iedqSBF9KrJz6C21k7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9EipnQW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9EipnQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDF21F000E9;
	Tue, 21 Jul 2026 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784665910;
	bh=MD2w6kulUoIcZFj5hkQ0HxsuO+mt3YlOYhddCSLSlhE=;
	h=Date:From:To:Cc:Subject;
	b=M9EipnQWHzM2klQ29Iv5gY6vvMdh37tKaL0psoe/2UipDjjJDrwfR9S9XdwJ5dKhI
	 5HN4zKVO6ByD4HzJFE55a4s4xK+n7wAnSKC3Ih7X5Xp04hxLdkO1CJZZvRZiMFB9OP
	 bXy/F3yy00LRR4O6pXTDhmMZGHMRHVr8SudTWtK79bz30p9nxxm/A99VIjcVKqvzDY
	 1QwqXnrQjLBqBMui3Fh2NMI9v/+1ASZxh4/Ulcz2JoMfZNkH1uDIruH+m3Nd8Y1PiG
	 hD+qjshqkF8/cpLCP2IqO0mhNNWbA9VWHPmWk5OTm3sE1PJUhmIcJyTx3fa9SaL4xf
	 jPlOcBAZTG9IQ==
Date: Tue, 21 Jul 2026 13:31:49 -0700
From: Drew Fustini <fustini@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Rosen Penev <rosenp@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	=linux-riscv@lists.infradead.org
Subject: [GIT PULL] clk: thead: Updates for v7.3
Message-ID: <al/XNcvZgyeGjXFz@x1>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-clk-for-v7.3

for you to fetch changes up to b2ee00d0bf4cca5dd02702fc339d2b523191966f:

  clk: thead: allow COMPILE_TEST builds (2026-07-14 21:42:01 -0700)

----------------------------------------------------------------
T-HEAD clock changes for v7.3

There is just one change for this cycle. It allows COMPILE_TEST to
select the th1520 clk driver without having CONFIG_ARCH_THEAD enabled.

----------------------------------------------------------------
Rosen Penev (1):
      clk: thead: allow COMPILE_TEST builds

 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
