Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262F03090D9;
	Wed, 29 Apr 2026 03:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434855; cv=none; b=qA7UB37flZNF/ldOpFV8gD5BtcyBuE/BGlTVzkMHAjOAVXe0mTDHX9l9rpznE7R0uzzcnOwgaWhzrG7ckFq/5YScDNU8bYO92EchRJVNbX1iaF77u8NohqTq+2+zmbHV70sy3Mdog8d4RiJIJ2FGOXqtqLkQ3Qh8rJDiwQIUeN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434855; c=relaxed/simple;
	bh=XD7LybSAWJo5KpfEb3C0kVQ7LW2jaY6lh3iKwHXtfjE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qnMqRvvzildlhmqaFATv7B6lwD1CQQIHksWmIUch6f/MULUimeSK9ftUdj9ewC0wGDeJZ/FcLQ+XetkqScCqk52LIV7jqanyqA9E/W66TITTkUc4xHi5rTZBTbmoSrmQE4FutRHeZ72Z+nj+Ar6KSblmoTr5gbQQsnAe1S/Px/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJOJLsvR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJOJLsvR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C06FAC19425;
	Wed, 29 Apr 2026 03:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434854;
	bh=XD7LybSAWJo5KpfEb3C0kVQ7LW2jaY6lh3iKwHXtfjE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sJOJLsvRUuRdJelK7SHCtw2wEoFlk3/lB8Ud8Nnz8YoElntgz2oenXX0QrADDOA2T
	 j0aOrWBO06l3S1Ckm/mKTMTj3MzxTsLD7kNlPNPWgSJRKID3I0IE84GSdcohVIAs+m
	 4Lyy9ndUe4enkds0AtB5PXBYFoIfY2+KCTM3Kfw0Rt2HuKERt3CAtfG1QxYdKpNEr5
	 jU6nHjGx6CZkX2b208SLzgJeS0Yo49Il30PYKospslG5bV1ee8xOoN2KzYqrPQAaI3
	 Cz+Y8PevW5ojH9Nsf+hOHg8UC+LXjGr44RcWzn/hvr+n61+y+YxvnUVBjMEEm/g9nP
	 CnWTUTDH4SDrA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260415-bmasney-clk-reviewer-v1-1-49c71082c973@redhat.com>
References: <20260415-bmasney-clk-reviewer-v1-1-49c71082c973@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a reviewer for the clk subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 28 Apr 2026 20:54:13 -0700
Message-ID: <177743485310.5403.12052018533672150549@lazor>
User-Agent: alot/0.12

Quoting Brian Masney (2026-04-15 13:30:49)
> I've reviewed a lot clk patches for parts of the subsystem that
> typically doesn't get much review. Add myself as a reviewer so that I
> don't miss anything.
>=20
> Link: https://lore.kernel.org/linux-clk/?q=3Df%3Abmasney%40redhat.com
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-fixes
