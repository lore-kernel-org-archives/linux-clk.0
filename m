Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9D04B1E6B
	for <linux-clk@vger.kernel.org>; Tue,  6 May 2025 20:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746564854; cv=none; b=H1GmLVP2Epf72sA5NiQ0DCGl6n9Klhg5iaaT3lHFy1MsG3jE2HTfmtRCBFFB0YGDCrxoPcC5AOWfYQAE7Eq6ej2+N/7u/QgbZ8VC5Zxsj6t867xYe9XsaDm+vXvm4scwBrhyL8fgjUW32L9PhiO0xtqwkCUQ2iTWcSJx7tgX9rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746564854; c=relaxed/simple;
	bh=VSZBh24ELOcaLYgnoEqdOEvNXzF37hRNgBnExnDi69o=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Z927eVlbbWTDz6NxAXSTdneQ3CjAK9+PjJHJg8oh5N4N8n5ZQRL8FDRXCXp/EaxOrVKPL46aJFcg21XYLUTZGJOTKfx+zB3G4cPY6lzLr7/13mz9nU/HzAsbsVyVzYwd2DKPkGwpmmW2br5YLuWHpaVREhnYRXcmC3ORP6rcn+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epaZceLy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epaZceLy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BA4C4CEE4;
	Tue,  6 May 2025 20:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746564853;
	bh=VSZBh24ELOcaLYgnoEqdOEvNXzF37hRNgBnExnDi69o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=epaZceLykrqEinKheO0wPZrz6boMucvVCD9sjGX0gXnMhkhCKmP3F80XUWn0+DIcb
	 +T49SUFfnEaY4taZFaJgSHJPyEASyNDU2o6E6mmVTL2mSaH7G0JT7CKERpWUhEvhlj
	 gsa3S/3UOB/SV8RUtBRPWubL66mM1cQJbPmcGnac7f7ACjKcV2Z4zY0AqkN2Wbxski
	 uy/ChpgVHqtTfwX2JZJPRILWzW8W7+pb+W1PfIPbAuP2rg++cAnmRg+glfe+wJia4Y
	 IyNRa9Jk+L/7bAdIPCnLRGySJ/K/oAoN6gi9ZrZv+0C85IDP94Y4hldo2xv8aJW1yP
	 BJa8ZSL9rZ2tA==
Message-ID: <dd3ec30988b604406d3f7563f983ec04@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250501113927.2008316-1-dinguyen@kernel.org>
References: <20250501113927.2008316-1-dinguyen@kernel.org>
Subject: Re: [GIT PULL] clk: socfpga: update for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: dinguyen@kernel.org, mturquette@baylibre.com
To: Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
Date: Tue, 06 May 2025 13:54:11 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Dinh Nguyen (2025-05-01 04:39:27)
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089a=
c8:
>=20
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/s=
ocfpga_clk_updates_for_6.16
>=20
> for you to fetch changes up to a5f390059970adcff4ad69a169b5cae3db0eacea:
>=20
>   clk: socfpga: agilex: add support for the Intel Agilex5 (2025-04-30 07:=
00:33 -0500)
>=20
> ----------------------------------------------------------------
> SoCFPGA Clock updates for v6.16
> - Optimize local variables for clocks
> - Add clock support fo Agilex5
>=20
> ----------------------------------------------------------------
> Niravkumar L Rabara (1):
>       clk: socfpga: agilex: add support for the Intel Agilex5

This needs a rework. Please resend without it or wait for an update.
