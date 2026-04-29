Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C23B31A7E2;
	Wed, 29 Apr 2026 03:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434782; cv=none; b=QHFuTF+ghBFKy/it4F4KV/8GIyhN9OdGn9TmQOKxEI+C4Rm3TcESh1gi3dy1PbxWsvwZMRNghgBc8OWe5MnQKalubZJOcxowYQEBVUhOskNgPPuQyXmQ1UQqul8+cuWpv0BPJQuDZgEFWeuZ2wLxkQx9y8aZQNk8qgh92xnZ5Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434782; c=relaxed/simple;
	bh=ZNLVduDR45JQw4+wr4F/tWrxXlNRayVw8yfFKyoGCMU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rVr+sV7WskSusW5p0IvHIugBN/YfR13FvXmSSCtisQh2mw2mPLjgzedQoka+DUBT+1EHbct37uXg2JjFw+dFtZg9+td+NByn6c7GjZTvt2n2r0iJJ9m1aN4w2wAR73BK0Lp5qRYQ3OVBW0FmqsjqF9bfkEm1BlxU9x2cvxBBXdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMQYrchw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMQYrchw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD488C19425;
	Wed, 29 Apr 2026 03:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434781;
	bh=ZNLVduDR45JQw4+wr4F/tWrxXlNRayVw8yfFKyoGCMU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YMQYrchwFPzOKYb7nhmumh5n1l1LKscWyouCyjYPOWGPCUhrK0lt0MoqF4xEjeyXv
	 rUwblFUwDNoLH5yfY4ulKT7TLnzf+cveCF+jB8EZN4VuqqqYBWIlTBzYsQ9FtUQ6q1
	 01Z82fWBufespR2ZVZ0tW3YBRdrmFjEJ2cQcOUEcLAbYOIh1SGbhU5mLSpCM831mps
	 du6OAO+3hxGyVSClJjHHAVGihD1KDmndjL0IPS8c1JZ0laxBL9ruhDwJeazDIFi/8z
	 Cvj23bo/y4lWKvHFcHPQzPojx4LRlDJrfnWQHl1wfwpFGblLandWMOilw9CELOVsID
	 v5/MNqEp5g1KQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
References: <20260303-hisi-error-v2-1-7cd9b43d8fbb@posteo.net>
Subject: Re: [PATCH v2] clk: hisilicon: Improve deallocation in error path
From: Stephen Boyd <sboyd@kernel.org>
Cc: Tao Lan <taolan@huawei.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, J. =?utf-8?q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To: J. =?utf-8?q?Neusch=C3=A4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>, Michael Turquette <mturquette@baylibre.com>, j.ne@posteo.net
Date: Tue, 28 Apr 2026 20:53:00 -0700
Message-ID: <177743478008.5403.3256097033511895494@lazor>
User-Agent: alot/0.12

Quoting J. Neusch=C3=A4fer via B4 Relay (2026-03-03 07:25:18)
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>=20
> Unmap 'base' if an error occurs after it has been mapped.
>=20
> Reported-by: Tao Lan <taolan@huawei.com>
> Closes: https://lore.kernel.org/lkml/ZNlSH+eWV8Sk3FYn@probook/
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---

Applied to clk-next
