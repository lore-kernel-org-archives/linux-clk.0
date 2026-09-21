Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684948E0FD;
	Mon, 21 Sep 2026 15:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005981; cv=none; b=HdjEHdw0RQcm7jSbg3wTqysU9pQQTIZWWNPqj6ldQB20u5k2g1Z5WJ63DtJivMmpj3cgFBbzKbMKC1PxmG7lzSkXYxqV/1vrz5wbHQDG8TNF9Zbw7aOq7Ujd0gV/6KioOxIDi7fWBEPIp/qYHf7e56RIaXSxDGsql/NU944gaZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005981; c=relaxed/simple;
	bh=nOzPEcGIoG6k1sHDGMuGV9ljX1lkGAwRWCGgaiX+YSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p9Gv2hOVzPo5TrN3vCrZ/t2q9lDRa9CYAl8mfG6uYfi8tMpUq/++t2i8uuJsgcC0mb9OPhkabr0L1HNBvyRI28xhjCBmzC+JlmS6lvvTSfedj+bbvJ1Oz1QJ/MoqMfFs/h1H+KLcH3QKdlo0lSndPL0UW4z0mYss48aA8BMh+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNfQol+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNfQol+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EB61F00898;
	Mon, 21 Sep 2026 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790005979;
	bh=hIi2nadaz9v+40zq6lBkL1D9SKdfdSIeq13JuEYLWgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cNfQol+0/dbhPr7tGbQyWQFtuRS1ayA/d4OnAEZ7bAMZDyVMydSz918Ly76J9LDt0
	 k3lVzbO8m3ix+LIpOhR1XQdq4vcFcTD73OgtHIcxZYwqs8Fxydtwc7XmlKe6XONnlA
	 ChkIZBix+f69C1AJDB35bAudUESRo+LIJG7D3B38iDBlVPjh11s/Wou78uB4tudJCR
	 LafwSwciHWxN1rIWH1GOeIMfM2Z+AaqOdwMH+BlFUvcgeDXTkWbBQPw8PkbgbDjr+S
	 ulNE4iE81x5iKrUgAHcXfRWzc0hZ7EdIh3UEevcXHdEE4qXBCIUoTimj4Mx036LfF9
	 VX3W+RZRmnWCg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Alastair D'Silva <alastair@d-silva.org>
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20260916042910.382744-1-alastair@d-silva.org>
References: <20260916041104.239999-1-alastair@d-silva.org>
 <20260916042910.382744-1-alastair@d-silva.org>
Subject: Re: [PATCH v2] clk: sunxi-ng: ccu_common: Use
 readl_relaxed_poll_timeout_atomic for PLL lock
Message-Id: <179000597757.4029583.5932313029750743285.b4-ty@kernel.org>
Date: Mon, 21 Sep 2026 23:52:57 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 16 Sep 2026 14:29:10 +1000, Alastair D'Silva wrote:
> The Allwinner sunxi-ng CCU driver currently uses
> readl_relaxed_poll_timeout() in ccu_helper_wait_for_lock() to wait for
> PLLs to lock.
> 
> This non-atomic poll macro relies on ktime_get() and the kernel
> timekeeping infrastructure. During early boot or sensitive clock
> transitions (such as CPUfreq DVFS scaling) where timer interrupts or
> timekeeping may be suspended or unstable, ktime_get() fails to advance.
> This turns the timeout calculation into an infinite busy-wait loop,
> causing RCU stalls and system freezes if the PLL lock bit does not
> assert immediately.
> 
> [...]

Applied to sunxi/clk-for-7.4 in sunxi, thanks!

[1/1] clk: sunxi-ng: ccu_common: Use readl_relaxed_poll_timeout_atomic for PLL lock
      https://git.kernel.org/sunxi/linux/c/9ef62592b80c

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

