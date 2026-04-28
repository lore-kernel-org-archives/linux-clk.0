Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BF2DB780;
	Tue, 28 Apr 2026 01:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340479; cv=none; b=cO74ot4oasLtuWERYgw49coWmGppL6yX0s5PciS6wLp1ITAlTCTfuvVh6TX0VTB6dIfnLa1MnysvUUodE2+Szkp0VAkTEc/cCGR0U1WM+9xmxka94tPNXL/vOqXSPfK6d7zQkFeDscbdlZUtjTfQLcCDWLtWnOq6D6uofMcD9M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340479; c=relaxed/simple;
	bh=kS6Nhw5Xce8gKlfbWDr+Qz8JGBd5F/n/TDPtz8b6uAA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZSBO/e42YxN9ZMgPo19mRMyMfPLm8T8PmEjYn/1FbCX1fMaJny6u3TD7M1cxHKTGMaLi05+G2LQbRJmqGbGG0Hefg7Li5yBcMTC5NBDL1zh/00IkQ/YWuWREad9GdNP9Q+Fi/oQbmRwjVvSwXQjn4ekkKUQPYsypAy5gUsrf4K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDcHkvqR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDcHkvqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA22C2BCB4;
	Tue, 28 Apr 2026 01:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777340479;
	bh=kS6Nhw5Xce8gKlfbWDr+Qz8JGBd5F/n/TDPtz8b6uAA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LDcHkvqREYp21fdsIvE3hqicidetzAVcadb9CaB0WYDnqYnrA8lTHHvloce1SbuxG
	 YqR/+K7fb9XNMtUTnlH02uCZH3MwxWVw/RAzzlvPIcEtSrpDEUHCYpcbf4HJb0OCgZ
	 z//4Izk2qtg2e1vAzVsbrkSC7CEGIrsoA95wzvz1+KAUUQGtxMOrqe+Qa/TFTH5E1d
	 3ZY12EXWUND7WfnXAfRxnCOfGQBlDKaixZx9rEJYbNJjW5kBR7yrzRAeB08UcpjJDJ
	 u+fg5FLNnDott4iqobSvT12fh+Up39IdmxWl7bqDDaGRvwSIX4QCmKAWDse9NegJCX
	 tVMD4hXdTsLjA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260302011651.94682-1-haiyuewa@163.com>
References: <20260302011651.94682-1-haiyuewa@163.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: ast2600: Add reset definition for video
From: Stephen Boyd <sboyd@kernel.org>
Cc: Haiyue Wang <haiyuewa@163.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Date: Mon, 27 Apr 2026 17:31:28 -0700
Message-ID: <177733628897.5403.16418225590380642017@localhost.localdomain>
User-Agent: alot/0.12

Quoting Haiyue Wang (2026-03-01 17:15:00)
> Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
> header. It is required for proper reset control of the video on the
> AST2600 SoC for aspeed-video driver.
>=20
> Signed-off-by: Haiyue Wang <haiyuewa@163.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
