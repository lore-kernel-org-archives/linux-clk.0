Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6362F6178;
	Wed,  3 Sep 2025 12:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901976; cv=none; b=ldCcojwvUS3FKngElQTfSX2HpYUkHDURwsekSVsqhfGIx+vY5eDSj0VBQSvCl/+QEDwZTWJCuOVgfMwuhypsehjzFZvW63awil+Vd6QYZ5ENSdeA/32FZtX4qQBdM7W4q5aEJS1GqDdejgk8HmwLqBEGUf9WOnUiY4uTIo8s0Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901976; c=relaxed/simple;
	bh=oDhD56IfuO3o9coc4tc7y6naPZd9iYaopYyQn6gukfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hFBzKB9i7E0BhaNkg2n9qVO0MOlHcyK+JKuU84tVZCzGGHnH2ATtLQ5Kxss4W6DI11K9xqjfaeHn5JFbkFB5n/CV0lU6CLOpY0mhbBDXDeuIVxdTxOXrkWrHUjNlOGuT3S5odkxn20sActdSwA4j1Ve9ERbg/WFQvNXv51gJKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0GyFtSxD; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0GyFtSxD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=J1KfW10yfYRUz0dRGNkZQYEnp2Hun5fkPdAXq0a5CeI=; b=0GyFtSxDP50gFZGFy+2kOXaebj
	S6P0FLjftPJ/knLJcL/8zL2kJncKmqdJUhHRRXiTE2VxVCrXm8oGZKljkALqMrzWnRcfqlwCSi21K
	LfjlaVmB76UU26NV9SOmyHtsmef3wI6OJbn4yTC/ca0gwQdtHJKXB8YbeUD7OxpPadtNtDj3QWlIg
	Q0EcLR7vtD4dbJ8iwKNJaMdf63zciJBX2aohUPO/ZRkvkb4vRmIRdoZZ4jpiuOFKe8qA5AxmjWQi1
	svARzV7X+tDsqwEvqM1UclnHxGXuUiqe8ZyNVbQ/vjIjiucPZ1QDVLB2yybks6SNRZDVLRZcfb2E9
	Xetbyl4g==;
Received: from [213.70.33.227] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmSX-0006Bv-Fb; Wed, 03 Sep 2025 14:19:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
Date: Wed,  3 Sep 2025 14:19:19 +0200
Message-ID: <175690195013.3771488.435870786224873257.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 31 Aug 2025 18:48:48 +0800, WeiHao Li wrote:
> This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> native display connectivity through the MIPI DSI host controller and
> PHY. The changes span multiple subsystems, including clock control,
> DRM/VOP integration, DSI controller binding, and PHY driver updates.
> 
> Key changes:
>   - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
>     phy initialization.
>   - Add missing lut_size of vop_data for RK3368.
>   - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
>     which is required for enabling the 24MHz reference clock.
>   - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
>     and register mappings.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
      commit: 4a76a0a889cef284327f265f97edc4ff2f3e11cc
[4/7] clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
      commit: 77111b2c22ef5b368da5c833175b6f7806b39ccb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
