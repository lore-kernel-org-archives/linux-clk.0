Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C75312C544;
	Fri, 21 Nov 2025 05:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763702445; cv=none; b=jaaDJqvVJ6/ADc60GFyNMYVch0siv0EIr/2uqzg6JZ7NQVWnBoY045EPnndvLQs2qA69uOHm2KO1+Lvsqc7oQq6tZ8KRjZ546KoOlspr+JYeAewWLrWzplFW7DCmekLvf28K6FJK2dIfrGdy2eSKGT2X0H0GRhwnDgdCXYQ/JGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763702445; c=relaxed/simple;
	bh=vRXivfFtcgsET3yxtAX2r5O203EM43gMUoVVBMg/jBg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=CvCaPJlGjYLiiVSD9GWDw4Xr6cRCq0IgiTX+3K5vSJwiNYD3IKHaipn2d+RMPp7pwjql9Pmua6xPIqokHbrqk1nDWp/fJZW/AEJPLeZmNLw4yY5r6o+5nwMvaj/G/ti1/UdCO0jrT6NHmFIS/NxAiRCc1xzkL3I+K/EAc27a3N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNydD+7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNydD+7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75EBC4CEF1;
	Fri, 21 Nov 2025 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702444;
	bh=vRXivfFtcgsET3yxtAX2r5O203EM43gMUoVVBMg/jBg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rNydD+7wfd7XEahi4kY1mzEMlCru/n3o07kgESMQ8X5GfBk3RVVwxgmCKEAN4ZKG2
	 5+NnNAFG561a/Eya/V3twIf70pUO8vhyU7km73g5kRbr4ILopN7LHSMa9kVSTSP1gA
	 ykanQtP9m5wWCjcX1pgK+utqEJ67NHoMGdnIWgOOdZp98I7ccYxqkUct3xc67q/S/M
	 jffs327olhX4d29JS1UeGX1z02nIasKCuFVHyOGzni8T1dp5ayMrwartCwa7jmhWCT
	 Hj0e8QxH5xCDRp2Cl4yOpfaKPTHUdZnxc8DVrPMkGvW226ZlOXx0b+ySk6imUNNVEw
	 5bGGgNrW4cpvQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114135842.1473203-1-abel.vesa@linaro.org>
References: <20251114135842.1473203-1-abel.vesa@linaro.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.19
From: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>, Mike Turquette <mturquette@baylibre.com>
Date: Thu, 20 Nov 2025 21:20:42 -0800
Message-ID: <176370244286.11952.16611312022435316192@lazor>
User-Agent: alot/0.11

Quoting Abel Vesa (2025-11-14 05:58:42)
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>=20
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/=
clk-imx-6.19
>=20
> for you to fetch changes up to fdc1dc7dd53b95805d3943ed36785c1ec812915e:
>=20
>   clk: imx: add driver for imx8ulp's sim lpav (2025-11-11 18:01:25 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
