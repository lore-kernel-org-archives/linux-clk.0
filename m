Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD333D4EC;
	Fri, 23 Jan 2026 01:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132826; cv=none; b=UGPJRegUkQtmeN5ctKnHrWM05dV8Za+betL2KuSg8zXtZOvrDY5ve9BlXSMNKbt1oYmnej2Q6xbBLPjywj30SsVJzNnMEW4dnqAtusX57ulpzC8hWmiza9LByLlP2NPJFZp+qyNwmsx5u4hV74pl+LkWyWlOUKCqAzsCZ1rKJhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132826; c=relaxed/simple;
	bh=s46UJ/fSZA41bC7jnvny8Q7zOEfqLogcJrNq4EgjrWQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=thdY4Th2u4k5Ir2lQ6uV5Moq3oijWUEEBPC15SgivlL9qJ71YqKRNZB1qItohFv2FV0htRJlhSlpQ060Vb1OmF6s17JEj3LbTuClWF+cqR5MoH9tIws31q8rBTSlvsyMsfwd17eRJK2Zjc6LpLaIZB7SWT5wwpz7HhcRIiw6C7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8UQqE2q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8UQqE2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6006BC116C6;
	Fri, 23 Jan 2026 01:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132825;
	bh=s46UJ/fSZA41bC7jnvny8Q7zOEfqLogcJrNq4EgjrWQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y8UQqE2qVJnEdAJ6/LJ+q+0UPRQ32VuvF766nNR4ZrFDTmQVni3Nm5he+V9yLa7DK
	 Oc3EcA+sgUcLVja96H6KcSlWvnW0oEg/kB/DYI4vCZoYdgQiFoCgOHfS/L93q/Pg1i
	 rC8T8gGYyrSmEBJNLIA2nd2nIjLnYnijYe9yFVlJSqmg/t/0l+zhZGHlFyR2UA3HL/
	 mrtdGKztH05Q7fyCwChlHoesfEyWh4DVFQ1tEigz62m9UAB/+4nmsA4zyr3WgNmvtq
	 ZEtZoQyN8bRgUJ3qKdvcc/WEnBlXXwLQO2QpTGnqMUI4u/4buZIvUW8q1onEfOFcQp
	 oQZ3PXOkCdI1w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251123154315.1564-1-vulab@iscas.ac.cn>
References: <20251123154315.1564-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] clk: mediatek: Fix error handling in runtime PM setup
From: Stephen Boyd <sboyd@kernel.org>
Cc: nfraprado@collabora.com, laura.nao@collabora.com, wenst@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Haotian Zhang <vulab@iscas.ac.cn>
To: Haotian Zhang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, mturquette@baylibre.com
Date: Thu, 22 Jan 2026 18:47:03 -0700
Message-ID: <176913282359.4027.16928737563389647276@lazor>
User-Agent: alot/0.11

Quoting Haotian Zhang (2025-11-23 08:43:15)
> devm_pm_runtime_enable() can fail due to memory allocation. The current
> code ignores its return value, and when pm_runtime_resume_and_get() fails,
> it returns directly without unmapping the shared_io region.
>=20
> Add error handling for devm_pm_runtime_enable(). Reorder cleanup labels
> to properly unmap shared_io on pm_runtime_resume_and_get() failure.
>=20
> Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers d=
uring probe")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Applied to clk-next
