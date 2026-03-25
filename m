Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A09329ACFD;
	Wed, 25 Mar 2026 02:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406949; cv=none; b=IPmm1UngMji47Ah9HPSBmCfwr6MJt+GgTdEcgrOYRjDfzm1jZdATw6o/ng3u3brkwxc2b1Dfv88W26fuEKk5Wa0X7Ium3DUhEU8f3PNSFhqtNUyvIiks8SL4ZUNhuBO56v/gO04XiiQfIwCftM93j1NNK2sTDueSCbXfA4t2uTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406949; c=relaxed/simple;
	bh=Z5KgW7mzx1+OcXofCq88W4pRt91Y2xmTlYOpY6J+Lj8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Baq6xQhZXqKF9qI0a+MWZXnIv0zgqxooYJbWy0yYXIeJY2G7PFj909/muPz2FrhulPWj8ZaQk3F7WRouDFAIpwXytrzPpFoVfUjFG5JLlRwTe361e4OppdImww3+K0xT7qdZw26IXUBFNpyunrU+WhUIzzhxTp5KsxoLzVxhdrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0WXTH5L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0WXTH5L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2C5C2BC87;
	Wed, 25 Mar 2026 02:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406949;
	bh=Z5KgW7mzx1+OcXofCq88W4pRt91Y2xmTlYOpY6J+Lj8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K0WXTH5L1xpwA3vKAINfcDmox16S8Ey+ZJ4Nize9at4X9dse/aNj0UfdZJ5jfOTQw
	 QYxYCQeWvL5b00iJCg8UlRIw6hH1cYsJOc5RH4DlhvUqVaRgdyuYQl1YnZ9wptMUDX
	 EW8DGWqqsS8niX/Dkxchz2oft4czOcswSACbxlYtl2aFwsl1Ae/MM8yEciSrD9fPvM
	 LrB7M15D7g2XlbxNxDWVYhBW71P/1jDQ8/wu6ZkNxsvVTnQdvK33CgE7YzA9ZiGA2R
	 uSF3KO4G/Roq0CYVkX3CO8Qz2A09TmVn6uhLd9MPXdMg0IQAFNx1YlDbEep51L5m9I
	 OBZP2COTX+PRQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260303080729.2265-1-dongxuyang@eswincomputing.com>
References: <20260303080513.2042-1-dongxuyang@eswincomputing.com> <20260303080729.2265-1-dongxuyang@eswincomputing.com>
Subject: Re: [PATCH v15 4/4] MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, ganboing@gmail.com, marcel@ziswiler.com, Xuyang Dong <dongxuyang@eswincomputing.com>
To: bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dongxuyang@eswincomputing.com, krzk+dt@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org, troy.mitchell@linux.dev
Date: Tue, 24 Mar 2026 19:12:41 -0700
Message-ID: <177440476105.5403.5741664134464120756@localhost.localdomain>
User-Agent: alot/0.12

Quoting dongxuyang@eswincomputing.com (2026-03-03 00:07:29)
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add myself as maintainer of ESWIN EIC7700 clock driver
>=20
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---

Applied to clk-next
