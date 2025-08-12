Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3330F1C861D;
	Tue, 12 Aug 2025 05:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975013; cv=none; b=eukJivL4kO4omVeonYQustiBORRcDgWcoxv2VkfzJsJkgtDasMIdceaVBd9A1fKLJ0t3qk2RlSF6KsHeqSSe7basK5c6VX8zFAmXU2Hc0Lc0NBC8o6YCneXZFcyX4hjuXBx/dTlXW9/IjcHw1um9xwLQuxqRdYVy45Li1CKagpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975013; c=relaxed/simple;
	bh=0aASSGzPbsJlEgSlsZ6D6ZGfHF6ChcO7jQtZrFDV5KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKoIkwLEbgpB6k6rGZMGd7KVl1g4HKUotR442X+ASqW7otencWbF1DB0fwkNlzT4HrbsHPR9Ihep2BaUjJwSdFeiN55HxZy+VaGrW2ja034332hSV89TVSUKFRBeg4RNv8I4isp68Svi9DrRer3bklK/c8ShFkzyvbINbT5ISAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSp4+2nO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSp4+2nO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E5CC4CEF5;
	Tue, 12 Aug 2025 05:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754975012;
	bh=0aASSGzPbsJlEgSlsZ6D6ZGfHF6ChcO7jQtZrFDV5KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSp4+2nOySu4amL/FumQIknZTTUfFptWOpc5GVzG7wtNvxA3J/v0qCh44l1uPF2eq
	 8qPCWXXAX9k615wImyzdn7xiKkBOBHxEAFuUwMxKWm1xz9zg7oau8dJmvsZLQxNydC
	 rqtM9Tr9/IhYVNjc6tInsaEflUiHJCJzMfeiPvEhPIhZewe3WQDg7qXZpS0lZH1gQA
	 EWYoVu4C0kdtQJEf/+KKCKzSfP9tR4wr1rmYIP9rYXXHnywpsXgDAwJysaWy0bTGnK
	 /GBQ1YYj/kuDSOYAObzfiPOAshVYXnl4miE5MJVb5ywa8VdqMEJyEKPFtjVitN2eq+
	 f68jsp3Rgzqgw==
Date: Mon, 11 Aug 2025 22:03:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH] clk: thead: Correct parent for DPU pixel clocks
Message-ID: <aJrLI7RAAUBTgiEK@x1>
References: <CGME20250809170205eucas1p2da20fc85d38c98195d2ce36422592bee@eucas1p2.samsung.com>
 <20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com>

On Sat, Aug 09, 2025 at 07:02:00PM +0200, Michal Wilczynski wrote:
> The dpu0_pixelclk and dpu1_pixelclk gates were incorrectly parented to
> the video_pll_clk.
> 
> According to the TH1520 TRM, the "dpu0_pixelclk" should be sourced from
> "DPU0 PLL DIV CLK". In this driver, "DPU0 PLL DIV CLK" corresponds to
> the `dpu0_clk` clock, which is a divider whose parent is the
> `dpu0_pll_clk`.
> 
> This patch corrects the clock hierarchy by reparenting `dpu0_pixelclk`
> to `dpu0_clk`. By symmetry, `dpu1_pixelclk` is also reparented to its
> correct source, `dpu1_clk`.
> 
> Fixes: 50d4b157fa96 ("clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC")
> Reported-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

Thanks for the patch. I've been excited to see Icenowy and you working
on the graphics functionality.

-Drew
