Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329433D9E;
	Mon, 29 Jul 2024 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722294098; cv=none; b=o6VC5+rBP8O/+x58aQGTcWirvmKy1ThwklEGT5DpWdQPcj+rXCpRPkiDodh3WAYtCg7LijeN2IAYLrd6YuMqr8vRRWljQ0YiMInNuPOvmgrv2JX8zO8QKo1kYUIUul2sGL76Doe+jXYaiJb8Ck1/Xpk++tbUC2/ojTG3xlirEVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722294098; c=relaxed/simple;
	bh=yzCurV82av03unBcoGcG74J4yRdeDooIgc+oa3Rp/6E=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=uM0cLa0p4LHR8RUvtVjk2dOpaaIhbOV9W1AmgGckh80UqKz4x/X6kf+WXGC1NyrQw5ZgVQ+NEorjmX3Hdfr95lmDE486O9z+No1KK3Q965HMIod1MumLZ6o21iLl+HYOYBUi8fb9TMmmmfJ1whv1afIqPx+aMiwi5ettQqEbSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQe0VNE5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQe0VNE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9D5C32786;
	Mon, 29 Jul 2024 23:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722294097;
	bh=yzCurV82av03unBcoGcG74J4yRdeDooIgc+oa3Rp/6E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GQe0VNE5g9ObKIB9IOMY41A6xtRZj967Ka7jdBOBClsfNIetnnHsndBKrgnqNvWKD
	 CgcfPxKm8VJ5WZMopnKqYQQNKL0Lky+yqRDTWekQkHU7ln47ANz/GxuWtBdLab4ugZ
	 w1EE/pNvN80QOdXeAgnV5Kk7M54s6ScmkgQfB/Y/iHX5aJ8oazglvkixXiGvN7Li3i
	 cRcD3/SCArnkpl9A5qMIXUJI7e6WFAzSueH3WJ+YZlvrHsI82vGIxxzo8USqmtZI5C
	 IuX3L4AnN58jh3X/bPJ6LlUcsDECdQQrFnpsWudlDvA6UXyrHub83VoMWnEryJOPRe
	 yqYmhFkB85Lpg==
Message-ID: <54decfcc0a311d4447122bb5f49bd491.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240717115919.975474-1-fshao@chromium.org>
References: <20240717115919.975474-1-fshao@chromium.org>
Subject: Re: [PATCH] clk: mediatek: reset: Return regmap's error code
From: Stephen Boyd <sboyd@kernel.org>
Cc: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>
Date: Mon, 29 Jul 2024 16:01:35 -0700
User-Agent: alot/0.10

Quoting Fei Shao (2024-07-17 04:58:52)
> device_node_to_regmap() can return different errors, and it's better
> practice to pass them to callers.
>=20
> Clean up the hardcoded -EINVAL and use PTR_ERR(regmap) instead.
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

Applied to clk-next
