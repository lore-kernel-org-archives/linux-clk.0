Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32BA18BC2F;
	Tue,  7 Jan 2025 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279326; cv=none; b=AGc999dpQTN3vq1aPmzN1SUT6L3Qvfhta9ptwmOgH7E4qWTrQGBowpBeXLyOFP/9l8LWWCu1Et1+0KCD94+wXpRqrnBtBOKqvr3QIh74pKlkmc+RMgpy2cDY10/A3emfsxq+lstNM+7OnTfLFFbvhsKzHaFwPE0Ain8aztvMVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279326; c=relaxed/simple;
	bh=BE3Kvlm4SYj9bK8LbiFE4KUXI/o+MNEkZx3XTGkEcYM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=B+NqVSK0CVD08IAiw0dP7dy5KoXm0IG0Jf1wHE8NEU1zSTKQARZacksZ3Do03TGD+CVos5htCFshMsYFBYxfbftj4wwJ+8ype1GbcHwpjf8j91ZdXQjb2YIlQUyEvCQSJk4wORPE0/lRy+WDGB1quUEeMlHMFMDDbQHqb5AdQC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJJLIrOF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJJLIrOF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C06DC4CED6;
	Tue,  7 Jan 2025 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279326;
	bh=BE3Kvlm4SYj9bK8LbiFE4KUXI/o+MNEkZx3XTGkEcYM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZJJLIrOF+YIe2HYHOMHHzV1ZUD5ZvQUJsWh22UsRfCTB9jTKRK5hTXUQDhjmU9KPM
	 /8TOTWDumBsqOO1RaN/ZM0P+lj0zOKztPwV/WJUE7k2jfNPdnjek48IIp6mM+tj55k
	 En9kKg8XDpqWRc9QxDkYtCNxdirBWhfc40aWSmtUoll6gmu3NoB+QPfbCY+7vzvGJj
	 S4dK050VyqJttIWPIJt8mERDnGdckGDvr1fAhqGouJ8hz9ppLF5qR79v3/G2lPWhAn
	 0KkWxR6LO/WBlurjzEjviDTlDAp2/PY4rSgTkj7ELOWDwFKKdxyo7QQSf11Gmk8Sbu
	 RqWFaRam/CnxQ==
Message-ID: <ad5423103bdc2cfdc2f99a41e3660e8e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250107044038.100945-2-rohit.visavalia@amd.com>
References: <20250107044038.100945-1-rohit.visavalia@amd.com> <20250107044038.100945-2-rohit.visavalia@amd.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: xilinx: Convert VCU bindings to dtschema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@xilinx.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, conor+dt@kernel.org, krzk+dt@kernel.org, michal.simek@amd.com, mturquette@baylibre.com, robh@kernel.org, vishal.sagar@amd.com
Date: Tue, 07 Jan 2025 11:48:43 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Rohit Visavalia (2025-01-06 20:40:37)
> From: Rohit Visavalia <rohit.visavalia@xilinx.com>
>=20
> Convert AMD (Xilinx) VCU bindings to yaml format.
> Additional changes:
>    - move xlnx_vcu DT binding to clock from soc following commit
>      a2fe7baa27a4 ("clk: xilinx: move xlnx_vcu clock driver from soc")
>    - corrected clock sequence as per xilinx device-tree generator
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
>=20
> ---

Applied to clk-next
