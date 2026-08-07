Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F34B25C6EE;
	Fri,  7 Aug 2026 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786143317; cv=none; b=E7FtLlyLcUAy6AMHyXyRMv8qdSPceUiTYR9D6VTUR42B+8brFPAOViIne7Eb8klBpsDX6xEig2bszEwjGTIBUB9AOOU53EJCIOTvPfDyu9qVjUQOtW3MnqMY7Acrs88ELzGa+PH2PXQHzICgRk23lJVRq8/TUu6KVeUBetfbeTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786143317; c=relaxed/simple;
	bh=GKOpdN0L/bUO+fx0N71tzBfAYrxXrKBlMqJx4+c0U14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnpvT7J2sH5KPUuXk5aRq26jciFuOsKjb5grpJL/I3bIPjyLhv845wLoqMg7RD1hDYfc7gx05LKnvXtvugB9Ef8yf873bu17kGS0HnWMrVu5HTb7HDo4I7l/ZsgWU7C8XqebyHh7AvoU3RAoXQA3VF68KDgPpfqyJumfHb5u88U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kU7/0U4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kU7/0U4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FA51F000E9;
	Fri,  7 Aug 2026 22:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786143315;
	bh=+366LTXRDddGVQ36zDbRda0ahcQS2/5quDYqmIJ1Km8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kU7/0U4pKAGrQxGKlOKkvC7QVpoTz1IqvQ2SHtkn77beA02CowswuqTcQEc/FS2Ji
	 jZTaQ14WugPogi/w68jRdxqelF9IroFo0RhJ/CgdV52EZU6qBrIBSaN7iBn5E7EMQc
	 zon/nt7/4F1StvrTAXw4b0VnIyfAkueqgF3SxhsfPKv/2hxr8EdyBaKBhg5AsihpDw
	 bIaFPmarJMfVVktuh67JAGPJmMVw4/VjejVn0pU/UytEnxbeI3k5JB1Tcnewvn+EEe
	 L9rTvjM/B4UOoZIIyqve5HsTh7jtJaG8CH0LplrDbQ762g0tahuFgyKeJMHekYQ+KF
	 dSPWYc2Fmoaug==
Date: Fri, 7 Aug 2026 17:55:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: airoha: Add PHY binding for
 Serdes port
Message-ID: <178614331466.2202130.14704368640955056014.robh@kernel.org>
References: <20260724184304.192962-1-ansuelsmth@gmail.com>
 <20260724184304.192962-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724184304.192962-2-ansuelsmth@gmail.com>


On Fri, 24 Jul 2026 20:43:01 +0200, Christian Marangi wrote:
> Add PHY cell property for Serdes port selection. Currently supported only
> for Airoha AN7581 SoC, that support up to 4 Serdes port.
> 
> The Serdes port can support both PCIe, USB3 or Ethernet mode.
> 
> - PCIe1 Serdes can support PCIe or Ethernet mode.
> - PCIe2 Serdes can support PCIe or Ethernet mode.
> - USB1 Serdes can support USB3 or HSGMII mode.
> - USB2 Serdes can support USB3 or PCIe mode.
> 
> Add bindings to permit correct reference of the Serdes ports in DT.
> Values are just symbolic and enumerates the Serdes port with a specific
> number for precise reference.
> 
> The available Serdes port can be selected following the dt-binding header
> in [2].
> 
> [2] <include/dt-bindings/soc/airoha,scu-ssr.h>
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 24 ++++++++++++++++---
>  include/dt-bindings/soc/airoha,scu-ssr.h      | 11 +++++++++
>  2 files changed, 32 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

