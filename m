Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118B328B7C;
	Mon, 17 Nov 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763416091; cv=none; b=XYQ40ibI2w00vt/Cl3DYHFmCiyQom/W26eANWL4z7BxK3b39DegIIPmyrqWBo8DzdC866cLhP7thhaom71lET/sV5V8T9yIFcwl9+vPw2EafpIobp02V3ibnLV5pjlXOIa34aVfNCuq/BQF9Vt2MISFoR5uNexS3gB8ymEqdqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763416091; c=relaxed/simple;
	bh=4hJGMHam+Dd5gmb1dURmkEFt/9NkYcx2ltvjZviBpfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdeU8tsKAs1TGrkqKoYw95OBIdtZraw9CL7c7g9YQSNcsU8AFOYa4grzOzMEZoefR1fPMj9Y7FSNigjR1TcxED0bmJi+VeZsdBHpN/1ret4XgKuoGp0TDfzY4evdkk2zK6rPSboAvTu+QME2tuUaEflFZFH+gxDLD7I5RRjM6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6vzTmTb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6vzTmTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB293C116B1;
	Mon, 17 Nov 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763416091;
	bh=4hJGMHam+Dd5gmb1dURmkEFt/9NkYcx2ltvjZviBpfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6vzTmTbE+LjRign8Xs4NXUC+3fBE+sS/v3dHARqBciO8MFXznCrD2pCAOW4+KUBc
	 ZlIw3GeXn/OOyWJBJX658t8viGviYRYRkAPYUOyhxvHuAJEGry5UrswJQvT3JAR9NH
	 UDy3hWQqTX1/LCzDt9NVd9QWyDWTHJrGmfwfDiXwKCbzZ+oOtMcPwAaObzIZJbR6iX
	 WoPnNOW+KPQns7XtNANSdwHuFiybUqoKZ3aKPudBj4ayw35eNooHZ1myoqirT6tALe
	 RFRCNhNdDd6f8rg4WSHUGKm6r6Nzp3Mb67VTSf8DPDKHLA2Nspd4Ma5FgFg7Stpn0f
	 Zr8c0bokveOfQ==
Date: Mon, 17 Nov 2025 15:48:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 2/3] dt-bindings: clock: mpfs-ccc: Add pic64gx
 compatibility
Message-ID: <176341608757.773703.18386473879112962175.robh@kernel.org>
References: <20251117-shadow-police-56aba5d855a3@spud>
 <20251117-mocha-shelter-4d9aa88e34b5@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-mocha-shelter-4d9aa88e34b5@spud>


On Mon, 17 Nov 2025 15:35:19 +0000, Conor Dooley wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> 
> pic64gx SoC Clock Conditioning Circuitry is compatibles
> with the Polarfire SoC
> 
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

