Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF047F2CD
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255666; cv=none; b=P3z/a571XbH1Ek+q3DMB8LbyoNP2j79hpmztev/91ElMda9zUap65F7/2ODxiCnhHG7IffllH64+yL5x4IBZ7QHCyXkh+99tuUC8yx25K3eP0xoVJ0FoF4IR4GjMJJ71V3RtQWZrdi64FIa3pO/kazYfBJUw65lvX3qiURxljHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255666; c=relaxed/simple;
	bh=M9o1iN6To3WfqryjKvDKhDLJXMt0htVhKtjKYfxZ9SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9Qey37OrgQYfC6XnxnXRgAt90e57G1NB9BhnkyHCqT7s76shTnaFsua/P/Ub8el1faj5Iqm8SS3SsdgsEQDlb4N35ino+X0E3JP4cJUaS7UzllqHYRmm9wqD1TWHr+BedEcVW/QTA/f1fqZAvr+sSsJfLfqzL6ya8IPTQzdA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/tZMIfO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/tZMIfO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5832C1F000E9;
	Tue,  1 Sep 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788255655;
	bh=RCdjlu6veFR+y5k/v3QgTn5QssF/RwgEqtIG9n7nJW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c/tZMIfO1dYzA5Ce1FQlKO64f6WMas5U0fsaPiUzmRM37lG4yjdBnF7ecIvh/Twp/
	 i4a9P6uvi3hPYdX8UwIIKs1Os4lFOUNvNrrP7EwllwNBIqJnwH44JqQ0OIEUBDC4hH
	 RYEJRWbTwNauTm7O8TG8OPtLkqd21J40eBiMgwSbw/lIqfsW0hN3+Uq0jqj10xcFVN
	 RJMkAMuds3690w0L0AujrBxvLcb+m1GamHoQ0VLNikZ+p9mpzEzSjHxvrQXJoBN30Z
	 7L5CxuMgRmLjPQXYghUEpG7X1KNCFTdtrOcWb9B2Cc9VGHF7M5st64XtclshWPgLYR
	 DQpEw2dZCAMMA==
Date: Tue, 1 Sep 2026 11:40:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org
Subject: Re: [PATCH] clk: actions: Drop unneeded forward declarations for
 clk_fixed_factor_ops
Message-ID: <76y4cj3o3kdxeli23fd6jireem3rs7w5cnxd2pjl5repgqk6uz@o7bcry4w6ne7>
References: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd9c25f164c46a80b4dd70c12af3196fcb398cc5.1786718502.git.geert+renesas@glider.be>

On Fri, Aug 14, 2026 at 04:43:30PM +0200, Geert Uytterhoeven wrote:
> This is already provided by <linux/clk-provider.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
