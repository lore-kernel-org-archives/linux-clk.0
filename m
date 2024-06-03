Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B6112DD9B;
	Mon,  3 Jun 2024 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717448925; cv=none; b=VqDcF4GSh6S7OcvFau29d7rDWbfP3HRkUXGcPe64OV1IqxFZV++a82kAMR07bPUTSyyhnA2vg99OhrqcRL9VPTH/AlAD/m+9eT9to/NjEothiXStlWtSdbXOeBBQkpd0yUqxu2m1d1V4ERhwnR6y9hXMbo9S5KszhRDl5T6De80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717448925; c=relaxed/simple;
	bh=EJuKBSp2wJUfZWUbTTL8jcG9qHIZQIVzA4rNmduBoL8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=soVPtUd2Rix7nqeCzbkfU/zhwrRQNruPvzzylsEoMbgsvxnjCO8xiou1H+Wc4Xercsj+M4KExtNsNJDI20cM06+SV4auL7q5lr2fJI646CixYq4zkkgnskpnNw4t5uJ+ZHYJCDzzqDCN2AE9g60XWl7qm0WlJ5clzZzoetD6Ocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hID2SJ6H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hID2SJ6H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258C3C2BD10;
	Mon,  3 Jun 2024 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717448925;
	bh=EJuKBSp2wJUfZWUbTTL8jcG9qHIZQIVzA4rNmduBoL8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hID2SJ6HhrZCqhsizIzpCBpGAY53oCgJYBJm7LcVCQhcBJhGBtAR/tQQ0JePZ+Yg1
	 p0M3vByRv2hU/i1+flIx5q86sDeKmRjmEeskX63XAdzaWiFHvdLkiWU6q7GQbp+eK+
	 3H0JespnX90kdYLXgScKMN+yex12rVb0ONEPKjb5Dd8pGBQfsfjkSggbfA2Wvu4o3T
	 ihnLxgskkxQQmH6/CJxwS2RP0PvADwkHZ0P4NzlYD7+VIxkU61uihMrQsIgeL4ms/C
	 0jtwO5rKkvj9PX+dKLIvZxBlwUIwIzEJrTXEM56SXbTKvs1GBpLe9KQ1CqoP7UBIYZ
	 yd02l2pQwSRzQ==
Message-ID: <1d5a854647a80f156494c77b4cf0d4a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0cd9b5ffbe986bd7dc4ffb3f13492123432ee2e1.1716975021.git.geert+renesas@glider.be>
References: <cover.1716975021.git.geert+renesas@glider.be> <0cd9b5ffbe986bd7dc4ffb3f13492123432ee2e1.1716975021.git.geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] clk: renesas: r8a77970: Use common cpg_lock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 03 Jun 2024 14:08:43 -0700
User-Agent: alot/0.10

Quoting Geert Uytterhoeven (2024-05-29 02:35:08)
> R-Car Gen3 Socs use the common CPG/MSSR library functions in
> rcar-cpg-lib.c, so the R-Car V3M sub-driver can use the common cpg_lock
> instead of a driver-private lock.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
