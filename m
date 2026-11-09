Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266552;
	b=MXdNyAYRUr1nBwbFft5+pPzXpidPQ+BIWJFAqU+HlZSWke4lIZnf6eEdhZtgisfkpN+U
	 aWpHsl0bTRDOawqGCIvW2f7mtaYGHLYIz4fBK2DriSgm3fAThgwUo+s4gPmlMqpuoPCTw
	 CYX0USFnK4uZNzKjSu64QAT8scNQpvOWYwaFyv1bOvBESruz1nUsG0XDCVV3R48kXU6cU
	 eYUPmZmhwe3omsxZ5vv3Ji4gEP9EEeLUeoLSPAkx9aO+1wtDDrmuU4bUnHiguN6bDh7IJ
	 Cci8/7Q0ieUQKMiHJgRxMOIzbILS7CDlx60mCcaIocMqNDbrP2aJwdMGjkY3M8cfA2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266552;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=W+XCy+nVFnxoDmQzBQ0c9S90ITTeoRgfFYCLUSeMDj4=;
	b=a6fAQS01bd8M5jI9WzYCkID6TiLUZ0FG3ZPK4VcF43fR8bSPYKK4hXc8hRCGVEMLqvY2
	 +l/4tSbQwCKMGrHvSMkztKjXuz9EYKXw2gDVgdlYxGmlEjDy0HXLtgml6Mr/wD6Y5UQzt
	 MoU7ZXBhTBFIBbG2PeoC8eu88aRSXmdNbkcvgrg1VrU2NkKNtNsNlOW7DjgIhB0tjnRDp
	 bj6VS0OrNt73rysAgbo4JsJGZv+5WFoE/B/4cYh2Fke2/IIBK1YVjrRTw7yk+FxUvkbQD
	 JTDAN2Y+zLVdFQY5jhkYlbOk66rTFDtVdALAZBQ6aoE47XrkNIRNcS5NpBeMd7gaLBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=J8jHts4v;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB57C606A31C
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 23:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB57C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=J8jHts4v
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id QN6ZxnN8aRiNxQYh5xOG9X; Mon, 09 Nov 2026 23:22:31 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYh4xlbe2xmi7QYh5xJr7n; Mon, 09 Nov 2026 23:22:31 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af255b7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=C-G3OIpCgmwuh2f8opQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=p49Upr6YYhNo69yxWKUU:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W+XCy+nVFnxoDmQzBQ0c9S90ITTeoRgfFYCLUSeMDj4=; b=J8jHts4vEOuUy2HxMIwZKAr89F
	h1cbBtZbq6Gt3UIU3q3O7RuBAJQWl4JrWWyDT8FYKnkBSx99VbSNTnLFXvUbu/h5zsj7ra5xv9s6d
	jthFhamylcg5cMTS7Tj1KIJZ3kEWBTIQq98t9tJPrgymVHqO3w9YdIvH0OTL7nzgGS+Tf1j7b5pw9
	mYC0ueLeWc+WMUWo0rB+5LYVVIA4ONfkz4jrYdfyUcfiibgd8+f5bqFbqjkK5vWVWH/Ua3iCKgRL6
	7Tl3RBBoCQlwU2lzguXEJ3WApPcKswiIHpfzF+ucRG8Wjw1eYfELs4S3hb2ag1ym99QGCTg2l6Mn1
	32akXeHg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55034 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYh3-00000000wME-05ni;
	Tue, 10 Nov 2026 04:52:29 +0530
Date: Mon, 9 Nov 2026 15:22:27 -0800
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
Subject: Re: [PATCH v8 4/7] watchdog: rzv2h: Drop runtime PM handling from
 WDTDCR init
Message-ID: <0ae129cf-87df-4d26-8d2f-0c54c09d4019@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261001165201.763882-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYh3-00000000wME-05ni
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55034
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 65
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNCte2t161iiL43Wg5AV5eNGugAkanArMS2ftqElFzcVlq3gDhpsZxg+SAKiFFqfAlRk8SgECgLdSxoYeVLR29bzcdrdi5decrEQutar5hbsslUS7zME
 t6hOq0BTP3Xj5qfUywLHm60AvL3IdSiRJ/CJYN2++Koi2DNIhJkP+FPMdUCwlVW2HoQD3nQoS7QOb6hHf4u+2QmB1Osbr3oeGxITNkUqNxWKO7JesTbB2/tZ

On Thu, Oct 01, 2026 at 05:51:58PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> WDTDCR is located in the CPG region, outside the watchdog module, and is
> accessible regardless of the watchdog's clocks and reset state.
> 
> Drop the unnecessary runtime PM handling from WDTDCR initialization and
> access the register directly.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied.

Thanks,
Guenter
