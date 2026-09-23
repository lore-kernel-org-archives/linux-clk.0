Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12CE450409;
	Wed, 23 Sep 2026 09:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157011; cv=none; b=TetpyU+nprawLamFfRvGiFr9ZfgljliIwKdE/KA5JOhjmf6iRPqdI8KurzlOagcOn1QPJ/lBxRgfrOHipZwBa7eUvrXJgOCwKsOMvkYnXId8b5pCimo2sd1ay1wtOa5BPAEW0JPWHEFyCyvIKiomeHT8SaiuhP+8uchaJaEp6G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157011; c=relaxed/simple;
	bh=2DEptU/BCQCCbP+o7ogqK7gMveBuRg0Fat/2M40Jruw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddXmwxh0hx3AMKqsapJzyitehSRacGXEtrdkbnlZ2bdiqjUWVKiVPlKrz+E4Vdx6SZTPPCVRH7z0BOHUCB0/iRo9rHhgKC5VxQysLkDXFrSBa6psRtRv9smrFF2HjPZez0YouQSwEMHlFxPFgY1QSaFaQHUmZRtZI6wlx/tuusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVw8v3yP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVw8v3yP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C41F00893;
	Wed, 23 Sep 2026 09:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157010;
	bh=Dpkfxbn6T1G7p7lIRLe3ir/ZubE3QQzEvQyVg576vgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVw8v3yPtxTe3gax/J4dXiqC5bzIurnEJOX9pazK+We0g3pQgbZaKiGeiyRfinSTG
	 yhPzkAUOuMf07sUmVY3NhJU9iLpUGCJjNdvSFgQUOBc7/o/1FTB+yQD9eO8gjzJmP4
	 P6isekAlyeLIRpCw+UuawTpbJbpVJ5QxIMjRtf0Lwpb6dFOUpSKAQ58zb57+as7UjJ
	 TsDjfwuEUro+uPUL49Ab5ziiEejqkSPrKXk9RxPkWZLycjFp6zMl9iWKOFkp4INr5a
	 N3XWgeK3TYz2qVkUrrCWZprDaa8+/h4A4ELP9/Pa+C4HBC0bP23oEvwOhcpxsIwfFW
	 ln3RnwM2zwQSA==
Date: Wed, 23 Sep 2026 10:50:03 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20260923095003.GB3864833@google.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com>
 <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
 <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>

On Thu, 17 Sep 2026, Stefan Dösinger wrote:

> Hi Lee,
> 
> Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
> Sie:
> > Hi Lee,
> > 
> > Thanks again for your review!
> 
> This is a ping regarding my reply[0] to your review from last week. Do you 
> have any comments on my responses?

Nope. =:-)

-- 
Lee Jones
