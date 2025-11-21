Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F505239567;
	Fri, 21 Nov 2025 05:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702458; cv=none; b=e6/09wH6qwgJw8BcLoDhYnKFO6fubaj+T/0bWcfAOFpkgz6uyVa83pOCGaWEOVTyNWJkYuSFtMqDmGU+kO+sQRyGud4kQeVRLNz8VShCzFlPOCxtjQzGj1/ivZcaPdsaLht2CZqyOf+TNC/OuZ+8iq1Hvl6ABoxV0OGXvBJU0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702458; c=relaxed/simple;
	bh=nfKOGJnWoc6+nmyYlT5K304xJCnByiY0NWCp1O11fSs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ha9/uCK4vN7GjhueE1BfrjunGXC82Bku0tVbvyAYrH6GWrILbS3WHdeFGAH5uVjjP90MXguKdeX6NTY/UorRe/1dH9CudLs/ZN4W8S/S3ICnULAT2LDqIyCa9V9+Afa416usq2aCG5QDAxMVf4a3Do8X4d+/HW+lVYD0wkFNUWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qos1E+FX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qos1E+FX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3602C4CEF1;
	Fri, 21 Nov 2025 05:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702457;
	bh=nfKOGJnWoc6+nmyYlT5K304xJCnByiY0NWCp1O11fSs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Qos1E+FXxG6/Zzokc+yzMNg2sFaQFjWbTqutq0Qitm4uX8Ns7J5XjYnvaC5jNWMbP
	 vOmOn5cbytqGq091l4BYh1C2T30p2oAyiyqq6bFROHauP6JsfkjjQZlslRpcnqMxJU
	 D/q8A7219Gh65LTgufryw/Uylpa5p9kcwl5ZBHqIqjjmmjXc18ymMZhYD3jux+lYW2
	 VD30Myn5VnqXZofmvEtoibZyYG9K0gZB6otEFgpuTOorxPcr/JJSSF3spd18HJNupc
	 t9zdNLUBudmmDon3jd2OKyqVu7PSV53RIwHUCJURGeYYbaB94TC6Z7C7fNfvPeWDG9
	 pDXfEOhLSnVMw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251028152013.1697585-1-abarnas@google.com>
References: <20251028152013.1697585-1-abarnas@google.com>
Subject: Re: [PATCH] clk: actions: Fix discarding const qualifier by 'container_of' macro
From: Stephen Boyd <sboyd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
To: Adrian =?utf-8?q?Barna=C5=9B?= <abarnas@google.com>, Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 20 Nov 2025 19:24:50 -0800
Message-ID: <176369549068.11952.12533090188793303559@localhost.localdomain>
User-Agent: alot/0.11

Quoting Adrian Barna=C5=9B (2025-10-28 08:20:11)
> Remove const qualifier from functions parameter because it was discarded
> when container_of was called. Received pointer had mutable access to
> it through received container.
>=20
> Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
> ---

Applied to clk-next
