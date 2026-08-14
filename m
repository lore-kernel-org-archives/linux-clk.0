Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2882F7F17;
	Fri, 14 Aug 2026 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685893; cv=none; b=QX/DExoe7SjIUwtlQpYeq1DFbGw1WRWxIoK56g79DoqlYmN/PQKIk0MywST8NGx/FijURmjF6vuZba1Rtxtn/eN5L7NBakg0Eaa/+xCNZX4KmegbP0tDA+FwQr+OJFF9O7QZ8R5w53+WBFhPtApNaRnXaS3Ney0+bRW87/hu8fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685893; c=relaxed/simple;
	bh=hWEi5PcIiH/HVIy3Rj5t6X1UxIOq14w3/MzwNCqvHzQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=BwoARq6tEAfMWJVGD+cF+SVvw/BZUVj4LWJ03TGCoB9HC9TQdbGoilGxFyxBcdMm8akj4/eVtTDeTxROf15ZmkPhu6/yVGlfNztlWkpHImsQBAwI8qWWvh/Tzzm21L7qQAReZoyAR0OKPd1h8HivBqGokd/6meIQO0nSxZOTiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6msycHE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6msycHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AC31F000E9;
	Fri, 14 Aug 2026 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786685891;
	bh=hWEi5PcIiH/HVIy3Rj5t6X1UxIOq14w3/MzwNCqvHzQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=L6msycHELII2rG6nfk54h6Gv9u09I5Zpy2CcF5QQOUJHqqqe+4TZU22E6rHnfQPG9
	 W/V/6dZWLtrelNMcoKrfkWoIe6jozrh4GtLG3e45w/X8PFYbOioq9MJZ21VeCjL0V0
	 FnanYr/eqiai0sDepKTg0/wwQvLD4s0dth5KRFy49yfk+2XVHfPkisAKcc2pbHK6ZS
	 J3agoEO/yMUiRFsyrfGKMBroZMHmi/fIU4OeMu29yUPXwI9P4rsG19pWlJmw+vWq5V
	 FJY5A5L1Kz626pFyo8hCun+J6geeqcQKgH6DvVT77yja6O3uJxCBJu3YJqZoNtkWYI
	 Az/nkUmithz/Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260803063126.7-1-bbnpreetsingh@gmail.com>
References: <20260803063126.7-1-bbnpreetsingh@gmail.com>
Subject: Re: [PATCH v2] clk: zynq: pll: Fix kernel-doc after determine_rate() conversion
From: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Michal Simek <michal.simek@amd.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 13 Aug 2026 22:38:09 -0700
Message-ID: <178668588985.5897.17245910889427329297@lazor>
User-Agent: alot/0.12

Quoting Babanpreet Singh (2026-08-02 23:31:26)
> Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
> determine_rate()") replaced zynq_pll_round_rate() with
> zynq_pll_determine_rate() but left its kernel-doc block behind, so the
> block still names the old function and documents the removed @rate and
> @prate parameters instead of @req.
>=20
> Retitle the block and describe @req. The Return: line described a
> frequency and referenced the removed @rate; the function returns 0
> unconditionally and the rounded rate comes back in @req.
>=20
> No functional changes.
>=20
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---

Applied to clk-next
