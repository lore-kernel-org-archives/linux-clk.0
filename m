Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B55D26CE04
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 01:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762822992; cv=none; b=QRd6uTrilIZ0/Q9QwAtb2SRDCWTjyddhIwU2OeUDTsgPW0NKdg4h17UTPBiQ0WdVFDiFRc2upjVt2Uj6kv59e6Yo/TS9F3gAOZlXdSSfyx7Zb+G+zXh8u2J9ZrTplkr/igUhKncCjZozlD2RCWK3nuz6AABjboMhm/P2LkDRROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762822992; c=relaxed/simple;
	bh=UazQu8pENsRL3wBMB+6+PXe0UfqoiV+EOCdGH71zGns=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=p8RPUTtIu5uvaux7i1kK3Ys/1ozboG/Lz6ZXxbYEovSB86AUmMuD8DCsDcXctUl03eXHk/aTEaX9veXKEHdiFmdIarOTPbTRDdbxtf1nYWnMwNtpSd1FpzIYFS9xCQuOjEdA2DVCeU3BOgBAR6Af2bGk3n5lN2s8Ufe4gIkakJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qS1Ge2zq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qS1Ge2zq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F8DC19422;
	Tue, 11 Nov 2025 01:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762822992;
	bh=UazQu8pENsRL3wBMB+6+PXe0UfqoiV+EOCdGH71zGns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qS1Ge2zq9xCeSMP8DnGWEVzR2qGnaHACIiB7VXtXiirrwD+2VkleAO3TaZRHWeCu6
	 wwpfFgYLYxklr8RlBWl4/i5T1YKxpYPEHNY10aTv+AHECHmnH2EYjxQrhCIfgsAw6H
	 4QooTEY4KSEg0STc0QU5/Tb2hVMHinjYnIn50ymrpMDO33B44Jw0iB1OPFfkjn7wDv
	 2qJ2smvlLcBAtqLE8Z6pWVGEcq97aMdV2DhU9Xpe7qJwgJHkRfn08/FQNwk6DQ3qau
	 Gnk8r/uUXlo7ec9hQkI/DTgn/LrJYmCxkb5PKQNemFQ7HQNtd5WYgcQO9jbGrEhhis
	 dt1eWm/jIYHqA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251023114535.262305-1-dinguyen@kernel.org>
References: <20251023114535.262305-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] clk: socfpga: update for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: dinguyen@kernel.org, linux-clk@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, mturquette@baylibre.com
Date: Mon, 10 Nov 2025 16:58:00 -0800
Message-ID: <176282268097.11952.13279204038833025737@lazor>
User-Agent: alot/0.11

Quoting Dinh Nguyen (2025-10-23 04:45:35)
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/s=
ocfpga_clk_for_v6.19
>=20
> for you to fetch changes up to 2050b57ecda040010ec797fb07713889372c5041:
>=20
>   clk: socfpga: agilex5: add clock driver for Agilex5 (2025-10-22 22:52:5=
8 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
