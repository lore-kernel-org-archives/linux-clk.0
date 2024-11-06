Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1653516EC1B
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 00:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854742; cv=none; b=fLreAxhrFhQ036967cB5xRAPy7iQIVMthggoc0sBKcaS6F1Gf/OPMspHvFd16vv37ykZx6H2+5hiAYTUhWq5xe1GZVUm23e2MrX9wdm5LGs5xVPOba1F53Dxl5HCKjWBW1Cr37ILNFM5Ph1Yjfjf3SsAAvwL2VSAcJxvCumvVB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854742; c=relaxed/simple;
	bh=ScyTMTNMH6zOeB30c/2wLzNnOEYdZ89ijPa2zF2WGU4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=fp0G8fITcgSiVd3I/hObH9gmLhjz7oCMi8cl4IzIepgZGkMZMVbiABuKLCKGbm1Fku21POWhFp4G4+9E02ne0eDsvqm9uglhKLeeZXB7USnzMQuG4GxeS/JsdtIgxlHNQkSNvs+/RKX173HmjcfsP/YqoYtxvtj9uPJERgxU/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7gqmyA8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7gqmyA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA41EC4CED1;
	Wed,  6 Nov 2024 00:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854741;
	bh=ScyTMTNMH6zOeB30c/2wLzNnOEYdZ89ijPa2zF2WGU4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d7gqmyA8sGYyt84WdH1qpzgP/rVK1dGVHF/2wHb6qd3R14r41D2eQxGUWKOYTqZ5X
	 V9JPLzQT7KVt+bR0vWoScs5z5gNEXM+9nKCnmBEYetfQMyfEPs2z4SQ6UkA21gEpdm
	 mVZsZVdfX7v1aNScedLwayUSpvo85XHAKCqCnQLGiEHnEQ/UBpPlaB9RSvy6E7QXKh
	 yFWHs2NoW59WLNntXDgGSaoM1zny+ihxBuwt8w6u/XyAA4+g1juD3bagCFCAYuLaWQ
	 /Mi1NXbTptAIUj4ppYMPh0EoKL1O+EeVnlY+G95ER4K/Zio3t8yF88l26kCoVbkofO
	 MU3O4o9K7OPUA==
Message-ID: <87b4b3fd603fdd2eea5fb68e8283475d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241105081941.3981524-1-claudiu.beznea@tuxon.dev>
References: <20241105081941.3981524-1-claudiu.beznea@tuxon.dev>
Subject: Re: [GIT PULL] Microchip clock updates for v6.13
From: Stephen Boyd <sboyd@kernel.org>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, daniel.machon@microchip.com, conor.dooley@microchip.com
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org
Date: Tue, 05 Nov 2024 16:58:59 -0800
User-Agent: alot/0.10

Quoting Claudiu Beznea (2024-11-05 00:19:41)
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>=20
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk=
-microchip-6.13
>=20
> for you to fetch changes up to 47d072b10507f813fb58d90fe6c37dd8686e8ed6:
>=20
>   clk: lan966x: add support for lan969x SoC clock driver (2024-10-13 19:2=
1:11 +0300)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
