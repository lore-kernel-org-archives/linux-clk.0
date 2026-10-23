Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751273;
	b=m5ke3TstcQMk7KbvnSlxQOWsoAtHFG68joXhbpX5vVh5HcQCvLNlFU0ZEt9oo9TmaKmP
	 fKmJlzrROG2oOuoJuoihcyz8zqOuDJo6w9oiUoi5JrWlrHjNY0kqWSlXfvIy1SMG4xW9B
	 JnvQG4VSkeUg730iN4EVca75lWAMdf8LKGQOQV3K50VrO+p3iIq4IQ35OZKOd6IY4/OSr
	 dONcYnWa4V6sZmGjbIoRwz9wl5h6je8xdGYGEPQ678/VycnuH1vEMPPJR8wWrIhtSkSt2
	 g91cp8q24/XHWVdVZRZvKWnaGvWxC35YEW6OnKDTm7vRluWBAOXc5pE6E7R3ibADe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751273;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qZ4/eiHVwBullnoqGWKFL11/mhEiAdGloLPRwlR6r+8=;
	b=Bv+2yVwqsygQPr71o6fhJFiZ+MvMq/qtHDY0p1SquC6Gu0mIVp3iQpkBuiZw4ewCFhSV
	 idLIHJjA12ShQS4bSDyxeNatarbFEZrXiF93wswFqnZCCQEVwkYRbOUhOUHXxMYsy8zb3
	 hFl3zd30FMDWEnoWMLRA1Qh+jWPUyc46/Se0oEVESM+U4wOAkv6fVbwsL92ufQSdfzfEJ
	 0pwlKXM5yaq5d5dhAB4lZN3tIVjPWLQzZ73yMSZLs7CTtiVMFZ6P0SquwqPRAmCXQcdmP
	 futLzsyl1ZkES+cNQst+m4bNhj6wgSFH3gpnWkqzHdus5q8rnM0MXt4KKkTqrxmwU3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZbIMhIhr;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ED7606A324
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 10:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67ED7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ZbIMhIhr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qZ4/
	eiHVwBullnoqGWKFL11/mhEiAdGloLPRwlR6r+8=; b=ZbIMhIhrgXZDuqu2lwwb
	5iRvKSTpxPy5LvrOUvYWWXaMTT1Fv5ibgEYanyUX3uSns+/xJef3M0xY1Oci9hHg
	wZKWD9rq1XzxK/dHN1WJ/ZBauju7E8i4IMyTpYfn77fstXsYdENGLrhPBGAT4AFO
	9DWeyYkdSVRPcJ4xUjjxGG7l85bMTL+KwoKM1YWh1e/bBrcCVz3JljNqddvRUyfS
	y/APWvsW9z91/yPFZ8ZJYwC3Z3aEFtcpsy+OgYYzTDITYsrV4MXeC328y6SiyqWi
	f2MtDePfCTR5mYbi07eUSoh/wL5b38GAdSOYAR09wRF95l2NfumKL8+yMk2vejs9
	7g==
Received: (qmail 1512031 invoked from network); 23 Oct 2026 12:27:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Oct 2026 12:27:42 +0200
X-UD-Smtp-Session: l3s3148p1@oDMgbn9eTKYujnv2
Date: Fri, 23 Oct 2026 12:27:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/8] i3c: renesas: Fix zero I2C SCL rate on pure I3C buses
Message-ID: <ats2nSA-kV10hlje@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-0-30a47f25e515@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>
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
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-v1-1-30a47f25e515@renesas.com>

On Tue, Oct 20, 2026 at 10:14:55AM +0100, Diogo Ivo wrote:
> On a pure I3C bus there are no I2C devices, so the I3C core leaves
> bus->scl_rate.i2c at zero if i2c-scl-hz is not specified in DT.
> Deriving i2c_total_ticks from that zero rate programs a zero-width
> open-drain SCL into the STDBR open-drain fields, which are still used
> in pure I3C mode for example in DAA.
> 
> Fall back to the 1 MHz FM+ limit instead, the fastest rate an I2C
> device could have, so that a sane open-drain timing is programmed.
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Great catch! Kudos for adding a good comment. I agree with Geert about
using the ternary operator, though. After that, you can add my:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

