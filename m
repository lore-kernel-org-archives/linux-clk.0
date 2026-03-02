Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380B02DC79F;
	Mon,  2 Mar 2026 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452884; cv=none; b=lC20UpvOkusmnJsDrPrgSOtf5LcfrDPJA+rRVc9cDCVEO3BHt0Qjsg4E52HYN+/lrajeZTAy++SRDWaJW8ll9nRayGwDAQmwrlV3rdnW/0Cb8ztSk5xQWMtR+BuSxhZd1huyGLx5wuqWRuqztLdjnZA77UTw8bOi7O0tj7cwFGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452884; c=relaxed/simple;
	bh=HjTZYxDJubndw4ncu7TiRyjrMifl5y4qIzoVJoMdBJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pd61wqIijFQqJPZcqA2musL0ksEFf2MiriScjdoMpI1UbuO3DCSBS9m3zKqimESrT+RMUUYxacc8aD8+iLryUqPw26fJDetJVDHPLjeIeObm0V2wyZm67lpkOn4BretDVcU7x07t4PjP7eTEuELDjIEl1EOEQaQd6AWZvCXK4aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=mrKOPfKK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="mrKOPfKK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VhxVYVRj5aFRsPdr2OVXiQ18bJD+qg+z47LEwb6wbmY=; b=mrKOPfKKv+7FIi+3XM2c5MJ+nq
	nFXUji/xwaVjYDqNUWRKIjJdGl5WblslK1MHVgBVvxl2Kl+l0de89M4qGMq+llRNc45VBgIl3w6aX
	JE2hf5e0h+dT/oDcvzv3Lu+6UOWUtQAfph6Lo/f5EwjVXdBygLleWNZBKy+3xBMz1fhn42D4ngQzH
	rViaN7odDxsp5nVv//iR8Z9r2bFn3NPTC/SMCcrf5RFHQHCiq/ziYIRY5B6JupIK7QCHLMy8z0pT6
	3TgmQcCVO8ln7qJTtU7CTwVInNmK/a7Lj2moqXGg0xxwlwIHr8p2jW9Oc3JVKF1fp4ZC9gUxBMiyH
	Vu/44VTQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: sboyd@kernel.org,
	Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	jonas@kwiboo.se,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
Date: Mon,  2 Mar 2026 13:01:10 +0100
Message-ID: <177245286613.789294.17137920373720584984.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210022620.172570-1-festevam@gmail.com>
References: <20260210022620.172570-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Feb 2026 23:26:19 -0300, Fabio Estevam wrote:
> Add support for the Rockchip RV1103B Clock and Reset Unit (CRU).
> 
> The RV1103B CRU is compatible with the existing RV1126B binding.
> Add the compatible string to the schema and introduce the
> corresponding clock ID definitions.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: rockchip: Add RV1103B CRU support
      commit: 75d627e5571a5ef313f6f553b7749b124c923c3d
[2/2] clk: rockchip: Add clock controller for the RV1103B
      commit: 3e65e426d4575a66a82928eb41b6d83f36e5ce9c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
