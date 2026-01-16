Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BDA3358CB;
	Fri, 16 Jan 2026 02:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531925; cv=none; b=Zixp9KpdoVnwshy1VZVJM0DDtVZBaj9raqSGMLw2TuDfGa2o6MU/TB3SBoxrCYNApU/ZmZLx3hkmyZX9l4NNbDt7+e0b0iFzVzNAGT85fT0ZLnakXgUmyOtMQ1MR2nUcYmg90dW9mOzwJT8KqpQFLQ4PBw6jNd/XHWKbuPgjHMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531925; c=relaxed/simple;
	bh=A1eAq6n2bbc/ess4mcqe4ZVOsZQmFPhftamux+4AflI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=p9dm6F2L3NLFuIukz6j8wgg3NNFWB4OwG0rOUrlI06KU3lGFs3y7KjgWkBTKPgF6FcLXXWxsjHRyD3SaDdisNj9Sf6MbTOSB8kLfjJirU1PmEyjsN+oF3Dg5ucF/FL+iK6XG/eCrCFI/leXLFJc6HhOa+iMVRboZ2bBGKftewZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GB+jGopo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GB+jGopo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09C7C116D0;
	Fri, 16 Jan 2026 02:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531924;
	bh=A1eAq6n2bbc/ess4mcqe4ZVOsZQmFPhftamux+4AflI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GB+jGopoHjHvHmUxiin88C9ksQ12+5UwObzUVVs9bIHfeVhBzZKQMwZHao45o2k3f
	 CvqOLcb0F0/XuOA54L3iP2WoXqkNLm8tacmtfdZhc95szpHoeF4IrFxZ/9RX0pF6C9
	 RmvwaBYKS5eeellZjiHY3ABbh3JKVQ1SqEiU6uUmpM7GgtLvJy3dxP8saQz3zCpkvH
	 PcbF3Bh9ykFvGO/EuxG8PfZuIV6WYVMpBxiupaEWnUxotupG2DFklRCy/WjoQJg71J
	 pBd/JDbljpfkTB5ZN6KyyLAgHcvrMRjxTw0FDMZTJFsC/KpdYs1LZP6PGyzrUixDyl
	 2yfi4ebzKnecQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6ddf998b90ec9f4ac1f2467f6053f1464d8c0e79.1764582057.git.geert@linux-m68k.org>
References: <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org> <6ddf998b90ec9f4ac1f2467f6053f1464d8c0e79.1764582057.git.geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] clk: Annotate #else and #endif
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Keerthy <j-keerthy@ti.com>, Michael Turquette <mturquette@baylibre.com>, Russ Dill <Russ.Dill@ti.com>, Russell King <linux@armlinux.org.uk>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>
Date: Thu, 15 Jan 2026 19:52:02 -0700
Message-ID: <176853192286.4027.15343826046930690450@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2025-12-01 02:42:28)
> Annotate the #else and #endif keywords in large #ifdef/#else/#endif
> sections, to improve readability.
>=20
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Applied to clk-next
