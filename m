Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2994618BC2F;
	Tue,  7 Jan 2025 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736279335; cv=none; b=XoNhFXL5mvONBG2+K8dklIQ/mvEud5YneQ0oxzJKAvx/TP6puT/Ee1WY83gObuU6vghaNDxrXN7SFQcybFaBGkxsscgpLJG//nrcUukMKO5Ci8ez7GRBqbjfchAPANRC+J3+dqcdM4KZxjanwPOXVJ9ObCzi1A7fsz2ho7TAFTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736279335; c=relaxed/simple;
	bh=HGG53FD+e6AEqDVpIXzu/Y9u3YY80a9hpl5Y6sSf3LM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=BKr4XBiiYNL4G+a2D8emibc4ErHsPQK66xoC8eX4x4BL33j0Y7grJgA0Pky1J3DvBzwQ8guUjxSkKZvkWlCFCDIQF5lvOdaoMlWCaB0A5HOQFJrYSp/GLYOdeHHhpfZLV26bUXquSH24kQGpQj7voaeCn2Nq70eaaPMcJ67fcko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZG2tEHI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZG2tEHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF04C4CEDE;
	Tue,  7 Jan 2025 19:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736279334;
	bh=HGG53FD+e6AEqDVpIXzu/Y9u3YY80a9hpl5Y6sSf3LM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kZG2tEHINMVPCS7b6QAo96qOp+fKoI/zsm6sQoGfoz7M6HsBxtvwZ7aj2cRpbqguW
	 YxrnjYihcs24UIYxzcW5RnxBvt9p2CMWpxSm+LNHrtVEcBv1PXVkv5PaAWKP9LzXXD
	 gb7612mqCAm0jHhu35dKAwEIBLGCbGbQuWulYDWQeM7JHJHBTX7eguwaR6v+fM4F4z
	 siI1qakgChT+icOXZRgxQu4WLdlKGwDBcIkfdVfpcokRmRG296BSRslnBVgXLmHqxH
	 AVPAsUEbklG7VumF4Ms8I70EzGuteV2xis0+HDsY1rt6aZZB/h0b304AnCK9sK2Ac6
	 6SHsL9jy+1o0A==
Message-ID: <b895c570e507cbf71906e5f0100bfaa3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250107044038.100945-3-rohit.visavalia@amd.com>
References: <20250107044038.100945-1-rohit.visavalia@amd.com> <20250107044038.100945-3-rohit.visavalia@amd.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: xilinx: Add reset GPIO for VCU
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, conor+dt@kernel.org, krzk+dt@kernel.org, michal.simek@amd.com, mturquette@baylibre.com, robh@kernel.org, vishal.sagar@amd.com
Date: Tue, 07 Jan 2025 11:48:52 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Rohit Visavalia (2025-01-06 20:40:38)
> It is marked as optional as some of the ZynqMP designs are having vcu_res=
et
> (reset pin of VCU IP) driven by proc_sys_reset, proc_sys_reset is another
> PL IP driven by the PS pl_reset. So, here the VCU reset is not driven by
> axi_gpio or PS GPIO so there will be no GPIO entry.
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---

Applied to clk-next
