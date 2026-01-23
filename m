Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A82B32ED38;
	Fri, 23 Jan 2026 02:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134133; cv=none; b=uHIl5OiM/791V5PckadTpvYFKWWP0xkrMCqOgkb7lHCO/jRPopegI9I1vVevJnLo8wSMqZAgkO0o7xDRcRkTjxxgfULoVcmjT4Mf/vn9kWgYIxqvBpWIRMHOOdyyYSg+1DNzkU53EFEO6zK8cnt73kBoyYCRcDmz09lG3B3kRac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134133; c=relaxed/simple;
	bh=UEmdGl83q+TmfSZCYDROVK38mF4s6E8Rj5vYhH8+rAY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HT28FB6Z4JdxKFnnAeD7EstrHx/nXr5RFJ+/lUQMoUdxlHuinnhZ/ZrZsFF0REJ/ULhTo5GZY3WzzTUE9jFOMKYaNH1ZlFi684mhtfldkuchM/iPmUg9Ej7xLBAW2VZYKs906xmSQWu0D9lNmBObQqK3YBaE7yurA6+4UJ9cuU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWBw56+4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWBw56+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87672C116C6;
	Fri, 23 Jan 2026 02:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769134130;
	bh=UEmdGl83q+TmfSZCYDROVK38mF4s6E8Rj5vYhH8+rAY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OWBw56+42XTYBM5eNK2ziiuIx3g/KXX3wyk8QY2KrXCO3dK8qIQvy0NfmX/USqZez
	 +RVDbzBCew8Ar+WlVWOE56csP/SH7ts6vvtO7vD+baobZLgjqMyx5hj8IX8dm0gWyY
	 wpKy2zhxz+X/UoIg3jJfLjf13b+I+ANn0/hI53C5NhpFcFM9rK+ujFZtBIeIrebVay
	 dVMgTUdcwz+slaTIr0tyRngzBxuZFEml6ti6BA16PZ2FiDVj53orR5acPbh2e6c5Tx
	 2e+iMsUVew2Bj8/zjZMa7lKiNJhWzEsg8/rz9rL8NgihjHl4fGXX51gjInyfAntHOo
	 RhPQa9wIN3UAQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aXKzYgVBLnYgwZ27@redhat.com>
References: <CGME20260122100703epcas5p13f4647a5e62546abc3021383134e824a@epcas5p1.samsung.com> <20260122101124.2396139-1-ping.gao@samsung.com> <aXKzYgVBLnYgwZ27@redhat.com>
Subject: Re: [PATCH]     drivers: clk: keystone: Fix parameter judgment in clk_prepare
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, hy50.seo@samsung.com, kwangwon.min@samsung.com
To: Brian Masney <bmasney@redhat.com>, ping.gao <ping.gao@samsung.com>
Date: Thu, 22 Jan 2026 19:08:48 -0700
Message-ID: <176913412868.4027.13825615091172956270@lazor>
User-Agent: alot/0.11

Quoting Brian Masney (2026-01-22 16:31:46)
>=20
> Just to help Stephen: It looks like this is what ultimately causes the
> problem:
>=20
> dw_mci_probe() in drivers/mmc/host/dw_mmc.c sets up host->ciu_clk, and
> if an error is returned by devm_clk_get(), it leaves the error pointer in
> host->ciu_clk, and the probe continues normally. Later
> dw_mci_runtime_resume() calls clk_prepare_enable() on host->ciu_clk with
> the error pointer.
>=20
> Additionally, clk_unprepare() already has this IS_ERR_OR_NULL() check.
>=20
> Stephen: Do you think that clk_enable() should also be updated as well?
> I see that clk_disable() also has the IS_ERR_OR_NULL() check.

No. We ignore error pointers in the disable and unprepare case to
simplify error paths, see commit  63589e92c2d9 ("clk: Ignore error and
NULL pointers passed to clk_{unprepare, disable}()"). With the usage of
devm though I'm not sure that error paths are a real thing anymore, but
it's nice to let drivers have one goto label instead of a million
different ones if they're not using devm.

Not ignoring error pointers in the enable and prepare path is
intentional. Fix the driver.
