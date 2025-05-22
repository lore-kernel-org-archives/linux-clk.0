Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3402BFC78;
	Thu, 22 May 2025 23:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955759; cv=none; b=grnDNZ0IZgVcQ1eLjsP26IioRXlX7KpBjb83Vf6hE0FoSlfSwFs9BBvmvTmhXEqMLttpuJblqJ0u1tbwB/4cOXz2aNSkxHGpi3nIGAt9UEEEH674uXFoav/Uu2uQAKMwwUMaeMQKpDQ/N1NdXIcGFi4fwRxCIXY0+SWleZI0XLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955759; c=relaxed/simple;
	bh=Jv56dkfNZCxpxUt9eux/nBkDnSUhfvknB6cfSV3tHfE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=WbVMhIGW3JL7UcmoKGPTTqFFSjCyvzCKx5uw8sjqaTkzYu9R5xs5BVZzswcrFKS8Dw658LZ26g1LVpljg/YWbahxc4hFOY/rrNLwXiBXcSzvs+4QNUhck+jRRWCmOHrymNk1LpI7hSIBfxm4ccsrORGPBfhqp5/umMGvXG0Bu+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=di+Ji8IP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="di+Ji8IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C011C4CEEB;
	Thu, 22 May 2025 23:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955759;
	bh=Jv56dkfNZCxpxUt9eux/nBkDnSUhfvknB6cfSV3tHfE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=di+Ji8IP5qIQGjCFOKy7Wwlnvqdoetb1VciQKZzvoEZZ5gRTyN/h+IM9+xnlhRbff
	 iuMHYtjkiVhCh5S5bmopo5i+GwUo4It42eoB+S+cgx5IaZIGhe5i4AusJqdHidSvwc
	 0knP0R/cL+06zbtWzlLiakw6373VOn2e5h68D7YoBsD1oXdG91Bx+3EkIWKMUrywrV
	 NcxpIU5QYjWzrhhpS9vbCB9yYCk5XhhkHW/hf0lpFm9qdaOAOyKLdRYMBDeWFRxYEB
	 H8ubNEsD0OkCtl/icfGSMJnQg/sQwA591Zk45F8k/I0Cs32RtPetBGxjgKDLYEC/0d
	 E5891P93wNTUg==
Message-ID: <1950c6ba75c7045a06bac6fe15cc6d43@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aCaetzKYzCpzRYzd@wens.tw>
References: <aCaetzKYzCpzRYzd@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 22 May 2025 16:15:57 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Chen-Yu Tsai (2025-05-15 19:11:03)
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.16
>=20
> for you to fetch changes up to be0e9a3727872783bad0752dc82e0857f4776049:
>=20
>   clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support (2025-05-12 2=
3:55:06 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
