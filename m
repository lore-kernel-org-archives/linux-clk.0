Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C938E120;
	Wed, 14 Jan 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768400244; cv=none; b=RfnFjRA2JRdHyBw3HWyyOtdq3fIBjFfXhwdFN91w+tQV6l/Rgs9TRaOClCyQ7uePSFjdW8sK+6cN3KHS7Xtk36c+rEi1A9XrvJ8wyhiEgofhmrW7Vtyq2LBDvMVNTV3Cvd0umv3X/zLVp9qITAvGDY1rsaCdnRLKjj1bzpgnz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768400244; c=relaxed/simple;
	bh=YDsCVs2H7YNQ9ysjzYX1cmm6O3NKFEO7OM3ERJ5sYJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+ghecFk7r9wRosTftwpxEpbH76ZOE9TYyVgaZDlYf3xuI1LkiAoUvAkaC5KbeXxjLRwyMRJG11tRLODEl4k97JQyV83i3FdGQ5OVdO7EDKYeczVbbpCPKuIKJkdIHFnZxZTb5sQi/J4ZC9wB9kopUXM9BM0pAUaAztPdrCySrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIyXnmkQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIyXnmkQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDDAC2BCC9;
	Wed, 14 Jan 2026 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768400242;
	bh=YDsCVs2H7YNQ9ysjzYX1cmm6O3NKFEO7OM3ERJ5sYJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIyXnmkQiVnngJi8wGzz323lSTCV/Wi6MbbQYOddwZaw8ndYADSu/Obem+dNXIcsR
	 76ueat5/MUeP3CM9XsI4SmLUAvzUJRD/u7/kWpH3bwUwEZ5THfHEvoPb7oDoZ+a0Hb
	 P5SNsPNFwQLWjDC3ryxWgz0jUr7elQytXQL7W5wV5dhDQaWdEer3Sj28aCQaHUrltt
	 jjJYJJ1V6xtNSBqsOOpssmOqjDQ1vrN7BrEIJnyEt6TZdXWHJ4UOZ9NsznTriqDWh5
	 34L/Zr4eU1u7/1tTyyPnbFDfwmIvYvRO4z5bILTee8Eirr7fEWxx/CU4R+aVduyXEZ
	 78GPYSaYMGXLg==
Date: Wed, 14 Jan 2026 19:47:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 25/27] phy: ti: phy-j721e-wiz: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <aWelbtaZjS4SZGQO@vaman>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-25-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-clk-divider-round-rate-v1-25-535a3ed73bf3@redhat.com>

On 08-01-26, 16:16, Brian Masney wrote:
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
> 
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
> 
>     req->rate = divider_round_rate(...)
> 
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
