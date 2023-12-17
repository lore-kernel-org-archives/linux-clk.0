Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2A47F4
	for <linux-clk@vger.kernel.org>; Sun, 17 Dec 2023 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvQ0d3Rt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085A0C433C8;
	Sun, 17 Dec 2023 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702775445;
	bh=8UsXhQrw0n1dTNDxfhgp/dWQ9ot+GQechE90gD637k8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nvQ0d3RtiF4bR3T7dQJseDiw/5UIuNz7CDfcCh2hJEY7BXzke95GME+VKjrppX6sm
	 guc8MZXYc72tXY3s4bmeqccVH56NKVR7DAnM9OJXCLB39sX+QwR62rLbZYr6wNm+p6
	 0gNZQ/OzVwsNPKz5zFYELXrG5R2jCYGOitWjN4aKyzS6GUyNvy6VRuxUsk+8wnysnx
	 cfO7NpDM10d6JUq/7MhlM+4yx0MAsjwg6BafEPBFV4Zil4TG7Yw+uXK/f+e1r1+J5x
	 YSWqUG0aSlm4FGd4TvcizioIncjRxjJjzNhNxqJP13ybanhkNsaZt11/UtFYPl4X26
	 pHbHNo0g5qdsA==
Message-ID: <f7accf22e8af7444919baa6cabded4da.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231128133016.2494699-1-yangyingliang@huawei.com>
References: <20231128133016.2494699-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] clk: sp7021: fix return value check in sp7021_clk_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: qinjian@cqplus1.com, mturquette@baylibre.com, yangyingliang@huawei.com
To: Yang Yingliang <yangyingliang@huawei.com>, linux-clk@vger.kernel.org
Date: Sat, 16 Dec 2023 17:10:42 -0800
User-Agent: alot/0.10

Quoting Yang Yingliang (2023-11-28 05:30:16)
> devm_platform_ioremap_resource() never returns NULL pointer,
> it will return ERR_PTR() when it fails, so replace the check
> with IS_ERR().
>=20
> Fixes: d54c1fd4a51e ("clk: Add Sunplus SP7021 clock driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-next
