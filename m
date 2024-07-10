Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE541B86C7
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720646191; cv=none; b=RSdl0h/+Sv2c+5NbnxtPH0oC9Mep8j3U6FZFKjmKBjBaKpEsrsEbDTDw5T6N9fCVYqDUqkBBN46VP6WSFHVKSKiEqumQhvVhMnRRhAvhJbwnVuMOdZAwDZk9DbAeEODn/qIDzOZ3ES0FzMlErxzZhJrMAsyLy2KJMnQYORvM5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720646191; c=relaxed/simple;
	bh=95Dt29olT49vD97o9Vn2sniM0ha5QyVnrsbHAJBjp7s=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=bDXWElAGj/sUGJwFb641o6wzBGYvH2AXRViM3ZKPlrU7RraW1oYDS0cuRNZI/xQTtJMF53saZWiJArrS4JTwgg+yGQvGZwSPjcNxmQs9ptKfcPZ8lcRJBGe2aI407uvKyK87Fc+5hAaGgF+hKajWI0a2GnlyXRDqpLJ9nzJAeNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYlqNnOe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYlqNnOe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6EDC32781;
	Wed, 10 Jul 2024 21:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720646190;
	bh=95Dt29olT49vD97o9Vn2sniM0ha5QyVnrsbHAJBjp7s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TYlqNnOeF6/eqhe5oNP7qWKiBYsa9o34Jjyn1bdkOg1ZGUW5ZQ+M0uPPqnXH7i+Y/
	 RSSGOLlCDQ32z/Vut0e59vkf2G1g1bk8pby9v8AR2T7Ujh0NS/ecwLhO+TzWtJGy1K
	 EYOk4FNPsimEvuaHpIHtmtbSKebcNmTEj50hpmWSlJnED+Igub7AEyFBA9vRkH++PP
	 0ImopJmF6IBWBVAvzq28KTKoQcpaH6HWUna3cqC6fPrHsVLoHNDVXld+CHDF1ajd0H
	 07Su+Kp4L0dgjas6QfG3D0NMEzvV4SyIsJVRIRhjseI+pkyhVo4oyT4bPjT3tNw1Hr
	 fMv4j/UF2X6pA==
Message-ID: <2ccd17608ac2a21496a5e05fc2ca93ce.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c8e66d51f880127549e2a3e623be6787f62b310d.1720506143.git.liqiang01@kylinos.cn>
References: <cover.1720506143.git.liqiang01@kylinos.cn> <c8e66d51f880127549e2a3e623be6787f62b310d.1720506143.git.liqiang01@kylinos.cn>
Subject: Re: [PATCH v2 1/1] clk/sophgo: Using BUG() instead of unreachable() in mmux_get_parent_id()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Li Qiang <liqiang01@kylinos.cn>
To: Li Qiang <liqiang01@kylinos.cn>, inochiama@outlook.com, mturquette@baylibre.com, unicorn_wang@outlook.com
Date: Wed, 10 Jul 2024 14:16:28 -0700
User-Agent: alot/0.10

Quoting Li Qiang (2024-07-08 23:36:38)
> In general it's a good idea to avoid using bare unreachable() because it
> introduces undefined behavior in compiled code. but it caused a compilati=
on warning,
> Using BUG() instead of unreachable() to resolve compilation warnings.
>=20
> Fixes the following warnings:
>     drivers/clk/sophgo/clk-cv18xx-ip.o: warning: objtool: mmux_round_rate=
() falls through to next function bypass_div_round_rate()
>=20
> Fixes: 80fd61ec46124 ("clk: sophgo: Add clock support for CV1800 SoC")
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
> ---

Applied to clk-next
