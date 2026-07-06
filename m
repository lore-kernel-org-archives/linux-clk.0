Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D43D904D;
	Mon,  6 Jul 2026 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783368440; cv=none; b=ePo1NOEeof4fz7eIOcAT7x5cvgEhJsJsj2CZOM6+jV/UUkz2BM1BzHJ1fml/rRlS1IeTjfrlFC8NSnVE7rdKnzfyuLf5gUvSZFm7BBdD/6f1sDJ8XjsH22PVO3NanKR43FO9rviU1EPNxXRQUZI1qJblu4+K81UuUVTkdrdHYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783368440; c=relaxed/simple;
	bh=DVkJ80ei0QraDVvglBABDS8jJMefAqNaSrs+5dbxpV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJcLxm00VjHzXVBkc5/24veAqvpCBlafOq34ZLnQDq95ZMvQxRS845y8GZ96KilRvzCsmPffblZe2h+XT4w0ztjdgLFn1tU234L45JyulpLgVLJPOg+zvhOsib+Zi7AWxbOuWak0oIwak7Kvkv8lLBngj2V+2i4qknfALLZD+kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBzhBI8x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBzhBI8x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1331F000E9;
	Mon,  6 Jul 2026 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783368438;
	bh=CkZHCYA2DevLfCsQnJY3TrD+OoWM9RORj16SR09p82k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QBzhBI8xRIkLKkOqJo7nvjcxvlhhfqZAORALMzMu5QWqDmjEXUHdKaMiJBkoo7Ejl
	 +83yZ5JrB71Srk2b6RhwM/lhRmxNweutuWUDaDfcy4h1GOA+V+XVhSm48modEyyyLe
	 gbxCHBiM6xHlUx5nJutqs5XAW0FAxWmK1D6dt0vBe4dscbGC17txjdAoQyK/joRzqX
	 XGAqGEc1XKARGWolR51CBbNVGokZHCEibB+zSlK7MSCqNZOhzx9PSxXyOIpcrI+UqN
	 dpNvRMh27FaAzx3b2gFGs+KMrIOvYCoha0HkdlDUXOJlaoQXN2XFiMILcInPOOf+SK
	 vcUaujYT3LMDw==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Han Gao <gaohan@iscas.ac.cn>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Drew Fustini <fustini@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] clk: spacemit: k3: set few clocks as critical
Date: Mon,  6 Jul 2026 20:07:12 +0000
Message-ID: <178336796970.834791.13749678515323157051.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
References: <20260630-06-clk-hdma-critial-v1-0-443c0ac88c5f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jun 2026 08:53:18 +0000, Yixun Lan wrote:
> Some clocks in K3 SoC need to set the critical flag so it will never
> get these clocks closed.
>   The HDMA clock provides the clock source for internal TCM access path
> of X100 RISC-V core, and from the real test case, shut down this clock
> will cause whole Linux system hang in a quite minimal environment with
> only ethernet, UFS modules enabled.
>   The RCPU clock is needed for RCPUs which are two RT24 RISC-V cores and
> it's responisble for running ESOS instance. ESOS should be always kept
> running behind Linux, so set it as critical flag to prevent it from being
> shut off.
> 
> [...]

Applied, thanks! Queued in for-clk-fixes-v7.2 branch
(Pick only patch 1/2, while leaving 2/2 for now)

[1/2] clk: spacemit: k3: set hdma clock as critical
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=eb525edd48907795c0d4e498ff57ad168070b289

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
