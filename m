Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C78E26AC3;
	Fri, 25 Sep 2026 02:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302176; cv=none; b=E5UC1C6QIMMP4nouCGIhELlDX2D+MW7K9hPAY+amDmeDzGi48zkeFnLbynkK4Pr8lych5JuJSII9nSBvCqIReJvOR+ITL27XihDYVaSHOvFNKRUjrffB1pTJEPHzuLvm2oN+B5QqLXbTEVV+Py38a2NWetrBUWDTAQTNzvyaHag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302176; c=relaxed/simple;
	bh=Lee/KGTk0erzLHAjrCf0qKCpp2QdgSA+BXuhxZBdeD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IREj4PSfFc4CaL5Vpu3Y+vVlEMIdeWax0XmAec33DROmwDnzORApEsKNs1eeuSElUdzpArR7kA3SN+FA0H/vl1CduavCPeRdO/EAlffgbYCjlAXHxuiyIebbm6dmiVN5VbuSkyVxZ5X0CPETvzPDtLdHSFSfifNhVox+n2dabLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjvVMfzu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjvVMfzu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A196E1F000FF;
	Fri, 25 Sep 2026 02:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302174;
	bh=lEL7RjYejIrWAwKkZbGHqb91M2mSRkyiPtdwFTRkUfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjvVMfzuQCo1u9YBX0Kqq6OQK8qMet0GOlgyftH8Xn5HAFe4a19psJzg8db7IDl3y
	 MGfBw7+mCm+4acLgm2C+IyYsVAgZO+IVOwWLOWiqndh0FzfEoJriPO4mA+p7yy7l+t
	 78DGZRlhCVkcSpqEUxCHKCv4eAwpJSEsyehM/qmNIGbPy0PtYDGdFqPHf9NXzAdoFv
	 8eBbH3r57ldzviReBBmTK2h7yx9stzZ51ReVF+ZJ5c6eDvYJYpZPxx9gM+yaRJ71Rd
	 ekx61NS913qmU4GdoXSZ/NFrDyCSY4BIX+k9wa8QYLnpw6CiS5Qo3SCww98BF2wS5F
	 vqkZjsszoFDKg==
Date: Thu, 24 Sep 2026 19:09:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Brian Masney <bmasney@redhat.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] clk: tenstorrent: Fix refcount leak on shared gate clk
 enable failure
Message-ID: <arXX3RkaFvEwTySN@thelio>
References: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-atlantis_gate_shared_enable_fix-v1-1-303f925b8a3d@oss.tenstorrent.com>

On Thu, Sep 24, 2026 at 10:31:51AM -0500, Anirudh Srinivasan wrote:
> atlantis_clk_gate_shared_enable() increments the refcount for the number
> of clks requesting the shared gate clk to be enabled always. It should
> only do this when the enable for the gate took effect in hardware. It's
> possible to end up in a situation where the gate enable failed, but the
> refcount is incremented anyway, so subsequent requests by other clks
> that share the same refcount get ignored and the gate enable is never
> retried.
> 
> Update this function so that the refcount is not incremented when the
> gate clk enable fails in hardware.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/AS8P251MB00013BD9A093C06D2D60E10EC8B42%40AS8P251MB0001.EURP251.PROD.OUTLOOK.COM
> Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller driver")
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>

I will apply this to tenstorrent-clk-for-next.

Thanks,
Drew
