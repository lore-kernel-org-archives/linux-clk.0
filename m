Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50D18E02A;
	Wed,  9 Oct 2024 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728516298; cv=none; b=GT+zp7HdxwYbfQXwpphhjEsHOI8eIVoXF3HpzVd+sMvFDOqELE1jAAF4vySWnZLywm+4Bo7y4q+KqdkPSnFsxMlz4GmmfEUDRNyhbklMR0aTwxSVzGy5IpdVI+N1bo8mFY0qIZK2JiI33jEDZKLKKscoPJEzFcAIdro65iAljVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728516298; c=relaxed/simple;
	bh=f8j5Rc2RHHhiF2GJc9OBWL+K6u2nb+DBAE4TxLYBxHE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=MStjuLm66qnELsl++9HbfTXKRg1zcflKAE7wK4izkvcE7po0lzzVi3ErFStKxwn4L60YgEL4stWpqN0iRJ0quh7f+k7xuFDbhHP4tVpB2kpR7OeGz/OGYSLsj+n86zeF9Dxot3Eb7ehyTzyTk9puaGuLC7Ln/9Ba7b9GzRKA17Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc8FJN6V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc8FJN6V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB812C4CEC3;
	Wed,  9 Oct 2024 23:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728516298;
	bh=f8j5Rc2RHHhiF2GJc9OBWL+K6u2nb+DBAE4TxLYBxHE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dc8FJN6VBianZ1+FazmVZdPlcp9zpSItKgTj557J2VYbbpZjCGF0DvR1E5fMSycW6
	 DXb32sDm58B9P8HuFphQbt+VNbcZsAl+cwRQ5jGUFZ0UDZSpI0vKJIWdiLpP3vzDMU
	 R+D+VFXsGwGqlg+PawFSSlqyXsUFh/7DXO6qfHlmgg+yNg+fqYt2wXBlMFGfDYFTSn
	 fymy11T41cP3QIjZhqapVHEFbW1pw/0UyX+cQpD1AF40ULJ/oyH/44h+uH/8iVoqgo
	 vY8Bjcc5WpH4jpyebJQckWrxSV8EpxWNc7NKHVmZVsTjIt7XyYdLDHaf4Ydk4kEqUe
	 ubXaDVaaIdiVQ==
Message-ID: <e0c20d3cc4490776fd2498bfd72ab6ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZvuzQxjuN2zRrAMG@lore-desk>
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org> <ZvuzQxjuN2zRrAMG@lore-desk>
Subject: Re: [PATCH v2 0/7] clk: en7523: Update register mapping for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Wed, 09 Oct 2024 16:24:55 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-10-01 01:30:59)
> On Sep 03, Lorenzo Bianconi wrote:
> > Map all clock-controller memory region in a single block for EN7581 SoC.
> > Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
> > memory area through a syscon node.
> > REG_PCIE*_MEM and REG_PCIE*_MEM_MASK registers (PBUS_CSR) are not
> > part of the scu block on the EN7581 SoC and they are used to select the
> > PCIE ports on the PBUS, so configure them via in the PCIE host driver.
> > This series does not introduce any backward incompatibility since the
> > dts for EN7581 SoC is not upstream yet.
>=20
> Hi,
>=20
> any update on this series? Are we supposed to do something?
>=20

I was waiting for review from someone like AngeloGioacchino.
