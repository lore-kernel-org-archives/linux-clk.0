Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147547;
	b=v3QUqI/QpNmyfrR1T1Z/vRAAdkzhNgHZwHl2qObz/BXrU1MA1Lz4LtXN/0vCp6eZfB/G
	 BdXXceOYiTiAQEaiVPsfkvZM0Oxx7HOW6RVf129p669zlJ1JVA2GgD+ePkkM9VogKblTU
	 zvo4jMjTu4kAKt1z0XJKWVqjsu3flYKyki7FGMihLGhaGRTx5RtI3AQTADypRsACToRU/
	 SGWBJpXDy21Ne2kUgh40GvBb0tiL1GI4AOCXrRBMbnQxiGAdTqqcMkLucjsaY2X9gVfOq
	 7vXTSUHHhkEuMjmiIE8/sjJ4ADTar825iEuEpG1jNrKcDU4OT8f5eyq/W5fD11+k1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147547;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=iSbGhFXFFG4ZHlkcmwgULCRh140prCnpHPqJ5f4DzcA=;
	b=b10ICUDuRTspWvGQjXshvz0w/2D/Mmz8HJ/tBcFRD/8F53zyHaHrZb8h5vxH4Recbm4/
	 uc0hEpi49L2yDmGotD/nHf0+wkP9+nv+OretUtcUN6dNf26qbJC9wX9lxLKlJ3offiOnL
	 Ka8wm+NDnrHGZilUxZD/kjzxxgDE3LY73pjEP2v0siN/i2TkBkQMspTVY2jBJ2CanaZyb
	 o4tI5wN5uXSqEMF+Ni3ivVq/TteKYfwOBwnrbS5cjgb2YnCcluXTz+pZf1FF8ypu9zjGt
	 lLXlxtgSxE3xMmVg5gRRI0EoCBCee1sQJROUCJNYcN5/qMSuyXfngEEjDntmhyrIhww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614ED606A320;
	Fri, 20 Nov 2026 04:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 614ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EBF819200BB; Fri, 20 Nov 2026 05:05:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id E4DF39200B3;
	Fri, 20 Nov 2026 04:05:43 +0000 (GMT)
Date: Fri, 20 Nov 2026 04:05:43 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
cc: linux-mips@vger.kernel.org, 
    =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0_=28Zhou_Yanjie=29?= <zhouyanjie@wanyeetech.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
    Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
    Jerome Brunet <jbrunet+clk@baylibre.com>, 
    Jiaxun Yang <jiaxun.yang@flygoat.com>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
    hns@goldelico.com, paul@boddie.org.uk
Subject: Re: [PATCH v6 3/4] MIPS: Ingenic: Add XBurst SMP support
In-Reply-To: <75c6a1d4-8c72-4590-9c29-4218bef2a1e7@gmail.com>
Message-ID: <alpine.DEB.2.21.2611200403260.54328@angie.orcam.me.uk>
References: <20261113190836.470937-1-f.fainelli@gmail.com> <20261113190836.470937-4-f.fainelli@gmail.com> <alpine.DEB.2.21.2611191915570.54328@angie.orcam.me.uk> <75c6a1d4-8c72-4590-9c29-4218bef2a1e7@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2026, Florian Fainelli wrote:

> > > +	/* The CP0 REIM register only stores the upper 16 address bits. */
> > > +	.section .text.smp-entry, "ax"
> > > +	.balign 0x10000
> > > +	.set noreorder
> > 
> >   What's the point of making this code `noreorder'?  We want to avoid such
> > code whenever possible.
> 
> This was in Zhou's implementation and I did not modify that part.

 No justification then?  Can we please get this fixed?  We want to get rid 
of existing `noreorder' code and certainly not add new one.

  Maciej
