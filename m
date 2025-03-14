Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF32B2F3B;
	Fri, 14 Mar 2025 00:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913642; cv=none; b=QssEzBxly6d7NPRzxni89Y0dGIGouwz6nXISwGcwjuqCjtYrDF5AdRfxO12T6hbAXChkpx5OxrEuy+ea/wq7Rk7FFlBFXCrf1l1qn+9ikwT94DxRcO1gmvwwlFb3LlRt8xJdOqsdp58B0xLMbinlbCVZHqt7QzKoMDtT5/sP6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913642; c=relaxed/simple;
	bh=jRPWshw6Gy6OZX27WaXXe+x7hDHge+5pOKY1D1mRWEo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=AO1UqYCAw+/ZI+mR2aZkzhwS9ewcPbIGc2A0xgIdds/UKzytShKhlro/HBpK+rz3hoREgj9RS25s7jINSA0KlYomEvWbJNbdXmyIROO8hxNTh0JQ6YXK03nBHP6e8a1CHhc2r0wRJRIWS+7ssD010gNSUgLIKmf70j90mkmlzPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltqEFm0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltqEFm0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D9FC4CEDD;
	Fri, 14 Mar 2025 00:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741913641;
	bh=jRPWshw6Gy6OZX27WaXXe+x7hDHge+5pOKY1D1mRWEo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ltqEFm0H/qyunkAvuYINa4+Z2I9msgdaZDAIleRwCvElntVIu3x5DvllP/qDWsP4s
	 6tsPwXRMp6wJJoMNHL7pRbdnx8mFb7NsJZDLMqwEt0b0d0pAmtlLTTDK+j0+0/mxvH
	 QVfPzzlrfKV9F0/9Ln9v+zUdduzKgilp80ZypxzUFZ6hsXa0oJISpT2yrkhgNGL58x
	 /4+ke3zcZZdXdKzHcKqTG/Gw2cGpX4C3rtoVGMJoIIPU/SKILagvDtYYKyxSufv+JN
	 f/3/oj9WjbG32kXsF02sleEmIgRE/5FLtK6h5/YAizzMPyPrB8zMPKEwmDeoa4cA14
	 vCmGTZcIrcfhA==
Message-ID: <c9ceb8c6751e41a623eca3b8b102431a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Z9Lcr8FyJLWdbp-J@wens.tw>
References: <Z9Lcr8FyJLWdbp-J@wens.tw>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 13 Mar 2025 17:53:58 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Chen-Yu Tsai (2025-03-13 06:25:03)
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>=20
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-c=
lk-for-6.15
>=20
> for you to fetch changes up to 8cea339cfb81eb3354b0f27ceb27e2bb107efa6d:
>=20
>   clk: sunxi-ng: add support for the A523/T527 PRCM CCU (2025-03-12 11:58=
:11 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
