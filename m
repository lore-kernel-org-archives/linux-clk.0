Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD281AC1
	for <linux-clk@vger.kernel.org>; Tue,  6 Aug 2024 21:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722981044; cv=none; b=iiOTxBVWf6XxHGe1l71uZ+T+b0my7DGBQiWWoujZyh8AxxtDVP5Ft9KWr+OSfdLbek/6JIrnAlRpYEkp5Xfc55lNpv2PktU8plP+XC11Z7YUePLtwR/oCvfIuHi9HoEi8DYi2yNs1bSo24mJFpOY9bG9EWtUZQkq3NX3jqr2fas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722981044; c=relaxed/simple;
	bh=2iWriSNPx78ZMaDl7FT3FsyDuk9OPIwPtKRKadscXeE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QZU1YLEt6ceWP/yUWxy494dlv78hXNW3NRk8JgdNsDReHt9eri9xRo6DIb9zotf5yCnYZCNOAGU/uL//ou9yaoiecRe8mFx0pvCunQGdo3wulr0TC3kT52XcYZki3G63TdTsHG+fa9TwgB8j/bEvrErUKlKc9ztBjT0AiiuDosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGdwRZWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGdwRZWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A349C32786;
	Tue,  6 Aug 2024 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722981043;
	bh=2iWriSNPx78ZMaDl7FT3FsyDuk9OPIwPtKRKadscXeE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IGdwRZWyQQq3Owz399zEwq5cfRbqhW+l7am6UJPfvdqbu4sXNJ4njhGABz7IOrICJ
	 2uh60qsVK3I5pLDtKwn8V9r8m4j8UpytbpuPRNPZP1thZ3lzFiS6dBOZT0Iilhqjaa
	 ncOpD4/HKbKQ7zhMXgq06djjpxn6lIkW7aiYLt44pXl5pmn8r7Z42zm2lEQiURdr0l
	 TuWHOIceHonyQMBrq2+khRt+7mEGLt3aaqDbQngXThDVPqD4FFIF6og6k1tztWaHkJ
	 lnwUFdHGwNgoqZO9I5UBza2AlgwXYhJihG08SVst1jMMU6ivbSOsO6c81a91d3xr+p
	 U03OWZNVDf66Q==
Message-ID: <3b5b22e21cdc184a9f74db4ff9167a58.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240710-dev-clk-misc-v1-2-cd9d960099a2@analog.com>
References: <20240710-dev-clk-misc-v1-0-cd9d960099a2@analog.com> <20240710-dev-clk-misc-v1-2-cd9d960099a2@analog.com>
Subject: Re: [PATCH RESEND (again) 2/2] clk: use clk_core_unlink_consumer() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>
Date: Tue, 06 Aug 2024 14:50:41 -0700
User-Agent: alot/0.10

Quoting Nuno S=C3=A1 (2024-07-10 01:40:36)
> There is an helper to remove a consumer from the clk provider list.
> Hence, let's use it when releasing a consumer.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---

Applied to clk-next
