Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FD376BE2;
	Tue, 11 Aug 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472215; cv=none; b=U/hTlkLqMAMUBdZfqZL/YtY3PCeNIbGeSa5AsBu/PUjsvCkjrqyBZjLL3+RRFZNpCn9QafHJZzpcnMhQ50QJcXyV4jn3I8jdBZrm94AbRGMHT5TQmOmRfiOBzJ9rDkUFOfjrGOxkUXwW/Z5E1JLUom/Rs2GFYPu7Og8rq+feA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472215; c=relaxed/simple;
	bh=bibfSxXOk63tUefD+Uc0+bl0HRdbY9R6WkvlcvTvOzg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qkWAg4Ls9HsKMMEm1igZEI3G5wNCOnqiyig6zLmj1MuRC7pU6ZM+jrZPG7G4o4uuqwhGyJ+D1FDU8kN8YaU9xjI6crtE4SWxJpotqtZVLoZAGCvVoM9kIZnzZsMc6lFQJk1u7d6HpCVoIiPbh5jig4KzY4tPcdzegNzAVD7vZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaqHL5wa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaqHL5wa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7BA1F000E9;
	Tue, 11 Aug 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786472214;
	bh=TtHYV0b9WDadltO5aBK+qs+bV4bIF+dX4kidc3U6uFc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=CaqHL5wa4t5/LvlQ81HYgEdoUtTMsYyA3TzGSf9Uv1UVettVO3+miK4lzzdMZAhw7
	 feY12Eb4oQsMz+6ownZWZpwZqm+KhWOeqHTSaYDxLXKxAUqDAowLeLiMISwBccfnyN
	 y7ZV0cq5LeZ/iUiCJ/sPYAlBQmW189/m2EAIL5MoHTC0prXLypTrrGsUxNRZaSDR/A
	 kypaiF+XXdFavMGjU2fAe0F1JA/n9J91h1/6FYpvFklUyhYhAXLxKgBk2B0uGq9vVh
	 YvmKRp8hcWenLNmYm6uuXg264SFwxWub18j/yb48wIpit/wGGbiGGCjopP8TbJr78W
	 lkXWDm8I6182w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260727172907.21229-1-andersson@kernel.org>
References: <20260727172907.21229-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 11 Aug 2026 11:16:52 -0700
Message-ID: <178647221208.5862.16159159109767639506@lazor>
User-Agent: alot/0.12

Quoting Bjorn Andersson (2026-07-27 10:29:07)
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.2
>=20
> for you to fetch changes up to 1aa4e2ed7caafbbbedff89fb226a982413469baf:
>=20
>   dt-bindings: clock: Replace bouncing emails (2026-07-11 10:24:07 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes
