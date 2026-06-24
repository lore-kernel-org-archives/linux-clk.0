Received: from fr5000-r.dnsiaas.com (fr5000-r.dnsiaas.com [92.42.104.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBAA1E376C;
	Wed, 24 Jun 2026 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.42.104.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303614; cv=none; b=tuMMCHafXIVlmIxlwhWXl4J5tOEpClvVP/7FRQZiwKtdC0E89Lb9+VUvP5389ZeMMPzZI3C/tWbIVYqDSPibECseZP3IbsC3dlN2rs/cY8/Dy1SZx0mF0DyQvSJHboz4cqtSu39pDrFnKS6ZzJXgn5Io90CYc5FbYv02s6VFU3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303614; c=relaxed/simple;
	bh=jJkcKCn078uona9XGGRB7XcSnb+0ei7fuHLd3fVitTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfGgaNl1nJbd+6AT5HQ5EFhWt8mEcQo0arERWmX3o7U6HvShUi4tLFuUdQ30vVikdQYBWLOIv6QxoB/GczZkETGmLYR2LGJaPFD3t+6g/vfEGDPAQFSXDOO7gKGKiigE0RkTiZLvpuZOQCAmsFr710KctMS/8nyG2pV3seyjUj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=kZeRiK6r; arc=none smtp.client-ip=92.42.104.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="kZeRiK6r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jJkcKCn078uona9XGGRB7XcSnb+0ei7fuHLd3fVitTA=; b=kZeRiK6rsuM+5U6Q0zOpbGqnRb
	cBSPQDS8MlSefsWmg5NTXgOHfvDyfD/CuhQacADe9pUlGrKPUjFz/v0cDdH3S6ZIjCA0r89Oi5h2x
	HGOldomGpiaL8OvkAiayjjV+ahEwAGBH3eJcRtqMgtvuOe0kzO+NxwJroGKqSyi4KJxKywla95MAA
	IxFMhGzTdOnR0xz/cbUUytzHoea1hBS11X9cnsfm5SKARTOn/PEkQ2WSDCxVUoPJ4EIXOlgcr40Qq
	YJONGlm+bi4R+/VJPAYmYAl4auXLeYaQBsG+esTLIzQb4Mqs8/62oz5CySGxap7qKzh8BnpsurCgS
	1qbENCjQ==;
Received: from [81.57.40.39] (port=58810 helo=superkali.me)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wcMaT-00000004mVM-2OD9;
	Wed, 24 Jun 2026 14:20:10 +0200
From: Daniele Briguglio <hello@superkali.me>
To: Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO
Date: Wed, 24 Jun 2026 14:20:08 +0200
Message-ID: <20260624122008.1737107-1-hello@superkali.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2008560.6tgchFWduM@diego>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me> <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me> <2008560.6tgchFWduM@diego>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Heiko,

> Care to send a patch for that change? :-)

Will do. I was only waiting for your call on the approach before sending,
so I'll get it out shortly.

Best regards,
Daniele
