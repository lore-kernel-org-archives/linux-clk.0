Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86CE1F4CAC;
	Thu, 24 Jul 2025 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391531; cv=none; b=bCVfu9sYABSCEKIVP2bjNCYAGdLu/SwPgGGDt/wsZh7s7nz8VRZ7d2vYbDWFYCI0mDGilKLNkBo1StADnlRFXZlVUqAAYpLHAj0utCiEeUi4yg1KkWhYDjxNi75/c/UUDZEESlJDh221Io7vNfo4Hb1iEWBQO7hmn/MU80Ldt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391531; c=relaxed/simple;
	bh=WqXl0oSRFmrg57tuZy0QoZl1j1CEs9cN8MESRjdRHP4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GZ403s5MJbeH60knaoiWMuBv/zrWh8ExA46iX5aWbCbSLvQ41bXYBYw3CzOLxNFOpjzB6IOam4zzUzG5t3HHDzI8RWXvGpJxiz30PEVWwve0ClnLtHWIy1dB6DOmlG5QsbcE6K000SBnUYFfyMz8KI9Ynaol4EmY4QH65aJueBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPOxXiig; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPOxXiig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31197C4CEED;
	Thu, 24 Jul 2025 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391531;
	bh=WqXl0oSRFmrg57tuZy0QoZl1j1CEs9cN8MESRjdRHP4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=RPOxXiigZl0IXkgqZbHsY81oVCLVvAoJciliVxuiWWMaQqiPkDjZlE9n/sj09zX71
	 Dl1/yQA8b3WYfqbg0YhxW+1zBaH+l9gtEEcgRbf7vah3tc58mnoy+XENlbv9Ng7wiD
	 nb5TXscnns4PJWAGEs2w9/sxN7I8Xefu/0bXqI8bYxhWKG51JSvXc7dEzx5ehvuxuC
	 SyIuPfzaFcKlwgcyrHZMUT3KRLQVIC61JdYzwFbX76TXZhHQmS7Fss36NiuCxxxWKf
	 0plZfSmyMR/lxZ5VvZ26LkqBgVf8yCyqeQbaj2qtcY2GciIM2tBrBIWx22mXNnjHGt
	 iJz8Yhq3prg1Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250630232658.3701225-1-robh@kernel.org>
References: <20250630232658.3701225-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert maxim,max9485 to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Daniel Mack <daniel@zonque.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Thu, 24 Jul 2025 14:12:10 -0700
Message-ID: <175339153034.3513.1217988806822508120@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-06-30 16:26:57)
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
