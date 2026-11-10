Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794272173;
	b=vbySxjfjmd40jozlvWD6pXrGxqGf7FFuwT4fX+HIVCkFuWOFH2p+BzymeUeo/oQeTjxc
	 lr7AeCZHRvgljY9XX9euM1OAxz1astos1hHGnJ29ozCzzElOEzPC7NVSuyfQezqfdPMS+
	 ADpLnkE4YmD+9Tz+BCPdzrMOsPq7UEBsu1Czl9gCJFHQqJiNTV4LYEHj2rkmn7SHXoHpH
	 g3ZqrnugKruXM7cyTlc2FT7UtyaGDy9VXqOBCINC4sMTvrVNHHBENC5Z2YkfjEtBGPx8U
	 /tXUSz+BBRTa3mmeCKhKd+KxQH8sdxDnLof67/zt0ySpAZ3/OEE0PpKlJbB/ndTqtpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272173;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=mqsJpcvl5xnVXB0JO5NOaGhdm3h5WbbRjFyaS6rWLhI=;
	b=DizPubTEEKvRUxpwnu/LtL4zNG26gPjXHwG8fc7109OEMQuxty3fjiM4UzC8SqId51CT
	 f4XFzZymSSw7gg8inHZCnbi/t2Hj7/tfSvOFok3B6uJ1jhV+LJaiaR58W+sFJQUAqIHOD
	 ecgptqVBqyKijY56lzB9/4Zf9tsD5rLMM3nj2wIqpNGu+5bVhcb9PRUyOS7s06Kn0yZJY
	 LPa0RqUfTk24S0f4D5yRn/cKOhHY0yXCSEOpqGTpj3jnPt1T5eZdGArgojuKxDVYXvdHy
	 FpploNeu6qfAauikNHfWnRoN0hiiq9bkHGMl3HwCSV9MRgw5qrBUsFCCsKR2lflvI+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZhIa3Fv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F02606A325;
	Tue, 10 Nov 2026 00:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZhIa3Fv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4211F0089F;
	Tue, 10 Nov 2026 00:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794272173;
	bh=mqsJpcvl5xnVXB0JO5NOaGhdm3h5WbbRjFyaS6rWLhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gZhIa3Fv0wij7Y0MyJ+UZImLtY58ZWWkKRZHSBkrI10cyghyyj+rKuOW4Usw+zr67
	 qwH5wI9YtThAXlBxVWGi5pmYQgt/gPnvU/ZvvhRuLifF5ZKWFIleOU7MrR0feM3M6n
	 FkmlF8khbCeGxWhxRBOy21uYg/1I+i2ZpNzfYiCsFxEobm0KySkfH99ufxUB7yo8NQ
	 4eq1Wt5Kzqmn0wYBMFiL76yK0Ke2vz3n96kS3TgupX7E8nOpVbsJhQnS7fgaqM3F2Q
	 eObgqPHZZqJWlvZ+fv/GHhyGBekhl2F8jHs+n+ZmqMpzAdOSI9B3Kpgs1/fMJWAulZ
	 aZaW2BGSzXxUA==
Date: Mon, 9 Nov 2026 19:56:08 -0500
From: Brian Masney <masneyb@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/8] clk: ath79: move the ath79 clock driver to
 drivers/clk
Message-ID: <avJrqNyhqZiVZQ7f@x1g10>
References: <20261104055852.152340-1-rosenp@gmail.com>
 <20261104055852.152340-4-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104055852.152340-4-rosenp@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Rosen,

On Tue, Nov 03, 2026 at 09:58:47PM -0800, Rosen Penev wrote:
> The ath79 PLL clock code only uses the clk API and its own PLL and SRIF
> registers now, so move it from arch/mips/ath79 to drivers/clk, like
> the Ralink clocks before it. Copy the register definitions it uses
> from asm/mach-ath79/ar71xx_regs.h into the driver, so it no longer
> needs the mach headers, and drop the unused ath79.h and common.h.
> 
> The driver stays a CLK_OF_DECLARE one, as the MIPS timer needs the CPU
> clock from plat_time_init(). COMMON_CLK_ATH79 defaults to ATH79.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

This patch itself looks straight forward, however looking at the
original driver it needs a lot of work to be cleaned up. To make it
easier to review, I suggest that you clean up the driver all in one go,
and post it as a brand new version to drivers/clk.

Also for the CLK_OF_DECLARE, we are trying to limit new drivers that use
this. Please have just the timer clock(s) declared with CLK_OF_DECLARE,
and have all of the others as a standard platform driver.

Brian

