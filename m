Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8F3812C2
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 22:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391303; cv=none; b=frZOPxrMlhCDLmdEptDj9GqcSoCRCEcRrqvf/erMfWa3TMm6fU6Rd+aSROkPbfZmO2q7PdsPG8VC6FKXWcIXbae40drjQ1NSqdSe9bOtBga5DJKc+WvZkAoEbFMyf2DnbwiuCfqW9bUoPVMW0tkoRNz3pMch2KzkLVciCqr1rRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391303; c=relaxed/simple;
	bh=uD2KgGN2qvePriWx+OmDu4T4iSBPyz3xOPgYGdBnNBc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=cVngOTVVrr3g6q0SJyyQD1t+uuG+tH57k4Ck/ys/lFO+Z0VfKJNRkms60EMC2x5wCRVXOrll5HV0yMBdlpyxjeSRJsEJB6EA81+wZ+85zQSTo7kuUQuKtvkSwW9E4iWScqEc4lLVWqk60DbnTAfV5XV4edRvN13ZcuGrKe+H7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLjmhtL+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLjmhtL+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B511F000E9;
	Sat, 13 Jun 2026 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391302;
	bh=SjUBfdi4LdjoTQHtLZhEUMBg8a67K1Nl1TJEtZTwpOY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=XLjmhtL+V6hC4vaJcQsI5KZshRXmFOZJw5VjKH8kQLN6h3/UbtSEj1E1zMBtX4Kgg
	 wrx3dE3YiYP69EXVmwxsgfuPedn/hFJqExE9cH8vqsj11SVr4CY008c51GvSPf6Hv3
	 /SGGPzLB6NOnN2lSM2mMUejMxrSoxIocTUmP5KeKBJUhP7+u1oC6kVKmV3y4dcdoEj
	 3WvNH+sg2grIxpZ6hpAdvUprZjbzjjQMYOFlnVix7faU5TVeF8cSj/SXI7d/V2eHTv
	 SzAlKdiTEKuK6p0JFLYAg5x7bKioJUFdg226i54K1yfSWie2iZszlsKe7qP8Z2bmu/
	 td4MicSBqa4Pg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4272848.9fHWaBTJ5E@phil>
References: <4272848.9fHWaBTJ5E@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 7.2 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date: Sat, 13 Jun 2026 14:51:04 -0700
Message-ID: <178138746455.819343.17093210868169147733@localhost.localdomain>
User-Agent: alot/0.12

Quoting Heiko Stuebner (2026-06-07 13:59:31)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with a Rockchip clock change for 7.2
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t tags/v7.2-rockchip-clk1
>=20
> for you to fetch changes up to 7edfb7fb58ee058298e18fde76a6077ef17d19d8:
>=20
>   clk: rockchip: allow COMPILE_TEST builds (2026-05-13 12:35:57 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
