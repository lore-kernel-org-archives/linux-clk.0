Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53500537FF
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 20:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728505797; cv=none; b=r9+NKhkBmRBZiTotkfCDH8s9ITmVFkOMJNAVknLZ/oWEkt4d4xD8MbM9IJJfze1AYV7IQQdLsPOvAJ9/ST81sE9tFLg0AGHq4qzOIYGELYGoUacziah9PPGxccg6bWlkixj3iWUqgIQZAYnDPR5Ztg+hxZwoAP4KOp9whh67Fp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728505797; c=relaxed/simple;
	bh=aXJfbbKnLDlXEL4Q8hawWwCpfkx5WSMtrbN22m67jYk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=K4LgsFwD1Y0zHWjwyeqesMnQMOv09/QU6+oqr5+YBcJ1fX9CToFvs86YELmPH/M6C5oJTeVBrAyddT5vGjsyFKTSUELB4ThY0mlENgMxunjzZzHVaPTCrV1/eKTUojJukn2jyQgma/FLdmrCkx/UwmDR7JA1PdTxslU7hRxteaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ake4viNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ake4viNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F15C4CEC3;
	Wed,  9 Oct 2024 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728505797;
	bh=aXJfbbKnLDlXEL4Q8hawWwCpfkx5WSMtrbN22m67jYk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ake4viNkj5l/16tin7YUXP3k/+2No2/Ky11IEB9Vfu8vVcP/N8QEhNpJCovm9mCZR
	 ImPUGaLW/j9+yz86Bc4D9+0Jpaz8sOcecV/jR2Fx3UoYx7oZz8vsMzmTR4faETxSsA
	 yBEvJbugOUqHFJ2VqXx7iZf9rHX0EVBsjY19F34Gvca8t++NV6ecgGNBnLNvkMmv+5
	 aFoDH/CXyq7iX7Tsbx5zhol8cIqgTfh05lWNhK7bIk1mlhiOjn6rnKKomNEvL6IPkG
	 2Mdh2b6c/goholCTEPX6GOQYuvxekGMpc2GrsDYJkyJtVyH/fIYiBfVj9xdu2yTsTO
	 31EbFTxMmlfGg==
Message-ID: <27ac7ba804d260ca9e1397a17b9e8696.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZwXUQOr-afniO-2u@gallifrey>
References: <ZwXUQOr-afniO-2u@gallifrey>
Subject: Re: Of clk_hw_unregister_fractional_divider
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
To: Dr. David Alan Gilbert <linux@treblig.org>, mturquette@baylibre.com
Date: Wed, 09 Oct 2024 13:29:54 -0700
User-Agent: alot/0.10

Quoting Dr. David Alan Gilbert (2024-10-08 17:54:24)
> Hi,
>   One of my scripts noticed that clk_hw_unregister_fractional_divider
> was unused and I was thinking of dead coding it, but thought it worth
> asking whether it's actually a missing call to it.
>=20
>   It was added in 2016 by:
>=20
> commit 39b44cff4ad4af6d7abd9dd2acb288b005c26503
> Author: Stephen Boyd <sboyd@codeaurora.org>
> Date:   Sun Feb 7 00:15:09 2016 -0800
>=20
>     clk: fractional-divider: Add hw based registration APIs
>    =20
> and I can see clk_hw_register_fractional_divider is called from
> clk_register_fractional_divider.
>=20
> Is that just consequence of them being system devices that never
> get unregistered or something else?
>=20

I don't know what you mean by system devices.

The clk_hw prefixed functions and clk_hw based APIs should be used
instead of struct clk APIs for clk providers in general. I'd accept a
patch that migrates the two calls to clk_register_fractional_divider()
with a call to clk_hw_register_fractional_divider() instead. If that's
done we can remove clk_register_fractional_divider(), which is the
overall plan but nobody got around to it so far.
