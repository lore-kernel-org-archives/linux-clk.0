Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794266216;
	b=2WwoQeRogh2fV8CAFcSJXHk2SBQEQZgHMJq+7bt21afQBJ1ImCYskrCP8rn2PhIuVRqv
	 A37xcMRsfWSA8jsOemlOPXnyoi/7NA5+t4MK2jJPzNsgTsoVfzphmjOnkxABcQRPr8k6N
	 zjATpav0DvrHZZvrz3JTFvL67KGeTUtrdIdI9x86uTMm2HmQluucYuLKa4D0ynWwJIblD
	 Ov8QHxDWt8f9z5nVnILBRzAKzM4TNvqOtfLOK+M4Ei+sG4rlU6xoI2b2oktotOU7jpqoU
	 UC7pNn3k9T9vd5ijfYjp6ozTanbbi7II2wf4VAW7npaToQTDT5A7MyeQ0wIznAXwk/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794266216;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ourNGXvQ5Ub4aFSYZr4GTp+31ZYMvfjzPnbWU36+4JY=;
	b=meN4KG0CVw49+aIp/dd3QJikFSwBSLBcB4qMnfMI9SD0J78UIoYxiYrFEQHkItKk9Z4f
	 XTIiqkTywHFanktNYKirSLffzVFPAOYus4Oidl6JuO5u2pf3G4MrVfCwICjxmGyIxG+wm
	 VxpgqEaL3R8cL8G4kAfcA+khSsO2Q+Z4lJCUYmgJ8hbewN4ZHliZ0D3JtnDEIaGshN2bu
	 DHMfQwAYZM8r0IlUPK33HkMacfHYfcAY2mVSo6C8OofFtQcNW2YtRYIkDkZqNBBti3HPF
	 qD++vZdEfa0E8skUHAX8l2RWUrCHujzDxIdE2XIv7X98heRSyQTsbzpJjiKARiM4eRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=g8OM+qIh;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762FB606A31C
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 23:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 762FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=g8OM+qIh
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id QVX9xQ8upAR1iQYbgxa7Ek; Mon, 09 Nov 2026 23:16:56 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QYbfxlSOkxmi7QYbfxJiv8; Mon, 09 Nov 2026 23:16:56 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af25468
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=yC-0_ovQAAAA:8
 a=GU2OR-2u3yUetoAu5r4A:9 a=CjuIK1q_8ugA:10 a=p49Upr6YYhNo69yxWKUU:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ourNGXvQ5Ub4aFSYZr4GTp+31ZYMvfjzPnbWU36+4JY=; b=g8OM+qIh4P8JuAXOofLquteH9V
	GA8GU+WHHy5ORMPSZWQXI2f2OHpxFOrmM6ExzkPpZDlo/xKgsF+FSDcJttYpKH6NowrZpbtzzGyzT
	D99Mj8eK3o8LtpxJHBQzwEKYH7KBe8tYLPJQ/7yQ22xZfiIRmrqJzNAIckR50HsbtEZfVR7puSGZu
	M3Pq6DIFGUP/dou1iJq4r4TPSNeRgBe32TRDERfdkm+KaAGOWtmjKLSxghGkwKkH8v2Mv4QSDT8zc
	1PY3Z99s2mFe0WYa9TvLqjk+UoN3SvAvVYe3ALxd0NIof43zNhrR0jircdZTB5idKxqkRG0rtyNe9
	UR1ibrIA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47824 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQYbd-00000000tOY-3UMs;
	Tue, 10 Nov 2026 04:46:53 +0530
Date: Mon, 9 Nov 2026 15:16:52 -0800
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
Subject: Re: [PATCH v8 2/7] watchdog: rzv2h: Use pm_runtime_put_sync()
Message-ID: <36f3db86-774e-4e38-9216-a5af7ccbf6a5@roeck-us.net>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261001165201.763882-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
In-Reply-To: <20261001165201.763882-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQYbd-00000000tOY-3UMs
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:47824
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHJkychBf8S17YrXdsPYW6BmQcNwudpNgoQpaxWwQKCqsOps2Z8BDSB1APHeM2GquMY5X086OmMdzjd8qEx2zVw6uWhj5yLcFsiDaKzLD+9SvQnsRzis
 HTPjHWg39omrWAAX4O9M0oXYCHvMkuLcl25Uuu+kXJqyl4oSAOt+dzcWbmtPIwzIrGNPr3Mf8XShx+R5HJK1m25aCDZmfQd2HopVQWFvuj3MVg3UcbFt4fB1

On Thu, Oct 01, 2026 at 05:51:56PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> pm_runtime_put() may trigger the idle check after pm_runtime_disable()
> is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
> runtime PM active.
> 
> Use pm_runtime_put_sync() to ensure the idle check runs synchronously.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied.

Thanks,
Guenter
