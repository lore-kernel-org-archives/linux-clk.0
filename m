Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4130E0D5;
	Wed, 12 Aug 2026 05:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786512155; cv=none; b=cAN1BWmm4Y/YFa0Zw+hT0gKqlozviLrSJdg9eRvnf7spxQG8ZPEQB3V0ubN4odOBScbIYSkQ+V9Q70Y6K0hyXFBAzDvrUZObYBzJd5hwaqc/cxUu1klyZWFZn/s1DN23n9OfbxzbChS+eHtpsidw7heZJX2z361hC6WBDd3hTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786512155; c=relaxed/simple;
	bh=cJNabvSKy6D6S+wSMhd5JQHpofj3pi/1/w1+JB93TkQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=b/Z0fdKtknNyTAhTV+08eK0TKZxH8c9P2qHP4U2NEFNMnWdfEjHO8kIVwbHDNpZiGeWBcgvXzA9hiS8/8vNwVoHwVxfRbwxEZ3VLl436PAbWwhR0e1jTzjGH+sktoHyRj9fBzjK7VwwtjlVp+Nbs/Zz6D9/rl4y49rSwZasNXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPveumX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPveumX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B1E1F000E9;
	Wed, 12 Aug 2026 05:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786512154;
	bh=ZPBb4cAV5MPrzvf4K070sFW5PaFLurQzUak2P3Vdyz8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=QPveumX/9BAkYMdtgUZyMe0989p35NJ/zMIOCea5t/w+G7+lZExnI/ehRI03M4gVW
	 yLvHNzpxMKU5WWJQKJXkqYwgJBKlm9fNNVtm/m/GiQImqJN84qAdvnaG1Z36uHeFjI
	 0wJ0bJMOhxtC/HfTdWSedxjAu64DjdOWxh66P2dL58iylcrBTxSB/Mg1MJJV0mUEIV
	 69at9EczkRFgnU0LnQzMkFT5sRxprN9+MBUauxK3FRo6oN3WntIZR5TCHVx7ccCV/R
	 hTF4lDo0TwbzKI5tXy0OWPt8nrqYEzTnepYJLfSrciaWH2PBkStpzmvLFYn+wI5Ta5
	 SazDDbmTaOKwQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260802014217-KYC2734409@kernel.org>
References: <20260802014217-KYC2734409@kernel.org>
Subject: Re: [GIT PULL] clk: spacemit: Updates for v7.3
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Brian Masney <bmasney@redhat.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-clk@vger.kernel.org, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Yixun Lan <dlan@kernel.org>
Date: Tue, 11 Aug 2026 22:22:32 -0700
Message-ID: <178651215252.5862.4480686966770442690@lazor>
User-Agent: alot/0.12

Quoting Yixun Lan (2026-08-01 18:42:52)
> Hi Stephen,
>=20
>    Please pull SpacemiT's clock changes for v7.3
>=20
> Yixun Lan
>=20
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/ tag=
s/spacemit-clk-for-7.3-1
>=20
> for you to fetch changes up to 8a7d4b1924d2a424b1a6fe69de4f9464ee1fb485:
>=20
>   clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers (2026-0=
7-29 02:42:06 +0000)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
