Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C54B1DA60F;
	Tue,  3 Feb 2026 00:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078963; cv=none; b=hJSIQDpKI0CWzeTPBu1yhD8gm2xIO3S77TU/IkcaAB8WQ8xbVE4AaeI3+/FaSqM0c5N1A1nywX4MM11rOiwpUVII5NY4AoIWM0wp8Hm8+mdmxfJskSCfObbyArNkzXhn1LCNn4T5csBGusZWosS5Q9v+bSqHaVqhoCjYMrWfssM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078963; c=relaxed/simple;
	bh=YH66jlqWTucD3o6rfLRNTV13L9DZ1S7HHrBe4+EeVYc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QXzJqCiak49zVjT+MtIZBlXPkUAnHBrJwIOVbvBfDvbo3I08MqHVncjrOubDAWZH/BQRTm5n4kQbV3H/TgFnZZRk/ujjqtbDi9veip8L8An2PuTDBXu22FwW081dtL84Q8dkUyjg/S9BDi4+eMCFSs4K5betbL6fjnwJ8lCaSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnpiOK76; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnpiOK76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2395DC116C6;
	Tue,  3 Feb 2026 00:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078963;
	bh=YH66jlqWTucD3o6rfLRNTV13L9DZ1S7HHrBe4+EeVYc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UnpiOK76NopNZOT/SPFmWNq6Q39cN4l4hQ1E89roSGOkV4/7/ANVScfaTLDwLeSiT
	 gY0yapY/6M9+hQQ/jVgIe4zUdnmJT9coiM5DsIKXPhhTl8AU6b+3gsDgZ7jg4lXRMA
	 IVE3hRhBs0rd0ca9Pt4APCMG5O/Lm4A8UeIVFIy6A3Xw8zlueeL8HkqWOKxTJUZe15
	 bnbOq12S3dPc9RU1tTppp4qMKhWoADGfk6+3SSjhIOUCHCcx0Zt/Jfg5KvgIZQ3rY0
	 /v0jmSNcq6o8uVuBeZWAoGRmWiAYHSTG2mB1BsHtg6rD7cD+5kNsXMOt/AtbqcKE+B
	 FsKbbvynxvMCQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
References: <15f24d006fc782d501922d6c88e836976d69c7cb.1768993373.git.geert+renesas@glider.be>
Subject: Re: [PATCH resend] clk: rs9: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>
Date: Mon, 02 Feb 2026 17:36:00 -0700
Message-ID: <177007896097.4027.11771913420394908681@lazor>
User-Agent: alot/0.11

Quoting Geert Uytterhoeven (2026-01-21 04:03:11)
> Convert the Renesas 9-series PCIe clock generator driver from
> SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
