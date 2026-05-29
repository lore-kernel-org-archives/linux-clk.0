Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF232E737C;
	Fri, 29 May 2026 01:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017743; cv=none; b=VydH73b07ZtToL0iqynw+x1lXjtDO+izxnjyRjzsgMrF0Eh49iYu9/n4aHu7YDexlhakCAJCaDmTWlEtrrLldbkB2kzmswsLYn3XC7PevGEhkELLHCcAFO2NfwLeiMgiV4IfAjYK2khTwbNKdf5h1IARENdXndRCm7DfvYhYK5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017743; c=relaxed/simple;
	bh=Grfqx6in53yR6brNkFKidWO3sz/SzbBK47q+qoFKUYo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NkSqnQSJA+jtEc/4yFQBV7s240PtlboAECaNedqNwmRCgCk/7zAbc93sBVYbGZ+AjnY6CFrnnPuW7ndeZsS/uTLWA6sr9ghG5lbhlDdqaVgvGXuZRtPIdcVaaq6j9FUBIar2bEKZsOZyC+ChJw7zHGCngtSzIHcNpYjKgRdV4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7ixbxX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7ixbxX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F61F000E9;
	Fri, 29 May 2026 01:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780017741;
	bh=nBm/saWMSnvcWJK0srDmWF64YvRSAgnNDoEaL6eIWLM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=n7ixbxX6Eiek901hoLF6lO4mfTy80hPp2QdMjaNYt0Vke97S+WAw8XuCSgIr8ipqX
	 fY937+M+benJVGfsAK7cp3FCx8zIea3Ut2pLiRBMsbcGr1kanX+JOTLT2OmN0rwBoW
	 /iO7VZUhv4Clxkzgt46g7KzzMw2k9LZoWHoBy10h17jAiyKAozcLM44M5lYRWhsWwF
	 VUV+xeh7Yp8rAK/3VJgQLtczuWj9Z/jm6ZdrRCTsHuyZzjuw7NyFBcmopHdD8x2vwZ
	 IR1K/apfvXmyVg61ibrySf8JLDJkg2aPOeJc1204nrqppMB5fnWBpf4RklDwFw3Ro/
	 t7icncf/bhFUA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260526150454.4281-1-andersson@kernel.org>
References: <20260526150454.4281-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hans de Goede <johannes.goede@oss.qualcomm.com>, Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Thu, 28 May 2026 18:22:20 -0700
Message-ID: <178001774018.5961.10942896930927860509@lazor>
User-Agent: alot/0.12

Quoting Bjorn Andersson (2026-05-26 08:04:54)
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-fixes-for-7.1
>=20
> for you to fetch changes up to 5285b046757844435d1db96c1b5c3a6621b2979a:
>=20
>   clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time=
 (2026-05-21 22:45:49 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-fixes.
