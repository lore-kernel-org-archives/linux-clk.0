Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266700;
	b=QnUNgwBsDHsY/1WDWDNCCovto0Ee3kSxpv71odJWU4ho2BCrHNm8f+BXc+leJ+JYw3zu
	 p9Fyv9kpzxMwot/OzksjtSQ4lqVUJQUmR7zlry4z6euBVDup8zWQrr/SlE+RX3sPoYj5g
	 Lo0zlI8TTvlc01j+wXnst/DcCdlV77va66NE23C3+FP9sbLIAmZonKsM3/qAtK4GkKGDM
	 iTuAvoiu4uARv3AOl807um62nGt6RyZw9xktmJ0pI1dRR0WXUS1W4nMhrqHLs5NnB9WVl
	 ljI3DlFoQ/0aAUMFOiADuRVxmXHgHCEENBfnXZzfai4QiU41CUTbpHupmFGLxNWjcBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266700;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=J+68wHIkUnHwz3TivKr0WUSuO34xn3RSmjsxMh6ln60=;
	b=qAjNrTNtBr456dAbZ1wfGyT8IvaUVxJoxFBGyRZFpz+EJHyogl+I3j1PCpHNe4TwoXJQ
	 syQKLoY/4IXIjKaOO4NO+Ar1jIkA8+FOFOGpEVPwUkJ93Xu+RHubApBhMRXcnpUtEomTJ
	 Vbcn6VWKXAcL7VHjTS1ygqNkCVknWmfqldHnPppa9N2T6KgxWnx/KUZRL2H9diquv+jiZ
	 EyHUPUE5mTSoL2KXZMKSymRzu07SIw+EIPDErUcZANJtHf5kr0nCPpvucL40V11aD0P0i
	 LT0WU1ztluglVcnRwDhctyy/4YIreevro0gEhFt6ci2QmpZDhCIMnTeVj8S2Gz0pdcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=piHV1Lxo;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF26606A32A
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 23:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF26606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=piHV1Lxo
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id QSizx66HoOOJnQYjSx7MFD; Mon, 09 Nov 2026 23:24:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYjSxMu6a0288QYjSxoIaC; Mon, 09 Nov 2026 23:24:58 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af2564a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=_jlGtV7tAAAA:8 a=X6MXEInN9CrlbRLakdQA:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J+68wHIkUnHwz3TivKr0WUSuO34xn3RSmjsxMh6ln60=; b=piHV1Lxota5tnko/Lsecfqv1WG
	cSQHd75k+wzOZePtR2ZBlYbAnYa767CLXA09Bue5KP/frAws6rpWrLxDno7xMPsdR3R6CNzjgOm3+
	cofch2KLmvS3hJ1vebizHrCH3ik8x1EpQsMM5ZTEWoV5lhK8rLCKEWijw/0uEqxAvWlVvbwsWg8ZF
	2pQ63lT/vKqlwMyKiiXuleanAdRR5f1N+ZfxfxcE+RMsjKRkRirqtXY72DAV3Zm/yi2XOPaOC7N5m
	2zKyS4xlaXAPB1KfusHlQQ1baAU11/gRd2MMSB04++dLIDuE1geYLMAn6MfDMEFk69mafTmZsrFfj
	HnTtmqgg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51608 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYjQ-00000000xBF-2QUA;
	Tue, 10 Nov 2026 04:54:56 +0530
Date: Mon, 9 Nov 2026 15:24:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v8 5/7] watchdog: rzv2h_wdt: Add syscon based WDTDCR
 access
Message-ID: <835899c7-5dea-4f34-b804-1b6bbb564d71@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001165201.763882-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYjQ-00000000xBF-2QUA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:51608
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 85
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfId6Bl28/qxAbhhEBbZ3fOuKFW/cvM75A6WLJVQWDzVGcjd2qNYUjCGolltxhm0y63ELu+9x2sTleo62EBsdzdeJvDrCgdZ3vdHnRubveJsg+HJ/yThy
 JP/uVhKSdK118rbahMW8Be8bpf7+jzpunPY+VJxKVVLQywB2cVW1fwudUXsvcU6uWh6DBbUeHBu3zjMnPeqBSCnjzc/MRuH6mBaxPskVIocT/FkX/z+WPjVv

On Thu, Oct 01, 2026 at 05:51:59PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On RZ/T2H and RZ/N2H, WDTDCR is located in the SYS block rather than the
> WDT register space. Allow the WDT driver to access it through the syscon
> regmap exposed by the CPG driver. Retain support for the existing second
> WDT register region for compatibility with older device trees.
> 
> The syscon regmap uses locks and cannot be used from the watchdog restart
> handler, which runs in atomic context. Use the CPG helper for this path so
> WDTDCR can be accessed without taking a lock, while continuing to use the
> syscon regmap for normal start and stop operations.
> 
> Keep the WDTDCR start and stop helpers as void and treat the regmap
> operations as best effort. Propagating errors from these MMIO-backed
> accesses would complicate the control flow and error handling, while
> the restart path in particular should make a best effort to restart
> the system.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
