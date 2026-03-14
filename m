Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258134EF11;
	Sat, 14 Mar 2026 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773481998; cv=none; b=tAErv0uTc4Ylj2XdZPp3M6zbZT4mU3NNfwvrFqcHaWH4C6mAcpMvquKefqaHFHy8XljAmw+rnxcISPbvNutvXi+saQmJylgKPxUnoelYcy3mLwxUmLNbMaY4eKHGPECLFoGJkKQ98Bj1FrSqWAHZle0PZ8XrlblTnux9LZF+lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773481998; c=relaxed/simple;
	bh=37R6VTCcTCRWcSDleqI5hHFt8e5llja0xDzhgFKV+/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdeXx5iltyJEqLphcoP4LQT51pNsX+HQGX3aL2sr2w1QkIgQAmV9wM2/DJLuWYfbldpQRu46mIBQK6CP+P4BvYUalbkhUyMXwB4ssq8jYnzlcc6wBKK8HRRIdJFTVjb2HK6QhVfUcuxUtrqxz+erqEaQmYMe4DgWvROSft4p/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9gFd2/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9gFd2/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61BCC116C6;
	Sat, 14 Mar 2026 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773481998;
	bh=37R6VTCcTCRWcSDleqI5hHFt8e5llja0xDzhgFKV+/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9gFd2/CI6esLe1eMKcrCe8YoEV/43EE5D2pq4Rxnfz6mht1roWiMH/LkT3qwQ9tG
	 tqk2M2WXbnz9wEoWQzbu9vJH6p3djoqauWlV5I67uij3AvViLDqbzpqUozt2HmGR1G
	 TGDKPS8M/cK6U92L1Z0a7l+PIhpO6+QoRsmgLbrPSNrqlg+t/1mXDhvLOkpUGGgo0W
	 gAGD36Kr7eYwuwrsU0JnrGvtybQBHb85fmWCj7sogCqYe1AVlVMaMjq91Po/l7CHZY
	 wUJNUFOUmeGjM5fORB0BO7/lLUbEcUw+TqiytiMdTn7Oe+0qjtodRZsRkubj4AdqI9
	 zN7y3BcnhCU+w==
Date: Sat, 14 Mar 2026 10:53:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, devicetree <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Ferass El Hafidi <funderscore@postmarketos.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
Message-ID: <20260314-sweet-amber-griffin-e81371@quoll>
References: <20260313070022.700437-1-jian.hu@amlogic.com>
 <20260313070022.700437-2-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313070022.700437-2-jian.hu@amlogic.com>

On Fri, Mar 13, 2026 at 03:00:20PM +0800, Jian Hu wrote:
> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
> 
> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Incorrect DCO chain. I don't understand what Ronald's SoB is doing here.
Please read submitting patches document to understand how various tags
are used in Linux kernel.


Best regards,
Krzysztof

