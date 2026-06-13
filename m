Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E622131E49;
	Sat, 13 Jun 2026 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391300; cv=none; b=JFfW9Fhnz2DCyphfQ7K0zh9epy0I7ieUcNIa2rEzwBa0+RFb1+1/WqGulOoF3SXrxL94/WhZ3pMFr+BgwMtG6J0eAe/qf+3Pg1mrERm/EuMRx3K/1EnTSqxTzPz/Z6qJi/bWD06kl3VNb/rjvnLf91/8LUPHkUq0DKchdz6K9e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391300; c=relaxed/simple;
	bh=9NAoG9N50/6mujiaJf+VFbMJV1SS7xVp6ryBEKBImiI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=k52lYnYp3mXLYHwn8+ZXJjsUBy8Z96rzx8LNUyR9ol7ylrA0Z3GuVQMclzl6KjoMWbMrae1dV/CR/L9o19yYEOHm4B2thZSmaW+OacqCfkYFWGj0XUA41eANu9PcY7g9jqEdtW7LMATtj+Y7HQVtrCkCYvsVeafWGdOerJU6UoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzAPRs3n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzAPRs3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B731F000E9;
	Sat, 13 Jun 2026 22:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391298;
	bh=Edq0RibfGQadV5IF2lHpUmyA/81DVnsxIgG+5Bq/eaQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=QzAPRs3nuBi7PiwvGwzLwrc6KRNM4f56zNLuQab77yQ3EHLwD+dg3KlYxK/BHa/oX
	 Hbyevv0/zISkL2NgO2l1FNvaoNm3KVzy0ID8A9mPJ5K1TiarQ3vlepG9J0NbMj7KXr
	 qa3gASrGSp/gU+P97mpsvkiUGJc4bf+QCEiLPMOQy7gUhzPsMznE3HHKquurS/udAC
	 //JU7LgskTV6ZzcIJp/qTR9vHecRUZOYpgUWgcji6gNyuw0R0HIFNyofeyp2Z++Vi2
	 k9hJotGwxHtJF6ZpXxQD9EqslyYnOVpVCaQ8WoPeT7ydOMoaAXCSI/UOHlkyejfe3b
	 EPdckAkabd8eA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260526122512.3841150-1-dinguyen@kernel.org>
References: <20260526122512.3841150-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] clk: socfpga: update for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: dinguyen@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>, mturquette@baylibre.com
Date: Sat, 13 Jun 2026 14:19:05 -0700
Message-ID: <178138554598.819343.8394587157390639221@localhost.localdomain>
User-Agent: alot/0.12

Quoting Dinh Nguyen (2026-05-26 05:25:12)
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/s=
ocfpga_clk_update_for_v7.2
>=20
> for you to fetch changes up to 1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548:
>=20
>   clk: socfpga: agilex: implement l3_main_free_clk (2026-05-25 21:46:56 -=
0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
