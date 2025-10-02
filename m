Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E157B442C;
	Thu,  2 Oct 2025 01:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759368669; cv=none; b=NFSw/jYgsiqIOIteNyNR91kuirUER9r7W0lB7bGqxGOe+Vmfw20FPZS3mGin66us7GhCQ7Ssns5G2SJHjdVaICLswmZGDCBD9Y8zMaXzEZa0mZpv6uGm0OwiAePUHaLq44cOIAGl99bTFgVnU+YOVX9gmPK5N5vwlduHzQu0EdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759368669; c=relaxed/simple;
	bh=HedJW/nDt3ySfYEknVt9nC6mYxiOLbtjAAGaTegzmC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dltU4ye5yRD8Zkm+I6lkGdFrLrCw5UKXfLB5aOT4yONYlD9/4lgtZap69kgxliROrrfhQ4myMvfXN9XtEEZXYuP2g+F64FC6CFx7GQCBZH7g5Q+TfrbByspFpfUHZyXI0sCL+2mVSmlR9EO5btY2RfUekx4H07/neUd0ReMAipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK3FBJ2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK3FBJ2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3AFC4CEF1;
	Thu,  2 Oct 2025 01:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759368665;
	bh=HedJW/nDt3ySfYEknVt9nC6mYxiOLbtjAAGaTegzmC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TK3FBJ2Pi2XNFQq9wfiZrF7ao79pFnuUna+jNN0498YP7RF7HEsRgtaLhnbLS6q0r
	 hpboNQUzFTc1MGKR12rpI9y0J3SKPMEvGY4NQP2HAaEN52crnjtGv1sLYtJ11tn06D
	 YjPslPyB9QVE8rIkGcNSfhuH1JeIsqAvuPHJQJCtKrvmZN26/3HKrC8YiJacARUjj8
	 V6YCCiLuRSwwsoaYDX6V7CF84x9nYW3hLryJkVq927C1YnZAvosV1PP8ZVooNIavsO
	 KbKcZ0y91kn+zfApjzIAoO98WSPQus3zTdGW1z9FQYmNsSawQMOGbVSAh1XK8zb903
	 ro8EdAaYMFEzw==
Date: Wed, 1 Oct 2025 19:31:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Anup Patel <apatel@ventanamicro.com>, linux-clk@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
In-Reply-To: <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
Message-ID: <82323d78-0111-aa0d-cafb-d0c04071c6ea@kernel.org>
References: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be> <6555b47f-919b-b56c-4a76-352c904343c2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Oct 2025, Paul Walmsley wrote:

> On Tue, 30 Sep 2025, Geert Uytterhoeven wrote:
> 
> > And perhaps the "default RISCV" should be dropped, too?
> 
> Probably.  I guess we should just add this to the arch/riscv defconfig 
> instead.  Let's wait on this one for a few days to see if anyone has any 
> comments, and consider that change for v6.18-rc fixes.

Sorry, this one got garbled on the way out.  I meant to say that we should 
think about whether it makes sense to use a more fine-grained way to 
enable this by default.


- Paul
